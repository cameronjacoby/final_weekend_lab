# define application
HangmanApp = angular.module "HangmanApp", []

# create controller
HangmanApp.controller "IndexCtrl", ['$scope', ($scope) ->

  $scope.submitWord = ->
    # hide submit form
    $scope.submitted = true
    # hide welcome message
    $scope.welcome = true
    # hide new game message
    $scope.newMsg = false
    # show counter for remaining guesses
    $scope.counter = true

    # reset guess count
    $scope.count = 0

    # convert secretWord to lowercase and save result
    $scope.savedWord = $scope.secretWord.toLowerCase()

    # clear secretWord
    $scope.secretWord = ''

    # split savedWord into an array
    $scope.characters = $scope.savedWord.split("")

    # create letters array
    $scope.letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
                    "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

    # set guessed chars array
    $scope.guessedChars = []
    # set spaces array
    $scope.spaces = []

    a = 0
    while a < $scope.characters.length
      $scope.spaces.push("")
      a += 1

    # set hangman
    $scope.hangman = {}

  $scope.guess = (letter) ->
    # hide the letter clicked
    this.clicked = true
    # set var for correct guess
    correct = false
    
    # loop through characters array to see if the letter clicked is in the array
    i = 0
    while i < $scope.characters.length
      if $scope.characters[i] is letter
        # push letter into guessedChars array
        $scope.guessedChars[i] = letter
        # set correct guess to true
        correct = true

        # check for empty spaces in the guessedChars array
        emptyCheck = false
        j = 0
        while j < $scope.guessedChars.length
          if $scope.guessedChars[j] == undefined
            emptyCheck = true
          j += 1

        # win declared if guessedChars is same length as characters
        # and no empty spaces in guessedChars array
        if $scope.guessedChars.length == $scope.characters.length && emptyCheck == false
          # reset letters array to hide all letters
          $scope.letters = []
          # hide counter for remaining guesses
          $scope.counter = false
          # show winning message
          $scope.winMsg = true
          # show restart button
          $scope.restart = true

      # if reached last character & guessed letter not found
      else if i == $scope.characters.length - 1 && correct == false
        # increment guess count
        $scope.count += 1
        # BUILD HANGMAN HERE
        $scope.hangman[$scope.count] = true

        # if guess count reaches 6
        if $scope.count == 6
          # reset letters array to hide all letters
          $scope.letters = []
          # hide counter for remaining guesses
          $scope.counter = false
          # show losing message
          $scope.loseMsg = true
          # show restart button
          $scope.restart = true
      i += 1

  $scope.newGame = ->
    # show new game message
    $scope.newMsg = true
    # show submit form
    $scope.submitted = false

    # hide winning message
    $scope.winMsg = false
    # hide losing message
    $scope.loseMsg = false
    # hide restart button
    $scope.restart = false

    # clear guessed chars array
    $scope.guessedChars = []
    # clear spaces array
    $scope.spaces = []
    # reset hangman
    $scope.hangman = {}

]