class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :teacher_id
      t.string :desc
      t.string :begin_date
      t.string :end_date
      t.integer :max_number

      t.timestamps
    end
  end
end
