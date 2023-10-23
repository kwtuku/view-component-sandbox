# == Schema Information
#
# Table name: ancestry_items
#
#  id         :uuid             not null, primary key
#  ancestry   :string           not null
#  my_string  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_ancestry_items_on_ancestry  (ancestry)
#
class AncestryItem < ApplicationRecord
  has_ancestry
end
