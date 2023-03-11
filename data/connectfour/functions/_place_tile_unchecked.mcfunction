# Place a game tile for the selected player (@s).
# Example command block to call this function:
# execute as @e[tag=connectfour_player1_column,tag=connectfour_column1,sort=nearest,limit=1] run function connectfour:place_tile

# Check if it's this players turn.
execute if entity @s[tag=connectfour_player1_column] run execute as @e[tag=connectfour_state,sort=nearest,limit=1] run execute unless entity @s[tag=_player1_turn] run tag @e[tag=connectfour_event,sort=nearest,limit=1] add _player1_notyourturn
execute if entity @s[tag=connectfour_player2_column] run execute as @e[tag=connectfour_state,sort=nearest,limit=1] run execute unless entity @s[tag=_player2_turn] run tag @e[tag=connectfour_event,sort=nearest,limit=1] add _player2_notyourturn

# Check if this column is full.
execute if entity @s[tag=connectfour_player1_column] run execute as @e[tag=connectfour_state,sort=nearest,limit=1] run execute if entity @s[tag=_player1_turn] run execute as @e[tag=connectfour_column_origin,sort=nearest,limit=1,distance=..0.5] run execute unless entity @s[scores={connectfour_nextrow=..64}] run tag @e[tag=connectfour_event,sort=nearest,limit=1] add _player1_columnfull
execute if entity @s[tag=connectfour_player2_column] run execute as @e[tag=connectfour_state,sort=nearest,limit=1] run execute if entity @s[tag=_player2_turn] run execute as @e[tag=connectfour_column_origin,sort=nearest,limit=1,distance=..0.5] run execute unless entity @s[scores={connectfour_nextrow=..64}] run tag @e[tag=connectfour_event,sort=nearest,limit=1] add _player2_columnfull

# Place a tile if possible.
scoreboard players set @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache 0
scoreboard players set @e[tag=connectfour_register2,sort=nearest,limit=1] connectfour_cache 0
scoreboard players set @e[tag=connectfour_register3,sort=nearest,limit=1] connectfour_cache 0
execute as @e[tag=connectfour_column_origin,sort=nearest,limit=1,distance=..0.5] run execute if entity @s[scores={connectfour_nextrow=..64}] run scoreboard players set @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache 1
execute as @e[tag=connectfour_state,sort=nearest,limit=1] run execute if entity @s[tag=_player1_turn] run scoreboard players set @e[tag=connectfour_register2,sort=nearest,limit=1] connectfour_cache 1
execute as @e[tag=connectfour_state,sort=nearest,limit=1] run execute if entity @s[tag=_player2_turn] run scoreboard players set @e[tag=connectfour_register3,sort=nearest,limit=1] connectfour_cache 1
execute at @e[tag=connectfour_column_origin,sort=nearest,limit=1] if score @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache matches 1 if entity @s[tag=connectfour_player1_column] if score @e[tag=connectfour_register2,sort=nearest,limit=1] connectfour_cache matches 1 run function connectfour:_place_tile_player1
execute at @e[tag=connectfour_column_origin,sort=nearest,limit=1] if score @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache matches 1 if entity @s[tag=connectfour_player2_column] if score @e[tag=connectfour_register3,sort=nearest,limit=1] connectfour_cache matches 1 run function connectfour:_place_tile_player2
scoreboard players set @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache 0
scoreboard players set @e[tag=connectfour_register2,sort=nearest,limit=1] connectfour_cache 0
scoreboard players set @e[tag=connectfour_register3,sort=nearest,limit=1] connectfour_cache 0

