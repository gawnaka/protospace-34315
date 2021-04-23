class CreatePrototypes < ActiveRecord::Migration[6.0]
    def change
      create_table :prototypes do |t|
        t.references  :user,                foreign_key: true
        t.text        :concept
        t.text        :catch_copy
        t.string      :title,               null: false, default: ""
        t.timestamps
      end
    end
  end
