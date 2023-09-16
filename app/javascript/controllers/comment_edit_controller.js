import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comment-edit"
export default class extends Controller {
  static targets = ["form", "content"];

  connect() {
    this.hideForm();
  }

  // 編集ボタンがクリックされたときに呼ばれる関数
  editComment() {
    this.showForm();
    this.loadContent();
  }

  // 編集フォームを表示する
  showForm() {
    this.formTarget.classList.remove("hidden");
  }

  // 編集フォームを隠す
  hideForm() {
    this.formTarget.classList.add("hidden");
  }

  // コメントの内容を編集フォームに読み込む
  loadContent() {
    const content = this.contentTarget.innerText.trim();
    this.formTarget.querySelector("#comment_content").value = content;
  }
}