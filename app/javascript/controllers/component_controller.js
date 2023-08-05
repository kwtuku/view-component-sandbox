import { Controller } from "@hotwired/stimulus"
import React, { StrictMode } from "react"
import { createRoot } from "react-dom/client"

import Hello from "../components/Hello"
import Hi from "../components/Hi"
import CategoryFilter from "../components/CategoryFilter"
import ProductOverview from "../components/ProductOverview"
import ProductQuickview from "../components/ProductQuickview"
import ShoppingCart from "../components/ShoppingCart"
import StoreNavigation from "../components/StoreNavigation"

export default class extends Controller {
  static values = { name: String }

  initialize() {
    this.components = {
      Hello: Hello,
      Hi: Hi,
      CategoryFilter: CategoryFilter,
      ProductOverview: ProductOverview,
      ProductQuickview: ProductQuickview,
      ShoppingCart: ShoppingCart,
      StoreNavigation: StoreNavigation,
    }
  }

  connect() {
    const root = createRoot(this.element)
    const Component = this.components[this.nameValue]
    root.render(
      <StrictMode>
        <Component />
      </StrictMode>,
    )
  }
}
