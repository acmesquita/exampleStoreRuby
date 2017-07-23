class Order

	def initialize (options = {})
		@id = options[:id]
		@product = options[:product]
		@quantity = options[:quantity].to_i
	end

	attr_accessor :quantity, :product, :id

	def to_s
		@product.to_s + " - " + @quantity.to_s
	end

	def add_quantity(quantity = 1)
		@quantity += quantity;
	end
end
