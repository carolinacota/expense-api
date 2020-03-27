require 'money'

Category.destroy_all
User.destroy_all
Transaction.destroy_all

puts "Creating Categories"
health = Category.create(name: "health", color: "blue")
home = Category.create(name: "home", color: "red")
clothing = Category.create(name: "clothing", color: "black")
education = Category.create(name: "education", color: "white")
entertainment = Category.create(name: "entertainment", color: "pink")
foodAndDrink = Category.create(name: "food and drink", color: "purple")
supermarket = Category.create(name: "supermarket", color: "green")
transportation = Category.create(name: "transportation", color: "orange")

puts "Creating Users"
carol = User.create(email: "carolinarcota@gmail.com", password: "12345678")
carol2 = User.create(email: "carolinareycota@gmail.com", password: "12345678")


puts "Creating Transactions"
t1 = Transaction.create(price_cents: 3333, paid_on: "01/03/2020",
                        description: "health insurance", category: health,
                        user: carol)
# t1.save!
# puts t1
# puts t1.price
# puts `T1:  #{t1.paid_on}`
# m = Money.new(3440, 'BRL')
# puts m

t2 = Transaction.create(price_cents: 3440, paid_on: "18/03/2020",
                        description: "mercadona", category: supermarket,
                        user: carol2)

t3 = Transaction.create(price_cents: 80000, paid_on: "16/03/2020",
                        description: "rent + bills", category: home,
                        user: carol)

t4 = Transaction.create(price_cents: 7000, paid_on: "15/02/2020",
                        description: "club", category: entertainment,
                        user: carol)

t6 = Transaction.create(price_cents: 2500, paid_on: "28/02/2020",
                        description: "burger", category: foodAndDrink,
                        user: carol2)

t6 = Transaction.create(price_cents: 2800, paid_on: "28/03/2020",
                        description: "burger", category: foodAndDrink,
                        user: carol2)

t5 = Transaction.create(price_cents: 4500, paid_on: "20/03/2020",
                        description: "jeans", category: clothing,
                        user: carol2)

t6 = Transaction.create(price: Money.new(3440, 'BRL'), paid_on: "18/03/2020",
                        description: "energy", category: home,
                        user: carol2)
