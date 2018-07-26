class ChangeModelNamePluralSubitileToSubtitle < ActiveRecord::Migration[5.2]
  def change
  	rename_column :portfolios, :subitile, :subtitle
  end
end
