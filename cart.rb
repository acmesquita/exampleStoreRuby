class Cart

	def initialize (options = {})
		@id = options[:id]
		@orders = []
	end
	attr_accessor :orders

	def show
		puts "---- My Cart ----"
		puts
		@orders.each{|o| puts "ID:#{o.id} - Quantity: #{o.quantity} - Product: #{o.product.title} $#{o.product.price}  Sub-total: $ #{o.sub_total()} "}
		puts
		puts "Total: $"+ total_price().to_s
		puts
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