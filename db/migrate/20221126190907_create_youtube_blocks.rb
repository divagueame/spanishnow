class CreateYoutubeBlocks < ActiveRecord::Migration[7.0]
  def change
    create_table :youtube_blocks do |t|
      t.string :url
      t.text :code

      t.timestamps
    end
  end
end
