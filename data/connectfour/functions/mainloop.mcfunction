# Mainloop to be repeated while the game is active.
# Necessary to perform some actions that need continuous checking.

# Mark winning blocks once all falling entities are gone (solid blocks).
execute if entity @e[tag=connectfour_state,sort=nearest,limit=1,tag=_game_finished] if entity @e[tag=connectfour_state,sort=nearest,limit=1,tag=_mark_winning_blocks] run execute as @e[tag=connectfour_winning_block,sort=nearest,limit=1] at @s run execute unless entity @e[tag=connectfour_falling_block,distance=..10] run function connectfour:mark_winning_blocks
