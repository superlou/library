Em.Handlebars.registerBoundHelper 'emailSlug', (value) ->
  if value
    html = "<li><i class='fi-mail'></i> " + value + "</li>"
  else
    html = "<li><i class='fi-mail'></i> no email provided</li>"

  html.htmlSafe()

Em.Handlebars.registerBoundHelper 'codeSlug', (value) ->
  if value
    html = "<li><i class='fi-marker'></i> " + value + "</li>"
  else
    html = "<li><i class='fi-marker'></i> no code set</li>"

  html.htmlSafe()

Em.Handlebars.registerBoundHelper 'identitySlug', (gender, adult) ->
  html = "<li><i class='fi-torso'></i> "
  if gender
    html += gender

  if adult
    html += " adult"
  else
    html += " non-adult"

  html += "</li>"

  html.htmlSafe()

Em.Handlebars.registerBoundHelper 'stockSlug', (available, stock)->
  html = "<li><i class='fi-shopping-cart'></i> "

  html += available + " of " + stock + " available"

  html += "</li>"
  html.htmlSafe()

Em.Handlebars.registerBoundHelper 'adultSlug', (adult)->
  html = "<li><i class='fi-torsos-all'></i> "

  if adult
    html += "adults only"
  else
    html += "all ages"

  html += "</li>"
  html.htmlSafe()