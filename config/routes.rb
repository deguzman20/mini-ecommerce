# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'authentication/sign_up'
  get 'authentication/sign_in'
  root 'pages#home'
  get 'announcement/:id', to: 'pages#announcement', as: :announcement
  get 'product/:id', to: 'pages#product', as: :product
  get 'order_history', to: 'pages#order_history', as: :order_history
  get 'order_product', to: 'pages#order_product'
  get 'contact_us', to: 'pages#contact_us'
  get 'add_to_cart', to: 'pages#add_to_cart'
  get 'get_product', to: 'pages#get_product'
  get 'blogs', to: 'pages#blogs', as: :blogs
  get 'blog/:id', to: 'pages#blog', as: :blog
  get 'get_local_storage', to: 'pages#get_local_storage'
  get 'checkout_steps/get_local_storage', to: 'checkout_steps#get_local_storage'
  get 'cart',  to: 'pages#cart'
  get 'reply', to: 'pages#reply'
  get 'increase_product_quantity', to: 'pages#increase_product_quantity'
  get 'decrease_product_quantity', to: 'pages#decrease_product_quantity'
  get 'delete_cart_product', to: 'pages#delete_cart_product'
  get 'get_sub_total', to: 'pages#get_sub_total'
  get '/execute', to: 'checkout_steps#execute'
  get '/redirect_to_paypal', to: 'checkout_steps#redirect_to_paypal', as: :paypal
  get 'continue_to_shipping_method', to: 'checkout_steps#continue_to_shipping_method'
  get 'complete_order', to: 'checkout_steps#complete_order'
  get 'get_nearest_city', to: 'checkout_steps#get_nearest_city'
  resources :checkout_steps, as: :checkout_steps
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
