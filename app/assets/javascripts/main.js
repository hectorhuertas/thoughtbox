$(document).ready(function(){
  $('#search-filter').on('keyup', searchFilter);
  $('#all').on('click', all);
  $('#read').on('click', read);
  $('#unread').on('click', unread);
});

function searchFilter (e) {
  var search = e.target.value;
  $('#links li').each(function (index, li) {
    if (li.textContent.indexOf(search) >= 0) {
      $(li).show();
    } else {
      $(li).hide();
    }
  });
}

function read (e) {
  $('#links li').each(function (index, li) {
    if (li.textContent.indexOf('Unread') >= 0) {
      $(li).hide();
    }
  });
}

function unread (e) {
  $('#links li').each(function (index, li) {
    if (li.textContent.indexOf('Unread') < 0) {
      $(li).hide();
    }
  });
}

function all (e) {
  $('#links li').each(function (index, li) {
      $(li).show();
  });
}
