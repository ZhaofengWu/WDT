# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
20.times do |i|
	post = Post.create!(title: "Hello - #{i}", body: "Body - #{i}", user: User.where(email: /@/).to_a[0])
	reply = Reply.create!(body: "Reply - #{i}", post: post, user: User.where(email: /@/).to_a[0])
end