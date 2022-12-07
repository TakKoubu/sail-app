class CreateSails < ActiveRecord::Migration[5.1]
  def change
    create_table :sails do |t|
      t.text :content

      t.timestamps
    end
  end
end
