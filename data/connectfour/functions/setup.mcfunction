# Set up the game for the entire server.

scoreboard objectives add connectfour_gamestate dummy
scoreboard objectives add connectfour_cache dummy
scoreboard objectives add connectfour_nextrow dummy

# Just in case
function connectfour:_remove_tags
