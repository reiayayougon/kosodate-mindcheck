import { Controller } from "@hotwired/stimulus"
import Swiper from 'swiper/bundle';
// Connects to data-controller="albumslider"


export default class extends Controller {
    static targets = ["sliderThumbnail", "slider"];

    connect() {
        this.sliderThumbnail = new Swiper(this.element.querySelector(".slider-thumbnail"), {
            slidesPerView: 5,
            freeMode: true,
            watchSlidesVisibility: true,
            watchSlidesProgress: true,
        });
        
        this.slider = new Swiper(this.element.querySelector(".slider"), {
            centeredSlides: true,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            thumbs: {
                swiper: this.sliderThumbnail
            },
            loop: false,
            loopedSlides: 5, 
            effect: 'fade',
            fadeEffect: {
                crossFade: true,
            },
            autoplay: {
                delay: 2000, 
                disableOnInteraction: false, 
            },
            
        });
    }
}