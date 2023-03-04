# Count how many connected tiles of length 4
# are in the selected column vertically.
# Select the column by adding the tag "connectfour_check".

# Rows 1-4
scoreboard players set @e[tag=connectfour_register1] connectfour_cache 1
function connectfour:_count_vertical_col
execute if entity @e[tag=connectfour_register2,scores={connectfour_cache=1}] run scoreboard players set @e[tag=connectfour_register1] connectfour_cache 0
execute if entity @e[tag=connectfour_register2,scores={connectfour_cache=1}] run function connectfour:_set_markers_vertical
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 0

# Rows 2-5
scoreboard players set @e[tag=connectfour_register1] connectfour_cache 2
function connectfour:_count_vertical_col
execute if entity @e[tag=connectfour_register2,scores={connectfour_cache=1}] run scoreboard players set @e[tag=connectfour_register1] connectfour_cache 1
execute if entity @e[tag=connectfour_register2,scores={connectfour_cache=1}] run function connectfour:_set_markers_vertical
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 0

# Rows 3-6
scoreboard players set @e[tag=connectfour_register1] connectfour_cache 4
function connectfour:_count_vertical_col
execute if entity @e[tag=connectfour_register2,scores={connectfour_cache=1}] run scoreboard players set @e[tag=connectfour_register1] connectfour_cache 2
execute if entity @e[tag=connectfour_register2,scores={connectfour_cache=1}] run function connectfour:_set_markers_vertical
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 0

# Rows 4-7
scoreboard players set @e[tag=connectfour_register1] connectfour_cache 8
function connectfour:_count_vertical_col
execute if entity @e[tag=connectfour_register2,scores={connectfour_cache=1}] run scoreboard players set @e[tag=connectfour_register1] connectfour_cache 3
execute if entity @e[tag=connectfour_register2,scores={connectfour_cache=1}] run function connectfour:_set_markers_vertical
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 0

# Reset
scoreboard players set @e[tag=connectfour_register1] connectfour_cache 0
