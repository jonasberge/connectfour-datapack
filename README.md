# Connect Four Minecraft Datapack

This is a datapack for playing the board game "Connect Four" in Minecraft.
Read the documentation below on how to create your first game board.

![connectfour-ingame](https://github.com/jonasberge/connectfour-datapack/assets/24623262/f3a7e7a6-650e-49cb-95d1-882a6d9e8575)

## Features

* Play Connect Four in Minecraft!
* All winning connected blocks (4 in a row) are identified, not just one.
The amount of these can be retrieved from a scoreboard value after the game.
* Each winning line of connected blocks is visually highlighted
once the game is over,
so players can tell who won and why they won.
* Proper logic to make sure
each player can only make one move during their turn.
* Includes necessary checks for full columns and tied games without a winner.
* Blocks are falling down from the top of the board (like falling sand).
* Game state is stored entirely in scoreboards and persistent entities,
which enables easier (and possibly faster) calculations
and lets the state be decoupled from the blocks in the world.
Even if the game board is destroyed, the game state can be recovered.
This also enables instant win checks,
even while a block/tile is falling down.
Game state cannot be manipulated by destroying blocks
and blocks on the board are restored before each move,
in case some were removed.
* Entirely implemented with functions,
so there is no need for a dozen command blocks bloating the area.
* Each event in the game can be detected with command blocks,
so that you can build a circuit that reacts to state changes!
Write custom messages to players,
change the arena based on who's turn it is and more.
* You can have multiple game boards in the same world,
in parallel, being played at the same time!
Just make sure to follow the instructions below.

# How to use this datapack

## General notes

* In-game you only need to execute functions
that are not prefixed with an underscore to interact with the datapack.
Functions with an underscore in front are considered private
and are not meant to be used from anywhere outside the datapack.
* It is possible to have multiple instances of the game in the same world.
To make sure that each function call knows on which instance it should operate,
prepend each function call with this command.
This is an absolute necessity,
otherwise it is not guaranteed that the datapack works properly
with multiple instances of this game in the same world.
```mcfunction
execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run ...
```

## Installation

To install this datapack,
either download a ZIP file of this repository
or choose on of the release from the sidebar.
Unzip it into the datapacks folder of your world
and enter the `/reload` or `/minecraft:reload` command
in your world or on your server.

## Usage guide

1. **Enabling the game on the current server**.
To be able to play the game,
necessary preparations need to be made on each server.
Execute the `connectfour:setup` function to enable the game on the current server.
Execute the `connectfour:teardown` function to disable it
and undo the changes that `setup` has made.
```mcfunction
function connectfour:setup
```
```mcfunction
function connectfour:teardown
```

2. **Tagging players of the game**.
Players of the game should be tagged with the tags
`connectfour_player1` and `connectfour_player2`.
Do this before the game starts.
It is not strictly necessary though to play the game,
but it might help if you want to incorporate messages to the players
when certain game events occur
(see below for reference on what game events are).

3. **Creating a board**.
Helper functions exist to create a minimal instance of the game.
Paste either of the following commands into a command block (important!)
and power it with a button or a redstone block.
This command must be executed from a command block
to ensure that summoned entities have correct relative coordinates.
The first function creates a board that is facing north/south,
the second one creates one that is facing east/west.  
**Note**: This will replace some blocks surrounding the command blocks.
To get an idea of how much space is necessary,
execute this command somewhere in the sky.
```mcfunction
function connectfour:create_board_northsouth
```
```mcfunction
function connectfour:create_board_eastwest
```

4. **Understanding what has been created**.
After having executed one of the two previous commands
you will see a square game board, several command blocks
and a few armor stands in a glass box below the board.  
**Armor stands**.
The entities are needed for the datapack to work
and must not be moved, destroyed or otherwise modified.
I have used visible armor stands, so it is easy to delete the board,
in case that is necessary at some point.
Check the reference below to find out what each entity is used for.  
**A sign**.
The sign in front of the armor stands is important!
It will store the names of player 1 and player 2
which can be used to check if a player with the tag
`connectfour_player1` or `connectfour_player2`
is actually the player of the nearest game.
This can be useful for making sure only the actual players
are in the arena and pressing buttons.
Use the function `connectfour:check_is_player` explained below for this.  
**Command blocks**.
Some command blocks have been placed with pre-made commands
that explain how to interact with the game
and which functions are necessary at a minimum to play the game:
    * *Making a move*.
    There are two rows of command blocks
    which allow making a move for player 1 (iron block)
    and player 2 (gold block) respectively.
    The command block below each column of the board
    summons a falling block entity at the top of the column,
    simulating the move of a player.
    The entire logic of the game is behind the scenes.
    * *Starting and stopping a game*.
    You can start a game at the nearest board
    by executing the function `connectfour:start`.
    The game does not need to be stopped explicitly,
    everything is reset upon calling the `start` function again.
    * *The main loop*.
    The repeating command block executes a function
    that checks certain things during each tick while the game is running.
    It must be activated while a game is played on this board
    This is used to allow delayed operations after certain game events.
    Each game board needs its own main loop.

5. **What to do next**.
Each of the command blocks will operate on the nearest game board.
So make sure they are closest to the created board
and not closer to another board in the world.
To be sure, leave some space between created boards.
You can move the command blocks to a different location
to build and design your own arena to your specific visual needs.
Check the reference below for more commands and features
that can be used to extend this basic circuit.

## Scoreboard Reference

The datapack uses the following scoreboards:

* `connectfour_gamestate` -
Stores the current gamestate, encoded as integers for each column.
For more information read the explanation below.
Can also hold other values in registers (see entities below),
to communicate return values from functions.
* `connectfour_nextrow` -
Stores in which row a tile for the next turn is placed for each column.
For more information read the explanation below.
* `connectfour_cache` -
A scoreboard for temporary values used for calculations
during function executions.

## Entity Reference

Below is a list of entities used by this datapack.
The string at the beginning of each bullet point denotes
the tag that the respective entity is tagged with.

* `connectfour_register1` (`2`, `3`) -
"Registers" (like CPU registers) to aid with calculations, etc.
* `connectfour_state` - Holds tags (flags) to store states the game is in.
* `connectfour_event` - Holds tags (flags) to communicate events
to other parts of your custom circuit (more information below).
* `connectfour_placer_anchor` -
The anchor to which placers return (see next entry).
* `connectfour_placer1` (`2`, `3`, `4`) -
Four placers that are used to place blocks inside the game board.
Entities are used because they can easily moved with relative coordinates.
* `connectfour_column1` (`2`, `3`, `4`, `5`, `6`, `7`) + `connectfour_player1_column` -
Entities below the columns of the game board,
used to summon falling blocks, count connected tiles
and hold the state of each column in the scoreboard.
These are for player1.
* `connectfour_column1` (`2`, `3`, `4`, `5`, `6`, `7`) + `connectfour_player2_column` -
Same as the previous, but for player 2.
The entities for player 2 are offset a little bit on the y axis,
so that a column entity can select one of it's neighbours
with `@e[tag=connectfour_column...,sort=nearest,limit=1]`
without accidentally selecting the column of the other player.

## Game State Reference

The entity with the tag `connectfour_state` can hold the following states.
These are held for extended time periods
(unlike events which should only exist for a single tick).

* `_player1_turn` - It's player 1's turn now.
* `_player2_turn` - Same as the previous, but for player 2.
* `_player1_won` - Player 1 has won the game. The game is finished.
* `_player2_won` - Same as the previous, but for player 2.
* `_no_winner_tie` - There is no winner, the game is a tie.
* `_mark_winning_blocks` -
Used internally to denote that winning blocks (connected tiles)
should be marked as such.
Winning blocks are only marked
once the falling entity has become a solid block,
but some time needs to pass for that to happen,
so the game waits and remembers this state by using this tag.
* `_game_active` - The game is currently active (running, unfinished).
* `_game_finished` - The game is finished
and any button presses do not change the game state anymore.

## Game Events Reference

During the game certain events can occur.
The `connectfour_event` entity is used
to communicate these events to your circuit.
You can read them with the following command in a repeating command block:
```mcfunction
tag @e[tag=connectfour_event,sort=nearest,limit=1] remove _event_name
```
The command block may then be followed by
any number of conditional (!) chained command blocks
that shall be executed when the named event occurs.
They must be conditional,
since you only want them to execute when the event tag is set (and removed).

Replace `_event_name` in the command above
with one of the following valid events:

* `_player1_turn` - It's player 1's turn now.
* `_player2_turn` - Same as the previous, but for player 2.
* `_player1_notyourturn` - It's not your turn, player 1.
Fired when player 1 attempts to make a move while it's not their turn.
* `_player2_notyourturn` - Same as the previous, but for player 2.
* `_player1_columnfull` - The column is full,
in which this player is attempting to place a tile.
The move they made is not valid and it is still their turn
* `_player2_columnfull` - Same as the previous, but for player 2.
* `_player1_won` - Player 1 has won the game. The game is finished.
* `_player2_won` - Same as the previous, but for player 2.
* `_game_finished` - The game is finished.
* `_no_winner_tie` - The game is finished.

You can use these events to write messages, turn on lights,
trigger other parts of your circuit, etc.

## Function Reference

* `connectfour:check_is_player` -
Checks if any of the players with the tag `connectfour_check_is_player`
is a player of the game that is nearest to them respectively.
If they are not, the tag `connectfour_check_is_player` is removed.
You can then determine who is not a player
by checking if they do not have a tag anymore.
For this to work, the names of the players should have been stored first
with the functions `store_player1_name` and `store_player2_name`.
* `connectfour:count_connected` -
Counts the number of connected game tiles (4 in a row)
horizontally, diagonally and vertically
for a specific player.
The player is selected by executing this function near those columns
that belong to the player.
The amount of connected tiles is stored for the entity
`connectfour_register1` in the scoreboard `connectfour_gamestate`.
This number may be written in chat or used otherwise.
Most importantly though, if it is greater than 0,
than the player whose columns were selected has won the game.
Use one the below commands to check
if player 1 or player 2 has won respectively.
```mcfunction
execute at @e[tag=connectfour_player1_middle_column] run function connectfour:count_connected
```
```mcfunction
execute at @e[tag=connectfour_player2_middle_column] run function connectfour:count_connected
```
* `connectfour:create_board_eastwest` - #TODO
* `connectfour:create_board_eastwest_entitiesonly` - #TODO
* `connectfour:create_board_northsouth` - #TODO
* `connectfour:create_board_northsouth_entitiesonly` - #TODO
* `connectfour:delete_nearest_board` - #TODO
* `connectfour:mainloop` - #TODO
* `connectfour:mark_winning_blocks` - #TODO
* `connectfour:place_tile` - #TODO
* `connectfour:readme` - #TODO
* `connectfour:reset_board` - #TODO
* `connectfour:restore_board` - #TODO
* `connectfour:setup` - #TODO
* `connectfour:start` - #TODO
* `connectfour:stop` - #TODO
* `connectfour:store_player1_name` - #TODO
* `connectfour:store_player2_name` - #TODO
* `connectfour:tag_nearest_player1` - #TODO
* `connectfour:tag_nearest_player2` - #TODO
* `connectfour:teardown` - #TODO

# How it works

Columns are encoded as binary numbers,
where each cell in a row is represented by a binary digit (1, 2, 4, etc.).
If player 1 has placed a block in column 1,
then player 2 in the same column and then player 1 again,
the value for that column for player 1 would be 5 (1 + 4)
and for player 2 it would be 2 (2),
since the first row is represented by 1,
the second by 2 and the third by 4.

This allows for a very compact and purely numeric representation
of the game state within a single scoreboard and with just a few entities.

Also, checking for connected tiles (4 in a row)
becomes quite simple (in theory),
since you only need to check these properties,
depending on the orientation you want to check:
* Vertically connected tiles -
Here a column's value must contain 4 consecutive binary digits,
e.g. 1, 2, 4 and 8 or 4, 8, 16 and 32.
Only if that is the case, there is are four connected tiles.
It is easy to check this using bit shifts (aka. divide by 2)
and comparing against the number 15 (containing the first four binary digits).
Bit shifts allow use to move tiles in a column up and down.
* Horizontally connected tiles -
Here we check if four neighbouring column values
all share a common binary digit (e.g. 4 or 64).
If they do, that means each of the columns have a tile in the same row,
which means there are four connected tiles in that row.
* Diagonally connected tiles -
We can reuse the algorithm for horizontally connected tiles,
by rearranging the four columns in the following manner:
Leave the left-most column as is.
Move the next column to the right of it 1 down.
Move the next column (the third one) 2 down.
Move the fourth and last column 3 down.
Imagine this visually and you will notice
that we have transformed a diagonal line to a horizontal line.
We can now simply check if these tiles are horizontally connected.

In order to mark which tiles are part of a connected series of tiles
(these blocks are highlighted at the end of each game, if there is a winner),
we can track back how many bit shifts we did and in which column we are,
to determine the exact position at which such a block is at.

That's it!
