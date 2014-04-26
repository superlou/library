Em.Handlebars.helper('timeAgo', function(value) {
  if (value) {
    return moment(value).fromNow();
  } else {
    return 'unknown';
  }
});

Em.Handlebars.helper('shortDateTime', function(value) {
  if (value) {
    return moment(value).format('lll');
  } else {
    return 'unknown';
  }
});

Em.Handlebars.helper('shortDate', function(value) {
  if (value) {
    return moment(value).format('MM/DD/YYYY');
  } else {
    return 'unknown';
  }
});

Em.Handlebars.helper('humanizeDuration', function(value) {
  if (value) {
    return value.humanize();
  } else {
    return 'unknown';
  }
});
