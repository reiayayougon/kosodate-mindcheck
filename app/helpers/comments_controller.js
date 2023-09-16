import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
    initialize() {
        console.log("comments_controller.js is loaded!");
    }

    editComment(event) {
        event.preventDefault();
        const commentId = event.target.dataset.commentId;
    
        // Turbo Framesを使用してコメント編集フォームを表示
        const frame = document.getElementById("comment-form-frame");
        frame.setAttribute("src", `/comments/${commentId}/edit`);
    }
}