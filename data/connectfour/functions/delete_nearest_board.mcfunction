# Deletes all armor stands of the nearest board.

execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run kill @e[distance=..4,tag=connectfour_register,sort=nearest,limit=3]
execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run kill @e[distance=..4,tag=connectfour_player,sort=nearest,limit=2]
execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run kill @e[distance=..4,tag=connectfour_state,sort=nearest,limit=1]
execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run kill @e[distance=..4,tag=connectfour_event,sort=nearest,limit=1]
execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run kill @e[distance=..4,tag=connectfour_placer_anchor,sort=nearest,limit=4]
execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run kill @e[distance=..4,tag=connectfour_placer,sort=nearest,limit=4]
execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run kill @e[distance=..4,tag=connectfour_column,sort=nearest,limit=14]

# Delete the origin last.
execute at @e[tag=connectfour_board_origin,sort=nearest,limit=1] run kill @e[distance=..4,tag=connectfour_board_origin,sort=nearest,limit=1]
