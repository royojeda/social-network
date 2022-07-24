import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "modal" ]

  close() {
    this.modalTarget.classList.add("hidden")
    this.modalTarget.classList.remove("flex")
  }

  open() {
    this.modalTarget.classList.remove("hidden")
    this.modalTarget.classList.add("flex")
  }
}
