class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|

      t.references :user, null: false, foreign_key: true
      t.boolean :seen, default: false
      t.references :notifeable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
