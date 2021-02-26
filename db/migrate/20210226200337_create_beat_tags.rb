class CreateBeatTags < ActiveRecord::Migration[6.0]
  def change
    create_table :beat_tags do |t|
      t.integer :beat_id
      t.string :tag

      t.timestamps
    end
  end
end
