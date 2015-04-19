# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Species.create(
  [
    {
      name: 'brown trout'
    },
    {
      name: 'rainbow trout'
    },
    {
      name: 'salmon'
    },
    {
      name: 'sea trout'
    }
  ]
)

WaterType.create(
  [
    {
      category: 'loch'
    },
    {
      category: 'river'
    },
    {
      category: 'reservoir'
    }
  ]
)
