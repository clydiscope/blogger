require 'random_data'

# Users


5.times do
	User.create!(
		name:			RandomData.random_name,
		email:		RandomData.random_email,
		password:	RandomData.random_sentence
	)
end

admin = User.create!(
	name:			'Admin User',
	email:		'admin@example.com',
	password:	'helloworld',
	role:			'admin'
)

member = User.create!(
	name:			'Member User',
	email:		'member@example.com',
	password:	'helloworld'
)

moderator = User.create!(
	name: 		'Moderator User',
	email:		'moderator@example.com',
	password: 'helloworld',
	role: 		'moderator'
	
	
)

users = User.all

# Topic
15.times do
	Topic.create!(
		name: 				RandomData.random_sentence,
		description:	RandomData.random_paragraph
	)
end
topics = Topic.all


# Topic
50.times do

	Post.create!(
		user: users.sample,
		topic: topics.sample,
		title: RandomData.random_sentence,
		body: RandomData.random_paragraph
	)
end
posts = Post.all


# Posts

100.times do

	Comment.create!(
		post: posts.sample,													#Picks a random post from the array
		body: RandomData.random_paragraph
	)
end

50.times do
	
	SponsoredPost.create!(
		topic: topics.sample,
		title: RandomData.random_sentence,
		body: RandomData.random_paragraph,
		price: rand(1..10)
	)	
end

user = User.first
user.update_attributes!(
	email: 'youremail.com',
	password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{SponsoredPost.count} sponsored posts created"