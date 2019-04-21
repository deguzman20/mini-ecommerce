images = [
	Rails.root + "app/assets/images/product-features/portable.png",
	Rails.root + "app/assets/images/product-features/solar.png",
	Rails.root + "app/assets/images/product-features/charge.png",
	Rails.root + "app/assets/images/product-features/fastcharge.png",
	Rails.root + "app/assets/images/product-features/surge.png",
	Rails.root + "app/assets/images/product-features/splashproof.png"
]

ProductFeature.create([
  {
  	name:'Portable', 
	image: File.open(images[0]),
  },
  {
  	name:'Solar Ready', 
	image: File.open(images[1]),
  },
  {
  	name:'High Capacity', 
	image: File.open(images[2]),
  },
  {
  	name:'Quick Charge', 
	image: File.open(images[3]),
  },
  {
  	name:'Power Surge Protection', 
	image: File.open(images[4]),
  },
  {
  	name:'Splash Proof', 
	image: File.open(images[5]),
  }
])

pp 'product feature created'