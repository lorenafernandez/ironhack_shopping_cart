require 'pry'
require 'pry-byebug'
require 'colorize'

class ShoppingCart

	def initialize
		@prices_table = FileReader.new
		@products = []
	end

	def add (product)
		@products << product.name
	end

	def total_cost
		cost = 0
		products_prices_pairs = @prices_table.read

		@products.each do |product|
			products_prices_pairs.each do |key,value|
				if key == product
					cost += value.to_i	
				end
			end
		end
		puts cost
	end

end

class Fruit 
	attr_accessor :name
	def initialize(name)
		@name = name
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

cart.add(apple)
cart.add(banana) 

cart.total_cost 

