# Update the score for placing a tile in the specified column (player 1).
# Must be executed as the entity for which the column should be placed.
# Must be executed at the origin entity for this column.
# The origin entities must be 10 blocks below the bottom of the game board.

scoreboard players operation @s connectfour_gamestate += @e[tag=connectfour_column_origin,sort=nearest,limit=1] connectfour_nextrow
scoreboard players operation @e[tag=connectfour_column_origin,sort=nearest,limit=1] connectfour_nextrow += @e[tag=connectfour_column_origin,sort=nearest,limit=1] connectfour_nextrow
