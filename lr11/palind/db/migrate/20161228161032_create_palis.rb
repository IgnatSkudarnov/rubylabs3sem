class CreatePalis < ActiveRecord::Migration[5.0]
  def change
    create_table :palis do |t|
      t.integer :key
      t.binary :palinds

      t.timestamps
    end
  end
end
