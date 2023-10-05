import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comment-modal"
export default class extends Controller {
    static targets = ['modal'];

    connect() {
    }

    close(e) {
      e.preventDefault();
      const modal = this.modalTarget; 
      modal.classList.add("hidden");
    }
}