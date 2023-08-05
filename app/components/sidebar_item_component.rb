class SidebarItemComponent < ViewComponent::Base
  renders_one :icon
  renders_one :badge

  def initialize(name:, url:)
    @name = name
    @url = url
  end
end
