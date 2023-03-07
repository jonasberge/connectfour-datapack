scoreboard players set @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache 0
execute as @e[tag=connectfour_state,sort=nearest,limit=1] run execute if entity @s[tag=_game_active,tag=!_game_finished] run scoreboard players set @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache 1
execute if score @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache matches 1 run function connectfour:_place_tile_unchecked
scoreboard players set @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache 0
