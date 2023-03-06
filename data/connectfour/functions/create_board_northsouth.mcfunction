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

# Box for the armor stands
fill ~3 ~-13 ~ ~-3 ~-15 ~ glass

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

# Origin for spawning the other armor stands
# 4 down (board height)
# 10 down (fixed buffer)
# 2 down (column armor stands are 1 above the center instead of below)
# 0.5 up (summon in the center of the block)
# = -4-10-2+0.5 = -15.5
summon armor_stand ~ ~-15.5 ~ {Tags:["connectfour_board_origin","connectfour_board_origin_live"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}

execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~ ~ {"Tags":["connectfour_register","connectfour_register1"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~ ~ {"Tags":["connectfour_register","connectfour_register2"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~ ~ {"Tags":["connectfour_register","connectfour_register3"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}

execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~ ~ {"Tags":["connectfour_state"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~ ~ {"Tags":["connectfour_event"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}

execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~ ~ {"Tags":["connectfour_placer_anchor"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~ ~ {"Tags":["connectfour_placer","connectfour_placer1"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~ ~ {"Tags":["connectfour_placer","connectfour_placer2"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~ ~ {"Tags":["connectfour_placer","connectfour_placer3"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~ ~ {"Tags":["connectfour_placer","connectfour_placer4"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}

execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~3 ~1 ~ {"Tags":["connectfour_column","connectfour_column1","connectfour_player1_column","connectfour_column_origin"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~2 ~1 ~ {"Tags":["connectfour_column","connectfour_column2","connectfour_player1_column","connectfour_column_origin"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~1 ~1 ~ {"Tags":["connectfour_column","connectfour_column3","connectfour_player1_column","connectfour_column_origin"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~0 ~1 ~ {"Tags":["connectfour_column","connectfour_column4","connectfour_player1_column","connectfour_column_origin"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~-1 ~1 ~ {"Tags":["connectfour_column","connectfour_column5","connectfour_player1_column","connectfour_column_origin"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~-2 ~1 ~ {"Tags":["connectfour_column","connectfour_column6","connectfour_player1_column","connectfour_column_origin"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~-3 ~1 ~ {"Tags":["connectfour_column","connectfour_column7","connectfour_player1_column","connectfour_column_origin"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}

execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~3 ~1.25 ~ {"Tags":["connectfour_column","connectfour_column1","connectfour_player2_column"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~2 ~1.25 ~ {"Tags":["connectfour_column","connectfour_column2","connectfour_player2_column"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~1 ~1.25 ~ {"Tags":["connectfour_column","connectfour_column3","connectfour_player2_column"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~0 ~1.25 ~ {"Tags":["connectfour_column","connectfour_column4","connectfour_player2_column"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~-1 ~1.25 ~ {"Tags":["connectfour_column","connectfour_column5","connectfour_player2_column"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~-2 ~1.25 ~ {"Tags":["connectfour_column","connectfour_column6","connectfour_player2_column"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~-3 ~1.25 ~ {"Tags":["connectfour_column","connectfour_column7","connectfour_player2_column"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}

tag @e[tag=connectfour_board_origin_live] remove connectfour_board_origin_live
