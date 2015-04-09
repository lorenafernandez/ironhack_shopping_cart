require 'pry'
require 'pry-byebug'
require 'colorize'
require 'date'

class ShoppingCart

	def initialize
		@prices_table = FileReader.new
		@products = []
	end

	def add (product)
		@products << product
	end

	def item_counter
		@products.length
	end

	def cost_and_discount
		@cost = 0
		products_prices_pairs = @prices_table.read
		@products.each do |product|
		products_prices_pairs.each do |key,value|
				if key == product.name
					@discount = product.discount (value)
					@cost += value.to_i	- @discount
				end
			end
		end
		total_cost
	end

	def total_cost
		
		if item_counter > 5
			puts final_price = @cost - 0.1 * @cost
		else
			puts final_price = @cost
		end
	end

end

class Product 
	attr_accessor :name
	def initialize(name)
		@name = name
		@discount = 0
	end
	def discount(price)
		@discount = 0
	end
end

class Fruit < Product
	def discount(price)
		if Date.today.wday == 0 || Date.today.wday == 6
			@discount = 0.1 * price.to_i
		else
			@discount = 0
		end
	end
end

class Housewares < Product
	def discount(price)
		if price.to_i > 100
			@discount = 0.05 * price.to_i
		else
			@discount = 0
		end
	end
end

class FileReader
	def read
		file = IO.read('prices.txt')
		products = file.split("\n")		
		products_hash = {}
		products.each do |product|
			item = product.split(",")
			products_hash[item[0]] = item[1]
		end
		return products_hash
	end
end

cart = ShoppingCart.new
apple = Fruit.new("apples")
banana = Fruit.new("banana")
vacuum_cleaner = Housewares.new("vacuum cleaner")
rice = Product.new("rice")
anchovies = Product.new("anchovies")


cart.add(apple)
cart.add(banana) 
cart.add(vacuum_cleaner)
cart.add(rice)
cart.add(anchovies)


cart.cost_and_discount 

