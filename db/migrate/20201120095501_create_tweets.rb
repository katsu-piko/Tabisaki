class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string     :spot,    null: false
      t.integer    :area_id, null: false
      t.text       :comment, null: false
      t.text       :advice,  null: false
      t.references :user,    foreign_key: true
      t.timestamps 
    end
  end
end
