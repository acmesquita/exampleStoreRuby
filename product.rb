class Product

	def initialize (options = {})
		@title = options[:title]
		@price = options[:price].to_i
	end

	def to_s
		@title + " - $" + @price.to_s
	end
	attr_accessor :title, :price
end
