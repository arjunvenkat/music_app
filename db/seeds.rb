# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Note.destroy_all


["C", "C sharp", "D", "D sharp", "E", "F", "F sharp", "G", 
  "G sharp", "A", "A sharp", "B"].each do |note|
  Note.create(name: note, form: "major")
end


["C", "C sharp", "D", "D sharp", "E", "F", "F sharp", "G", 
  "G sharp", "A", "A sharp", "B"].each do |note|
  Note.create(name: note, form: "minor")
end
