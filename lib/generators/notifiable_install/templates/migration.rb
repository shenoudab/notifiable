class SoonerCreateSubscribers < ActiveRecord::Migration
  def self.up
    create_table :notifications do |t|
      t.string        :header
      t.string        :level
      t.text          :message
      t.boolean       :dismissed, :default => false
      t.boolean       :dismissable, :default => false
      t.datetime      :expires
      t.references    :notifiable, :polymorphic => true
      #Any additional fields here  
      t.timestamps   
    end

    add_index :notifications, [:dismissed, :expires], :name => 'viewable_index'
    add_index :notifications, [:notifiable_type, :notifiable_id], :name => 'notifiable'

  end
  
  def self.down
    drop_table :notifications 
  end
  
end
