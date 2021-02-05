class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.json :title
      t.json :description
      t.json :location

      t.timestamps
    end
  end
end
