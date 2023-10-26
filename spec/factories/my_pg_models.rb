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
FactoryBot.define do
  factory :my_pg_model do
    my_model
    my_binary { "MyString" }
    my_string_array { "MyString, MyString" }
    my_text_array { "MyText\nMyText" }
    my_integer_array { "1, 2" }
    my_json { "{}" }
    my_jsonb { "{}" }
    my_daterange { "[2023-10-21,2023-10-22)" }
    my_uuid { "af28a052-8738-421c-95ce-13cc1e1776d8" }
    my_interval { 1 }
  end
end
