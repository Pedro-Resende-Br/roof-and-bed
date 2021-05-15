import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Roof and Bed offers you the best flats!"],
    typeSpeed: 50,
    loop: false
  });
}

export { loadDynamicBannerText };