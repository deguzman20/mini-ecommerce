# frozen_string_literal: true

images = [
  Rails.root + 'app/assets/images/products/E500-product-display.png',
  Rails.root + 'app/assets/images/products/E75-product-display.png',
  Rails.root + 'app/assets/images/products/sp100-product-display_600x.png'
]

Product.create([
                 {
                   name: 'Explorer 500',
                   image: File.open(images[0]),
                   price: 12_000,
                   product_description: 'A high-capacity Lithium-ion battery power generator that can be charged by AC outlet or solar panel. Ideal as a power back-up for brownouts and emergencies, it is also an ultra-portable 500W mobile power source for outdoor activities such as hiking, camping and boating.',
                   weight: 10.1
                 },
                 {
                   name: 'Explorer 75',
                   image: File.open(images[1]),
                   price: 1000,
                   product_description: 'The ultimate all-in one Lithium-ion battery accessory to power up your electronic devices while you are on the go. With a unique built-in AC power plug, it is an ultra-high capacity power bank that can charge laptops and small appliances.',
                   weight: 12.0
                 },
                 {
                   name: 'Solar Panel 100',
                   image: File.open(images[2]),
                   price: 10,
                   product_description: 'The SP100 is a 100watt solar panel specifically designed as a charging partner to the Explorer 500 power generator. Rugged, portable and foldable. It is light and easily transportable when you need a sustainable power source for extended periods of time due to emergency or disaster situations.',
                   weight: 9.0
                 }
               ])

pp 'products created'
