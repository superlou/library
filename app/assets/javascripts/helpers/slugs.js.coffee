Em.Handlebars.registerBoundHelper 'emailSlug', (value) ->
  if value
    html = "<li><span class='glyphicon glyphicon-envelope'></span> " + value + "</li>"
  else
    html = "<li><span class='glyphicon glyphicon-envelope'></span> no email provided</li>"

  html.htmlSafe()

Em.Handlebars.registerBoundHelper 'codeSlug', (value) ->
  if value
    html = "<li><span class='glyphicon glyphicon-barcode'></span> " + value + "</li>"
  else
    html = "<li><span class='glyphicon glyphicon-barcode'></span> no code set</li>"

  html.htmlSafe()

Em.Handlebars.registerBoundHelper 'identitySlug', (gender, adult) ->
  html = "<li><span class='glyphicon glyphicon-user'></span> "
  if gender
    html += gender

  if adult
    html += " adult"
  else
    html += " non-adult"

  html += "</li>"

  html.htmlSafe()

Em.Handlebars.registerBoundHelper 'stockSlug', (available, stock)->
  html = "<li><span class='glyphicon glyphicon-shopping-cart'></span> "

  html += available + " of " + stock + " available"

  html += "</li>"
  html.htmlSafe()

Em.Handlebars.registerBoundHelper 'adultSlug', (adult)->
  html = "<li><span class='glyphicon glyphicon-user'></span> "

  if adult
    html += "adults only"
  else
    html += "all ages"

  html += "</li>"
  html.htmlSafe()

Em.Handlebars.registerBoundHelper 'keepCheckoutHistorySlug', (keepCheckoutHistory)->
  html = "<li><span class='glyphicon glyphicon-list-alt'></span> "

  if keepCheckoutHistory
    html += "Keep checkout history"
  else
    html += "Do not keep checkouts"

  html += "</li>"
  html.htmlSafe()