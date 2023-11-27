import { Controller } from "@hotwired/stimulus"
import Swiper from 'swiper/bundle';

// Connects to data-controller="cardslider"
export default class extends Controller {
  static targets = ["cardslider"];

  connect() {
    this.slider = new Swiper(this.element.querySelector(".cardslider"), {
      loop: true,
      loopAdditionalSlides: 1,
      slidesPerView: 3,
      spaceBetween: 10,
      allowTouchMove: false,
      autoplay: {
        delay: 3000,
        disableOnInteraction: false,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      breakpoints: {
        680: {
          slidesPerView: 1,
        },
        1025: {
          slidesPerView: 2,
          spaceBetween: 5,
        }
      },
    });
  }
}
