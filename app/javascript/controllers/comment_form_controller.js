import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "form", "textArea" ]

  clicked() {
    this.textAreaTarget.value = ""
    this.formTarget.classList.toggle("hidden")
    this.textAreaTarget.focus()
  }
}
