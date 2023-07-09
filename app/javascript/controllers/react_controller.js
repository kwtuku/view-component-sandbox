import { Controller } from "@hotwired/stimulus"
import React, { StrictMode } from "react"
import { createRoot } from "react-dom/client"
import Hello from "../components/Hello"

export default class extends Controller {
  connect() {
    const root = createRoot(this.element)
    root.render(
      <StrictMode>
        <Hello />
      </StrictMode>,
    )
  }
}
