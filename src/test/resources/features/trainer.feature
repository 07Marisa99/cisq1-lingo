Scenario: start new game
  When i start a new game
  Then the word has "5" letters
  And i should see my first letter
  And i have "0" points

Scenario Outline: winning a round
  Given i am playing a game
  And the round was won
  And the last word had "<previous length>" letters
  When i start a new round
  Then the word to guess has "<next length>" letters

  Examples:
    |previous lenght|next length    |
    |5              |6              |
    |6              |7              |
    |7              |5              |

  #Failure path

Scenario: losing a round
  Given i am playing a game
  And the round was lost
  Then i cannot start a new round

Scenario Outline: guessing a word
  Given i am playing a game
  And i have made a <guess>
  When there are any matches with <word>
  Then i will receive <feedback>

  Examples:
    |word          |feedback      |
    |wrong place   |yellow circle |
    |right place   |red background|