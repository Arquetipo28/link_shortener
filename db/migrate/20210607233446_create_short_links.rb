class CreateShortLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :short_links do |t|
      t.string :original_link
      t.string :shorted_link
      t.integer :visited_count, default: 0

      t.timestamps
    end
  end
end
