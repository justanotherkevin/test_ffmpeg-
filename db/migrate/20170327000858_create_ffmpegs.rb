class CreateFfmpegs < ActiveRecord::Migration[5.0]
  def change
    create_table :ffmpegs do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
