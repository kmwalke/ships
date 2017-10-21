# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


ships = Ship.create(
    [
        {
            name:  'Falcon',
            color: 'Grey'
        },
        {
            name:  'Heart of gold',
            color: 'many'
        }
    ]
)

cockpit = Component.create(name: 'Cockpit', affect: 'piloting')
medbay  = Component.create(name: 'Medbay', affect: 'healing')

ships.first.components << cockpit
ships.first.components << medbay
ships.last.components << cockpit
