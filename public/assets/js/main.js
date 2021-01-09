var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl)
});

$('#confirmModal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget);
  var recipient = button.data('whatever');
  var recipient2 = button.data('link');

  document.getElementById('message-text-mconf').innerHTML = recipient;
  document.getElementById('confirm-btn-mconf').href = recipient2;
});