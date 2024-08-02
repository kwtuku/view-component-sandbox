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

  it "tippy.js のドロップダウンが動く" do
    visit root_path

    within '[data-testid="tippy-dropdown"]' do
      expect(page).to have_no_content "Neil Sims"
      click_button "Open user menu"
      expect(page).to have_content "Neil Sims"
    end
  end
end
