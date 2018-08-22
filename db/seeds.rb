# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



course1 = Course.create(name:"Math", teacher_id: 3, desc:"hahahahahahahahahahahahahahahaha", begin_date:"5/14", end_date:"9/28", max_number: 30 )
course2 = Course.create(name:"Biology", teacher_id: 1, desc:"hahahahahahahahahahahahahahahaha", begin_date:"5/14", end_date:"9/28", max_number: 30 )
course3 = Course.create(name:"Chemistry", teacher_id: 3, desc:"hahahahahahahahahahahahahahahaha", begin_date:"5/14", end_date:"9/28", max_number: 30 )
course4 = Course.create(name:"Ruby", teacher_id: 2, desc:"hahahahahahahahahahahahahahahaha", begin_date:"5/14", end_date:"9/28", max_number: 30 )
course5 = Course.create(name:"JavaScript", teacher_id: 2, desc:"hahahahahahahahahahahahahahahaha", begin_date:"5/14", end_date:"9/28", max_number: 30 )

question1 = Question.create(title: "help", content: "who am i?", course_id: 1, user_id: 1)
question1 = Question.create(title: "help", content: "who am i?", course_id: 1, user_id: 1)
question1 = Question.create(title: "help", content: "who am i?", course_id: 1, user_id: 1)


#
#
# question1 = Question.create("",)
#
# create_table "course_selections", force: :cascade do |t|
#   t.integer "course_id"
#   t.integer "user_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
#
# create_table "courses", force: :cascade do |t|
#   t.string "name"
#   t.integer "teacher_id"
#   t.string "desc"
#   t.string "begin_date"
#   t.string "end_date"
#   t.integer "max_number"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
#
# create_table "comments", force: :cascade do |t|
#   t.integer "question_id"
#   t.text "content"
#   t.integer "user_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
#
# create_table "questions", force: :cascade do |t|
#   t.string "title"
#   t.text "content"
#   t.integer "course_id"
#   t.integer "user_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
#
# create_table "users", force: :cascade do |t|
#   t.string "name"
#   t.string "user_type"
#   t.string "user_name"
#   t.string "password_digest"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
