class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :title
      t.text :text
      t.references :user, index: true
      t.references :car, index: true

      t.timestamps
    end
  end
end
