import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "menu", "dropdown" ]

  hovered() {
    this.menuTarget.classList.remove("hidden")
  }

  unhovered() {
    this.menuTarget.classList.add("hidden")
    this.dropdownTarget.classList.add("hidden")
  }

  toggle() {
    this.dropdownTarget.classList.toggle("hidden")
  }
}
