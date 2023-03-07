# Position the placer
tp @e[tag=connectfour_placer1,sort=nearest,limit=1] @s
execute as @e[tag=connectfour_placer1,sort=nearest,limit=1] at @s run tp @s ~ ~10 ~
scoreboard players operation @e[tag=connectfour_register2,sort=nearest,limit=1] connectfour_cache = @e[tag=connectfour_register3,sort=nearest,limit=1] connectfour_cache
execute at @e[tag=connectfour_placer_anchor,sort=nearest,limit=1] run execute positioned ~ ~15 ~ run tag @e[tag=connectfour_placer1,sort=nearest,limit=1] add connectfour_tp_up
function connectfour:_tp_up_by_register2

# Determine if this block exists for the player
function connectfour:_copy_gamestate_to_cache
scoreboard players operation @s connectfour_cache /= @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache
scoreboard players set @e[tag=connectfour_register2,sort=nearest,limit=1] connectfour_cache 2
scoreboard players operation @s connectfour_cache %= @e[tag=connectfour_register2,sort=nearest,limit=1] connectfour_cache
execute if score @s connectfour_cache matches 1 run tag @e[tag=connectfour_register2,sort=nearest,limit=1] add connectfour_success

# Place the block or set it to air if there is no block
execute if entity @s[tag=connectfour_player1_column] run execute as @e[tag=connectfour_register2,sort=nearest,limit=1] if entity @s[tag=connectfour_success] run execute at @e[tag=connectfour_placer_anchor,sort=nearest,limit=1] run execute positioned ~ ~15 ~ run execute as @e[tag=connectfour_placer1,sort=nearest,limit=1] at @s run fill ~ ~ ~ ~ ~ ~ iron_block replace
execute if entity @s[tag=connectfour_player2_column] run execute as @e[tag=connectfour_register2,sort=nearest,limit=1] if entity @s[tag=connectfour_success] run execute at @e[tag=connectfour_placer_anchor,sort=nearest,limit=1] run execute positioned ~ ~15 ~ run execute as @e[tag=connectfour_placer1,sort=nearest,limit=1] at @s run fill ~ ~ ~ ~ ~ ~ gold_block replace air
execute as @e[tag=connectfour_register2,sort=nearest,limit=1] if entity @s[tag=!connectfour_success] run execute at @e[tag=connectfour_placer_anchor,sort=nearest,limit=1] run execute positioned ~ ~15 ~ run execute as @e[tag=connectfour_placer1,sort=nearest,limit=1] at @s unless block ~ ~ ~ iron_block run fill ~ ~ ~ ~ ~ ~ air replace

# Reset
tag @e[tag=connectfour_placer_anchor,sort=nearest,limit=1] add connectfour_placer_anchor_live
execute at @e[tag=connectfour_placer_anchor,sort=nearest,limit=1] run execute positioned ~ ~15 ~ run tp @e[tag=connectfour_placer1,sort=nearest,limit=1] @e[tag=connectfour_placer_anchor_live,sort=nearest,limit=1]
tag @e[tag=connectfour_placer_anchor,sort=nearest,limit=1] remove connectfour_placer_anchor_live
tag @e[tag=connectfour_register2,sort=nearest,limit=1] remove connectfour_success
scoreboard players set @e[tag=connectfour_register2,sort=nearest,limit=1] connectfour_cache 0
