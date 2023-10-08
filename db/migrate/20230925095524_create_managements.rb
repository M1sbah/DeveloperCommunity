class CreateManagements < ActiveRecord::Migration[7.0]
  def change
    create_table :managements do |t|
      t.string :name
      t.string :contact_no
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
