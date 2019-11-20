
const moveForward = (event) => {
  const etape = document.querySelector('.active');
  if (etape.nextElementSibling) {
    etape.nextElementSibling.classList.add('active');
    etape.classList.remove('active');
  }
};


const listenSteps = () => {
  const submits = document.querySelectorAll('.next');
  submits.forEach((submit) => {
    submit.addEventListener("click", moveForward);
  })
}

export { listenSteps }
