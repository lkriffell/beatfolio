class CreateBeats < ActiveRecord::Migration[6.0]
  def change
    create_table :beats do |t|
      t.integer :user_id
      t.string :name
      t.string :image
      t.string :description
      t.attachment :audio

      t.timestamps
    end
  end
end
