import { Controller } from "@hotwired/stimulus"
import { StrictMode } from "react"
import { createRoot } from "react-dom/client"

import Hello from "../components/Hello"
import Hi from "../components/Hi"
import CategoryFilter from "../components/CategoryFilter"
import ContactSection from "../components/ContactSection"
import Dropdown from "../components/Dropdown"
import DropdownWithDividers from "../components/DropdownWithDividers"
import FlyoutMenu from "../components/FlyoutMenu"
import Header from "../components/Header"
import HeroSection from "../components/HeroSection"
import Modal from "../components/Modal"
import Navbar from "../components/Navbar"
import PageHeading from "../components/PageHeading"
import ProductOverview from "../components/ProductOverview"
import ProductQuickview from "../components/ProductQuickview"
import SelectMenu from "../components/SelectMenu"
import ShoppingCart from "../components/ShoppingCart"
import SlideOver from "../components/SlideOver"
import StoreNavigation from "../components/StoreNavigation"

export default class extends Controller {
  static values = { name: String }

  initialize() {
    this.components = {
      Hello: Hello,
      Hi: Hi,
      CategoryFilter: CategoryFilter,
      ContactSection: ContactSection,
      Dropdown: Dropdown,
      DropdownWithDividers: DropdownWithDividers,
      FlyoutMenu: FlyoutMenu,
      Header: Header,
      HeroSection: HeroSection,
      Modal: Modal,
      Navbar: Navbar,
      PageHeading: PageHeading,
      ProductOverview: ProductOverview,
      ProductQuickview: ProductQuickview,
      SelectMenu: SelectMenu,
      ShoppingCart: ShoppingCart,
      SlideOver: SlideOver,
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
