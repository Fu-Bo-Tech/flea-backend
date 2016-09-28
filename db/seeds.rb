# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
alice = User.create!(email: 'alice@mail.com', name: 'Alice', password: '12345678', nickname: 'AAlice')

Good.create([
              { title: 'car', description: 'super faster', bidding_time: DateTime.now, owner: alice },
              { title: 'plane', description: 'WTF expensive', bidding_time: 2.days.ago, owner: alice }
            ])