# Check if the game is finished.
# Player 1
scoreboard players set @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_gamestate 0
execute at @e[tag=connectfour_player1_middle_column,sort=nearest,limit=1] run function connectfour:count_connected
execute unless score @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_gamestate matches 0 run tag @e[tag=connectfour_state,sort=nearest,limit=1] add _player1_won
execute as @e[tag=connectfour_state,sort=nearest,limit=1] run execute if entity @s[tag=_player1_won] run tag @e[tag=connectfour_event,sort=nearest,limit=1] add _player1_won
scoreboard players set @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache 0
execute as @e[tag=connectfour_state,sort=nearest,limit=1] run execute if entity @s[tag=_player1_won] run scoreboard players set @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache 1
# Player 2
execute if score @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache matches 0 run scoreboard players set @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_gamestate 0
execute if score @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache matches 0 run execute at @e[tag=connectfour_player2_middle_column,sort=nearest,limit=1] run function connectfour:count_connected
execute if score @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_cache matches 0 run execute unless score @e[tag=connectfour_register1,sort=nearest,limit=1] connectfour_gamestate matches 0 run tag @e[tag=connectfour_state,sort=nearest,limit=1] add _player2_won
execute as @e[tag=connectfour_state,sort=nearest,limit=1] run execute if entity @s[tag=_player2_won] run tag @e[tag=connectfour_event,sort=nearest,limit=1] add _player2_won
# Game is done
execute as @e[tag=connectfour_state,sort=nearest,limit=1] run execute if entity @s[tag=_player1_won] run tag @e[tag=connectfour_state,sort=nearest,limit=1] add _game_finished
execute as @e[tag=connectfour_state,sort=nearest,limit=1] run execute if entity @s[tag=_player2_won] run tag @e[tag=connectfour_state,sort=nearest,limit=1] add _game_finished
execute as @e[tag=connectfour_state,sort=nearest,limit=1] run execute if entity @s[tag=_player1_won] run tag @e[tag=connectfour_event,sort=nearest,limit=1] add _game_finished
execute as @e[tag=connectfour_state,sort=nearest,limit=1] run execute if entity @s[tag=_player2_won] run tag @e[tag=connectfour_event,sort=nearest,limit=1] add _game_finished

# Check if no turn can be made.
execute if score @e[tag=connectfour_column_origin,tag=connectfour_column1,sort=nearest,limit=1] connectfour_nextrow matches 128 if score @e[tag=connectfour_column_origin,tag=connectfour_column2,sort=nearest,limit=1] connectfour_nextrow matches 128 if score @e[tag=connectfour_column_origin,tag=connectfour_column3,sort=nearest,limit=1] connectfour_nextrow matches 128 if score @e[tag=connectfour_column_origin,tag=connectfour_column4,sort=nearest,limit=1] connectfour_nextrow matches 128 if score @e[tag=connectfour_column_origin,tag=connectfour_column5,sort=nearest,limit=1] connectfour_nextrow matches 128 if score @e[tag=connectfour_column_origin,tag=connectfour_column6,sort=nearest,limit=1] connectfour_nextrow matches 128 if score @e[tag=connectfour_column_origin,tag=connectfour_column7,sort=nearest,limit=1] connectfour_nextrow matches 128 run tag @e[tag=connectfour_state,sort=nearest,limit=1] add _no_winner_tie
execute as @e[tag=connectfour_state,sort=nearest,limit=1] run execute if entity @s[tag=_no_winner_tie] run tag @e[tag=connectfour_event,sort=nearest,limit=1] add _no_winner_tie
execute as @e[tag=connectfour_state,sort=nearest,limit=1] run execute if entity @s[tag=_no_winner_tie] run tag @e[tag=connectfour_state,sort=nearest,limit=1] add _game_finished
execute as @e[tag=connectfour_state,sort=nearest,limit=1] run execute if entity @s[tag=_no_winner_tie] run tag @e[tag=connectfour_event,sort=nearest,limit=1] add _game_finished

# It's nobody's turn if the game is done
execute as @e[tag=connectfour_state,sort=nearest,limit=1] run execute if entity @s[tag=_game_finished] run tag @e[tag=connectfour_event,sort=nearest,limit=1] remove _player1_turn
execute as @e[tag=connectfour_state,sort=nearest,limit=1] run execute if entity @s[tag=_game_finished] run tag @e[tag=connectfour_event,sort=nearest,limit=1] remove _player2_turn
