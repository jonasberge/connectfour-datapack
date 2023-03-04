# Places acacia buttons on the tiles/blocks that are marked
# by having an entity inside of them with the tag "connectfour_winning_block".
# Blocks are not (!) placed while there is a falling entity
# (tagged with "connectfour_falling_block"), so that there are no floating buttons.
# Call this function again once there is no falling entity.

function connectfour:_determine_board_orientation

# East
execute if entity @e[tag=connectfour_register1,sort=nearest,limit=1,scores={connectfour_cache=1}] as @e[tag=connectfour_winning_block] at @s run execute unless entity @e[tag=connectfour_falling_block,distance=..10] run tag @s add _place_here
execute if entity @e[tag=connectfour_register1,sort=nearest,limit=1,scores={connectfour_cache=1}] as @e[tag=connectfour_winning_block] at @s run execute unless entity @e[tag=connectfour_falling_block,distance=..10] run tag @s add _place_here
execute if entity @e[tag=connectfour_register1,sort=nearest,limit=1,scores={connectfour_cache=1}] as @e[tag=connectfour_winning_block] at @s run execute unless entity @e[tag=connectfour_falling_block,distance=..10] run tag @s add _place_here
execute if entity @e[tag=connectfour_register1,sort=nearest,limit=1,scores={connectfour_cache=1}] as @e[tag=connectfour_winning_block] at @s run execute unless entity @e[tag=connectfour_falling_block,distance=..10] run tag @s add _place_here
execute as @e[tag=connectfour_winning_block,tag=_place_here] at @s run fill ~1 ~ ~ ~1 ~ ~ acacia_button[face=wall,facing=east] replace air
tag @e[tag=connectfour_winning_block,tag=_place_here] add _remove_this
tag @e[tag=connectfour_winning_block,tag=_place_here] remove _place_here

# South
execute if entity @e[tag=connectfour_register1,sort=nearest,limit=1,scores={connectfour_cache=2}] as @e[tag=connectfour_winning_block] at @s run execute unless entity @e[tag=connectfour_falling_block,distance=..10] run tag @s add _place_here
execute if entity @e[tag=connectfour_register1,sort=nearest,limit=1,scores={connectfour_cache=2}] as @e[tag=connectfour_winning_block] at @s run execute unless entity @e[tag=connectfour_falling_block,distance=..10] run tag @s add _place_here
execute if entity @e[tag=connectfour_register1,sort=nearest,limit=1,scores={connectfour_cache=2}] as @e[tag=connectfour_winning_block] at @s run execute unless entity @e[tag=connectfour_falling_block,distance=..10] run tag @s add _place_here
execute if entity @e[tag=connectfour_register1,sort=nearest,limit=1,scores={connectfour_cache=2}] as @e[tag=connectfour_winning_block] at @s run execute unless entity @e[tag=connectfour_falling_block,distance=..10] run tag @s add _place_here
execute as @e[tag=connectfour_winning_block,tag=_place_here] at @s run fill ~ ~ ~1 ~ ~ ~1 acacia_button[face=wall,facing=south] replace air
tag @e[tag=connectfour_winning_block,tag=_place_here] add _remove_this
tag @e[tag=connectfour_winning_block,tag=_place_here] remove _place_here

# West
execute if entity @e[tag=connectfour_register1,sort=nearest,limit=1,scores={connectfour_cache=1}] as @e[tag=connectfour_winning_block] at @s run execute unless entity @e[tag=connectfour_falling_block,distance=..10] run tag @s add _place_here
execute if entity @e[tag=connectfour_register1,sort=nearest,limit=1,scores={connectfour_cache=1}] as @e[tag=connectfour_winning_block] at @s run execute unless entity @e[tag=connectfour_falling_block,distance=..10] run tag @s add _place_here
execute if entity @e[tag=connectfour_register1,sort=nearest,limit=1,scores={connectfour_cache=1}] as @e[tag=connectfour_winning_block] at @s run execute unless entity @e[tag=connectfour_falling_block,distance=..10] run tag @s add _place_here
execute if entity @e[tag=connectfour_register1,sort=nearest,limit=1,scores={connectfour_cache=1}] as @e[tag=connectfour_winning_block] at @s run execute unless entity @e[tag=connectfour_falling_block,distance=..10] run tag @s add _place_here
execute as @e[tag=connectfour_winning_block,tag=_place_here] at @s run fill ~-1 ~ ~ ~-1 ~ ~ acacia_button[face=wall,facing=west] replace air
tag @e[tag=connectfour_winning_block,tag=_place_here] add _remove_this
tag @e[tag=connectfour_winning_block,tag=_place_here] remove _place_here

# North
execute if entity @e[tag=connectfour_register1,sort=nearest,limit=1,scores={connectfour_cache=2}] as @e[tag=connectfour_winning_block] at @s run execute unless entity @e[tag=connectfour_falling_block,distance=..10] run tag @s add _place_here
execute if entity @e[tag=connectfour_register1,sort=nearest,limit=1,scores={connectfour_cache=2}] as @e[tag=connectfour_winning_block] at @s run execute unless entity @e[tag=connectfour_falling_block,distance=..10] run tag @s add _place_here
execute if entity @e[tag=connectfour_register1,sort=nearest,limit=1,scores={connectfour_cache=2}] as @e[tag=connectfour_winning_block] at @s run execute unless entity @e[tag=connectfour_falling_block,distance=..10] run tag @s add _place_here
execute if entity @e[tag=connectfour_register1,sort=nearest,limit=1,scores={connectfour_cache=2}] as @e[tag=connectfour_winning_block] at @s run execute unless entity @e[tag=connectfour_falling_block,distance=..10] run tag @s add _place_here
execute as @e[tag=connectfour_winning_block,tag=_place_here] at @s run fill ~ ~ ~-1 ~ ~ ~-1 acacia_button[face=wall,facing=north] replace air
tag @e[tag=connectfour_winning_block,tag=_place_here] add _remove_this
tag @e[tag=connectfour_winning_block,tag=_place_here] remove _place_here

# Remove entities for which buttons have been placed.
kill @e[tag=connectfour_winning_block,tag=_remove_this]

# Reset
scoreboard players reset @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache

# Remove state
tag @e[tag=connectfour_state,sort=nearest,limit=1] remove _mark_winning_blocks
