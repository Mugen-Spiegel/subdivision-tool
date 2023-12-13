import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["output"]
  connect() {
    this.fetch_residence()
  }

  fetch_residence() {
    var url = window.location.href + "users"
    fetch(url, { headers: { accept: "text/html" } })
    .then(response => response.text())
    .then((html) => {
      this.outputTarget.innerHTML = html
    })
  }
}
