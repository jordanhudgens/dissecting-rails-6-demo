class AddLiveUpdatesToGuides < ActiveRecord::Migration[6.0]
  def change
    add_column :guides, :live_updates, :boolean, default: false
  end
end
