# Stops the locally nearest game on this server.
# Teardown is not necessary to stop a game.

function connectfour:_remove_tags
function connectfour:_reset_placers

tag @e[tag=connectfour_state,sort=nearest,limit=1] remove _game_active
