import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clear-comment"
export default class extends Controller {
    static targets = ["commentBody"]

    clearForm() {
        this.commentBodyTarget.value = ''
    }
}