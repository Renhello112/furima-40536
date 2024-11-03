class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
        t.string :name
        t.text :description
        t.integer :price
        t.integer :category_id
        # 新しいカラムを追加
        t.string :image_url
        t.integer :genre_id     , null: false
      t.timestamps
    end
  end
end
