const triggerModal = () => {
  if (document.getElementById('booking_count').value != 0) {
    $('#bookingModal').modal('show');
    console.log("test");
  }
};

export { triggerModal };
