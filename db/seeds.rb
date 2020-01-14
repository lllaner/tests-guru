# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
UserTest.delete_all
User.delete_all
Test.delete_all
Answer.delete_all
Question.delete_all
Category.delete_all

# => Users
user1 = User.create(name: 'Vlad')
user2 = User.create(name: 'Vania')
user3 = User.create(name: 'Alex')

# => Category
category1 = Category.create(title: 'Frontend')
category2 = Category.create(title: 'Backand')
category3 = Category.create(title: 'Logic')

# => Tests
test1 = Test.create(title: 'HTML', category1.id)
test2 = Test.create(title: 'Ruby', level: 2, category2.id)
test3 = Test.create(title: 'CSS', category1.id)
test4 = Test.create(title: 'PHP', level: 2, category2.id)
test5 = Test.create(title: 'Mathematic', level: 3, category3.id)

# => Questions

question1 = Question.create(body: 'What do commnd puts?', test2.id)
question2 = Question.create(body: 'what is result 2 plus 2?', test5.id)
question3 = Question.create(body: 'what do style box-shadow?', test3.id)
question4 = Question.create(body: 'what do command echo?', test4.id)
question5 = Question.create(body: 'what is selector?', test1.id)


# => Answer
answer1 = Answer.create(body: 'show in consol text', question1.id)
answer2 = Answer.create(body: 'result is 4', question2.id)
answer3 = Answer.create(body: 'It add shadow to html element', question3.id)
answer4 = Answer.create(body: 'show text on page', question4.id)
answer5 = Answer.create(body: 'selector using in css for add style to html element', question5.id)

# => UserTest

usertest1 = UserTest.create(user1.id, test1.id)
usertest2 = UserTest.create(user1.id, test3.id)
usertest3 = UserTest.create(user1.id, test4.id)
usertest4 = UserTest.create(user2.id, test2.id)
usertest5 = UserTest.create(user2.id, test5.id)
