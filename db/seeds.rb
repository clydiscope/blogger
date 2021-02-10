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

users = User.all

#labels

20.times do
	Label.create!(
		name: RandomData.random_word
	)
labels = Label.all

end

# Topic
15.times do
	Topic.create!(
		name: 				RandomData.random_sentence,
		description:	RandomData.random_paragraph,
#		label:				labels.sample
	)
end
topics = Topic.all


# Post
50.times do

	Post.create!(
		user: 	users.sample,
		topic: 	topics.sample,
		title: 	RandomData.random_sentence,
		body: 	RandomData.random_paragraph,
#		label:	labels.sample
	)
end
posts = Post.all


# Comment

50.times do

	Comment.create!(
		user: users.sample,													#Picks a random post from the array
		body: RandomData.random_paragraph,
		commentable: posts.sample
	)
end

50.times do

	Comment.create!(
		user: users.sample,													#Picks a random post from the array
		body: RandomData.random_paragraph,
		commentable: topics.sample
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