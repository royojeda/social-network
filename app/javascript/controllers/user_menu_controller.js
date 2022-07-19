import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "dropdown" ]

  clicked() {
    this.dropdownTarget.classList.toggle("hidden")
  }
}
