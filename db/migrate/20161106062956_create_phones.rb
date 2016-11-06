class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.integer :contact_id
      t.string :phone
      t.string :phone_type

      t.timestamps
    end
    add_index :phones, :contact_id
  end
end
