# Check if the 4 selected columns are filled with the same binary digit
# stored in "connectfour_cache" for entity "@e[tag=connectfour_register1]".
# The columns must be selected by tagging exactly 4 columns
# with the tag "connectfour_check".
# The current game state must have been copied to the cache
# before calling this function.
#
# Algorithm:
# 1. Divide each column by the selected digit
# 2. Modulo the result by 2
# 3. If the result of that is 1, the digit was set
#
# "connectfour_register2" has a score of 1 if this is successful.

# Divide by the selected digit
scoreboard players operation @e[tag=connectfour_check,limit=4] connectfour_cache /= @e[tag=connectfour_register1] connectfour_cache
# Modulo 2
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 2
scoreboard players operation @e[tag=connectfour_check,limit=4] connectfour_cache %= @e[tag=connectfour_register2] connectfour_cache
# If the sum of all results is 4, then all digits were set
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 0
scoreboard players operation @e[tag=connectfour_register2] connectfour_cache += @e[tag=connectfour_check,limit=4] connectfour_cache
execute if score @e[tag=connectfour_register2,limit=1] connectfour_cache matches 4 run tag @e[tag=connectfour_register2] add connectfour_success_vertical

execute if entity @e[tag=connectfour_register2,tag=connectfour_success_vertical] run scoreboard players add @e[tag=connectfour_register1] connectfour_gamestate 1

# Return value
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 0
execute if entity @e[tag=connectfour_register2,tag=connectfour_success_vertical] run scoreboard players set @e[tag=connectfour_register2] connectfour_cache 1

# Reset
tag @e[tag=connectfour_register2] remove connectfour_success_vertical
