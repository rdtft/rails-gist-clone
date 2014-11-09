class CreateGists < ActiveRecord::Migration
  def change
    create_table :gists do |t|
      t.string :description
      t.text :content, null: false
      t.boolean :private, null: false, default: false

      t.timestamps
    end
  end
end
