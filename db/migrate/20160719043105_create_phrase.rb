class CreatePhrase < ActiveRecord::Migration[5.0]
  def up
    create_table :phrases do |t|
      t.string :words
      t.text :content
      t.belongs_to :upload
    end
  end

  def down
    drop_table :phrases
  end
end
