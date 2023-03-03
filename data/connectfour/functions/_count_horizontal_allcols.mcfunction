# Count how many horizontally (and diagonally) connected tiles there are.

# Columns 1-4
tag @e[tag=connectfour_column1,sort=nearest,limit=1] add connectfour_check
tag @e[tag=connectfour_column2,sort=nearest,limit=1] add connectfour_check
tag @e[tag=connectfour_column3,sort=nearest,limit=1] add connectfour_check
tag @e[tag=connectfour_column4,sort=nearest,limit=1] add connectfour_check
tag @e[tag=connectfour_column1,sort=nearest,limit=1] add connectfour_check1
tag @e[tag=connectfour_column2,sort=nearest,limit=1] add connectfour_check2
tag @e[tag=connectfour_column3,sort=nearest,limit=1] add connectfour_check3
tag @e[tag=connectfour_column4,sort=nearest,limit=1] add connectfour_check4
function connectfour:_count_horizontal_allrows
tag @e[tag=connectfour_column1,sort=nearest,limit=1] remove connectfour_check
tag @e[tag=connectfour_column2,sort=nearest,limit=1] remove connectfour_check
tag @e[tag=connectfour_column3,sort=nearest,limit=1] remove connectfour_check
tag @e[tag=connectfour_column4,sort=nearest,limit=1] remove connectfour_check
tag @e[tag=connectfour_column1,sort=nearest,limit=1] remove connectfour_check1
tag @e[tag=connectfour_column2,sort=nearest,limit=1] remove connectfour_check2
tag @e[tag=connectfour_column3,sort=nearest,limit=1] remove connectfour_check3
tag @e[tag=connectfour_column4,sort=nearest,limit=1] remove connectfour_check4

# Columns 2-5
tag @e[tag=connectfour_column2,sort=nearest,limit=1] add connectfour_check
tag @e[tag=connectfour_column3,sort=nearest,limit=1] add connectfour_check
tag @e[tag=connectfour_column4,sort=nearest,limit=1] add connectfour_check
tag @e[tag=connectfour_column5,sort=nearest,limit=1] add connectfour_check
tag @e[tag=connectfour_column2,sort=nearest,limit=1] add connectfour_check1
tag @e[tag=connectfour_column3,sort=nearest,limit=1] add connectfour_check2
tag @e[tag=connectfour_column4,sort=nearest,limit=1] add connectfour_check3
tag @e[tag=connectfour_column5,sort=nearest,limit=1] add connectfour_check4
function connectfour:_count_horizontal_allrows
tag @e[tag=connectfour_column2,sort=nearest,limit=1] remove connectfour_check
tag @e[tag=connectfour_column3,sort=nearest,limit=1] remove connectfour_check
tag @e[tag=connectfour_column4,sort=nearest,limit=1] remove connectfour_check
tag @e[tag=connectfour_column5,sort=nearest,limit=1] remove connectfour_check
tag @e[tag=connectfour_column2,sort=nearest,limit=1] remove connectfour_check1
tag @e[tag=connectfour_column3,sort=nearest,limit=1] remove connectfour_check2
tag @e[tag=connectfour_column4,sort=nearest,limit=1] remove connectfour_check3
tag @e[tag=connectfour_column5,sort=nearest,limit=1] remove connectfour_check4

# Columns 3-6
tag @e[tag=connectfour_column3,sort=nearest,limit=1] add connectfour_check
tag @e[tag=connectfour_column4,sort=nearest,limit=1] add connectfour_check
tag @e[tag=connectfour_column5,sort=nearest,limit=1] add connectfour_check
tag @e[tag=connectfour_column6,sort=nearest,limit=1] add connectfour_check
tag @e[tag=connectfour_column3,sort=nearest,limit=1] add connectfour_check1
tag @e[tag=connectfour_column4,sort=nearest,limit=1] add connectfour_check2
tag @e[tag=connectfour_column5,sort=nearest,limit=1] add connectfour_check3
tag @e[tag=connectfour_column6,sort=nearest,limit=1] add connectfour_check4
function connectfour:_count_horizontal_allrows
tag @e[tag=connectfour_column3,sort=nearest,limit=1] remove connectfour_check
tag @e[tag=connectfour_column4,sort=nearest,limit=1] remove connectfour_check
tag @e[tag=connectfour_column5,sort=nearest,limit=1] remove connectfour_check
tag @e[tag=connectfour_column6,sort=nearest,limit=1] remove connectfour_check
tag @e[tag=connectfour_column3,sort=nearest,limit=1] remove connectfour_check1
tag @e[tag=connectfour_column4,sort=nearest,limit=1] remove connectfour_check2
tag @e[tag=connectfour_column5,sort=nearest,limit=1] remove connectfour_check3
tag @e[tag=connectfour_column6,sort=nearest,limit=1] remove connectfour_check4

# Columns 4-7
tag @e[tag=connectfour_column4,sort=nearest,limit=1] add connectfour_check
tag @e[tag=connectfour_column5,sort=nearest,limit=1] add connectfour_check
tag @e[tag=connectfour_column6,sort=nearest,limit=1] add connectfour_check
tag @e[tag=connectfour_column7,sort=nearest,limit=1] add connectfour_check
tag @e[tag=connectfour_column4,sort=nearest,limit=1] add connectfour_check1
tag @e[tag=connectfour_column5,sort=nearest,limit=1] add connectfour_check2
tag @e[tag=connectfour_column6,sort=nearest,limit=1] add connectfour_check3
tag @e[tag=connectfour_column7,sort=nearest,limit=1] add connectfour_check4
function connectfour:_count_horizontal_allrows
tag @e[tag=connectfour_column4,sort=nearest,limit=1] remove connectfour_check
tag @e[tag=connectfour_column5,sort=nearest,limit=1] remove connectfour_check
tag @e[tag=connectfour_column6,sort=nearest,limit=1] remove connectfour_check
tag @e[tag=connectfour_column7,sort=nearest,limit=1] remove connectfour_check
tag @e[tag=connectfour_column4,sort=nearest,limit=1] remove connectfour_check1
tag @e[tag=connectfour_column5,sort=nearest,limit=1] remove connectfour_check2
tag @e[tag=connectfour_column6,sort=nearest,limit=1] remove connectfour_check3
tag @e[tag=connectfour_column7,sort=nearest,limit=1] remove connectfour_check4
