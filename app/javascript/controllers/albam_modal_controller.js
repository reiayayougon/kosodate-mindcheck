import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="albam-modal"
export default class extends Controller {
    static targets = ["modal"];

    close() {
        this.modalTarget.classList.add('hidden');
        window.location.href = "/albams";
        
    }
}