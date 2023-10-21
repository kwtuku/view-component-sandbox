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

  def my_string_array=(value)
    if value.is_a?(Array)
      super
    else
      super(value.split(",").map(&:strip).compact_blank)
    end
  end

  def my_string_array
    super&.join(", ")
  end

  def my_text_array=(value)
    if value.is_a?(Array)
      super
    else
      super(value.split(/\R/).map(&:strip).compact_blank)
    end
  end

  def my_text_array
    super&.join("\n")
  end

  def my_integer_array=(value)
    if value.is_a?(Array)
      super
    else
      super(value.split(",").map(&:strip).compact_blank.map(&:to_i))
    end
  end

  def my_integer_array
    super&.join(", ")
  end

  def my_daterange_start_on=(value)
    ActiveModel::Type::Date.new.cast(value).tap do |start_on|
      self.my_daterange = Range.new(start_on, my_daterange&.max)
    end
  end

  def my_daterange_start_on
    my_daterange&.begin
  end

  def my_daterange_end_on=(value)
    ActiveModel::Type::Date.new.cast(value).tap do |end_on|
      self.my_daterange = Range.new(my_daterange&.begin, end_on)
    end
  end

  def my_daterange_end_on
    my_daterange&.max
  end

  def my_interval=(value)
    super(ActiveSupport::Duration.build(value.to_i))
  end
end
