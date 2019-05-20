class CreateStateIds < ActiveRecord::Migration[5.1]
  def change
    create_table :state_ids do |t|
      t.integer :id_number
      t.string :state
      t.date :expiration_date
      t.string :path_to_image
      t.references :user, foreign_key: true
    end
  end
end
