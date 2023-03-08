# Creates a board, centered at the position this command is executed.
# It is oriented so that it is facing north/south.
# ONLY execute this function from a command block!
# Do not execute it manually, otherwise entities
# will be spawned at coordinates with decimal places.

# Mark the border of the board.
fill ~4 ~4 ~ ~-4 ~-4 ~ white_stained_glass
fill ~3 ~3 ~ ~-3 ~-3 ~ air replace white_stained_glass
fill ~ ~4 ~ ~ ~4 ~ black_stained_glass replace white_stained_glass
fill ~ ~-4 ~ ~ ~-4 ~ black_stained_glass replace white_stained_glass
fill ~4 ~ ~ ~4 ~ ~ black_stained_glass replace white_stained_glass
fill ~-4 ~ ~ ~-4 ~ ~ black_stained_glass replace white_stained_glass

# Make space below the board
fill ~4 ~-5 ~ ~-4 ~-15 ~ air

# Set command blocks with commands to place tiles.
fill ~4 ~-6 ~ ~-4 ~-6 ~ iron_block
setblock ~3 ~-6 ~ command_block[facing=down]{Command:"execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute as @e[tag=connectfour_player1_column,tag=connectfour_column1,sort=nearest,limit=1] at @s run function connectfour:place_tile"} replace
setblock ~2 ~-6 ~ command_block[facing=down]{Command:"execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute as @e[tag=connectfour_player1_column,tag=connectfour_column2,sort=nearest,limit=1] at @s run function connectfour:place_tile"} replace
setblock ~1 ~-6 ~ command_block[facing=down]{Command:"execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute as @e[tag=connectfour_player1_column,tag=connectfour_column3,sort=nearest,limit=1] at @s run function connectfour:place_tile"} replace
setblock ~0 ~-6 ~ command_block[facing=down]{Command:"execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute as @e[tag=connectfour_player1_column,tag=connectfour_column4,sort=nearest,limit=1] at @s run function connectfour:place_tile"} replace
setblock ~-1 ~-6 ~ command_block[facing=down]{Command:"execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute as @e[tag=connectfour_player1_column,tag=connectfour_column5,sort=nearest,limit=1] at @s run function connectfour:place_tile"} replace
setblock ~-2 ~-6 ~ command_block[facing=down]{Command:"execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute as @e[tag=connectfour_player1_column,tag=connectfour_column6,sort=nearest,limit=1] at @s run function connectfour:place_tile"} replace
setblock ~-3 ~-6 ~ command_block[facing=down]{Command:"execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute as @e[tag=connectfour_player1_column,tag=connectfour_column7,sort=nearest,limit=1] at @s run function connectfour:place_tile"} replace
fill ~4 ~-8 ~ ~-4 ~-8 ~ gold_block
setblock ~3 ~-8 ~ command_block[facing=down]{Command:"execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute as @e[tag=connectfour_player2_column,tag=connectfour_column1,sort=nearest,limit=1] at @s run function connectfour:place_tile"} replace
setblock ~2 ~-8 ~ command_block[facing=down]{Command:"execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute as @e[tag=connectfour_player2_column,tag=connectfour_column2,sort=nearest,limit=1] at @s run function connectfour:place_tile"} replace
setblock ~1 ~-8 ~ command_block[facing=down]{Command:"execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute as @e[tag=connectfour_player2_column,tag=connectfour_column3,sort=nearest,limit=1] at @s run function connectfour:place_tile"} replace
setblock ~0 ~-8 ~ command_block[facing=down]{Command:"execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute as @e[tag=connectfour_player2_column,tag=connectfour_column4,sort=nearest,limit=1] at @s run function connectfour:place_tile"} replace
setblock ~-1 ~-8 ~ command_block[facing=down]{Command:"execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute as @e[tag=connectfour_player2_column,tag=connectfour_column5,sort=nearest,limit=1] at @s run function connectfour:place_tile"} replace
setblock ~-2 ~-8 ~ command_block[facing=down]{Command:"execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute as @e[tag=connectfour_player2_column,tag=connectfour_column6,sort=nearest,limit=1] at @s run function connectfour:place_tile"} replace
setblock ~-3 ~-8 ~ command_block[facing=down]{Command:"execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute as @e[tag=connectfour_player2_column,tag=connectfour_column7,sort=nearest,limit=1] at @s run function connectfour:place_tile"} replace
# Mainloop
setblock ~ ~-10 ~ repeating_command_block[facing=down]{Command:"execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run function connectfour:mainloop"} replace
setblock ~1 ~-10 ~ command_block[facing=down]{Command:"execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run function connectfour:start"} replace

function connectfour:create_board_northsouth_entitiesonly
