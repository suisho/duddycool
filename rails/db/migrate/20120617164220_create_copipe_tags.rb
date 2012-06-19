class CreateCopipeTags < ActiveRecord::Migration
  def change
    create_table :copipe_tags do |t|
      t.integer :copipe_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
