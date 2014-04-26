Em.Handlebars.helper('valueOrDefault', function(value, default_value) { 
  if (value) {
  	return value;
  } else {
  	return default_value;
  }
});