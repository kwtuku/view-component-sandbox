# == Schema Information
#
# Table name: repositories
#
#  id          :uuid             not null, primary key
#  description :string           default(""), not null
#  name        :string           not null
#  status      :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :uuid             not null
#
# Indexes
#
#  index_repositories_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Repository < ApplicationRecord
  belongs_to :user

  enum :status, { private: 0, public: 1 }, default: :private, prefix: true

  validates :name, length: { in: 1..30 }
  validates :description, length: { in: 0..300 }
  validates :status, inclusion: { in: statuses.keys }
end
