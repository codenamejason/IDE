class IDE.OnboardingModalContent extends JView

  constructor: (options = {}, data) ->

    options.cssClass = 'content-container'

    super options, data

    @getStartedButton = new KDButtonView
      title    : 'Get Started'
      cssClass : 'get-started solid green medium'
      callback : => @emit 'GetStartedButtonClicked'

  pistachio: ->
    return """
      <div class="top-container">
        <div class="video-placeholder"></div>
      </div>
      <div class="footer">
        <div class="headline">
          Welcome to your awesome dev environment
        </div>
        {{> @getStartedButton }}
      </div>
    """