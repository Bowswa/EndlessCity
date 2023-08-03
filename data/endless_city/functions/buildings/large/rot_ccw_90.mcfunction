scoreboard players set in math 1
scoreboard players set in1 math 16
function endless_city:rng/range

execute if score out math matches 1..2 run place template endless_city:buildings/coal/tower_f1 ^5 ^-1 ^5 counterclockwise_90
execute if score out math matches 3..4 run place template endless_city:buildings/coal/tower_f2 ^5 ^-1 ^5 counterclockwise_90
execute if score out math matches 5..6 run place template endless_city:buildings/coal/tower_f3 ^5 ^-1 ^5 counterclockwise_90
execute if score out math matches 7..8 run place template endless_city:buildings/coal/tower_f4 ^5 ^-1 ^5 counterclockwise_90
execute if score out math matches 9..10 run place template endless_city:buildings/coal/tower_f5 ^5 ^-1 ^5 counterclockwise_90
execute if score out math matches 11..12 run place template endless_city:buildings/coal/tower_f6 ^5 ^-1 ^5 counterclockwise_90
execute if score out math matches 13..14 run place template endless_city:buildings/coal/tower_f7 ^5 ^-1 ^5 counterclockwise_90
execute if score out math matches 15..16 run place template endless_city:buildings/coal/tower_top ^5 ^-1 ^5 counterclockwise_90

execute unless score out math matches 15..16 positioned ~ ~5 ~ run function endless_city:buildings/large/rot_ccw_90