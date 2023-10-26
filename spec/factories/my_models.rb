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
FactoryBot.define do
  factory :my_model do
    my_string { "MyString" }
    my_text { "MyText" }
    my_integer { 1 }
    my_bigint { 1_000_000_000_000_000_000 }
    my_float { 1.5 }
    my_decimal { "9.99" }
    my_datetime { "2023-10-19 23:32:13" }
    my_date { "2023-10-19" }
    my_time { "23:32:13" }
    my_boolean { false }
  end
end
