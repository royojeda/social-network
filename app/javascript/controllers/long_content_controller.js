import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "truncated", "full" ]

  clicked() {
    this.truncatedTarget.classList.add("hidden")
    this.fullTarget.classList.remove("hidden")
  }
}
