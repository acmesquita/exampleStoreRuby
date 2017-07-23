class Order

	def initialize (options = {})
		@id = options[:id]
		@product = options[:product]
		@quantity = options[:quantity].to_i
	end

	attr_accessor :quantity, :product, :id

	def to_s
		"ID:" + @id.to_s + " - Product:" +@product.titulo + " - Quantity:" + @quantity.to_s
	end

	def add_quantity(quantity = 1)
		@quantity = quantity;
	end

	def sub_total()
		@product.price * @quantity
	end
end
