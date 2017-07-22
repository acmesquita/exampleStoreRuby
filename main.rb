load 'product.rb'
load 'order.rb'
load 'cart.rb'


products = [];
orders = [];
carts = [];




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
