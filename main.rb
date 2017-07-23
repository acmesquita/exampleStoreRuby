require 'highline/import'

load 'product.rb'
load 'order.rb'
load 'cart.rb'


products = [];
orders = [];
carts = [];

loop do

choose do |menu|
	system("clear")
  menu.prompt = "Choose an option:"
  menu.choice(:client) { 
  	system("clear")
  	choose do |menu|
	  menu.prompt = "Hello Client, choose an option:"
	  menu.choice(:list_products) { system("clear")
	  								puts "---- List Products ----"
	  								products.each{|product| puts "#{p.to_s}"}
	  								ask "return?" }
	  menu.choice(:buy) { say("Build...") }
	  menu.choice(:go_to_your_cart) { say("Build...") }
	  menu.default = :client
	end
  }
  menu.choice(:manager) {
  	system("clear")
  	choose do |menu|
	  menu.prompt = "Hello Manager, choose an option:"
	  menu.choice(:create_product) { product = Product.create
	  								 products << product
	  								 product.id = products.length
	  							   }
	  menu.choice(:delete_product) { system("clear")
	  								 puts "---- List Products ----"
	  								 products.each{|p| puts "#{p.to_s}"}
	  								 answer = ask "who id?" 
	  								 products.delete_if{|product| product.id = answer}
	  								}
	  menu.choice(:find_product) {
	  								system("clear")
	  								answer = ask "Title?" 
	  								puts "---- List Products ----"
	  								products.select{ |product|  product.name.include? answer}.each{|p| puts "#{p.to_s}"}
	  								
	  							 }
	  menu.default = :find_product
	end
  }
  menu.choice(:exit){exit}
  menu.default = :client
end

end

def client
	
end

=begin
puts "#### Test 01 ####"

puts "Create product 01"
product01 = Product.new({title:"Product 01", price:10})

puts "Create order 01"
order01 = Order.new({product:product01, quantity:2})

puts order01.to_s

puts "create cart"
cart = Cart.new

puts "Add order 01 to cart"
cart.add(order01)

puts "--- Cart show ---"

cart.show

puts "Total $#{cart.total_price}"

order01.add_quantity()

puts "--- Cart show ---"

cart.show

puts "Total $#{cart.total_price}"

order01.add_quantity(3)

puts "--- Cart show ---"

cart.show

puts "Total $#{cart.total_price}"
=end
