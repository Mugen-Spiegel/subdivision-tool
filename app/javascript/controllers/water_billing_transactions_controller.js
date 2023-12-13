import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["output" ]
  connect() {
    this.fetch_water_bills()
  }
  fetch_water_bills() {
    var url = window.location.href + "water_billing_transaction"
    fetch(url, { headers: { accept: "text/html" } })
    .then(response => response.text())
    .then((html) => {
      this.outputTarget.innerHTML = html
    })
  }
}
