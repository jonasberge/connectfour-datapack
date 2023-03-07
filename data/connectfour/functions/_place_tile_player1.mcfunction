# Restore the board first! In case changes have been made.
execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run function connectfour:restore_board

summon falling_block ~ ~17 ~ {BlockState:{Name:"minecraft:iron_block"},Time:1,Tags:["connectfour_falling_block"]}
execute at @s as @s run function connectfour:_update_gamestate
tag @e[tag=connectfour_state,sort=nearest,limit=1] remove _player1_turn
tag @e[tag=connectfour_state,sort=nearest,limit=1] add _player2_turn
tag @e[tag=connectfour_event,sort=nearest,limit=1] add _player2_turn
