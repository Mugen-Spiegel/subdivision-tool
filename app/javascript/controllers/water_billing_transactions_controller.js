import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["output", "inputCurrentReading", "searchForm", "updateForm"]
  connect() {
    // this.fetch_water_bills_transaction()
  }
  fetch_water_bills_transaction() {
    var url = window.location.href + "/water_billing_transaction"
    fetch(url, { headers: { accept: "text/html" } })
    .then(response => response.text())
    .then((html) => {
      this.outputTarget.innerHTML = html
    })
  }

  search() {
    this.searchFormTarget.requestSubmit()
  }

  updateCurrentReading(e) {
    e.preventDefault()
    let id = e.currentTarget.id.split("_")[1]
    this.update(e, {"current_reading":document.getElementById("water_transaction_current_reading" + id).value})
  }

  updatePayment(e) {
    e.preventDefault()
    let id = e.currentTarget.id.split("_")[1]
    this.update(e, {"paid_amount": document.getElementById("water_billing_payment" + id).value})
  }

  exact_amount(e) {
    let id = e.target.id.split("_")
    if (e.target.checked == true) {
      let value = parseFloat(document.getElementById("balance_" + id[0]).textContent.replace('₱','').replace(',',''))
      document.getElementById("water_billing_payment" + id[0]).value = value
    } else {
      document.getElementById("water_billing_payment" + id[0]).value = "0.0"
    }
    
  }

  update(e, water_billing_transaction_json) {
    fetch(e.currentTarget.action, { 
      method: "PUT",
      headers: { 
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'X-CSRF-TOKEN': this.getMetaValue("csrf-token")
      },
      body: JSON.stringify(water_billing_transaction_json)
    })
    .then(() => {
      this.searchFormTarget.requestSubmit()
      
    })
  }



  getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }

}
