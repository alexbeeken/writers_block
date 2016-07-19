class CreateSentences < ActiveRecord::Migration[5.0]
  def up
    create_table :sentences do |t|
      t.attachment :image
    end
  end

  def down
    drop_table :sentences
  end
end
