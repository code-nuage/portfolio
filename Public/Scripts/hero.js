const hero = document.querySelector('.hero');

window.addEventListener('scroll', () => {
  if (window.scrollY > 64) {
    hero.classList.add('scrolled');
  } else {
    hero.classList.remove('scrolled');
  }
});
