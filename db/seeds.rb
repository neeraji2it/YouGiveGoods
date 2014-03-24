# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = Admin.new(:email => "yougivegds@gmail.com", :password => "yougive!@#", :first_name => "YouGive", :last_name => "Goods")
admin.save(:validate => false)