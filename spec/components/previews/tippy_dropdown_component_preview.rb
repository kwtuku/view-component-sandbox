class TippyDropdownComponentPreview < ViewComponent::Preview
  layout "component_preview"

  def default
    render(TippyDropdownComponent.new)
  end
end
