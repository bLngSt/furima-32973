class CreateUserDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :user_details do |t|
      t.string     :postal,       null: false
      t.integer    :area_id,      null: false
      t.string     :city,         null: false
      t.string     :address,      null: false
      t.string     :building
      t.string     :phone,        null: false
      t.references :item_history, null: false

      t.timestamps
    end
  end
end
