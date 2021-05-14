// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

let map;

  function initMap() {
    geocoder = new google.maps.Geocoder()

    map = new google.maps.Map(document.getElementById('admins-map'), {
      // コントローラーで定義した変数から緯度経度を呼び出し、マップの中心に表示
      center: {
        lat: gon.customer.latitude,
        lng: gon.customer.longitude
      },
      zoom: 16,
    });

    marker = new google.maps.Marker({
      // コントローラーで定義した変数から緯度経度を呼び出し、マーカーを立てる
      position: {
        lat: gon.customer.latitude,
        lng: gon.customer.longitude
      },
      map: map
    });
  }