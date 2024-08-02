require "rails_helper"

RSpec.describe TippyDropdownComponent do
  it "tippy.js のドロップダウンが動く" do
    visit "/rails/view_components/tippy_dropdown_component/default"

    expect(page).to have_button "Open user menu"
    expect(page).to have_no_content "Neil Sims"

    click_on "Open user menu"
    expect(page).to have_content "Neil Sims"
  end
end
