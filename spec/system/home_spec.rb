require "rails_helper"

RSpec.describe "トップページ" do
  it "表示される" do
    visit root_path

    expect(page).to have_content "Hello, World!"
  end

  it "React のコンポーネントが表示される" do
    visit root_path

    expect(page).to have_content "Hello React!"
  end
end
