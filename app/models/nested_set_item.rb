# == Schema Information
#
# Table name: nested_set_items
#
#  id             :uuid             not null, primary key
#  children_count :integer          default(0), not null
#  depth          :integer          default(0), not null
#  lft            :integer          not null
#  my_string      :string           not null
#  rgt            :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  parent_id      :uuid
#
# Indexes
#
#  index_nested_set_items_on_lft        (lft)
#  index_nested_set_items_on_parent_id  (parent_id)
#  index_nested_set_items_on_rgt        (rgt)
#
# Foreign Keys
#
#  fk_rails_...  (parent_id => nested_set_items.id)
#
class NestedSetItem < ApplicationRecord
  acts_as_nested_set counter_cache: :children_count
end
