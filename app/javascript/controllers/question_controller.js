import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content"];


  async fetchRandomQuestion() {
    const response = await fetch("/questions/random");
    const data = await response.json();
    console.log(data);
    this.contentTarget.textContent = data.question.content;
    
  
  }
}