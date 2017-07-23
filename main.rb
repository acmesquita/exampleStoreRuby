require 'highline/import'

load 'product.rb'
load 'order.rb'
load 'cart.rb'


products = [];
orders = [];
cart = Cart.new

loop do

choose do |menu|
	system("clear")
	puts "-------- Store --------"
	puts
  menu.prompt = "Choose an option:"
  menu.choice(:client) { 
  	system("clear")
  	puts "-------- Store --------"
	puts
  	choose do |menu|
	  menu.prompt = "Hello Client, Choose an option:"
	  menu.choice(:find_product) {
	  								system("clear")
	  								answer = ask "Find by title" 
	  								puts "---- List Products ----"
	  								products.select{ |product|  product.title.include? answer}.each{|product| puts "#{product.to_s}"}
	  								
	  								ask "return?"
	  							 }
	  menu.choice(:list_products) { system("clear")
	  								puts "---- List Products ----"
	  								puts
	  								products.each{|product| puts "#{product.to_s}"}
	  								ask "return?" }
	  menu.choice(:add_to_cart) { system("clear")
						  puts "---- List Products ----"
						  puts
						  products.each{|product| puts "#{product.to_s}"}
						  id = ask "Choose your product, informe the id:"
						  quant = ask "Quantity:"
						  product = products.select{ |product|  product.id == id.to_i}.first
						  order = Order.new({product: product, quantity:quant})
						  orders << order
						  order.id = orders.length

						  cart.add(order)
						  
						  choose do |menu|
							menu.prompt = "Choose an option:"
							menu.choice(:see_cart){
								system("clear")
								cart.show
								ask "return?"
							}
							menu.choice(:return){}
							menu.default = :return
						  end
	  					}
	  menu.choice(:go_to_your_cart) { system("clear")

	  								cart.show
	  								
	  								choose do |menu|
	  									menu.prompt = "Choose an option:"
	  									menu.choice(:remove_order){
	  										system("clear")
	  										cart.show
	  										id = ask "Choose an product, informe the id order:"
	  										system("clear")
	  										order = orders.select{ |order| order.id == id.to_i}.first
	  										answer = ask("Are you sure?  ") { |q| q.default = "yes" }
	  										if answer == "yes"
	  											orders.delete(order)
	  											cart.orders.delete(order)
	  										end
	  										
	  									}
	  									menu.choice(:chance_quantity){
	  										system("clear")
	  										cart.show
	  										id = ask "Choose an product, informe the id order:"
	  										order = orders.select{ |order| order.id == id.to_i}.first
	  										answer = ask "Informe an quantity:"
	  										order.add_quantity(answer.to_i)
	  									}
	  									menu.choice(:finalizar){
	  										system("clear")
	  										cart.show
	  										puts "Done, Thank you!!"
	  										exit
	  									}
	  									menu.choice(:return){}
	  									menu.default = :return
	  								end
	  								}
	  menu.default = :list_products
	end
  }
  menu.choice(:manager) {
  	system("clear")
  	puts "-------- Store --------"
	puts
  	choose do |menu|
	  menu.prompt = "Hello Manager, Choose an option:"
	  menu.choice(:create_product) { product = Product.create
	  								 products << product
	  								 product.id = products.length
	  							   }
	  menu.choice(:delete_product) { system("clear")
	  								 puts "---- List Products ----"
	  								 puts
	  								 products.each{|product| puts "#{product.to_s}"}
	  								 answer = ask "who id?", Integer
	  								 products.delete_if{|product| product.id == answer.to_i}
	  								}
	  menu.choice(:find_product) {
	  								system("clear")
	  								puts "---- Find Products ----"
	  								puts
	  								answer = ask "Find by title" 
	  								puts "---- List Products ----"
	  								puts
	  								products.select{ |product|  product.title.include? answer}.each{|product| puts "#{product.to_s}"}
	  								ask "return?"
	  							 }
	  menu.default = :create_product
	end
  }
  menu.choice(:exit){exit}
  menu.default = :client
end

end