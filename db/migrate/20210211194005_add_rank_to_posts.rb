class AddRankToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :rank, :float
  end
end
