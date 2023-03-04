# Starts the locally nearest game on this server.
# Setup must have been called before.

# Just in case
function connectfour:_reset_placers

# Scores
scoreboard players set @e[tag=connectfour_column,tag=connectfour_player1_column,sort=nearest,limit=7] connectfour_gamestate 0
scoreboard players set @e[tag=connectfour_column,tag=connectfour_player2_column,sort=nearest,limit=7] connectfour_gamestate 0
# Player 1 columns hold the number (binary digit) that is added to each column on the next player move (any player).
scoreboard players set @e[tag=connectfour_column_origin,sort=nearest,limit=7] connectfour_nextrow 1

# Registers
scoreboard players set @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_gamestate 0
scoreboard players set @e[tag=connectfour_register2,sort=nearest,limit=1] connectfour_gamestate 0
scoreboard players set @e[tag=connectfour_register3,sort=nearest,limit=1] connectfour_gamestate 0
scoreboard players set @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache 0
scoreboard players set @e[tag=connectfour_register2,sort=nearest,limit=1] connectfour_cache 0
scoreboard players set @e[tag=connectfour_register3,sort=nearest,limit=1] connectfour_cache 0

# Player 1 starts the game
tag @e[tag=connectfour_state,sort=nearest,limit=1] add _player1_turn
tag @e[tag=connectfour_event,sort=nearest,limit=1] add _player1_turn

tag @e[tag=connectfour_state,sort=nearest,limit=1] add _game_active
