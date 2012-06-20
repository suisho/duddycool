class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :screen_name
      t.timestamps
    end
    add_index :users, [:provider, :uid], :name => "provider_uid"
  end
end
