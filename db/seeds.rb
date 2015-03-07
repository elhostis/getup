# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

user = User.new({email: 'iraiser@iraiser.eu', password: "azertyui", password_confirmation: 'azertyui'})
user.skip_confirmation!
user.save
