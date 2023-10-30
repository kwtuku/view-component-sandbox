import { Controller } from "@hotwired/stimulus"
import Choices from "choices.js"

export default class extends Controller {
  connect() {
    new Choices(this.element)
  }
}
