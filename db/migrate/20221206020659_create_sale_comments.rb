class CreateSaleComments < ActiveRecord::Migration[5.1]
  def change
    create_table :sale_comments do |t|
      t.text :content
      t.references :sale, foreign_key: true

      t.timestamps
    end
  end
end
