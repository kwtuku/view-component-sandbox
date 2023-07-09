import { Controller } from "@hotwired/stimulus"
import React, { StrictMode } from "react"
import { createRoot } from "react-dom/client"

import Hello from "../components/Hello"
import Hi from "../components/Hi"

export default class extends Controller {
  static values = { name: String }

  initialize() {
    this.Components = {
      Hello: Hello,
      Hi: Hi,
    }
  }

  connect() {
    const Component = this.Components[this.nameValue]
    const root = createRoot(this.element)
    root.render(
      <StrictMode>
        <Component />
      </StrictMode>,
    )
  }
}
