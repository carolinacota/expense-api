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
carol = User.create(email: "carolinareycota@gmail.com", password: "12345678")

puts "Creating Transactions"
t1 = Transaction.create(value: 33, currency: "euro", paid_on: "01/03/2020",
                        description: "health insurance", category: health,
                        user: carol)

t2 = Transaction.create(value: 59, currency: "euro", paid_on: "18/03/2020",
                        description: "mercadona", category: supermarket,
                        user: carol)

t3 = Transaction.create(value: 1100, currency: "euro", paid_on: "16/03/2020",
                        description: "rent + bills", category: home,
                        user: carol)

t4 = Transaction.create(value: 1100, currency: "euro", paid_on: "15/02/2020",
                        description: "club", category: entertainment,
                        user: carol)

t5 = Transaction.create(value: 1100, currency: "euro", paid_on: "20/02/2020",
                        description: "jeans", category: clothing,
                        user: carol)

t6 = Transaction.create(value: 1100, currency: "euro", paid_on: "29/02/2020",
                        description: "burger", category: foodAndDrink,
                        user: carol)

