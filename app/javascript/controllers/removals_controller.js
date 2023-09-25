import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="removals"
export default class extends Controller {
  remove() {
    this.element.remove()
  }

  connect() {
    setTimeout(() => {
      this.hideMessage()
    }, 2000); 
  }

  hideMessage() {
    this.element.remove() // メッセージを削除する
  }
}






