import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Roof &amp; Bed offers you the best flats!"],
    typeSpeed: 50
  });
}

export { loadDynamicBannerText };