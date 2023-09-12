class CreateRepositories < ActiveRecord::Migration[7.0]
  def change
    create_table :repositories, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :name, null: false
      t.string :description, default: "", null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end
