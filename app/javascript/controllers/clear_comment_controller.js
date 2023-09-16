import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clear-comment"
export default class extends Controller {
    static targets = ["form"]
    connect() {
        this.formTarget.addEventListener("ajax:success", this.clearForm.bind(this))
    }    

    clearForm() {
        this.formTarget.reset()
    }
}
