# Counts the amount of connected rows/columns/diagonals of a player.
#
# Requires an existing scoreboard dummy objective "connectfour_gamestate"
# in which the state of each game column is encoded as a single number.
# The score is held by a single armor stand (more about that below).
#
# There must also be the following dummy objective used for calculations:
# - connectfour_cache
#
# The encoding of this number works as follows:
# - Add 1 to the number if the 1st cell from the bottom is set
# - Add 2 to the number if the 2nd cell from the bottom is set
# - Add 4 to the number if the 3rd cell from the bottom is set
# - etc.
# Basically, the score is a binary number with each bit denoting
# if there is a player's tile in a particular cell or not,
# with less significant binary digits representing cells towards bottom.
#
# To specify which player should be checked
# the function must be called from a position close the the armor stands
# that hold the score information for this player,
# such that @e[tag=...,sort=nearest,limit=1] with the approriate tag
# selects the proper armor stand of the intended player.
# Thus there must be 7 armor stands for each player and
# for each column with the following tags:
# - Armor stand 1: connectfour_column, connectfour_column1
# - Armor stand 2: connectfour_column, connectfour_column2
# - ...
# - Armor stand 7: connectfour_column, connectfour_column7
#
# The entity with the tag "connectfour_register1"
# will receive a score in "connectfour_gamestate" that specifies
# how many rows/columns/diagonals were connected by the player.
# There also must be an entity with the tag "connectfour_register2".

# reset
scoreboard players set @e[tag=connectfour_register1] connectfour_gamestate 0
scoreboard players set @e[tag=connectfour_register1] connectfour_cache 0
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 0

# check all horizontal rows
function connectfour:_count_horizontal
function connectfour:_count_vertical

# reset
scoreboard players set @e[tag=connectfour_register1] connectfour_cache 0
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 0
