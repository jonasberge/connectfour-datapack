summon falling_block ~ ~17 ~ {BlockState:{Name:"minecraft:iron_block"},Time:1}
execute at @s as @s run function connectfour:_update_gamestate
tag @e[tag=connectfour_state] remove _player1_turn
tag @e[tag=connectfour_state] add _player2_turn
tag @e[tag=connectfour_event] add _player2_turn
