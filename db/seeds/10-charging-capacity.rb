images = [
	Rails.root + "app/assets/images/charging-capacity/pl-icon-digicam.png",
	Rails.root + "app/assets/images/charging-capacity/pl-icon-fan.png",
	Rails.root + "app/assets/images/charging-capacity/pl-icon-fridge.png",
	Rails.root + "app/assets/images/charging-capacity/pl-icon-laptop.png",
	Rails.root + "app/assets/images/charging-capacity/pl-icon-light.png",
	Rails.root + "app/assets/images/charging-capacity/pl-icon-smartphone.png",
	Rails.root + "app/assets/images/charging-capacity/pl-icon-tablet.png",
	Rails.root + "app/assets/images/charging-capacity/pl-icon-tv.png",
]

ChargingCapacity.create([
  {
  	product_id: 1,
    image: File.open(images[2]),
    first_text: '9+ Hours',
    second_text: 'Mini Fridge'
  },
  {
  	product_id: 1,
    image: File.open(images[7]),
    first_text: '3+ Hours',
    second_text: 'LED TV'
  },
  {
  	product_id: 1,
    image: File.open(images[3]),
    first_text: '3-6 Recharges',
    second_text: 'Laptop'
  },
  {
  	product_id: 1,
    image: File.open(images[0]),
    first_text: '30+ Recharges',
    second_text: 'Digital Camera'
  },
  {
  	product_id: 1,
    image: File.open(images[6]),
    first_text: '15+ Recharges',
    second_text: 'Tablet'
  },
  {
  	product_id: 1,
    image: File.open(images[5]),
    first_text: '40+ Recharges',
    second_text: 'Smartphones'
  },
  {
  	product_id: 1,
    image: File.open(images[1]),
    first_text: '12+ Hours',
    second_text: 'Fan'
  },
  {
  	product_id: 1,
    image: File.open(images[4]),
    first_text: '90+ Hours',
    second_text: '12V / 5V Lights'
  },
  {
  	product_id: 2,
    image: File.open(images[3]),
    first_text: '1-2 Recharges',
    second_text: 'Laptop'
  },
  {
  	product_id: 2,
    image: File.open(images[0]),
    first_text: '9+ Recharges',
    second_text: 'Digital Camera'
  },
  {
  	product_id: 2,
    image: File.open(images[6]),
    first_text: '4-5 Recharges',
    second_text: 'Tablet'
  },
  {
  	product_id: 2,
    image: File.open(images[5]),
    first_text: '6-7 Recharges',
    second_text: 'Smartphones'
  },
  {
  	product_id: 2,
    image: File.open(images[1]),
    first_text: '2+ Hours',
    second_text: 'Fan'
  },
  {
  	product_id: 2,
    image: File.open(images[4]),
    first_text: '2+ Hours',
    second_text: 'Fan'
  }
])