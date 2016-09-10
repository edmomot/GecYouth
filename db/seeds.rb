# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.new(first_name: 'Ed', last_name: 'Momot', email: 'ed.momot@gmail.com',
            phone: '6146539110', birth_date: '1993-05-12', password: 'Password')



a = Address.create(address1: '123 Main St', city: 'Columbus', state: 'OH', zip: '43119')

u.address = a

u.save