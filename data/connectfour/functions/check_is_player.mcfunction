# Checks if the tagged players are actual players
# of the game that is nearest to them.
# To add a player to this check, tag them with `connectfour_check_is_player`.
# Any player that does not have this tag anymore
# after this function returns, is not a player of that game.
# They can e.g. be safely teleported away.

tag @e[type=player,tag=connectfour_check_is_player] add _to_check
execute if entity @e[type=player,tag=connectfour_check_is_player,tag=_to_check] run function connectfour:_check_is_player_internal
