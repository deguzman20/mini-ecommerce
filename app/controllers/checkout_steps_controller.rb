class CheckoutStepsController < ApplicationController
  include Wicked::Wizard
  steps :customer_information, :shipping_method, :payment_method
  $additional
  def get_local_storage
    decoded_hash = JWT.decode(params[:auth_token], Rails.application.secrets.secret_key_base)
    decoded_hash[0].each { |customer_id| $customer_id = customer_id[1] }
  end
  
  def continue_to_shipping_method
    if params[:is_save_info_checked] == "true"
       customer_shipping_address = CustomerShippingAddress.new
       customer_shipping_address.email_address = params[:email]
       customer_shipping_address.first_name = params[:fname]
       customer_shipping_address.last_name = params[:lname]
       customer_shipping_address.customer_id = $customer_id.to_i
       customer_shipping_address.address     = params[:address]
       customer_shipping_address.apartment   = params[:apartment]
       customer_shipping_address.city        = params[:city]
       customer_shipping_address.country     = params[:country] 
       customer_shipping_address.postal_code = params[:postal]
       customer_shipping_address.is_save_info = true
       render json: 'shipping address saved successfuly'.to_json  if customer_shipping_address.save!
    else
       customer_shipping_address = CustomerShippingAddress.new
       customer_shipping_address.email_address = params[:email]
       customer_shipping_address.first_name = params[:fname]
       customer_shipping_address.last_name = params[:lname]
       customer_shipping_address.customer_id = $customer_id.to_i
       customer_shipping_address.address     = params[:address]
       customer_shipping_address.apartment   = params[:apartment]
       customer_shipping_address.city        = params[:city]
       customer_shipping_address.country     = params[:country] 
       customer_shipping_address.postal_code = params[:postal]
       customer_shipping_address.is_save_info = false
       render json: 'shipping address saved successfuly'.to_json  if customer_shipping_address.save!
    end 
  end 
  
  def get_city(city)
    $city = city
  end 

  def additional_fee(additional, city_code, total_weight)    
    $additional, $city_code, $total_weight = additional, city_code, total_weight
  end
  
  def show
    @sub_total = 0
    @cart_quantity = 0
    total = 0
    cart = Cart.find_by_customer_id($customer_id)
    @cart_product = CartProduct.where(cart_id:cart.id)
    @cart_product.where(cart_id: cart.id).each { |cart_product|
                                               @sub_total += cart_product.product.price * cart_product.quantity
                                               @cart_quantity += cart_product.quantity.to_i 
                                            }
    case step
    when :customer_information 	
    pp 'customer information'
    when :shipping_method
    @customer_shipping_address = CustomerShippingAddress.where(customer_id: $customer_id).last
    pp 'additional'
    pp $city_code
    pp $total_weight.to_i
    pp @additional = $additional
    when :payment_method
    @city = $city unless $city.nil? 
    pp 'payment method'
    else   	 		
    end	
    render_wizard
  end	
 
  def get_nearest_city
    city = City.find_by_sql("SELECT id,name,city_code,lat,lng, ((ACOS(SIN(#{params[:lat]} * PI() / 180) 
                             * SIN(lat * PI() / 180) + COS(#{params[:lat]} * PI() / 180) * COS(lat * PI() / 180) 
                             * COS((#{params[:lng]} - lng) * PI() / 180)) * 180 / PI()) * 60 * 1.1515) 
                             AS distance FROM cities HAVING distance <='20' ORDER BY distance ASC LIMIT 0,10")
    render json: $city
    get_city(city)
    pp calculate($city)
  end

  def calculate(city_result)
    city_code = ""
    additional = 0;
    sub_total = 0
    total_weight = 0
    cart = Cart.find_by_customer_id($customer_id)
    CartProduct.where(cart_id: cart.id).each { |cart_product|
                                               total_weight += cart_product.product.weight * cart_product.quantity 
                                               sub_total += cart_product.product.price * cart_product.quantity
                                             }
  
    city_result.each { |city| city_code =  city.city_code }
  
    case city_code 
      when 'MNL'
      case total_weight
      when 0..5 then additional = 100.00
      when 6..49 then additional = 115.89
      when 50..249 then additional = 130.22
      when 250..999 then additional = 143.01
      when total_weight >= 1000 then additional = 154.2         
      end 
      when 'BOAC'
      case total_weight
      when 0..5 then additional = 200.00
      when 6..49 then additional = 221.96
      when 50..249 then additional = 242.36
      when 250..999 then additional = 261.22
      when total_weight >= 1000 then additional = 278.48         
      end 
      when 'CALAPAN'
      case total_weight
      when 0..5 then additional = 200.00
      when 6..49 then additional = 219.99
      when 50..249 then additional = 238.42
      when 250..999 then additional = 255.31
      when total_weight >= 1000 then additional = 270.6         
      end      
      when 'CRK'
      case total_weight
      when 0..5 then additional = 120.00
      when 6..49 then additional = 136.45
      when 50..249 then additional = 151.339
      when 250..999 then additional = 164.689
      when total_weight >= 1000 then additional =  176.43999999999997      
      end
      when 'LUCENA'
      case total_weight
      when 0..5 then additional = 200.00
      when 6..49 then additional = 220.21
      when 50..249 then additional = 238.86
      when 250..999 then additional = 255.97
      when total_weight >= 1000 then additional = 271.48       
      end          
      when 'URDANETA'
      case total_weight
      when 0..5 then additional = 200.00
      when 6..49 then additional = 225.20
      when 50..249 then additional = 248.83
      when 250..999 then additional = 270.94
      when total_weight >= 1000 then additional = 291.44         
      end   
      when 'BAGUIO'
      case total_weight
      when 0..5 then additional = 200.00
      when 6..49 then additional = 228.74
      when 50..249 then additional = 255.92
      when 250..999 then additional = 281.56
      when total_weight >= 1000 then additional = 305.6  
      end         
      when 'BCD'
      case total_weight
      when 0..5 then additional = 150.00
      when 6..49 then additional = 178.44
      when 50..249 then additional = 205.0
      when 250..999 then additional = 229.42
      when total_weight >= 1000 then additional = 251.89     
      end           
      when 'BXU'
      case total_weight
      when 0..5 then additional = 150.00
      when 6..49 then additional = 180.82
      when 50..249 then additional = 209.76
      when 250..999 then additional = 236.82
      when total_weight >= 1000 then additional = 262.28      
      end             
      when 'SUG'
      case total_weight
      when 0..5 then additional = 220.00
      when 6..49 then additional = 265.55
      when 50..249 then additional = 310.86
      when 250..999 then additional = 354.68
      when total_weight >= 1000 then additional = 395.74       
      end  
      when 'CGY'
      case total_weight
      when 0..5 then additional = 150.00
      when 6..49 then additional = 184.74
      when 50..249 then additional = 216.84
      when 250..999 then additional = 247.5
      when total_weight >= 1000 then additional = 275.89        
      end   
      when 'IGN'
      case total_weight
      when 0..5 then additional = 220.00
      when 6..49 then additional = 257.97
      when 50..249 then additional = 294.23
      when 250..999 then additional = 329.01
      when total_weight >= 1000 then additional = 359.59      
      end                               
      when 'CEB'
      case total_weight
      when 0..5 then additional = 150.00
      when 6..49 then additional = 180.03
      when 50..249 then additional = 207.57
      when 250..999 then additional = 233.06
      when total_weight >= 1000 then additional = 256.39        
      end      
      when 'CBO'
      case total_weight
      when 0..5 then additional = 220.00
      when 6..49 then additional = 260.73
      when 50..249 then additional = 298.99
      when 250..999 then additional = 335.14
      when total_weight >= 1000 then additional = 368.76         
      end
      when 'DLP'
      case total_weight
      when 0..5 then additional = 150.00
      when 6..49 then additional = 178.45
      when 50..249 then additional = 205.22
      when 250..999 then additional = 230.23
      when total_weight >= 1000 then additional = 253.87       
      end 
      when 'DVO'
      case total_weight
      when 0..5 then additional = 165.00
      when 6..49 then additional = 203.66
      when 50..249 then additional = 240.99
      when 250..999 then additional = 277.81
      when total_weight >= 1000 then additional = 313.06     
      end       
      when 'DGT'
      case total_weight
      when 0..5 then additional = 150.00
      when 6..49 then additional = 178.67
      when 50..249 then additional = 205.58
      when 250..999 then additional = 231.41
      when total_weight >= 1000 then additional = 256.88       
      end          
      when 'BAIS'
      case total_weight
      when 0..5 then additional = 200.00
      when 6..49 then additional = 233.67
      when 50..249 then additional = 265.19
      when 250..999 then additional = 295.3
      when total_weight >= 1000 then additional = 324.71        
      end            
      when 'BAYAWAN'
      case total_weight
      when 0..5 then additional = 220.00
      when 6..49 then additional = 262.41
      when 50..249 then additional = 301.989
      when 250..999 then additional = 339.579
      when total_weight >= 1000 then additional = 375.879    
      end             
      when 'GES'
      case total_weight
      when 0..5 then additional = 150.00
      when 6..49 then additional = 186.97
      when 50..249 then additional = 221.35
      when 250..999 then additional = 253.64
      when total_weight >= 1000 then additional = 284.68 
      end
      when 'MARBEL'
      case total_weight
      when 0..5 then additional = 220.00
      when 6..49 then additional = 262.58
      when 50..249 then additional = 302.19
      when 250..999 then additional = 339.35
      when total_weight >= 1000 then additional = 374.84 
      end     
      when 'ILO'
      case total_weight
      when 0..5 then additional = 150.00
      when 6..49 then additional = 177.88
      when 50..249 then additional = 203.4
      when 250..999 then additional = 226.98
      when total_weight >= 1000 then additional = 248.12 
      end        
      when 'KLO'
      case total_weight
      when 0..5 then additional = 150.00
      when 6..49 then additional = 177.78
      when 50..249 then additional = 202.98
      when 250..999 then additional = 225.97
      when total_weight >= 1000 then additional = 246.47 
      end                         
      when 'MPH'
      case total_weight
      when 0..5 then additional = 200.00
      when 6..49 then additional = 232.28
      when 50..249 then additional = 261.56
      when 250..999 then additional = 288.33
      when total_weight >= 1000 then additional = 312.58 
      end                          
      when 'BRY'
      case total_weight
      when 0..5 then additional = 300.00
      when 6..49 then additional = 351.69
      when 50..249 then additional = 400.93
      when 250..999 then additional = 448.53
      when total_weight >= 1000 then additional = 493.78
      end                             
      when 'OZC'
      case total_weight
      when 0..5 then additional = 165.00
      when 6..49 then additional = 207.36
      when 50..249 then additional = 246.44
      when 250..999 then additional = 282.87
      when total_weight >= 1000 then additional = 316.46
      end                               
      when 'PAG'
      case total_weight
      when 0..5 then additional = 170.00
      when 6..49 then additional = 215.96
      when 50..249 then additional = 258.74
      when 250..999 then additional = 298.9
      when total_weight >= 1000 then additional = 336.159
      end                             
      when 'PPS'
      case total_weight
      when 0..5 then additional = 150.00
      when 6..49 then additional = 182.43
      when 50..249 then additional = 212.20
      when 250..999 then additional = 239.88
      when total_weight >= 1000 then additional = 265.05
      end                                   
      when 'RXS'
      case total_weight
      when 0..5 then additional = 150.00
      when 6..49 then additional = 175.46
      when 50..249 then additional = 199.02
      when 250..999 then additional = 220.86
      when total_weight >= 1000 then additional = 240.68
      end           
      when 'TAC'
      case total_weight
      when 0..5 then additional = 150.00
      when 6..49 then additional = 180.17
      when 50..249 then additional = 208.01
      when 250..999 then additional = 234.28
      when total_weight >= 1000 then additional = 258.99
      end                                     
      when 'CYP'
      case total_weight
      when 0..5 then additional = 200.00
      when 6..49 then additional = 236.83
      when 50..249 then additional = 270.469
      when 250..999 then additional = 302.369
      when total_weight >= 1000 then additional = 331.549
      end                                       
      when 'CRM'
      case total_weight
      when 0..5 then additional = 200.00
      when 6..49 then additional = 237.88
      when 50..249 then additional = 272.9
      when 250..999 then additional = 305.919
      when total_weight >= 1000 then additional = 336.289
      end    
      when 'ORMOC'
      case total_weight
      when 0..5 then additional = 150.00
      when 6..49 then additional = 196.06
      when 50..249 then additional = 241.12
      when 250..999 then additional = 283.62
      when total_weight >= 1000 then additional = 324.53
      end                                           
      when 'TAG'
      case total_weight
      when 0..5 then additional = 150.00
      when 6..49 then additional = 180.49
      when 50..249 then additional = 208.84
      when 250..999 then additional = 235.15
      when total_weight >= 10000 then additional = 259.36
      end                        
      when 'TALIBON'
      case total_weight
      when 0..5 then additional = 230.00
      when 6..49 then additional = 267.35
      when 50..249 then additional = 301.92
      when 250..999 then additional = 333.86
      when total_weight >= 10000 then additional = 363.04
      end       
      when 'ZAM'
      case total_weight
      when 0..5 then additional = 170.00
      when 6..49 then additional = 208.21
      when 50..249 then additional = 244.96
      when 250..999 then additional = 279.47
      when total_weight >= 10000 then additional = 311.97
      end  
      when 'SJI'
      case total_weight
      when 0..5 then additional = 220.00
      when 6..49 then additional = 249.32
      when 50..249 then additional = 276.4
      when 250..999 then additional = 301.469
      when total_weight >= 10000 then additional = 324.409
      end
      when 'LGP'
      case total_weight
      when 0..5 then additional = 150.00
      when 6..49 then additional = 178.12
      when 50..249 then additional = 203.58
      when 250..999 then additional = 226.64
      when total_weight >= 10000 then additional = 247.16
      end 
      when 'SORSOGON', 'IRIGA'
      case total_weight
      when 0..5 then additional = 150.00
      when 6..49 then additional = 189.52
      when 50..249 then additional = 223.72
      when 250..999 then additional = 253.12
      when total_weight >= 10000 then additional = 277.44
      end
      when 'WNP'
      case total_weight
      when 0..5 then additional = 220.00
      when 6..49 then additional = 244.84
      when 50..249 then additional = 267.87
      when 250..999 then additional = 289.26
      when total_weight >= 10000 then additional = 309.59
      end 
    end
  
    total = sub_total + additional   
    additional_fee(additional, city_result, total_weight)
  end  

end
