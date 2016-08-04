user1 = User.create(email: "jason@katalyst.com.au", password: "katalyst", password_confirmation: "katalyst")
user2 = User.create(email: "sarah@katalyst.com.au", password: "katalyst", password_confirmation: "katalyst")
user3 = User.create(email: "guy@katalyst.com.au", password: "katalyst", password_confirmation: "katalyst")

designer = Designer.create(title: "Salmon Studio")
designer.users << user2

printer = Printer.create(title: "Finsbury Green")
printer.users << user3

client = Client.create(title: "Katalyst")
client.users << user1

job = Job.create!(title: "Guide Dogs annual report", description: "This is an annual report", client: client, designer: designer)


user4 = User.create(email: "jason@foo.com.au", password: "katalyst", password_confirmation: "katalyst")
user5 = User.create(email: "sarah@foo.com.au", password: "katalyst", password_confirmation: "katalyst")
user6 = User.create(email: "guy@foo.com.au", password: "katalyst", password_confirmation: "katalyst")

designer2 = Designer.create(title: "Voice Design")
designer2.users << user5

printer2 = Printer.create(title: "Snap Printing")
printer2.users << user6

client2 = Client.create(title: "Oliveri")
printer2.users << user4

job2 = Job.create!(title: "Oliveri annual report", description: "This is an annual report", client: client2, designer: designer2)

