# Count connected horizontal (and diagonal) rows
# for all rows of the 4 selected columns.
# Select columns by adding the tag connectfour_check to and.
# Also add the tags connectfour_check1 through connectfour_check4
# to define the order of the columns.
# This is necessary for properly checking connections diagonally.

# Row 1
scoreboard players set @e[tag=connectfour_register1] connectfour_cache 1
scoreboard players set @e[tag=connectfour_register3] connectfour_cache 0
function connectfour:_count_horizontal_diagonal

# Row 2
scoreboard players set @e[tag=connectfour_register1] connectfour_cache 2
scoreboard players set @e[tag=connectfour_register3] connectfour_cache 1
function connectfour:_count_horizontal_diagonal

# Row 3
scoreboard players set @e[tag=connectfour_register1] connectfour_cache 4
scoreboard players set @e[tag=connectfour_register3] connectfour_cache 2
function connectfour:_count_horizontal_diagonal

# Row 4
scoreboard players set @e[tag=connectfour_register1] connectfour_cache 8
scoreboard players set @e[tag=connectfour_register3] connectfour_cache 3
function connectfour:_count_horizontal_diagonal

# Row 5
scoreboard players set @e[tag=connectfour_register1] connectfour_cache 16
scoreboard players set @e[tag=connectfour_register3] connectfour_cache 4
function connectfour:_count_horizontal_diagonal

# Row 6
scoreboard players set @e[tag=connectfour_register1] connectfour_cache 32
scoreboard players set @e[tag=connectfour_register3] connectfour_cache 5
function connectfour:_count_horizontal_diagonal

# Row 7
scoreboard players set @e[tag=connectfour_register1] connectfour_cache 64
scoreboard players set @e[tag=connectfour_register3] connectfour_cache 6
function connectfour:_count_horizontal_diagonal

# Reset
scoreboard players set @e[tag=connectfour_register1] connectfour_cache 0
scoreboard players set @e[tag=connectfour_register3] connectfour_cache 0
