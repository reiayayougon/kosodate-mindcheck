import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
    static targets = ["form"]

    connect() {
        this.formTarget.addEventListener("ajax:success", this.clearForm.bind(this))
    }

    clearForm() {
        this.formTarget.reset()
    }
}