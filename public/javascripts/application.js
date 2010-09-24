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

function init_location_form() {
  $('#location_country').change(function() {
    val = $(this).val();
    if (val == 'United States') {
      $('#location_state').parents('li').slideDown();
    } else {
      $('#location_state').parents('li').slideUp();
    }
  });
  $('#location_country').trigger('change');
};

var CENTER_OF_THE_WORLD_LAT = 30;
var CENTER_OF_THE_WORLD_LNG = 20;

var info_window;
var boss_icon;
var location_icon;
var client_icon;
var map;

function show_locations_on_map(center, locations) {
  var latlng = new google.maps.LatLng(CENTER_OF_THE_WORLD_LAT, CENTER_OF_THE_WORLD_LNG);
  //var latlng = new google.maps.LatLng(center.lat, center.lng);
  var myOptions = {
    zoom: 2,
    center: new google.maps.LatLng(CENTER_OF_THE_WORLD_LAT, CENTER_OF_THE_WORLD_LNG),
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    disableDefaultUI: true
  };
  var map = new google.maps.Map(document.getElementById("map"), myOptions);
  info_window = new google.maps.InfoWindow({ content: '' });
  $('#map').show();
  $.each(locations, function() {
    add_location_icon(this, map);
  });
  add_boss_icon(center, map);
};

function add_boss_icon(info, map) {
  var image = '/images/pins/red.png';
  var position = new google.maps.LatLng(info.lat, info.lng);
  var boss_marker = new google.maps.Marker({
      position: position,
      map: map,
      icon: image
  });
  google.maps.event.addListener(boss_marker, 'click', function() {
    info_window.close();
    info_window.setContent("Your Location.");
    info_window.open(map, boss_marker);
  });
};

function add_location_icon(info, map) {
  var image = '/images/pins/blue.png';
  var position = new google.maps.LatLng(info.lat, info.lng);
  var location_marker = new google.maps.Marker({
      position: position,
      map: map,
      icon: image
  });
  google.maps.event.addListener(location_marker, 'click', function() {
    var _info = info;
    info_window.close();
    info_window.setContent(_info.name);
    info_window.open(map, location_marker);
  });
};