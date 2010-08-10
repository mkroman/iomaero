class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.string :sid
      t.binary :data
      t.string :name
      t.string :content_type
      t.string :remote_address

      t.timestamps
    end
  end

  def self.down
    drop_table :contents
  end
end
