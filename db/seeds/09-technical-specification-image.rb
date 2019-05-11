# frozen_string_literal: true

images = [
  Rails.root + 'app/assets/images/technical-specifications/e500-front.png',
  Rails.root + 'app/assets/images/technical-specifications/e75-explode.png',
  Rails.root + 'app/assets/images/technical-specifications/solar-specifications_800x.png'
]

TechnicalSpecificationImage.create([
                                     {
                                       product_id: 1,
                                       image: File.open(images[0])
                                     },
                                     {
                                       product_id: 2,
                                       image: File.open(images[1])
                                     },
                                     {
                                       product_id: 3,
                                       image: File.open(images[2])
                                     }
                                   ])

pp 'technical specification image created'
