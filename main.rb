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
  menu.prompt = "Hello, ? "
  menu.choice(:client) { 
  	system("clear")
  	choose do |menu|
	  menu.prompt = "Hello Client, choose an option"
	  menu.choice(:list_products) { 
	  								choose do |menu|
	  									menu.prompt = "Choose an product"
	  									menu.choices(products){say("p")}
	  								end
	  							 }
	  menu.choice(:buy) { say("Not from around here, are you?") }
	  menu.choice(:go_to_your_cart) { say("Not from around here, are you?") }
	  menu.default = :client
	end
  }
  menu.choice(:manager) {
  	system("clear")
  	choose do |menu|
	  menu.prompt = "Hello Manager, choose an option"
	  menu.choice(:create_product) { product = Product.create
	  								 products << product }
	  menu.choice(:delete_product) { say("delete product") }
	  menu.choice(:find_product) { say("find product") }
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
