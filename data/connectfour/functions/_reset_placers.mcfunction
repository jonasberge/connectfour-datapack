tag @e[tag=connectfour_placer_anchor,sort=nearest,limit=1] add connectfour_placer_anchor_live

execute at @e[tag=connectfour_placer_anchor,sort=nearest,limit=1] run execute positioned ~ ~15 ~ run tp @e[tag=connectfour_placer1,sort=nearest,limit=1] @e[tag=connectfour_placer_anchor_live,sort=nearest,limit=1]
execute at @e[tag=connectfour_placer_anchor,sort=nearest,limit=1] run execute positioned ~ ~15 ~ run tp @e[tag=connectfour_placer2,sort=nearest,limit=1] @e[tag=connectfour_placer_anchor_live,sort=nearest,limit=1]
execute at @e[tag=connectfour_placer_anchor,sort=nearest,limit=1] run execute positioned ~ ~15 ~ run tp @e[tag=connectfour_placer3,sort=nearest,limit=1] @e[tag=connectfour_placer_anchor_live,sort=nearest,limit=1]
execute at @e[tag=connectfour_placer_anchor,sort=nearest,limit=1] run execute positioned ~ ~15 ~ run tp @e[tag=connectfour_placer4,sort=nearest,limit=1] @e[tag=connectfour_placer_anchor_live,sort=nearest,limit=1]

tag @e[tag=connectfour_placer_anchor,sort=nearest,limit=1] remove connectfour_placer_anchor_live
