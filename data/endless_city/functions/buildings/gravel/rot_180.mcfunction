scoreboard players set in math 1
scoreboard players set in1 math 5
function endless_city:rng/range

execute if score out math matches 1..4 run place template endless_city:buildings/gravel_pillar ^1 ^-1 ^1 180

execute unless score out math matches 5 positioned ~ ~5 ~ run function endless_city:buildings/gravel/rot_180