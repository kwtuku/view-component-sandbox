# == Schema Information
#
# Table name: my_list_items
#
#  id         :uuid             not null, primary key
#  my_scope   :integer          not null
#  my_string  :string           not null
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MyListItem < ApplicationRecord
  enum :my_scope, {
    red: 0,
    blue: 2,
    yellow: 1,
    green: 3,
  }

  acts_as_list scope: %i[my_scope]
end
