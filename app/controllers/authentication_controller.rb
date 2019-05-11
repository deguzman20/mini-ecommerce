# frozen_string_literal: true

class AuthenticationController < ApplicationController
  def sign_up
    customer = Customer.new
    customer.fullname = params[:fullname]
    customer.email = params[:email]
    customer.password = params[:password]
    if customer.save!
      Cart.create(customer_id: customer.id)
      render json: 'Register Successfuly'.to_json
    end
  end

  def sign_in
    customer = Customer.find_by_email(params[:email])
    if customer&.authenticate(params[:password])
      payload = {
        customer_id: customer.id
      }
      jwt = JWT.encode(
        payload,
        Rails.application.secrets.secret_key_base
      )
      response = jwt
    else
      response = nil
    end
    render json: response.to_json
    end
end
