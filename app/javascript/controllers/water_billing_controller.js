import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["output", "searchForm"]
  connect() {
    // console.log( "asdasdsda")
    // this.fetch_water_bills()
  }
  fetch_water_bills() {
    var url = window.location.href + "/water_billing"
    console.log(url,  "asdasdsda")
    fetch(url, { headers: { accept: "text/html" } })
    .then(response => response.text())
    .then((html) => {
      this.outputTarget.innerHTML = html
    })
  }

  // search() {
  //   this.searchFormTarget.requestSubmit()
  // }

  spinner(e) {
    console.log(e.target[1].value)
    
  }



}
