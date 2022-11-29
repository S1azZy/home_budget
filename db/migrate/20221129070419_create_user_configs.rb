class CreateUserConfigs < ActiveRecord::Migration[7.0]
  def change
    create_table :user_configs do |t|
      t.references :user, null: false, index: true, foreign_key: true
      t.references :default_currency,
                   null: false,
                   index: true,
                   foreign_key: { to_table: :currencies, on_delete: :restrict }

      t.timestamps
    end
  end
end
