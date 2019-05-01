class CartProduct < ApplicationRecord
  require 'paypal-sdk-rest'
  include PayPal::SDK::REST 
  belongs_to :cart, optional: true
  belongs_to :product


 PayPal::SDK::REST.set_config(
  :mode => "sandbox", # "sandbox" or "live"
  :client_id => "AYjZT2tas5_xjKODvKSW1DEXVieC0wn4EWR4H_bn7vfP4PwdjTlY5kjL640PZgRhrWbk71Fy62tO87IJ",
  :client_secret => "EDuYKlUbkwgH8wGLetN0Gk6a0l4BUBuCFqh0JIvuXavIKBrewa5G5AAA7vbPpe_xd08GWfzSSvSuO9BX")

  def paypal_url(additional, cart_product , url)
           
        @url = url
        itemlist = []
        @total = []
        @index = 0
        cart_product.each do |product|
            @id       = product.product_id
            @price    = product.product.price
            @quantity = product.quantity
            @index+=1
             Product.where(id:@id).each_with_index do |prod,index|
          
		          itemlist << {
                 name: "#{prod.name}", 
		             price: "#{@price}",
		             currency: 'PHP',
		             quantity: "#{@quantity}"              
		          }
            end
              itemlist << {
                 name: 'Shipping Fee',
                 price: additional,
                 currency: 'PHP',
                 quantity: 1
              }
        end

        itemlist.each do |items|
          pp items
          @total << items[:price].to_i * items[:quantity].to_i
        end
        pp itemlist
        @grand_total = @total.sum
        pp itemlist
        pp @grand_total
        pp '#{@total.sum}'
        @payment = Payment.new({
        :intent =>  "sale",
        :payer =>  {
          :payment_method =>  "paypal" },
        :redirect_urls => {
          :return_url => "#{@url}/execute",
          :cancel_url => "#{@url}/cart" },
        :transactions =>  [{
             :item_list => {
             :items => itemlist },
             :amount =>  {
             :total => @grand_total.to_s ,
             :currency =>  "PHP" },
             :description =>  'This is the payment transaction description.' }]})
      if @payment.create
        @redirect_url = @payment.links.find{|v| v.rel == "approval_url" }.href
      else
        logger.error @payment.error.inspect
      end
  end
 
end


  # # Credentials for Classic APIs
  # app_id: APP-80W284485P519543T
  # username: marvn.jimena-facilitator_api1.gmail.com
  # password: QLV3K2XZLGWQP2H3
  # signature: A9A0gZTWcGyirG.qnLuzNtP0Yj-IA5IeOJyTR7Ni6K.l.dBQqkq9Armq
  # # # With Certificate
  # # cert_path: "config/cert_key.pem"
  # sandbox_email_address: Platform.sdk.seller@gmail.com

  # # IP Address
  # ip_address: 127.0.0.1
  # # HTTP Proxy
  # http_proxy: http://proxy-ipaddress:3129/
