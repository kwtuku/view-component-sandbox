class SidebarItemComponent < ViewComponent::Base
  def initialize(name:, url:, icon_id:, badge_text: nil, badge_color: nil)
    @name = name
    @url = url
    @icon_id = icon_id
    @badge_text = badge_text
    @badge_color = badge_color
  end

  def icon
    helpers.send("#{@icon_id}_icon")
  end
end
