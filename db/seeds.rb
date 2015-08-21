# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
email: 'Benjamin.Rombaut@ugent.be',
uid: 'berombau',
name: 'Benjamin Rombaut',
role: 'admin',
created_at: Time.now,
updated_at: Time.now
) unless User.where(email: email).exists?
user.save!
puts 'ADDED USER: ' << User.find_by_uid("berombau")
