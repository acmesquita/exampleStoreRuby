require 'highline/import'

class Product

	def initialize (options = {})
		@id = options[:id]
		@title = options[:title]
		@price = options[:price].to_f
	end

	def to_s
		"#"+ @id.to_s + " " + @title + " - $" + @price.to_s
	end
	attr_accessor :title, :price, :id

	def self.create
		system("clear")
		title = ask "Please, enter for title for product."
		price = ask "Please, how a price?", Float

		say("Product create successfully.")
		Product.new({title: title, price: price})
	end

	
end
