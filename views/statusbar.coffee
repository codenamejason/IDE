class IDE.StatusBar extends KDView

  constructor: (options = {}, data) ->

    options.cssClass = 'status-bar'

    super options, data

    @status     = new KDCustomHTMLView
      cssClass  : 'status'

    @menuButton = new KDCustomHTMLView
      tagName   : 'span'
      cssClass  : 'actions-button'
      click     : =>
        KD.getSingleton('appManager').tell 'IDE', 'showActionsMenu', @menuButton

    @addSubView @status
    @addSubView @menuButton


class IDE.StatusBarMenu extends KDContextMenu

  constructor: (options = {}) ->

    menuItems        = @getMenuItems options.paneType
    {delegate}       = options
    options.x        = delegate.getX()
    options.cssClass = 'status-bar-menu'

    super options, menuItems

    @on 'ContextMenuItemReceivedClick', @bound 'destroy'

  getMenuItems: (paneType) ->
    appManager = KD.getSingleton 'appManager'
    items      = {}

    items.Shortcuts  = callback: -> appManager.tell 'IDE', 'showShortcutsView'
    items.Feedback   = callback: -> appManager.tell 'IDE', 'showFeedbackView'
    items.Contribute = callback: -> appManager.tell 'IDE', 'showContributeView'
    items.Quit       = callback: ->
      appManager.quitByName 'IDE'
      KD.getSingleton('router').handleRoute '/Activity'

    return items
