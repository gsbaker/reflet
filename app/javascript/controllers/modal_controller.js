import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = [ "dialog" ]

  show() {
    this.dialogTarget.showModal()
  }

  close() {
    this.dialogTarget.close()
  }
}
