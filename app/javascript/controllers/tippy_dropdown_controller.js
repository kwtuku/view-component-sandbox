import { Controller } from "@hotwired/stimulus"
import tippy from "tippy.js"

export default class extends Controller {
  static classes = ["show", "hide"]
  static targets = ["button", "content"]
  static values = { placement: { type: String, default: "bottom" } }

  connect() {
    const template = this.contentTarget
    template.classList.add(this.showClass)
    template.classList.remove(this.hideClass)

    tippy(this.buttonTarget, {
      content: template,
      allowHTML: true,
      placement: this.placementValue,
      trigger: "click",
      interactive: true,
    })
  }
}
