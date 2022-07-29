import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "textArea" ]

  clear() {
    console.log("hello")
    this.textAreaTarget.value = ""
  }
}
