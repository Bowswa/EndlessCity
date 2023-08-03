function endless_city:rng/range
execute if score out math matches -3 run tp @s ~-3 ~ ~
execute if score out math matches -2 run tp @s ~-2 ~ ~
execute if score out math matches -1 run tp @s ~-1 ~ ~
execute if score out math matches 1 run tp @s ~1 ~ ~
execute if score out math matches 2 run tp @s ~2 ~ ~
execute if score out math matches 3 run tp @s ~3 ~ ~

function endless_city:rng/range
execute if score out math matches -3 at @s run tp @s ~ ~ ~-3
execute if score out math matches -2 at @s run tp @s ~ ~ ~-2
execute if score out math matches -1 at @s run tp @s ~ ~ ~-1
execute if score out math matches 1 at @s run tp @s ~ ~ ~1
execute if score out math matches 2 at @s run tp @s ~ ~ ~2
execute if score out math matches 3 at @s run tp @s ~ ~ ~3