# frozen_string_literal: true

images = [
  Rails.root + 'app/assets/images/blog/Mr.-Vinscent-Gahol-Provincial-DRRM-Officer-with-his-5-x-Explorer-500-e1531757889999-768x1024_large.jpg',
  Rails.root + 'app/assets/images/blog/Dr.-Harry-C-Cacha-Gynecologist-with-E500-powering-his-ultrasound-machine-e1531757648412.jpg',
  Rails.root + 'app/assets/images/blog/Alan-Nash-El-Galleon-Resort-Owner-with-his-E500.jpg',
  Rails.root + 'app/assets/images/blog/Ana-Maria-Devilla-from-Batangas-with-her-E500_1024x1024.png'
]
Blog.create([
              {
                name: 'Mr. Vinscent Gahol',
                title: 'Provincial DRRM Officer with his 5 x Explorer 500',
                image: File.open(images[0])
              },
              {
                name: 'Dr. Harry C Cacha',
                title: 'Gynecologist with E500 powering his ultrasound machine',
                image: File.open(images[1])
              },
              {
                name: 'Allan Nash',
                title: 'El Galleon Resort Owner with his E500',
                image: File.open(images[2])
              },
              {
                name: 'Ana Maria Devilla',
                title: 'from Batangas with her E500',
                image: File.open(images[3])
              }
            ])
