import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ratings"
export default class extends Controller {
  static targets = [ "rating" ]

  select(evt) {
    if (evt.key === "1") {
      this.ratingTargets[0].click()
    } else if (evt.key === "2") {
      this.ratingTargets[1].click()
    } else if (evt.key === "3") {
      this.ratingTargets[2].click()
    }
  }

  submit() {
    this.element.requestSubmit()
  }
}
