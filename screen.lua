Screen = {}
row = 1
col = 1

function playerStats(player, control)
  if control == 3 then
    io.write("👮 ", player.name)
    print()
  elseif control == 4 then
    io.write("🌀 Level: ", player.level)
    print()
  elseif control == 5 then
    io.write("🌀 XP: ", player.xp, "/", player.max_xp)
    print()
  elseif control == 6 then
    io.write("❤️  HP: ", player.hp,"/",player.max_hp)
    print()
  elseif control == 7 then
    io.write("⚔️  Damage: ", player.damage)
    print()

  elseif control == 8 then
    io.write("🛡️  Defense: ", player.defense)
    print()

  elseif control == 9 then
    io.write("❇️  Accuracy: ", player.accuracy)
    io.write(" %")
    print()

  elseif control == 10 then
    io.write("🥾 Dexterity: ", player.dexterity)
    io.write(" %")
    print()

  elseif control == 11 then
    io.write("❌️ Critical: ", player.critical)
    io.write(" %")
    print()
  elseif control == 12 then
    io.write("🧪 Potions: ", player.potion)
    print()
  else
    print()
  end
end

function enemyStats(enemy, control)
  local shift = 30
  if control == 3 then
    io.write("👾 ", enemy.nameE,
      "\027[", control, ";", shift, "H")
  elseif control == 4 then
    io.write("❤️  HP: ", enemy.hp,"/",enemy.max_hp,
      "\027[", control, ";", shift, "H")
  elseif control == 5 then
    io.write("⚔️  Damage: ", enemy.damage, "\027[",
      control, ";", shift, "H")

  elseif control == 6 then
    io.write("🛡️  Defense: ", enemy.defense, "\027[",
      control, ";", shift, "H")

  elseif control == 7 then
    io.write("❇️  Accuracy: ", enemy.accuracy," %",
      "\027[", control, ";", shift, "H")

  elseif control == 8 then
    io.write("🥾 Dexterity: ", enemy.dexterity," %",
      "\027[", control, ";", shift, "H")

  elseif control == 9 then
    io.write("❌️ Critical: ", enemy.critical," %",
      "\027[", control, ";", shift, "H")

  elseif control == 10 then
    io.write("\027[", control, ";", shift, "H")
  elseif control == 11 then
    io.write("\027[", control, ";", shift, "H")
  elseif control == 12 then
    io.write("\027[", control, ";", shift, "H")
  else
    print()
  end
end

function prettyMap(char)
  if char == "X" then
    io.write('\027[', 44, 'm')
    io.write("  ")
  elseif char == "P" then
    io.write('\027[', 47, 'm')
    io.write('\027[', 32, 'm')
    io.write("👮")
  elseif char == " " then
    io.write('\027[', 47, 'm')
    io.write("  ")
  elseif char == "S" then
    io.write('\027[', 47, 'm')
    io.write('\027[', 32, 'm')
    io.write("⛩ ")
  elseif char == "K" then
    io.write('\027[', 47, 'm')
    io.write('\027[', 32, 'm')
    io.write("⛩ ")
  elseif char == "C" then
    io.write('\027[', 47, 'm')
    io.write('\027[', 34, 'm')
    io.write("🧰")
  elseif char == "E" then
    io.write('\027[', 47, 'm')
    io.write('\027[', 31, 'm')
    io.write("⚔ ")
  else
  end
end

function Screen:show(map, player, commands, state, bt)
  
  if state == "mapa" then
    mapeando(map, player, commands)
  elseif state == "batalha" then
    batalha(map, player, commands, bt)
  elseif state == "gameover" then
    mapeando(map, player, commands, bt)
  else
    print ("-------else switch state")
    mapeando(map, player, commands)
  end
end

function showCommands(commands)
  print(commands)
end

function mapeando(map, player, commands)
  height = #map
  if height < 9 then
    height = 9
  end
  io.write("\027[", 5, ";", 1, "H")
  for i = 1, height do
    for j = 1, #map[i] do
      prettyMap(tostring(map[i][j]))
    end
    io.write('\027[', 0, 'm')
    io.write('     ')
    playerStats(player, i)
  end
  showCommands(commands)
end

function batalha(map, player, commands, bt)
  height = 12
  for i = 1, height do
    io.write("\027[", i, ";", 1, "H")
    io.write('\027[', 0, 'm')

    enemyStats(bt.enemy, i)
    playerStats(bt.player, i)
  end
  io.write("\027[", 13, ";", 1, "H")
  showCommands(commands)
end

function showSword(sword, ctl)
  local shift = 30
  if control == 3 then
    io.write("🗡️ ", sword.Sname,
      "\027[", control, ";", shift, "H")
  elseif control == 4 then
    io.write("⚔️  Damage: ", sword.Sdamage,
      "\027[", control, ";", shift, "H")
  elseif control == 5 then
    io.write("❇️  Accuracy: ", sword.Saccuracy," %",
      "\027[", control, ";", shift, "H")
  elseif control == 7 then
    io.write("❌️ Critical: ", sword.Scritical," %",
      "\027[", control, ";", shift, "H")
  elseif control == 8 then
    io.write("\027[", control, ";", shift, "H")
  else
    print()
  end
end

function showArmour(armour, ctl)
  if control == 3 then
    io.write("🗡️ ", armour.Aname)
  elseif control == 4 then
    io.write("⚔️  Damage: ", armour.Amax_hp)
  elseif control == 5 then
    io.write("❇️  Accuracy: ", armour.Adefense)
  elseif control == 7 then
    io.write("❌️ Critical: ", armour.Adexterity," %")
  elseif control == 8 then
    io.write("")
  else
    print()
  end
end

function inventario(player, commands)
  print()
  print()
  print()
  for i = 1, 10 do
    showSword(plr.sword, i)
    showArmour(plr.armour, i)
  end
end

return Screen