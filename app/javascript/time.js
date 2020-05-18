import onmount from "onmount";

onmount('.time-form', function() {
  $('.time-form input').on('change', function () {
      $(this).closest('form').submit();
      if( parseInt($(this).val()) > 0 ) {
        $(this).addClass('filled');
      } else {
        $(this).removeClass('filled');
      }
  });
});
