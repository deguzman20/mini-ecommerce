images = [
  Rails.root + 'app/assets/images/powerlife/1.jpg',
  Rails.root + 'app/assets/images/powerlife/2.jpg',
  Rails.root + 'app/assets/images/powerlife/3.jpg'
]

WallOfPower.create([
 {
   image: File.open(images[0]),
   name: 'Mark',
   owner_product: 'E500',
   title:'Great Product'
 },
 {
   image: File.open(images[1]),
   name: 'Richard',
   owner_product: 'E500',
   title:'Nice Product'
 },
  {
   image: File.open(images[2]),
   name: 'John',
   owner_product: 'E500',
   title:'Nice Product'
 },
])