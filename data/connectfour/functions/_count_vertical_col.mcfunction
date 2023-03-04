# Check if the selected column contains all binary digits,
# starting from the digit stored in the objective "connectfour_cache"
# for the entity "@e[tag=connectfour_register1]"
# up until the digit that is the result of multiplying it by 8.
#
# Example: The stored digit is 2, then this function will check
# if the column contains the digits 2, 4, 8 and 16,
# which would signify vertically connected tiles in row 2, 3, 4 and 5.
#
# "connectfour_register2" has a score of 1 if this is successful.

function connectfour:_copy_gamestate_to_cache

scoreboard players operation @e[tag=connectfour_check,sort=nearest,limit=1] connectfour_cache /= @e[tag=connectfour_register1] connectfour_cache
scoreboard players set @e[tag=connectfour_register2] connectfour_cache 16
scoreboard players operation @e[tag=connectfour_check,sort=nearest,limit=1] connectfour_cache %= @e[tag=connectfour_register2] connectfour_cache
scoreboard players remove @e[tag=connectfour_register2] connectfour_cache 1
execute if score @e[tag=connectfour_check,sort=nearest,limit=1] connectfour_cache = @e[tag=connectfour_register2,limit=1] connectfour_cache run tag @e[tag=connectfour_register2] add connectfour_success_vertical
execute if entity @e[tag=connectfour_register2,tag=connectfour_success_vertical] run scoreboard players add @e[tag=connectfour_register1] connectfour_gamestate 1
execute if entity @e[tag=connectfour_register2,tag=connectfour_success_vertical] run scoreboard players set @e[tag=connectfour_register2] connectfour_cache 1

# Reset
tag @e[tag=connectfour_register2] remove connectfour_success_vertical
