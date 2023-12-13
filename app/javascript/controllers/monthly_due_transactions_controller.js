import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  greet(event) {
    event.preventDefault()
    fetch(event.target.href, { headers: { accept: "application/json" } })
    .then(response => response.json())
    .then((data) => {})
  }
}
