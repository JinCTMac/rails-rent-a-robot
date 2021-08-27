const triggerModal = () => {
  const input = document.getElementById('booking_count');
  if (input) {
  console.log("on input page");
  console.log(input);
    if (input.value != "0") {
      console.log("blah");
      $('#bookingModal').modal('show');
    }
  }
};

export { triggerModal };
