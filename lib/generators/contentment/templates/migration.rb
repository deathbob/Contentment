class CreateContents < ActiveRecord::Migration

  def self.up
    create_table :contents do |t|
      t.string   :title
      t.text     :body
      t.string   :tipe
      t.string   :dom_id
      t.integer  :position
      t.boolean  :visible
      t.string   :link
      t.timestamps
    end
  end

  def self.down
    drop_table :contents
  end

end
