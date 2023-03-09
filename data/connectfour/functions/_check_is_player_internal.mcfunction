tag @e[type=player,tag=connectfour_check_is_player] remove _next_player
tag @e[type=player,tag=connectfour_check_is_player,tag=_to_check,sort=arbitrary,limit=1] add _next_player
tag @e[type=player,tag=connectfour_check_is_player,tag=_next_player,sort=arbitrary,limit=1] remove _to_check

# Initial value for the success results is -1,
# because 0 is success, 1 is failure, so 0 should not be the current value
# (which it might be)
execute as @e[type=player,tag=connectfour_check_is_player,tag=_next_player,sort=arbitrary,limit=1] run execute at @s run execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run scoreboard players set @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache -1
execute as @e[type=player,tag=connectfour_check_is_player,tag=_next_player,sort=arbitrary,limit=1] run execute at @s run execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run scoreboard players set @e[tag=connectfour_register2,sort=nearest,limit=1] connectfour_cache -1

## BEGIN set_name
execute as @e[type=player,tag=connectfour_check_is_player,tag=_next_player,sort=arbitrary,limit=1] run execute at @s run execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute if block ~ ~ ~-1 oak_wall_sign run data modify block ~ ~ ~-1 Text3 set value '{"selector":"@e[type=player,tag=connectfour_check_is_player,tag=_next_player,sort=arbitrary,limit=1]"}'
execute as @e[type=player,tag=connectfour_check_is_player,tag=_next_player,sort=arbitrary,limit=1] run execute at @s run execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute if block ~-1 ~ ~ oak_wall_sign run data modify block ~-1 ~ ~ Text3 set value '{"selector":"@e[type=player,tag=connectfour_check_is_player,tag=_next_player,sort=arbitrary,limit=1]"}'
## END set_name

# Check if the to be checked player is player 1.
execute as @e[type=player,tag=connectfour_check_is_player,tag=_next_player,sort=arbitrary,limit=1] run execute at @s run execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute if block ~ ~ ~-1 oak_wall_sign run execute store success score @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache run data modify block ~ ~ ~-1 Text3 set from block ~ ~ ~-1 Text1
execute as @e[type=player,tag=connectfour_check_is_player,tag=_next_player,sort=arbitrary,limit=1] run execute at @s run execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute if block ~-1 ~ ~ oak_wall_sign run execute store success score @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache run data modify block ~-1 ~ ~ Text3 set from block ~-1 ~ ~ Text1

# Set the name again because it was overwritten by Text1.
## BEGIN set_name
execute as @e[type=player,tag=connectfour_check_is_player,tag=_next_player,sort=arbitrary,limit=1] run execute at @s run execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute if block ~ ~ ~-1 oak_wall_sign run data modify block ~ ~ ~-1 Text3 set value '{"selector":"@e[type=player,tag=connectfour_check_is_player,tag=_next_player,sort=arbitrary,limit=1]"}'
execute as @e[type=player,tag=connectfour_check_is_player,tag=_next_player,sort=arbitrary,limit=1] run execute at @s run execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute if block ~-1 ~ ~ oak_wall_sign run data modify block ~-1 ~ ~ Text3 set value '{"selector":"@e[type=player,tag=connectfour_check_is_player,tag=_next_player,sort=arbitrary,limit=1]"}'
## END set_name

# Check if the to be checked player is player 2.
execute as @e[type=player,tag=connectfour_check_is_player,tag=_next_player,sort=arbitrary,limit=1] run execute at @s run execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute if block ~ ~ ~-1 oak_wall_sign run execute store success score @e[tag=connectfour_register2,sort=nearest,limit=1] connectfour_cache run data modify block ~ ~ ~-1 Text3 set from block ~ ~ ~-1 Text2
execute as @e[type=player,tag=connectfour_check_is_player,tag=_next_player,sort=arbitrary,limit=1] run execute at @s run execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute if block ~-1 ~ ~ oak_wall_sign run execute store success score @e[tag=connectfour_register2,sort=nearest,limit=1] connectfour_cache run data modify block ~-1 ~ ~ Text3 set from block ~-1 ~ ~ Text2

# Debug
#execute as @e[type=player,tag=connectfour_check_is_player,tag=_next_player,sort=arbitrary,limit=1] run execute at @s run execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run tellraw @a [{"score":{"objective":"connectfour_cache","name":"@e[tag=connectfour_register1,sort=nearest,limit=1]"}}]
#execute as @e[type=player,tag=connectfour_check_is_player,tag=_next_player,sort=arbitrary,limit=1] run execute at @s run execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run tellraw @a [{"score":{"objective":"connectfour_cache","name":"@e[tag=connectfour_register2,sort=nearest,limit=1]"}}]

# Reset signs
execute as @e[type=player,tag=connectfour_check_is_player,tag=_next_player,sort=arbitrary,limit=1] run execute at @s run execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute if block ~ ~ ~-1 oak_wall_sign run data modify block ~ ~ ~-1 Text3 set value ''
execute as @e[type=player,tag=connectfour_check_is_player,tag=_next_player,sort=arbitrary,limit=1] run execute at @s run execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute if block ~-1 ~ ~ oak_wall_sign run data modify block ~-1 ~ ~ Text3 set value ''

# If neither is a success (both equal 1),
# the player is not a player of the game.
execute as @e[type=player,tag=connectfour_check_is_player,tag=_next_player,sort=arbitrary,limit=1] run execute at @s run execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute if score @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache matches 1 if score @e[tag=connectfour_register2,sort=nearest,limit=1] connectfour_cache matches 1 run tag @e[type=player,tag=connectfour_check_is_player,tag=_next_player,sort=arbitrary,limit=1] add connectfour_not_a_player
tag @e[type=player,tag=connectfour_not_a_player,sort=arbitrary,limit=1] remove connectfour_check_is_player
tag @e[type=player,tag=connectfour_not_a_player,sort=arbitrary,limit=1] remove _next_player
tag @e[type=player,tag=connectfour_not_a_player,sort=arbitrary,limit=1] remove connectfour_not_a_player

# Recursion until no player is left
execute if entity @e[type=player,tag=connectfour_check_is_player,tag=_to_check] run function connectfour:_check_is_player_internal
