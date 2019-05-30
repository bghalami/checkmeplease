class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email_address
      t.date :date_of_birth

      t.timestamps
    end
  end
end
