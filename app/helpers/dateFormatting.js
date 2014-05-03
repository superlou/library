Em.Handlebars.helper('timeAgo', function(value) {
  if (value) {
    return moment(value).fromNow();
  } else {
    return 'undefined';
  }
});

Em.Handlebars.helper('shortDateTime', function(value) {
  if (value) {
    return moment(value).format('lll');
  } else {
    return 'undefined';
  }
});

Em.Handlebars.helper('shortDateTimeWithDefault', function(value, default_val) {
  if (value) {
    return moment(value).format('lll');
  } else {
    return default_val;
  }
});

Em.Handlebars.helper('shortDate', function(value) {
  if (value) {
    return moment(value).format('MM/DD/YYYY');
  } else {
    return 'undefined';
  }
});

Em.Handlebars.helper('humanizeDuration', function(value) {
  if (value) {
    return value.humanize();
  } else {
    return 'undefined';
  }
});
