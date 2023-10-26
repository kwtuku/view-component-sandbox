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
require "rails_helper"

RSpec.describe MyPgModel do
  describe "#my_string_array" do
    it "配列を入力すると、コンマ区切りの文字列を出力する" do
      my_pg_model = build(:my_pg_model, my_string_array: %w[a b c])
      expect(my_pg_model.my_string_array).to eq "a, b, c"
    end

    it "コンマ区切りの文字列を入力すると、コンマ区切りの文字列を出力する" do
      my_pg_model = build(:my_pg_model, my_string_array: "a, b, c")
      expect(my_pg_model.my_string_array).to eq "a, b, c"
    end

    it "入力された文字列の空白文字は取り除く" do
      my_pg_model = build(:my_pg_model, my_string_array: " a ,b, c \n")
      expect(my_pg_model.my_string_array).to eq "a, b, c"
    end

    it "入力された文字列の空白の要素は取り除く" do
      my_pg_model = build(:my_pg_model, my_string_array: "a,,b,c,")
      expect(my_pg_model.my_string_array).to eq "a, b, c"
    end
  end

  describe "#my_text_array" do
    it "配列を入力すると、LF区切りの文字列を出力する" do
      my_pg_model = build(:my_pg_model, my_text_array: %w[a b c])
      expect(my_pg_model.my_text_array).to eq "a\nb\nc"
    end

    it "LF区切りの文字列を入力すると、LF区切りの文字列を出力する" do
      my_pg_model = build(:my_pg_model, my_text_array: "a\nb\nc")
      expect(my_pg_model.my_text_array).to eq "a\nb\nc"
    end

    it "CR+LF区切りの文字列を入力すると、LF区切りの文字列を出力する" do
      my_pg_model = build(:my_pg_model, my_text_array: "a\r\nb\r\nc")
      expect(my_pg_model.my_text_array).to eq "a\nb\nc"
    end

    it "入力された文字列の空白文字は取り除く" do
      my_pg_model = build(:my_pg_model, my_text_array: "  a \nb\n c   ")
      expect(my_pg_model.my_text_array).to eq "a\nb\nc"
    end

    it "入力された文字列の空白の要素は取り除く" do
      my_pg_model = build(:my_pg_model, my_text_array: "a\nb\n\nc")
      expect(my_pg_model.my_text_array).to eq "a\nb\nc"
    end
  end

  describe "#my_integer_array" do
    it "配列を入力すると、コンマ区切りの文字列を出力する" do
      my_pg_model = build(:my_pg_model, my_integer_array: [1, 2, 3])
      expect(my_pg_model.my_integer_array).to eq "1, 2, 3"
    end

    it "コンマ区切りの文字列を入力すると、コンマ区切りの文字列を出力する" do
      my_pg_model = build(:my_pg_model, my_integer_array: "1, 2, 3")
      expect(my_pg_model.my_integer_array).to eq "1, 2, 3"
    end

    it "入力された文字列の空白文字は取り除く" do
      my_pg_model = build(:my_pg_model, my_integer_array: " 1 ,2, 3 \n")
      expect(my_pg_model.my_integer_array).to eq "1, 2, 3"
    end

    it "入力された文字列の空白の要素は取り除く" do
      my_pg_model = build(:my_pg_model, my_integer_array: "1,,2,3,")
      expect(my_pg_model.my_integer_array).to eq "1, 2, 3"
    end
  end

  describe "#my_daterange" do
    it "reloadしなければ、終端を含むことの真偽は入力した範囲オブジェクトと同じ", :aggregate_failures do
      my_pg_model = create(:my_pg_model, my_daterange: Date.parse("2023-10-01")..Date.parse("2023-10-31"))
      expect(my_pg_model.my_daterange).to eq Date.parse("2023-10-01")..Date.parse("2023-10-31")

      my_pg_model = create(:my_pg_model, my_daterange: Date.parse("2023-10-01")...Date.parse("2023-11-01"))
      expect(my_pg_model.my_daterange).to eq Date.parse("2023-10-01")...Date.parse("2023-11-01")

      my_pg_model = create(:my_pg_model, my_daterange: "2023-10-01".."2023-10-31")
      expect(my_pg_model.my_daterange).to eq Date.parse("2023-10-01")..Date.parse("2023-10-31")

      my_pg_model = create(:my_pg_model, my_daterange: "2023-10-01"..."2023-11-01")
      expect(my_pg_model.my_daterange).to eq Date.parse("2023-10-01")...Date.parse("2023-11-01")
    end

    # findなどで取得したときはこの挙動になる
    it "reloadすると、範囲オブジェクトは終端を含まない", :aggregate_failures do
      my_pg_model = create(:my_pg_model, my_daterange: Date.parse("2023-10-01")..Date.parse("2023-10-31"))
      expect(my_pg_model.reload.my_daterange).to eq Date.parse("2023-10-01")...Date.parse("2023-11-01")

      my_pg_model = create(:my_pg_model, my_daterange: Date.parse("2023-10-01")...Date.parse("2023-11-01"))
      expect(my_pg_model.reload.my_daterange).to eq Date.parse("2023-10-01")...Date.parse("2023-11-01")

      my_pg_model = create(:my_pg_model, my_daterange: "2023-10-01".."2023-10-31")
      expect(my_pg_model.reload.my_daterange).to eq Date.parse("2023-10-01")...Date.parse("2023-11-01")

      my_pg_model = create(:my_pg_model, my_daterange: "2023-10-01"..."2023-11-01")
      expect(my_pg_model.reload.my_daterange).to eq Date.parse("2023-10-01")...Date.parse("2023-11-01")
    end

    it "終端を含む範囲オブジェクトを入力すると、終端を含まない範囲オブジェクトを出力する", :aggregate_failures do
      my_pg_model = create(:my_pg_model, my_daterange: Date.parse("2023-10-01")..Date.parse("2023-10-31"))
      expect(my_pg_model.reload.my_daterange).to eq Date.parse("2023-10-01")...Date.parse("2023-11-01")

      my_pg_model = create(:my_pg_model, my_daterange: "2023-10-01".."2023-10-31")
      expect(my_pg_model.reload.my_daterange).to eq Date.parse("2023-10-01")...Date.parse("2023-11-01")
    end

    it "終端を含まない範囲オブジェクトを入力すると、終端を含まない範囲オブジェクトを出力する", :aggregate_failures do
      my_pg_model = create(:my_pg_model, my_daterange: Date.parse("2023-10-01")...Date.parse("2023-11-01"))
      expect(my_pg_model.reload.my_daterange).to eq Date.parse("2023-10-01")...Date.parse("2023-11-01")

      my_pg_model = create(:my_pg_model, my_daterange: "2023-10-01"..."2023-11-01")
      expect(my_pg_model.reload.my_daterange).to eq Date.parse("2023-10-01")...Date.parse("2023-11-01")
    end

    it "始端と終端にnilと無限大を入力すると、無限大を出力する", :aggregate_failures do
      # (nil..nil)と(..nil)と(nil..)は同じ
      # [(nil..nil), (..nil), (nil..)].uniq
      # => [nil..]
      my_pg_model = create(:my_pg_model, my_daterange: nil..)
      expect(my_pg_model.reload.my_daterange).to eq(-Float::INFINITY...Float::INFINITY)

      my_pg_model = create(:my_pg_model, my_daterange: -Float::INFINITY..Float::INFINITY)
      expect(my_pg_model.reload.my_daterange).to eq(-Float::INFINITY...Float::INFINITY)

      my_pg_model = create(:my_pg_model, my_daterange: -Float::INFINITY..)
      expect(my_pg_model.reload.my_daterange).to eq(-Float::INFINITY...Float::INFINITY)

      my_pg_model = create(:my_pg_model, my_daterange: nil..Float::INFINITY)
      expect(my_pg_model.reload.my_daterange).to eq(-Float::INFINITY...Float::INFINITY)
    end

    it "始端だけにnilと無限大を入力すると、無限大を出力する", :aggregate_failures do
      my_pg_model = create(:my_pg_model, my_daterange: nil..Date.parse("2023-10-31"))
      expect(my_pg_model.reload.my_daterange).to eq(-Float::INFINITY...Date.parse("2023-11-01"))

      my_pg_model = create(:my_pg_model, my_daterange: -Float::INFINITY..Date.parse("2023-10-31"))
      expect(my_pg_model.reload.my_daterange).to eq(-Float::INFINITY...Date.parse("2023-11-01"))
    end

    it "終端だけにnilと無限大を入力すると、無限大を出力する", :aggregate_failures do
      my_pg_model = create(:my_pg_model, my_daterange: Date.parse("2023-10-01")..)
      expect(my_pg_model.reload.my_daterange).to eq Date.parse("2023-10-01")...Float::INFINITY

      my_pg_model = create(:my_pg_model, my_daterange: Date.parse("2023-10-01")..Float::INFINITY)
      expect(my_pg_model.reload.my_daterange).to eq Date.parse("2023-10-01")...Float::INFINITY
    end
  end

  describe "#my_daterange_start_on, #my_daterange_end_on" do
    it "開始日と終了日を入力すると、終端を含まない範囲オブジェクトを出力する", :aggregate_failures do
      my_pg_model = create(:my_pg_model, my_daterange: nil, my_daterange_start_on: Date.parse("2023-10-01"), my_daterange_end_on: Date.parse("2023-10-31"))
      expect(my_pg_model.reload.my_daterange).to eq Date.parse("2023-10-01")...Date.parse("2023-11-01")

      my_pg_model = create(:my_pg_model, my_daterange: nil, my_daterange_start_on: "2023-10-01", my_daterange_end_on: "2023-10-31")
      expect(my_pg_model.reload.my_daterange).to eq Date.parse("2023-10-01")...Date.parse("2023-11-01")
    end

    it "開始日だけを入力すると、終端を含まない範囲オブジェクトを出力する" do
      my_pg_model = create(:my_pg_model, my_daterange: nil, my_daterange_start_on: "2023-10-01")
      expect(my_pg_model.reload.my_daterange).to eq Date.parse("2023-10-01")...Float::INFINITY
    end

    it "終了日だけを入力すると、終端を含まない範囲オブジェクトを出力する" do
      my_pg_model = create(:my_pg_model, my_daterange: nil, my_daterange_end_on: "2023-10-31")
      expect(my_pg_model.reload.my_daterange).to eq(-Float::INFINITY...Date.parse("2023-11-01"))
    end
  end

  describe "#my_interval" do
    it "間隔オブジェクトを入力すると、間隔オブジェクトを出力する", :aggregate_failures do
      my_pg_model = build(:my_pg_model, my_interval: 0)
      expect(my_pg_model.my_interval).to eq 0

      my_pg_model = build(:my_pg_model, my_interval: 1.second)
      expect(my_pg_model.my_interval).to eq 1.second

      my_pg_model = build(:my_pg_model, my_interval: 1.minute)
      expect(my_pg_model.my_interval).to eq 1.minute

      my_pg_model = build(:my_pg_model, my_interval: 1.hour)
      expect(my_pg_model.my_interval).to eq 1.hour

      my_pg_model = build(:my_pg_model, my_interval: 1.day)
      expect(my_pg_model.my_interval).to eq 1.day

      my_pg_model = build(:my_pg_model, my_interval: 1.week)
      expect(my_pg_model.my_interval).to eq 1.week

      my_pg_model = build(:my_pg_model, my_interval: 1.fortnight)
      expect(my_pg_model.my_interval).to eq 1.fortnight

      my_pg_model = build(:my_pg_model, my_interval: 1.month)
      expect(my_pg_model.my_interval).to eq 1.month

      my_pg_model = build(:my_pg_model, my_interval: 1.year)
      expect(my_pg_model.my_interval).to eq 1.year
    end

    it "文字列を入力すると、間隔オブジェクトを出力する", :aggregate_failures do
      my_pg_model = build(:my_pg_model, my_interval: "0")
      expect(my_pg_model.my_interval).to eq 0

      my_pg_model = build(:my_pg_model, my_interval: "1")
      expect(my_pg_model.my_interval).to eq 1.second

      my_pg_model = build(:my_pg_model, my_interval: "60")
      expect(my_pg_model.my_interval).to eq 1.minute

      my_pg_model = build(:my_pg_model, my_interval: "86400")
      expect(my_pg_model.my_interval).to eq 1.day

      my_pg_model = build(:my_pg_model, my_interval: "604800")
      expect(my_pg_model.my_interval).to eq 1.week

      my_pg_model = build(:my_pg_model, my_interval: "1209600")
      expect(my_pg_model.my_interval).to eq 1.fortnight

      my_pg_model = build(:my_pg_model, my_interval: "2629746")
      expect(my_pg_model.my_interval).to eq 1.month

      my_pg_model = build(:my_pg_model, my_interval: "31556952")
      expect(my_pg_model.my_interval).to eq 1.year
    end
  end
end
