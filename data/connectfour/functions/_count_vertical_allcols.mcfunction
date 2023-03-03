# Count how many vertically connected tiles there are.

# Column 1
tag @e[tag=connectfour_column1,sort=nearest,limit=1] add connectfour_check
function connectfour:_count_vertical_allrows
tag @e[tag=connectfour_column1,sort=nearest,limit=1] remove connectfour_check

# Column 2
tag @e[tag=connectfour_column2,sort=nearest,limit=1] add connectfour_check
function connectfour:_count_vertical_allrows
tag @e[tag=connectfour_column2,sort=nearest,limit=1] remove connectfour_check

# Column 3
tag @e[tag=connectfour_column3,sort=nearest,limit=1] add connectfour_check
function connectfour:_count_vertical_allrows
tag @e[tag=connectfour_column3,sort=nearest,limit=1] remove connectfour_check

# Column 4
tag @e[tag=connectfour_column4,sort=nearest,limit=1] add connectfour_check
function connectfour:_count_vertical_allrows
tag @e[tag=connectfour_column4,sort=nearest,limit=1] remove connectfour_check

# Column 5
tag @e[tag=connectfour_column5,sort=nearest,limit=1] add connectfour_check
function connectfour:_count_vertical_allrows
tag @e[tag=connectfour_column5,sort=nearest,limit=1] remove connectfour_check

# Column 6
tag @e[tag=connectfour_column6,sort=nearest,limit=1] add connectfour_check
function connectfour:_count_vertical_allrows
tag @e[tag=connectfour_column6,sort=nearest,limit=1] remove connectfour_check

# Column 7
tag @e[tag=connectfour_column7,sort=nearest,limit=1] add connectfour_check
function connectfour:_count_vertical_allrows
tag @e[tag=connectfour_column7,sort=nearest,limit=1] remove connectfour_check

# Reset
tag @e[tag=connectfour_column,sort=nearest,limit=7] remove connectfour_check
