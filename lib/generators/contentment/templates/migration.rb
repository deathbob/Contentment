# Everything listed in this migration will be added to a migration file
# inside of your main app.
class CreateContents < ActiveRecord::Migration
  def self.up
    
    # Birds Table
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

  end # End of self.up

  def self.down
    drop_table :contents
    # You can drop more tables here
  end # End of self.down
end
