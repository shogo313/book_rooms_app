function dropDawnMenu() {
  const dropDawnMenu = document.getElementById('dropDawnMenu');
  const dropDawnMenu_button = document.getElementById('dropDawnMenu_button');
  dropDawnMenu_button.addEventListener('click', function(){
    dropDawnMenu.classList.toggle('dropDawnMenu-open');
  });
};

$(document).on('turbolinks:load', function() {
  if (document.getElementById('dropDawnMenu_button') !== null){
    dropDawnMenu();
  }
});
