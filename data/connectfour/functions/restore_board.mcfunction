# Restore the state of the board from the state that is saved in the scoreboard.

execute as @e[tag=connectfour_player1_column,tag=connectfour_column1,sort=nearest,limit=1] run execute at @s run function connectfour:_restore_rows
execute as @e[tag=connectfour_player1_column,tag=connectfour_column2,sort=nearest,limit=1] run execute at @s run function connectfour:_restore_rows
execute as @e[tag=connectfour_player1_column,tag=connectfour_column3,sort=nearest,limit=1] run execute at @s run function connectfour:_restore_rows
execute as @e[tag=connectfour_player1_column,tag=connectfour_column4,sort=nearest,limit=1] run execute at @s run function connectfour:_restore_rows
execute as @e[tag=connectfour_player1_column,tag=connectfour_column5,sort=nearest,limit=1] run execute at @s run function connectfour:_restore_rows
execute as @e[tag=connectfour_player1_column,tag=connectfour_column6,sort=nearest,limit=1] run execute at @s run function connectfour:_restore_rows
execute as @e[tag=connectfour_player1_column,tag=connectfour_column7,sort=nearest,limit=1] run execute at @s run function connectfour:_restore_rows

execute as @e[tag=connectfour_player2_column,tag=connectfour_column1,sort=nearest,limit=1] run execute at @s run function connectfour:_restore_rows
execute as @e[tag=connectfour_player2_column,tag=connectfour_column2,sort=nearest,limit=1] run execute at @s run function connectfour:_restore_rows
execute as @e[tag=connectfour_player2_column,tag=connectfour_column3,sort=nearest,limit=1] run execute at @s run function connectfour:_restore_rows
execute as @e[tag=connectfour_player2_column,tag=connectfour_column4,sort=nearest,limit=1] run execute at @s run function connectfour:_restore_rows
execute as @e[tag=connectfour_player2_column,tag=connectfour_column5,sort=nearest,limit=1] run execute at @s run function connectfour:_restore_rows
execute as @e[tag=connectfour_player2_column,tag=connectfour_column6,sort=nearest,limit=1] run execute at @s run function connectfour:_restore_rows
execute as @e[tag=connectfour_player2_column,tag=connectfour_column7,sort=nearest,limit=1] run execute at @s run function connectfour:_restore_rows

# Reset
function connectfour:_reset_placers
