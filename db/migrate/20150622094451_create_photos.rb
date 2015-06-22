class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.attachment :image
      t.boolean :main, default: false
      t.belongs_to :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
