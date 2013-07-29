class CreateMentorships < ActiveRecord::Migration
  def change
    create_table :mentorships do |t|
      t.belongs_to :mentor
      t.belongs_to :mentee
      t.date :started
      t.string :kind

      t.timestamps
    end
  end
end
