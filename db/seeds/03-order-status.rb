
# order status 
OrderStatus.create!([
	{
		# id: 1,
		name: "Pending"
	},
	{
		# id: 2,
		name: "Ready to Pack"
	},
	{
		# id: 3,
		name: "Ready to Ship"
	},
	{
		# id: 4,
		name: "Shipped"
	},
	{
		# id: 5,
		name: "Verified"
	},
	{
		# id: 6,
		name: "Canceled"
	},
	{
		# id: 7,
		name: "Processing"
	},
	{
	 	# id: "8"
		name: "Completed"
	}
])

pp "Order status Created"
