# Tic Tac Toe
## A rendition by Tenny and Fer

## Introduction

**Tic Tac Toe** has been played for thousands of years, it's so old that the game has been found in egyptian ruins! And it's widely spread all around the world.

## Gameplay

+ This game is commonly played in a 3 by 3 grid and it involves two players.
+ The goal of the game is to mark 3 consecutive spaces either vertically, diagonally or horizontally.
+ Each player chooses a sign, traditionally an X for one, and an O for another.
+ Each player can mark only one block per turn and once the mark is done it will be the other player's turn.
+ If played correctly by both players, the game will end in a draw.

## Instructions

1. Open a terminal.
2. Within the terminal, navigate to the game's directory

    **In windows by using:**
    ```
    cd directory
    ```
    To go to a directory
    If you don't know the name of a directory, use:
    ```
    dir
    ```
    To see the available directories and files within the one you're currently at.

    **In an unix terminal using:**
    ```
    cd directory
    ```
    To go to a directory
    If you don't know the name of a directory, use:
    ```
    ls
    ```
    To see the available directories and files within the one you're currently at.

3. Once you're at the games directory, access the **bin** folder.
    ```
    cd bin
    ```

4. To start the game run the **main.rb** file

    **In windows:**
    ```
    ruby main.rb
    ```
    **In a unix terminal:**
    ```
    main.rb
    ```

5. Play the game
    &nbsp;

    1. Input the name of the first player when requested.
    ```
    What is the name of the first player?
    ```
    &nbsp;
    
    2. Input the name of the second player when requested.
    ```
    What is the name of the second player?
    ```
    + In the game, the first player will be assigned X and the second player will be assigned O.
    + Likewise, the first player will be assigned blue and the second player will be assigned violet.
      
    &nbsp;

    3. The board will be displayed:
    ```
      1 ¦ 2 ¦ 3
     -----------
      4 ¦ 5 ¦ 6
     -----------
      7 ¦ 8 ¦ 9
    ```
    + In our 3 by 3 grid each of the 9 spaces has a number assigned.
    + When asked about a move, the player must choose one of the 9 spaces by imputing the space's number.
    
    &nbsp;

    4. When each of the players chooses a space to mark, the board will be displayed again showing the space marked with the player's mark.
    ```
      X ¦ 2 ¦ 3
     -----------
      4 ¦ O ¦ 6
     -----------
      7 ¦ 8 ¦ 9
    ```

    &nbsp;

    5. If any player manages to mark 3 consecutive spaces, either vertically, diagonally or horizontally, the game will end and the winner announced.
    ```
      X ¦ 2 ¦ 3
     -----------
      X ¦ O ¦ O
     -----------
      X ¦ 8 ¦ 9
    ```
    
    &nbsp;
    
## About the project

+ Built using [Ruby v 2.6.X][rbl]
+ All contributors used [VS Code][vsc] as IDE
+ Big shout out to [stackoverflow][sow] user [Erik Skoglund][esw] for his [answer][esa] which helped us understand how to colorize ruby's terminal output.
+ Git and Github were used for version control

+ This was build as part of [microverse][mvs]'s technical curriculum.
+ Based on [The Odin Project][top]'s Ruby Programing's [Project 1][tor]

## The authors
+ Tennyson Zvaita - [@tennyzvaita](https://twitter.com/tennyzvaita) - tzvaita@gmail.com

+ Fernando Del Valle - [@fer_dv_](https://twitter.com/@fer_dv_) - ferdelvalle@me.com

[rbl]: https://www.ruby-lang.org/en/
[vsc]: https://code.visualstudio.com/
[sow]: https://stackoverflow.com/
[esw]: https://stackoverflow.com/users/829120/erik-skoglund
[esa]: https://stackoverflow.com/questions/1489183/colorized-ruby-output
[mvs]: https://www.microverse.org/
[top]: https://www.theodinproject.com
[tor]: https://www.theodinproject.com/courses/ruby-programming/lessons/oop