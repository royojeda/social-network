import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "fullTime" ]

  hovered() {
    this.fullTimeTarget.classList.remove("hidden")
  }

  unhovered() {
    this.fullTimeTarget.classList.add("hidden")
  }
}
