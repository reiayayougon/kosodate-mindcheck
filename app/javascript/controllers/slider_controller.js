import Swiper from 'swiper/bundle';
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slider"
export default class extends Controller {
    static targets = ["container", "next", "prev", "pagination"];

    connect() {
        const swiperContainer = this.containerTarget;
        console.log(swiperContainer);
            if (swiperContainer) {
            this.swiper = new Swiper(swiperContainer, {
                slidesPerView: 1,
                spaceBetween: 10,
                loop: true,
                pagination: {
                    el: ".swiper-pagination",
                    clickable: true,
                },
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
                autoplay: {
                    delay: 5000, 
                    disableOnInteraction: false, //ユーザーがスライダーに触れても自動再生を無効にしない
                },
            });
        }
    }

    disconnect() {
        if (this.swiper) {
        this.swiper.destroy();
        }
    }
}