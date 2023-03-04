# Determines the orientation of the board
# by comparing x and z coordinates of the column entities.

execute store result score @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache run data get entity @e[tag=connectfour_column_origin,tag=connectfour_column1,sort=nearest,limit=1] Pos[0]
execute store result score @e[tag=connectfour_register2,sort=nearest,limit=1] connectfour_cache run data get entity @e[tag=connectfour_column_origin,tag=connectfour_column2,sort=nearest,limit=1] Pos[0]
scoreboard players operation @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache -= @e[tag=connectfour_register2,sort=nearest,limit=1] connectfour_cache

execute store result score @e[tag=connectfour_register2,sort=nearest,limit=1] connectfour_cache run data get entity @e[tag=connectfour_column_origin,tag=connectfour_column1,sort=nearest,limit=1] Pos[2]
execute store result score @e[tag=connectfour_register3,sort=nearest,limit=1] connectfour_cache run data get entity @e[tag=connectfour_column_origin,tag=connectfour_column2,sort=nearest,limit=1] Pos[2]
scoreboard players operation @e[tag=connectfour_register2,sort=nearest,limit=1] connectfour_cache -= @e[tag=connectfour_register3,sort=nearest,limit=1] connectfour_cache

# Orientation east-west (1)
execute if entity @e[tag=connectfour_register1,sort=nearest,limit=1,scores={connectfour_cache=0}] run scoreboard players set @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache 1
# Orientation north-south (2)
execute if entity @e[tag=connectfour_register2,sort=nearest,limit=1,scores={connectfour_cache=0}] run scoreboard players set @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache 2

# Reset
scoreboard players reset @e[tag=connectfour_register2,sort=nearest,limit=1] connectfour_cache
scoreboard players reset @e[tag=connectfour_register3,sort=nearest,limit=1] connectfour_cache

# Debug
#tellraw @a [{"score":{"objective":"connectfour_cache","name":"@e[tag=connectfour_register1,sort=nearest,limit=1]"}}]
#tellraw @a [{"score":{"objective":"connectfour_cache","name":"@e[tag=connectfour_register2,sort=nearest,limit=1]"}}]
