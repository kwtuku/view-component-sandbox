class PageCornerRibbonComponent < ViewComponent::Base
  def render?
    Rails.env.development?
  end
end
