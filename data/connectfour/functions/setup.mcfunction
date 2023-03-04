scoreboard objectives add connectfour_gamestate dummy
scoreboard objectives add connectfour_cache dummy
scoreboard objectives add connectfour_nextrow dummy
scoreboard players set @e[tag=connectfour_column,tag=connectfour_player1_column,sort=nearest,limit=7] connectfour_gamestate 0
scoreboard players set @e[tag=connectfour_column,tag=connectfour_player2_column,sort=nearest,limit=7] connectfour_gamestate 0
# Player 1 columns hold the number (binary digit) that is added to each column on the next player move (any player).
scoreboard players set @e[tag=connectfour_column_origin,sort=nearest,limit=7] connectfour_nextrow 1
function connectfour:_remove_tags
