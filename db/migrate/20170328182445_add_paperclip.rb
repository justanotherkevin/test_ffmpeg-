class AddPaperclip < ActiveRecord::Migration[5.0]
  def change
    add_column :ffmpegs, :video_meta, :string
  end
end
