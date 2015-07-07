class AddVisitedAtAndTimesVisitedToUrl < ActiveRecord::Migration
  def change
    add_column :urls, :visited_at, :datetime
    add_column :urls, :times_visited, :integer
  end
end
