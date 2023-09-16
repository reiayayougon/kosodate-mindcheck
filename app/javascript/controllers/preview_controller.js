import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="preview"
export default class extends Controller {
    static targets = [ "file", "image" ]
    data = new DataTransfer();
    connect() {
    }
    previewImage() {
      // fileTargetが変更されたタイミングで処理を開始
        this.fileTarget.addEventListener('change', e => {
            const preview = this.imageTarget
            const file = e.target.files[0]
            // FileReaderのインスタンスを作成
            const reader = new FileReader()
    
            // readerがファイルの読み込みができたら処理を開始
            reader.addEventListener("load", () => {
            //画像ファイルを base64 文字列に変換してimgタグに代入
                preview.src = reader.result
            }, false)
            // ファイルの読み込みを実行
            reader.readAsDataURL(file)
        })
    }
}