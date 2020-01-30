// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require('materialize-css/dist/js/materialize')

require("trix")
require("@rails/actiontext")
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


//Floating Action Button
document.addEventListener("turbolinks:load", function() {
    var elems = document.querySelectorAll('.fixed-action-btn');
    var instances = M.FloatingActionButton.init(elems, {
      direction: 'up'
    });
  });

//Datepicker
document.addEventListener("turbolinks:load", function() {
  var elems = document.querySelectorAll('.datepicker');
  var instances = M.Datepicker.init(elems);
});

//Dropdown Menu
document.addEventListener("turbolinks:load", function() {
    var elems = document.querySelectorAll('select');
    var instances = M.FormSelect.init(elems);
  });
  
//Collapsable
document.addEventListener("turbolinks:load", function() {
    var elems = document.querySelectorAll('.collapsible');
    var instances = M.Collapsible.init(elems);
  });
  
  
//Add link when choosing video type.
document.addEventListener("turbolinks:load", function() {
    $("#assignment_type").on('change', function(){
      alert("hey")
    })

});

//Dropdown for Units
document.addEventListener("turbolinks:load", function() {
    var elems = document.querySelectorAll('.dropdown-trigger');
    var instances = M.Dropdown.init(elems, {constrainWidth: false});
  });


  
require("trix")
require("@rails/actiontext")