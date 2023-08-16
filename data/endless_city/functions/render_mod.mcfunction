scoreboard players operation @s render_distance += @s rd
scoreboard players operation @s render_distance > #2 rd
scoreboard players operation @s render_distance < #32 rd

scoreboard players set @s rd 0
scoreboard players enable @s rd
tellraw @s [{"text": "Render distance:       ","color": "gold"},{"text": "-4 ","color": "red","clickEvent": {"action": "run_command","value": "/trigger rd set -4"}},{"text": "-2 ","color": "red","clickEvent": {"action": "run_command","value": "/trigger rd set -2"}},{"text": "-1","color": "red","clickEvent": {"action": "run_command","value": "/trigger rd set -1"}},{"text": "  "},{"score": {"name": "@s","objective": "render_distance"},"color": "white","hoverEvent": {"action": "show_text","value": "Configured render distance"}},{"text": "  "},{"text": "+1","color": "green","clickEvent": {"action": "run_command","value": "/trigger rd set 1"}},{"text": " +2","color": "green","clickEvent": {"action": "run_command","value": "/trigger rd set 2"}},{"text": " +4","color": "green","clickEvent": {"action": "run_command","value": "/trigger rd set 4"}}]