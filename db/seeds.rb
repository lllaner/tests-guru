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
User.create(name: 'Vlad')
User.create(name: 'Vania')
User.create(name: 'Alex')

# => Category
Category.create(title: 'Frontend')
Category.create(title: 'Backand')
Category.create(title: 'Logic')

# => Tests
Test.create(title: 'HTML', category_id: 1)
Test.create(title: 'Ruby', level: 2, category_id: 2)
Test.create(title: 'CSS', category_id: 1)
Test.create(title: 'PHP', level: 2, category_id: 2)
Test.create(title: 'Mathematic', level: 3, category_id: 3)

# => Questions

Question.create(body: 'What do commnd puts?', test_id: 2)
Question.create(body: 'what is result 2 plus 2?', test_id: 5)
Question.create(body: 'what do style box-shadow?', test_id: 3)
Question.create(body: 'what do command echo?', test_id: 4)
Question.create(body: 'what is selector?', test_id: 1)


# => Answer
Answer.create(body: 'show in consol text', question_id: 1)
Answer.create(body: 'result is 4', question_id: 2)
Answer.create(body: 'It add shadow to html element', question_id: 3)
Answer.create(body: 'show text on page', question_id: 4)
Answer.create(body: 'selector using in css for add style to html element', question_id: 5)

# => UserTest

UserTest.create(user_id: 1, test_id: 1)
UserTest.create(user_id: 1, test_id: 3)
UserTest.create(user_id: 1, test_id: 4)
UserTest.create(user_id: 2, test_id: 2)
UserTest.create(user_id: 2, test_id: 5)
