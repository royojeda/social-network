import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "comments", "form", "textArea" ]

  toggle() {
    this.commentsTarget.classList.toggle("hidden")
  }

  toggleForm() {
    this.textAreaTarget.value = ""
    this.formTarget.classList.toggle("hidden")
    this.textAreaTarget.focus()
  }
}
