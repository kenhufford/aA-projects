# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cats = Cat.create([
  { birth_date: '2015/01/20', color: 'black', name: 'fido', sex: 'M'},
  { birth_date: '2015/01/20', color: 'grey', name: 'cat', sex: 'f'},
  { birth_date: '2013/01/20', color: 'white', name: 'evans', sex: 'M'},
  { birth_date: '2015/03/20', color: 'ginger', name: 'frank', sex: 'M'}  
])

cat_rentals = CatRentalRequest.create([
  { cat_id: 1, start_date: '2019/11/05', end_date: '2019/11/07', status: 'APPROVED'},
  { cat_id: 1, start_date: '2019/11/12', end_date: '2019/11/15', status: 'APPROVED'},
  { cat_id: 1, start_date: '2019/11/25', end_date: '2019/11/30', status: 'APPROVED'},
])