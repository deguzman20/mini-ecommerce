# frozen_string_literal: true

class PagesController < ApplicationController
  $customer_id
  def home; end

  def product
    @product       = Product.find(params[:id].to_i)
    @faqs          = @product.faqs
    @tech_specs    = @product.technical_specifications
    @tect_spec_img = @product.technical_specification_image
    @charging_capacities = ChargingCapacity.where(product_id: params[:id].to_i)
    @features            = FeatureInfo.where(product_id: params[:id].to_i)
  end

  def announcement
    @announcement = Announcement.find(params[:id])
  end

  def get_local_storage
    decoded_hash = JWT.decode(
                    params[:auth_token], 
                    Rails.application.secrets.secret_key_base
                   )
    decoded_hash[0].each { |customer_id| $customer_id = customer_id[1] }
  end

  def order_history
    @customer_orders = Order.where(customer_id: $customer_id.to_i)
  end

  def get_product
    product = Product.find(params[:product_id].to_i)
    render json: product
  end

  def order_product
    order_product = OrderProduct.where(order_id: params[:id].to_i)
    render json: order_product
  end

  def contact; end  

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
    pp cart
    @cart_products = CartProduct.where(cart_id: cart.id)
  end

  def blogs
    @blogs = Blog.all
  end

  def blog
    @blog = Blog.find(params[:id])
  end

  def reply
    reply_blog = ReplyBlog.new
    reply_blog.blog_id = params[:blog_id].to_i
    reply_blog.name = params[:name]
    reply_blog.email = params[:email]
    reply_blog.comment = params[:comment]
    reply_blog.website = params[:website]
    render json: 'reply sent successfuly'.to_json if reply_blog.save!
  end

  def contact_us
    contact = ContactU.new
    contact.name = params[:name]
    contact.email_address = params[:email]
    contact.message = params[:message]
    render json: 'Send Successfuly'.to_json if contact.save!
  end

  def add_to_cart
    cart_id = ''
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
    CartProduct.where(cart_id: cart.id).each do |cart_product|
      subtotal += cart_product.product.price * cart_product.quantity
    end
    render json: subtotal.to_json
  end
end
