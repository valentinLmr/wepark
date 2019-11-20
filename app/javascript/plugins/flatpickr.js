import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

// flatpickr("#start-date", {
//   altInput: true,
//   minDate: "today",
//   plugins: [new rangePlugin({ input: "#end-date"})],
// })


// import flatpickr from "flatpickr"
// import "flatpickr/dist/flatpickr.min.css"
// import rangePlugin from "flatpickr/dist/plugins/rangePlugin"


const rentalform = document.getElementById('rental-form-div');
console.log(rentalform)
 if (rentalform) {
    const rentals = JSON.parse(rentalform.dataset.rentals);
    console.log(rentals)
    flatpickr("#start-date", {
      altInput: true,
      minDate: "today",
      plugins: [new rangePlugin({ input: "#end-date"})],
      "disable": rentals,
    });
  };







