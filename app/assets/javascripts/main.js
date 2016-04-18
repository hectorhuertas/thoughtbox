$(document).ready(function(){
  $('#search-filter').on('keyup', searchFilter);
});

function searchFilter (e) {
  var search = e.target.value;
  console.log('bob');
  $('#links li').each(function (index, li) {
    if (li.textContent.indexOf(search) >= 0) {
      $(li).show();
    } else {
      $(li).hide();
    }
  });
}
