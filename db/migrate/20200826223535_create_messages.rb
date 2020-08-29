class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :content

      t.timestamps
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
    end
  end
end
