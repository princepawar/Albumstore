class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.float :math
      t.float :science
      t.float :english
      t.float :percentage

      t.timestamps null: false
    end
  end
end
