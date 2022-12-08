class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.text :content

      t.timestamps
    end
  end
end
