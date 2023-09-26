import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal"]

  connect() {
      this.modalTarget.classList.add("visible");
  }

  hide() {
      const modal = this.element.querySelector("[data-modal-target='modal']");
      modal.style.display = "none";
  }
}