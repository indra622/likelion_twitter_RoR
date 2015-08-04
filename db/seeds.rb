# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.create(post_username: "sejin", post_password:"1234", post_content:"sdfsdf")

post = Post.new
post.post_username = "sese"
post.post_content= "fffff"
post.post_password = "1234"
post.save