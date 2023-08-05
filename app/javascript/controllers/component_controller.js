import { Controller } from "@hotwired/stimulus"
import React, { StrictMode } from "react"
import { createRoot } from "react-dom/client"

import Hello from "../components/Hello"
import Hi from "../components/Hi"
import CategoryFilter from "../components/CategoryFilter"
import ProductQuickview from "../components/ProductQuickview"
import StoreNavigation from "../components/StoreNavigation"

export default class extends Controller {
  static values = { name: String }

  initialize() {
    this.components = {
      Hello: Hello,
      Hi: Hi,
      CategoryFilter: CategoryFilter,
      ProductQuickview: ProductQuickview,
      StoreNavigation: StoreNavigation,
    }
  }

  connect() {
    const root = createRoot(this.element)
    const Component = this.components[this.nameValue]
    console.log(this.nameValue)
    root.render(
      <StrictMode>
        <Component />
      </StrictMode>,
    )
  }
}
