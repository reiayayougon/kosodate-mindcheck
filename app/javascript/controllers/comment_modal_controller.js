import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comment-modal"
export default class extends Controller {
  static targets = ['modal', 'content'];

  connect() {
    document.addEventListener('click', this.closeOutsideModal.bind(this));
    this.contentTarget.addEventListener('click', (event) => event.stopPropagation());
  }

  disconnect() {
    // コントローラーがデタッチされたときにリスナーを削除
    document.removeEventListener('click', this.closeOutsideModal.bind(this));
    this.contentTarget.removeEventListener('click', (event) => event.stopPropagation());
  }

  closeOutsideModal(event) {
    // クリックした要素がモーダルの外部であるか
    if (this.contentTarget && !this.contentTarget.contains(event.target)) {
      this.closeModal();
    }
  }

  closeModal() {
    const modal = this.modalTarget;
    modal.classList.add("hidden");
  }

  close(e) {
    e.preventDefault();
    const modal = this.modalTarget; 
    modal.classList.add("hidden");
  }
}