import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="popover"
export default class extends Controller {
  static targets = ["popover"];

  connect() {
    // ポップオーバーが表示されているかどうかの状態を管理します
    this.showing = false;
  }

  show() {
    this.showing = true;
    this.popoverTarget.classList.remove("hidden");
  }

  hide() {
    this.showing = false;
    this.popoverTarget.classList.add("hidden");
  }
}