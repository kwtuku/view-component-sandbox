require "rails_helper"

RSpec.describe ExampleComponent, type: :component do
  it "renders component" do
    render_inline(described_class.new(title: "my title")) { "Hello, World!" }

    expect(page).to have_css "span[title='my title']", text: "Hello, World!"
    # or, to just assert against the text
    expect(page).to have_text "Hello, World!"
  end
end
