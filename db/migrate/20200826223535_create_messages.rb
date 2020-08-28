class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :content

      t.timestamps
      t.references :user, null: false
      t.references :room, null: false
    end
  end
end
