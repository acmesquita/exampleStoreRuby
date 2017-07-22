class Cart

	def initialize (options = [])
		@id = options[:id]
		@orders = []
	end
	attr_accessor :orders

	def show
		@orders.each{|o| puts "#{o.quantity} - #{o.product}"}
	end

	def add(order)
		@orders << order
	end

	def remove(order)
		@orders.delete(order)
	end

	def total_price
		@orders.map { |o| o.quantity * o.product.price }.sum
	end
end