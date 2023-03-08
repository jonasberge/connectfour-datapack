# Box for the armor stands
fill ~ ~-13 ~3 ~ ~-15 ~-3 glass

# Origin for spawning the other armor stands
# 4 down (board height)
# 10 down (fixed buffer)
# 2 down (column armor stands are 1 above the center instead of below)
# 0.5 up (summon in the center of the block)
# = -4-10-2+0.5 = -15.5
summon armor_stand ~ ~-15.5 ~ {Tags:["connectfour_board_origin","connectfour_board_origin_live"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}

execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~ ~ {"Tags":["connectfour_register","connectfour_register1"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~ ~ {"Tags":["connectfour_register","connectfour_register2"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~ ~ {"Tags":["connectfour_register","connectfour_register3"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}

execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~ ~ {"Tags":["connectfour_state"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~ ~ {"Tags":["connectfour_event"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}

execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~ ~ {"Tags":["connectfour_placer_anchor"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~ ~ {"Tags":["connectfour_placer","connectfour_placer1"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~ ~ {"Tags":["connectfour_placer","connectfour_placer2"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~ ~ {"Tags":["connectfour_placer","connectfour_placer3"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~ ~ {"Tags":["connectfour_placer","connectfour_placer4"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}

execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~1 ~-3 {"Tags":["connectfour_column","connectfour_column1","connectfour_player1_column","connectfour_column_origin"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~1 ~-2 {"Tags":["connectfour_column","connectfour_column2","connectfour_player1_column","connectfour_column_origin"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~1 ~-1 {"Tags":["connectfour_column","connectfour_column3","connectfour_player1_column","connectfour_column_origin"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~1 ~0 {"Tags":["connectfour_column","connectfour_column4","connectfour_player1_column","connectfour_player1_middle_column","connectfour_column_origin"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~1 ~1 {"Tags":["connectfour_column","connectfour_column5","connectfour_player1_column","connectfour_column_origin"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~1 ~2 {"Tags":["connectfour_column","connectfour_column6","connectfour_player1_column","connectfour_column_origin"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~1 ~3 {"Tags":["connectfour_column","connectfour_column7","connectfour_player1_column","connectfour_column_origin"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}

execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~1.25 ~-3 {"Tags":["connectfour_column","connectfour_column1","connectfour_player2_column"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~1.25 ~-2 {"Tags":["connectfour_column","connectfour_column2","connectfour_player2_column"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~1.25 ~-1 {"Tags":["connectfour_column","connectfour_column3","connectfour_player2_column"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~1.25 ~0 {"Tags":["connectfour_column","connectfour_column4","connectfour_player2_column","connectfour_player2_middle_column"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~1.25 ~1 {"Tags":["connectfour_column","connectfour_column5","connectfour_player2_column"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~1.25 ~2 {"Tags":["connectfour_column","connectfour_column6","connectfour_player2_column"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}
execute at @e[tag=connectfour_board_origin_live,sort=nearest,limit=1] run summon minecraft:armor_stand ~ ~1.25 ~3 {"Tags":["connectfour_column","connectfour_column7","connectfour_player2_column"],NoGravity:1b,Invulnerable:1b,NoBasePlate:1b,Small:1b,PersistenceRequired:1b}

tag @e[tag=connectfour_board_origin_live] remove connectfour_board_origin_live
