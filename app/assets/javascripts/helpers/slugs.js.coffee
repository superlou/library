Em.Handlebars.registerBoundHelper 'emailSlug', (value) ->
  if value
    html = "<span class='glyphicon glyphicon-envelope'></span> " + value
  else
    html = "<span class='glyphicon glyphicon-envelope'></span> no email provided"

  html.htmlSafe()

Em.Handlebars.registerBoundHelper 'codeSlug', (value) ->
  if value
    html = "<span class='glyphicon glyphicon-barcode'></span> " + value
  else
    html = "<span class='glyphicon glyphicon-barcode'></span> no code set"

  html.htmlSafe()

Em.Handlebars.registerBoundHelper 'identitySlug', (gender, adult) ->
  html = "<span class='glyphicon glyphicon-user'></span> "
  if gender
    html += gender

  if adult
    html += " adult"
  else
    html += " non-adult"


  html.htmlSafe()

Em.Handlebars.registerBoundHelper 'stockSlug', (available, stock)->
  html = "<span class='glyphicon glyphicon-shopping-cart'></span> "

  html += available + " of " + stock + " available"

  html.htmlSafe()

Em.Handlebars.registerBoundHelper 'adultSlug', (adult)->
  html = "<span class='glyphicon glyphicon-user'></span> "

  if adult
    html += "adults only"
  else
    html += "all ages"

  html.htmlSafe()

Em.Handlebars.registerBoundHelper 'keepCheckoutHistorySlug', (keepCheckoutHistory)->
  html = "<span class='glyphicon glyphicon-list-alt'></span> "

  if keepCheckoutHistory
    html += "Keep checkout history"
  else
    html += "Do not keep checkouts"

  html.htmlSafe()