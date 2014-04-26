Em.Handlebars.helper('emailSlug', function(value) {
  var html;

  if (value) {
    html = "<span class='glyphicon glyphicon-envelope'></span> " + value;
  } else {
    html = "<span class='glyphicon glyphicon-envelope'></span> no email provided";
  }

  return html.htmlSafe();
});

Em.Handlebars.helper('codeSlug', function(value) {
  var html;

  if (value) {
    html = "<span class='glyphicon glyphicon-barcode'></span> " + value;
  } else {
    html = "<span class='glyphicon glyphicon-barcode'></span> no code set";
  }

  return html.htmlSafe();
});

Em.Handlebars.helper('identitySlug', function(gender, adult) {
  var html = "<span class='glyphicon glyphicon-user'></span> ";

  if (gender) {
    html += gender;
  }

  if (adult) {
    html += " adult";
  } else {
    html += " non-adult";
  }

  return html.htmlSafe();
});

Em.Handlebars.helper('stockSlug', function(available, stock) {
  var html = "<span class='glyphicon glyphicon-shopping-cart'></span> ";

  html += available + " of " + stock + " available";

  return html.htmlSafe();
});

Em.Handlebars.helper('adultSlug', function(adult) {
  var html = "<span class='glyphicon glyphicon-user'></span> ";

  if (adult) {
    html += "adults only";
  } else {
    html += "all ages";
  }

  return html.htmlSafe();
});

Em.Handlebars.helper('keepCheckoutHistorySlug', function(keepCheckoutHistory) {
  var html = "<span class='glyphicon glyphicon-list-alt'></span> ";

  if (keepCheckoutHistory) {
    html += "Keep checkout history";
  } else {
    html += "Do not keep checkouts";
  }

  return html.htmlSafe();
});