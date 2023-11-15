class CreateMyRankedModels < ActiveRecord::Migration[7.0]
  def change
    create_table :my_ranked_models, id: :uuid do |t|
      t.string :my_string, null: false
      t.integer :my_scope, null: false
      t.integer :row_order

      t.timestamps
    end
  end
end
