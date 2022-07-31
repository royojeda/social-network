import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "form" ]

  clicked() {
    this.formTarget.classList.toggle("hidden")
  }
}
