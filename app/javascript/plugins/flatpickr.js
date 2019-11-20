import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

const rentalform = document.getElementById('rental-form-div');
if (rentalform) {
  const rentals = JSON.parse(rentalform.dataset.rentals);
  flatpickr("#start-date", {
    altInput: true,
    minDate: "today",
    dateFormat: "Y-m-d",
    "disable": rentals,
    plugins: [new rangePlugin({ input: "#end-date"})],
  });
};

