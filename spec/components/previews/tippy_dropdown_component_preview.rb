class TippyDropdownComponentPreview < ViewComponent::Preview
  layout "flowbite"

  def default
    render(TippyDropdownComponent.new)
  end
end
