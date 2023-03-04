# Place a game tile for the selected player (@s).
# Example command block to call this function:
# execute as @e[tag=connectfour_player1_column,tag=connectfour_column1,sort=nearest,limit=1] run function connectfour:place_tile

# Check if it's this players turn.
execute if entity @s[tag=connectfour_player1_column] unless entity @e[tag=connectfour_state,sort=nearest,limit=1,tag=_player1_turn] run tag @e[tag=connectfour_event,sort=nearest,limit=1] add _player1_notyourturn
execute if entity @s[tag=connectfour_player2_column] unless entity @e[tag=connectfour_state,sort=nearest,limit=1,tag=_player2_turn] run tag @e[tag=connectfour_event,sort=nearest,limit=1] add _player2_notyourturn

# Check if this column is full.
execute if entity @s[tag=connectfour_player1_column] if entity @e[tag=connectfour_state,sort=nearest,limit=1,tag=_player1_turn] unless entity @e[tag=connectfour_column_origin,sort=nearest,limit=1,scores={connectfour_nextrow=..64},distance=..0.5] run tag @e[tag=connectfour_event,sort=nearest,limit=1] add _player1_columnfull
execute if entity @s[tag=connectfour_player2_column] if entity @e[tag=connectfour_state,sort=nearest,limit=1,tag=_player2_turn] unless entity @e[tag=connectfour_column_origin,sort=nearest,limit=1,scores={connectfour_nextrow=..64},distance=..0.5] run tag @e[tag=connectfour_event,sort=nearest,limit=1] add _player2_columnfull

# Place a tile if possible.
execute at @e[tag=connectfour_column_origin,sort=nearest,limit=1] if entity @e[tag=connectfour_column_origin,sort=nearest,limit=1,scores={connectfour_nextrow=..64},distance=..0.5] if entity @s[tag=connectfour_player1_column] if entity @e[tag=connectfour_state,sort=nearest,limit=1,tag=_player1_turn] run function connectfour:_place_tile_player1
execute at @e[tag=connectfour_column_origin,sort=nearest,limit=1] if entity @e[tag=connectfour_column_origin,sort=nearest,limit=1,scores={connectfour_nextrow=..64},distance=..0.5] if entity @s[tag=connectfour_player2_column] if entity @e[tag=connectfour_state,sort=nearest,limit=1,tag=_player2_turn] run function connectfour:_place_tile_player2

# Check if the game is finished.
# Player 1
execute at @e[tag=connectfour_player1_column,tag=connectfour_column1] run function connectfour:count_connected
execute if entity @e[tag=connectfour_register1,scores={connectfour_gamestate=1..}] run tag @e[tag=connectfour_state,sort=nearest,limit=1] add _player1_won
execute if entity @e[tag=connectfour_state,sort=nearest,limit=1,tag=_player1_won] run tag @e[tag=connectfour_event,sort=nearest,limit=1] add _player1_won
# Player 2
execute unless entity @e[tag=connectfour_state,sort=nearest,limit=1,tag=_player1_won] run execute at @e[tag=connectfour_player2_column,tag=connectfour_column1] run function connectfour:count_connected
execute unless entity @e[tag=connectfour_state,sort=nearest,limit=1,tag=_player1_won] if entity @e[tag=connectfour_register1,scores={connectfour_gamestate=1..}] run tag @e[tag=connectfour_state,sort=nearest,limit=1] add _player2_won
execute if entity @e[tag=connectfour_state,sort=nearest,limit=1,tag=_player2_won] run tag @e[tag=connectfour_event,sort=nearest,limit=1] add _player2_won
# Game is done
execute if entity @e[tag=connectfour_state,sort=nearest,limit=1,tag=_player1_won] run tag @e[tag=connectfour_state,sort=nearest,limit=1] add _game_finished
execute if entity @e[tag=connectfour_state,sort=nearest,limit=1,tag=_player2_won] run tag @e[tag=connectfour_state,sort=nearest,limit=1] add _game_finished
execute if entity @e[tag=connectfour_state,sort=nearest,limit=1,tag=_player1_won] run tag @e[tag=connectfour_event,sort=nearest,limit=1] add _game_finished
execute if entity @e[tag=connectfour_state,sort=nearest,limit=1,tag=_player2_won] run tag @e[tag=connectfour_event,sort=nearest,limit=1] add _game_finished
# It's nobody's turn if the game is done
execute if entity @e[tag=connectfour_state,sort=nearest,limit=1,tag=_game_finished] run tag @e[tag=connectfour_event,sort=nearest,limit=1] remove _player1_turn
execute if entity @e[tag=connectfour_state,sort=nearest,limit=1,tag=_game_finished] run tag @e[tag=connectfour_event,sort=nearest,limit=1] remove _player2_turn
