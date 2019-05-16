# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w[store-front/nav.css]
Rails.application.config.assets.precompile += %w[store-front/carousel.css]
Rails.application.config.assets.precompile += %w[store-front/style.css]
Rails.application.config.assets.precompile += %w[store-front/authentication.js]
Rails.application.config.assets.precompile += %w[store-front/cart.js]
Rails.application.config.assets.precompile += %w[store-front/payment-method.js]
Rails.application.config.assets.precompile += %w[store-front/contact-us.js]
Rails.application.config.assets.precompile += %w[store-front/order-history.js]
Rails.application.config.assets.precompile += %w[store-front/blog.js]
Rails.application.config.assets.precompile += %w[store-front/admin_authentication.js]
Rails.application.config.assets.precompile += %w[store-front/home.js]
