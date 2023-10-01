class TailwinduiController < ApplicationController
  layout proc { |controller|
    list = %w[
      sign_in navbar stacked_layout store_navigation promo_section header_section newsletter_section hero_section content_section not_found contact_section
      banner feature_section_with_product_screenshot blog_section header pricing_section feature_section_centered_2x2_grid
    ]
    controller.action_name.in?(list) ? "no_navbar" : "tailwindui"
  }

  Tailwindui::Example.names.each do |name|
    define_method(name) do
      # アクションを定義するだけ
    end
  end
end
