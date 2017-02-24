# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

rose = Product.create(name: 'Rose', code: 'R12')
lily = Product.create(name: 'Lily', code: 'L09')
# tulip = Product.create(name: 'Tulip', code: 'T58')

rose.bundles = [Bundle.create(bundle_quantity: 5, bundle_cost: 6.99), Bundle.create(bundle_quantity: 10, bundle_cost: 12.99)]
lily.bundles= [Bundle.create(bundle_quantity: 3, bundle_cost: 9.95), Bundle.create(bundle_quantity: 6, bundle_cost: 16.95), Bundle.create(bundle_quantity: 9, bundle_cost: 24.95)]
# tulip.bundles = [Bundle.create(bundle_quantity: 3, bundle_cost: 5.95), Bundle.create(bundle_quantity: 5, bundle_cost: 9.95), Bundle.create(bundle_quantity: 9, bundle_cost: 16.99)]