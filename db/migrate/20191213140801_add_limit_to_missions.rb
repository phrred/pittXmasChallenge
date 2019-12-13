class AddLimitToMissions < ActiveRecord::Migration[5.2]
  def change
    add_column :missions, :limit, :integer
  end
end
