# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!([
  {
  email: 'Benjamin.Rombaut@gmail.com',
  uid: 'berombau',
  username: 'berombau',
  cas_givenname: 'Benjamin',
  cas_surname: 'Rombaut',
  cas_ugentStudentID: '01300348',
  cas_mail: 'Benjamin.Rombaut@gmail.com',
  cas_uid: 'berombau',
  role: 'admin',
  }
])
puts 'ADDED USERS SUCCESFULLY'

Comfy::Cms::Site.create!(identifier: 'default-site', hostname: 'default.dev')
Comfy::Cms::Layout.create!(site_id: 'default-site', identifier: 'default-layout', label: 'Default Layout', content: '{{ cms:page:content:rich_text }}')
Comfy::Cms::Page.create!(site_id: 'default-site', layout_id: 'default-layout', label: 'Default Page', full_path: 'default.dev', content_cache: 'Welcome!')

puts 'ADDED CMS SITE SUCCESFULLY'
