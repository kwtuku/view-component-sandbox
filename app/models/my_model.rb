# == Schema Information
#
# Table name: my_models
#
#  id          :uuid             not null, primary key
#  my_bigint   :bigint           not null
#  my_boolean  :boolean          default(FALSE), not null
#  my_date     :date             not null
#  my_datetime :datetime         not null
#  my_decimal  :decimal(, )      not null
#  my_float    :float            not null
#  my_integer  :integer          not null
#  my_string   :string           not null
#  my_text     :text             not null
#  my_time     :time             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class MyModel < ApplicationRecord
  has_many :my_pg_models, dependent: :destroy

  validates :my_string, presence: true
  validates :my_text, presence: true
  validates :my_integer, presence: true
  validates :my_bigint, presence: true
  validates :my_float, presence: true
  validates :my_decimal, presence: true
  validates :my_datetime, presence: true
  validates :my_time, presence: true
  validates :my_date, presence: true
end
