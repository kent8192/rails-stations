class CreateSheets < ActiveRecord::Migration[6.1]
  def change
    create_table :sheets, if_not_exists: true do |t|
      t.integer :column, limit: 1, null: false  # TINYINT(5) に相当
      t.string :row, limit: 1, null: false      # VARCHAR(1) に相当

      t.timestamps
    end
  end
end
