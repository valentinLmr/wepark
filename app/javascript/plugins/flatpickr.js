import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

flatpickr("#start-date", {
  altInput: true,
  minDate: "today",
  plugins: [new rangePlugin({ input: "#end-date"})],
})


