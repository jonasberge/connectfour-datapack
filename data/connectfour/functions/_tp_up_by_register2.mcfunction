execute as @e[tag=connectfour_register2,sort=nearest,limit=1] run execute if entity @s[scores={connectfour_cache=1..}] run execute as @e[tag=connectfour_tp_up] at @s run tp @s ~ ~1 ~
execute as @e[tag=connectfour_register2,sort=nearest,limit=1] run execute if entity @s[scores={connectfour_cache=1..}] run scoreboard players remove @e[tag=connectfour_register2,sort=nearest,limit=1] connectfour_cache 1
# Note: Don't execute this line after calling the function, otherwise the tag will be removed more than once.
execute as @e[tag=connectfour_register2,sort=nearest,limit=1] run execute if entity @s[scores={connectfour_cache=..0}] run tag @e[tag=connectfour_tp_up] remove connectfour_tp_up
execute as @e[tag=connectfour_register2,sort=nearest,limit=1] run execute if entity @s[scores={connectfour_cache=..0}] run scoreboard players set @e[tag=connectfour_register2,sort=nearest,limit=1] connectfour_cache 0
execute as @e[tag=connectfour_register2,sort=nearest,limit=1] run execute if entity @s[scores={connectfour_cache=1..}] run function connectfour:_tp_up_by_register2
