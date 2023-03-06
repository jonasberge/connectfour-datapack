execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run function connectfour:_determine_board_orientation

# Replace possible buttons first, so they don't drop as items.
execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute if score @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache matches 1 run fill ~1 ~12 ~-3 ~-1 ~18 ~3 air replace acacia_button
execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute if score @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache matches 2 run fill ~-3 ~12 ~1 ~3 ~18 ~-1 air replace acacia_button

execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute if score @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache matches 1 run fill ~1 ~12 ~-3 ~-1 ~18 ~3 air
execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run execute if score @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache matches 2 run fill ~-3 ~12 ~1 ~3 ~18 ~-1 air

scoreboard players reset @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache
