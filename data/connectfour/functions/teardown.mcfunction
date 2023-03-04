# Only call teardown if all Connect Four games should be stopped (obviously)!
# Tears down the game for the entire server.

scoreboard objectives remove connectfour_gamestate
scoreboard objectives remove connectfour_cache
scoreboard objectives remove connectfour_nextrow
