$(function() {
  $("select, input, textarea, input:checkbox, input:radio, input:file").uniform(); 
  $('.date_picker').datepicker({
    showOn: 'both',
    buttonImage: '/images/calendar_3.png',
    buttonImageOnly: true,
    dateFormat: "yy-mm-dd"
  });
  $('.flash').delay(2500).slideUp('fast').live('click', function() {$(this).slideUp('fast')});
});

function init_add_form() {
  $('.subnav a').live('click', function() {
    var _this = $(this);
    var to = $(_this.attr('to'));
    var targetOffset = (to.offset().top + _this.offset().top) - 200 + 'px';
    to.slideDown('fast').find('a').click(function() {
      to.slideUp('fast');
      _this.parent().show();
      return false;
    });
    _this.parent().hide();
    $('html,body').animate({scrollTop: targetOffset}, 1000);
    return false;
  });
};

function init_company_form() {
  $('#company_country').change(function() {
    val = $(this).val();
    if (val == 'United States') {
      $('#company_state').parents('li').slideDown();
    } else {
      $('#company_state').parents('li').slideUp();
    }
  });
  $('#company_country').trigger('change');
};