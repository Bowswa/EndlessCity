scoreboard players add @a render_distance 0
scoreboard players add @a rd 0
scoreboard players set @a[scores={render_distance=0}] render_distance 12

execute as @a[scores={city_menu=1}] run tellraw @s [{"text": "Render distance:       ","color": "gold"},{"text": "-4 ","color": "red","clickEvent": {"action": "run_command","value": "/trigger rd set -4"}},{"text": "-2 ","color": "red","clickEvent": {"action": "run_command","value": "/trigger rd set -2"}},{"text": "-1","color": "red","clickEvent": {"action": "run_command","value": "/trigger rd set -1"}},{"text": "  "},{"score": {"name": "@s","objective": "render_distance"},"color": "white","hoverEvent": {"action": "show_text","value": "Configured render distance"}},{"text": "  "},{"text": "+1","color": "green","clickEvent": {"action": "run_command","value": "/trigger rd set 1"}},{"text": " +2","color": "green","clickEvent": {"action": "run_command","value": "/trigger rd set 2"}},{"text": " +4","color": "green","clickEvent": {"action": "run_command","value": "/trigger rd set 4"}}]
scoreboard players set @a[scores={city_menu=1}] city_menu 0

execute as @a unless score @s rd matches 0 run function endless_city:render_mod

scoreboard players enable @a city_menu
scoreboard players enable @a rd

scoreboard objectives add leftGame custom:leave_game
scoreboard players add @a leftGame 0
tellraw @a[scores={leftGame=0}] {"text":"Welcome to the Endless City!","color":"yellow"}
tellraw @a[scores={leftGame=0}] {"text":"Please remember to configure your render distance to avoid lag (/trigger city_menu)","color":"yellow"}
scoreboard players set @a[scores={leftGame=0}] leftGame -1

execute as @e[type=wandering_trader,tag=!endless_city.modified] run function endless_city:traders