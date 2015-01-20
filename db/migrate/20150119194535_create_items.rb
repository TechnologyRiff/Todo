class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.references :list, index: true
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
