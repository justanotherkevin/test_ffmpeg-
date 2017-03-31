class AddConversionOptionsToFfmpeg < ActiveRecord::Migration[5.0]
  def change
    add_column :ffmpegs, :conversion_option, :string
  end
end
