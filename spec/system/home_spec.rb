require "rails_helper"

RSpec.describe "トップページ" do
  it "表示される" do
    visit root_path

    expect(page).to have_content "Hello, World!"
  end
end
