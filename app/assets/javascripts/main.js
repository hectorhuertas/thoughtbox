$(document).ready(function(){
  $('#search-filter').on('keyup', searchFilter);
  $('#all').on('click', all);
  $('#read').on('click', read);
  $('#unread').on('click', unread);
  $('#sort').on('click', sort);
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

function sort (e) {
  var sorted = $('#links li').sort(sortFunction);
  $('#links').empty().append(sorted);
}

function sortFunction (a,b) {
  var keyA = $(a).find('span').text();
  var keyB = $(b).find('span').text();

  if (keyA < keyB) return -1;
  if (keyA > keyB) return 1;
  return 0;
}
