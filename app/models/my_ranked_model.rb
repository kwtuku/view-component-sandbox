# == Schema Information
#
# Table name: my_ranked_models
#
#  id         :uuid             not null, primary key
#  my_scope   :integer          not null
#  my_string  :string           not null
#  row_order  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MyRankedModel < ApplicationRecord
  enum :my_scope, MyListItem.my_scopes.keys

  include RankedModel
  ranks :row_order, with_same: %i[my_scope]
end
