class CreateGoodDogs < ActiveRecord::Migration[5.1]
  def change
    create_table :good_dogs do |t|
      t.string :name
      t.string :breed_1
      t.string :breed_2
      t.string :color_1
      t.string :color_2
      t.string :color_3
      t.string :sex
      t.string :zip_code
      t.integer :birth_month
      t.integer :birth_year
      t.boolean :guard_or_trained
      t.boolean :vaccinated
      t.boolean :spayed_or_neutered
    end
  end
end
