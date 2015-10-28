class CreateProfilpics < ActiveRecord::Migration
  def change
    create_table :profilpics do |t|
      t.string :name
      t.string :image
      t.string :remote_image_url
      t.references :user, index: true

      t.timestamps
    end
  end
end
