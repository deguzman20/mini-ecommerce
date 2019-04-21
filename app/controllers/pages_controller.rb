class PagesController < ApplicationController
  def home
  end

  def product
   @product       = Product.find(params[:id].to_i)
   @faqs          = @product.faqs 
   @tech_specs    = @product.technical_specifications
   @tect_spec_img = @product.technical_specification_image
  end	
  
  def announcement
   @announcement = Announcement.find(params[:id])
  end  

  def get_local_storage
   decoded_hash = JWT.decode(params[:auth_token], Rails.application.secrets.secret_key_base)
   decoded_hash[0].each { |customer_id| $customer_id = customer_id[1] }
  end
  
  def delete_cart_product
   cart_product = CartProduct.find(params[:id].to_i)
   cart_product.delete 
   get_sub_total
  end

  def increase_product_quantity
   cart_product = CartProduct.find(params[:cart_product_id].to_i)  
   cart_product.quantity += 1
   cart_product.save! 
   get_sub_total
  end  
  
  def decrease_product_quantity
   cart_product = CartProduct.find(params[:cart_product_id].to_i)  
   cart_product.quantity -= 1
   cart_product.save!
   get_sub_total
  end
  
  def cart
    cart = Cart.find_by_customer_id($customer_id.to_i)
    @cart_products = CartProduct.where(cart_id: cart.id)  
  end
  
  def contact_us 
   contact = ContactU.new
   contact.name = params[:name]
   contact.email_address = params[:email]
   contact.message = params[:message] 
   render json: 'Send Successfuly'.to_json if contact.save!
  end

  def add_to_cart
	 cart_id = ""
   product_id = params[:product_id]
   carts = Cart.where(customer_id: $customer_id.to_i)
   carts.each do |cart|
    cart_id = cart.id
   end	
   
   if CartProduct.where(cart_id: cart_id.to_i).where(product_id: product_id).present?
      CartProduct.where(cart_id: cart_id.to_i).where(product_id: product_id).each do |cart_product|
        cp = CartProduct.find(cart_product.id)
        cp.quantity += params[:quantity].to_i
        cp.save! 
      end   
   else
      cart_product = CartProduct.new
      cart_product.cart_id = cart_id.to_i
      cart_product.product_id = product_id
      cart_product.quantity = params[:quantity].to_i
      cart_product.save!
   end
     render json: 'Saved Successful'.to_json
  end

  def get_sub_total
    subtotal = 0
    cart = Cart.find_by_customer_id($customer_id.to_i)
    CartProduct.where(cart_id: cart.id).each { |cart_product| 
                                                subtotal += cart_product.product.price * cart_product.quantity  }
    render json: subtotal.to_json
  end	
  
  def redirect_to_paypal
   cart_product = CartProduct.new
   cart = Cart.find_by_customer_id($customer_id.to_i)
   cart_products = CartProduct.where(cart_id:cart.id)
   base_url = request.base_url
   redirect_to cart_product.paypal_url(cart_products ,base_url )
  end  

  def execute
    payment = PayPal::SDK::REST::Payment.find(params[:paymentId])
    transactions = payment.links.find{|v| v.rel == 'approval_url'}
    if payment.execute(payer_id: params[:PayerID])
        subtotal = 0
        # get the cart of current user
        cart = Cart.find_by_customer_id($customer_id.to_i)
        
        # get the sub total of all product for the specific customer in cart
        CartProduct.where(cart_id: cart.id).each { |cart_product| 
                                                    subtotal += cart_product.product.price * cart_product.quantity  }
        transaction_id = JSON.parse(payment.to_json)['transactions'][0]['related_resources'][0]['sale']['id']
        
        # create new order
        order = Order.new
        order.total = subtotal
        order.customer_id = $customer_id
        order.payment_order_status_id = 1
        order.paypal_transaction = transaction_id
        order.Saved!
         
        # redirect to the cart page if paypal was success
        redirect_to transactions.href.to_s
    else
      payment.error # Error Hash
    end
  end


end
  