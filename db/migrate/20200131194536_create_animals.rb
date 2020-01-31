class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string "name"
      t.string "kind"
      t.string "breed"
      t.integer "age"
    end
  end
end
