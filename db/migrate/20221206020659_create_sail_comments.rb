class CreateSailComments < ActiveRecord::Migration[5.1]
  def change
    create_table :sail_comments do |t|
      t.text :content
      t.references :sail, foreign_key: true

      t.timestamps
    end
  end
end
