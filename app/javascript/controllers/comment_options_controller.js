import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "menu", "dropdown" ]

  hovered() {
    if (this.hasMenuTarget) {
      this.menuTarget.classList.remove("hidden")
    }
  }

  unhovered() {
    if (this.hasMenuTarget && this.hasDropdownTarget) {
      this.menuTarget.classList.add("hidden")
      this.dropdownTarget.classList.add("hidden")
    }
  }

  toggle() {
    this.dropdownTarget.classList.toggle("hidden")
  }
}
