# == Schema Information
#
# Table name: my_pg_models
#
#  id               :uuid             not null, primary key
#  my_binary        :binary           not null
#  my_daterange     :daterange        not null
#  my_integer_array :integer          not null, is an Array
#  my_interval      :interval         not null
#  my_json          :json             not null
#  my_jsonb         :jsonb            not null
#  my_string_array  :string           not null, is an Array
#  my_text_array    :text             not null, is an Array
#  my_uuid          :uuid             not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  my_model_id      :uuid             not null
#
# Indexes
#
#  index_my_pg_models_on_my_model_id  (my_model_id)
#
# Foreign Keys
#
#  fk_rails_...  (my_model_id => my_models.id)
#
class MyPgModel < ApplicationRecord
  belongs_to :my_model

  validates :my_binary, presence: true
  validates :my_string_array, presence: true
  validates :my_text_array, presence: true
  validates :my_integer_array, presence: true
  validates :my_json, presence: true
  validates :my_jsonb, presence: true
  validates :my_daterange, presence: true
  validates :my_uuid, presence: true
  validates :my_interval, presence: true

  def my_string_array=(val)
    if val.is_a?(Array)
      super
    else
      super(val.split(",").map(&:strip).compact_blank)
    end
  end

  def my_text_array=(val)
    if val.is_a?(Array)
      super
    else
      super(val.split(/\R/).map(&:strip).compact_blank)
    end
  end

  def my_integer_array=(val)
    if val.is_a?(Array)
      super
    else
      super(val.split(",").map(&:strip).compact_blank.map(&:to_i))
    end
  end
end
