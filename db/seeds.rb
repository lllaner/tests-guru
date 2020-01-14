# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
TestsUser.delete_all
User.delete_all
Answer.delete_all
Question.delete_all
Test.delete_all
Category.delete_all

# => Users
user1 = User.create(name: 'Vlad',email: 'vlad@example.com')
user2 = User.create(name: 'Vania',email: 'vania@example.com')
user3 = User.create(name: 'Alex',email: 'alex@example.com')
user4 = User.create(name: 'Moder',email: 'moder@example.com')

# => Category
category1 = Category.create(title: 'Frontend')
category2 = Category.create(title: 'Backand')
category3 = Category.create(title: 'Logic')

# => Tests
test1 = Test.create(title: 'HTML', level: 1, category_id: category1.id, author_id: user4.id)
test2 = Test.create(title: 'Ruby', level: 2, category_id: category2.id, author_id: user4.id)
test3 = Test.create(title: 'CSS', level: 1, category_id: category1.id, author_id: user4.id)
test4 = Test.create(title: 'PHP', level: 2, category_id: category2.id, author_id: user4.id)
test5 = Test.create(title: 'Mathematic', level: 3, category_id: category3.id, author_id: user4.id)
test6 = Test.create(title: 'Machine Logic', level: 5, category_id: category2.id, author_id: user4.id)
test7 = Test.create(title: 'Neural networks', level: 6, category_id:category2.id, author_id: user4.id)
# => Questions

question1 = Question.create(body: 'What do commnd puts?', test_id: test2.id)
question2 = Question.create(body: 'what is result 2 plus 2?', test_id: test5.id)
question3 = Question.create(body: 'what do style box-shadow?', test_id: test3.id)
question4 = Question.create(body: 'what do command echo?', test_id: test4.id)
question5 = Question.create(body: 'what is selector?', test_id: test1.id)

# => Answer
answer1 = Answer.create(body: 'show in consol text', question_id: question1.id)
answer2 = Answer.create(body: 'result is 4', question_id: question2.id)
answer3 = Answer.create(body: 'It add shadow to html element', question_id: question3.id)
answer4 = Answer.create(body: 'show text on page', question_id: question4.id)
answer5 = Answer.create(body: 'selector using in css for add style to html element', question_id: question5.id)



