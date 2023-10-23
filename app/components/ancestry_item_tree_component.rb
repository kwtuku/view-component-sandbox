class AncestryItemTreeComponent < ViewComponent::Base
  def initialize(items:, is_children:)
    @items = items
    @is_children = is_children
  end
end
