# Count how many horizontally (and diagonally) connected tiles there are
# for the selected row and columns.

# Horizontal
function connectfour:_copy_gamestate_to_cache
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 0
function connectfour:_count_horizontal_row
execute if entity @e[tag=connectfour_register2,scores={connectfour_cache=1}] run function connectfour:_set_markers_horizontal
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 0

# Diagonal: Bottom-left to top-right (transform diagonals to horizontals)
function connectfour:_copy_gamestate_to_cache
# keep first column like it is
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 1
scoreboard players operation @e[tag=connectfour_check1,sort=nearest,limit=1] connectfour_cache /= @e[tag=connectfour_register2] connectfour_cache
# Divide the second column by 2 to move it 1 down
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 2
scoreboard players operation @e[tag=connectfour_check2,sort=nearest,limit=1] connectfour_cache /= @e[tag=connectfour_register2] connectfour_cache
# Divide the third column by 4 to move it 2 down
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 4
scoreboard players operation @e[tag=connectfour_check3,sort=nearest,limit=1] connectfour_cache /= @e[tag=connectfour_register2] connectfour_cache
# Divide the fourth column by 8 to move it 3 down
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 8
scoreboard players operation @e[tag=connectfour_check4,sort=nearest,limit=1] connectfour_cache /= @e[tag=connectfour_register2] connectfour_cache
# Now, since we adjusted the columns
# such that bottom-left-to-top-right diagonals are horizontals,
# we can reuse the horizontal function to check for diagonals.
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 0
function connectfour:_count_horizontal_row
execute if entity @e[tag=connectfour_register2,scores={connectfour_cache=1}] run function connectfour:_set_markers_diagonal_bltr
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 0

# Diagonal: Top-left to bottom-right (transform diagonals to horizontals)
function connectfour:_copy_gamestate_to_cache
# Divide the first column by 8 to move it 3 down
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 8
scoreboard players operation @e[tag=connectfour_check1,sort=nearest,limit=1] connectfour_cache /= @e[tag=connectfour_register2] connectfour_cache
# Divide the second column by 2 to move it 2 down
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 4
scoreboard players operation @e[tag=connectfour_check2,sort=nearest,limit=1] connectfour_cache /= @e[tag=connectfour_register2] connectfour_cache
# Divide the third column by 4 to move it 1 down
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 2
scoreboard players operation @e[tag=connectfour_check3,sort=nearest,limit=1] connectfour_cache /= @e[tag=connectfour_register2] connectfour_cache
# keep fourth column like it is
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 1
scoreboard players operation @e[tag=connectfour_check4,sort=nearest,limit=1] connectfour_cache /= @e[tag=connectfour_register2] connectfour_cache
# Now, since we adjusted the columns
# such that bottom-left-to-top-right diagonals are horizontals,
# we can reuse the horizontal function to check for diagonals.
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 0
function connectfour:_count_horizontal_row
execute if entity @e[tag=connectfour_register2,scores={connectfour_cache=1}] run function connectfour:_set_markers_diagonal_tlbr
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 0

# Debug
#execute if entity @e[tag=connectfour_register1,tag=_debug] run tellraw @a [{"score":{"name":"@e[tag=connectfour_check1,limit=1]","objective":"connectfour_cache"}}]
#execute if entity @e[tag=connectfour_register1,tag=_debug] run tellraw @a [{"score":{"name":"@e[tag=connectfour_check2,limit=1]","objective":"connectfour_cache"}}]
#execute if entity @e[tag=connectfour_register1,tag=_debug] run tellraw @a [{"score":{"name":"@e[tag=connectfour_check3,limit=1]","objective":"connectfour_cache"}}]
#execute if entity @e[tag=connectfour_register1,tag=_debug] run tellraw @a [{"score":{"name":"@e[tag=connectfour_check4,limit=1]","objective":"connectfour_cache"}}]
#execute if entity @e[tag=connectfour_register1,tag=_debug] run tellraw @a "-"
