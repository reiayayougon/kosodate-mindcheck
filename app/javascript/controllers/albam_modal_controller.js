import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="albam-modal"
export default class extends Controller {
    static targets = ["modal"];

    open() {
        this.modalTarget.classList.add("open");
    }
    close() {
        this.modalTarget.style.display = "none";
    }

}