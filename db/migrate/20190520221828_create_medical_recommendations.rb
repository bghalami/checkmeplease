class CreateMedicalRecommendations < ActiveRecord::Migration[5.1]
  def change
    create_table :medical_recommendations do |t|
      t.integer :recommendation_number
      t.string :issuer
      t.string :state
      t.date :expiration_date
      t.string :path_to_image
      t.references :user, foreign_key: true
    end
  end
end
