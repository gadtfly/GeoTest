class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.belongs_to :user
      t.belongs_to :location
      t.string :content
      t.timestamps
    end
  end
end
