Shopping cart

We are building a shopping cart for our new awesome website. Excepting that we have no website yet everything is in place and ready for our work.

We need something that calculates the total cost of our purchases but also that applies some discounts to some items.

Iteration 1

Write a shopping cart where you can add items. For example

cart = ShoppingCart.new
apple = Fuit.new("apple")
banana = Fruit.new("banana")

cart.add apple
cart.add banana

cart.cost 
#=> 30
Use this table of prices

apples     10$
oranges     5$
banana     20$
watermelon 50$
rice          1$
vacuum cleaner 150$
anchovies     2$
Iteration 2

Our cart needs to also calculate discount. Remember that we need to be open for future developers to write other discounts.

At this moment we have this deals:

By default, items will have no discount.
If an item has a discount, it should be calculated by calling a discount method on that item.
Fruits have no discount during weekdays but on weekends they have a 10% discount.
Housewares have no discount unless their unit price is more than 100€ / $100. In that case they have a 5% discount.
When a customer has more than 5 items in their cart, they get a 10% discount for that purchase.

