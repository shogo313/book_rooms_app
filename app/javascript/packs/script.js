$(document).on('turbolinks:load', function() {
  const dropDawnMenu = document.getElementById('dropDawnMenu');
  const dropDawnMenu_button = document.getElementById('dropDawnMenu_button');
  dropDawnMenu_button.addEventListener('click', function(){
      dropDawnMenu.classList.toggle('dropDawnMenu-open');
  });
});