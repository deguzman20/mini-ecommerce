class CartProduct < ApplicationRecord
require 'paypal-sdk-rest'
include PayPal::SDK::REST 
 belongs_to :cart, optional: true
 belongs_to :product


 PayPal::SDK::REST.set_config(
  :mode => "sandbox", # "sandbox" or "live"
  :client_id => "AcCp1ZKvcqBS3QxenYo8cI-PYrc2E8m07mIVqzTHj-yixNBkEK12LbSoptWDkKxPKb72-nkLCA93A7vD",
  :client_secret => "ECnipckEVxtOwLlLzTdcvkfXA5zPF-wWIzJzlFXgZwNu6qIYtAJ2p2WtvL0e7U-76zFfPeBeJXbWIQOO")

  def paypal_url(cart_product , url)

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
          
		          itemlist << {:name=>"#{prod.name}", 
		           :price=>"#{@price}",
		           :currency=>'USD',
		           :quantity=>"#{@quantity}"

		          }
            end
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
            :currency =>  "USD" },
          :description =>  "This is the payment transaction description." }]})

      if @payment.create
        @redirect_url = @payment.links.find{|v| v.rel == "approval_url" }.href
          else
            logger.error @payment.error.inspect
          end
 
  end
 
end
