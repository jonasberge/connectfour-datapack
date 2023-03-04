# Teleports the placers in a horizontal orientation
# inside the columns that are tagged with
# "connectfour_check1" through "connectfour_check4"
# and offset upwards by the number that is stored in "connectfour_register3".

tp @e[tag=connectfour_placer1,sort=nearest,limit=1] @e[tag=connectfour_check1,sort=nearest,limit=1]
tp @e[tag=connectfour_placer2,sort=nearest,limit=1] @e[tag=connectfour_check2,sort=nearest,limit=1]
tp @e[tag=connectfour_placer3,sort=nearest,limit=1] @e[tag=connectfour_check3,sort=nearest,limit=1]
tp @e[tag=connectfour_placer4,sort=nearest,limit=1] @e[tag=connectfour_check4,sort=nearest,limit=1]

execute as @e[tag=connectfour_placer1,sort=nearest,limit=1] at @s run tp @s ~ ~10 ~
execute as @e[tag=connectfour_placer2,sort=nearest,limit=1] at @s run tp @s ~ ~10 ~
execute as @e[tag=connectfour_placer3,sort=nearest,limit=1] at @s run tp @s ~ ~10 ~
execute as @e[tag=connectfour_placer4,sort=nearest,limit=1] at @s run tp @s ~ ~10 ~

tellraw @a [{"score":{"objective":"connectfour_cache","name":"@e[tag=connectfour_register3,sort=nearest,limit=1]"}}]
scoreboard players operation @e[tag=connectfour_register2] connectfour_cache = @e[tag=connectfour_register3] connectfour_cache
scoreboard players add @e[tag=connectfour_register2] connectfour_cache 1
tag @e[tag=connectfour_placer1,sort=nearest,limit=1] add connectfour_tp_up
tag @e[tag=connectfour_placer2,sort=nearest,limit=1] add connectfour_tp_up
tag @e[tag=connectfour_placer3,sort=nearest,limit=1] add connectfour_tp_up
tag @e[tag=connectfour_placer4,sort=nearest,limit=1] add connectfour_tp_up
function connectfour:_tp_up_by_register2

# Summon markers
execute as @e[tag=connectfour_placer1,sort=nearest,limit=1] at @s run summon marker ~ ~ ~ {Tags:["connectfour_winning_block"]}
execute as @e[tag=connectfour_placer2,sort=nearest,limit=1] at @s run summon marker ~ ~ ~ {Tags:["connectfour_winning_block"]}
execute as @e[tag=connectfour_placer3,sort=nearest,limit=1] at @s run summon marker ~ ~ ~ {Tags:["connectfour_winning_block"]}
execute as @e[tag=connectfour_placer4,sort=nearest,limit=1] at @s run summon marker ~ ~ ~ {Tags:["connectfour_winning_block"]}

# Set state for the future:
# Winning blocks are marked once all falling entities are gone.
# (see mainloop)
tag @e[tag=connectfour_state,sort=nearest,limit=1] add _mark_winning_blocks

# Reset
function connectfour:_reset_placers
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 0
