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

function showSword(sword, control)
  local shift = 30
  if control == 3 then
    io.write("\027[", control, ";", 1, "H")
    io.write("🗡️  ", sword.Sname,
      "\027[", control, ";", shift, "H")
  elseif control == 4 then
    io.write("⚔️  Damage: ", sword.Sdamage,
      "\027[", control, ";", shift, "H")
  elseif control == 5 then
    io.write("❇️  Accuracy: ", sword.Saccuracy," %",
      "\027[", control, ";", shift, "H")
  elseif control == 6 then
    io.write("❌️ Critical: ", sword.Scritical," %",
      "\027[", control, ";", shift, "H")
  elseif control == 7 then
    io.write("\027[", control, ";", shift, "H")
  else
    print()
  end
end

function showArmour(armour, control)
  if control == 3 then
    io.write("👘  ", armour.Aname,"\n")
  elseif control == 4 then
    io.write("❤️  Hp: ", armour.Amax_hp,"\n")
  elseif control == 5 then
    io.write("🛡️  Defence: ", armour.Adefense,"\n")
  elseif control == 6 then
    io.write("🥾 Dexterity: ", armour.Adexterity," %","\n")
  elseif control == 7 then
    io.write("\n")
  else
    print()
  end
end

function inventario(player, commands)
  print("👜  Inventario")
  print()
  for i = 1, 7 do
    showSword(plr.sword, i)
    showArmour(plr.armour, i)
  end
  io.write("\027[", 9, ";", 1, "H")
  showCommands(commands)
end

function showNewSword(plr, sword, commands)
  local shift = 30
  for control = 1, 7 do
    if control == 3 then
      io.write("\027[", control, ";", 1, "H")
      io.write("Nova Espada -> ",
        "\027[", control, ";", shift, "H")
      io.write("Sua espada -> \n")
    elseif control == 4 then
      io.write("\027[", control, ";", 1, "H")
      io.write("🗡️  ", sword.Sname,
        "\027[", control, ";", shift, "H")
      io.write("🗡️  ", plr.sword.Sname, "\n")
    elseif control == 5 then
      io.write("⚔️  Damage: ", sword.Sdamage,
        "\027[", control, ";", shift, "H")
      io.write("⚔️  Damage: ", plr.sword.Sdamage, "\n")
    elseif control == 6 then
      io.write("❇️  Accuracy: ", sword.Saccuracy," %",
        "\027[", control, ";", shift, "H")
      io.write("❇️  Accuracy: ", plr.sword.Saccuracy," % \n")
    elseif control == 7 then
      io.write("❌️ Critical: ", sword.Scritical," %",
        "\027[", control, ";", shift, "H")
      io.write("❌️ Critical: ", plr.sword.Scritical," % \n")
    else
      print()
    end
  end
  io.write("\027[", 9, ";", 1, "H")
  showCommands(commands)
end

function showNewArmour(plr, armour, commands)
  local shift = 30
  for control = 1, 7 do
    if control == 3 then
      io.write("\027[", control, ";", 1, "H")
      io.write("Nova Armadura -> ",
        "\027[", control, ";", shift, "H")
      io.write("Sua Armadura -> \n")
    elseif control == 4 then
      io.write("👘  ", armour.Aname,
        "\027[", control, ";", shift, "H")
      io.write("👘  ", plr.armour.Aname,"\n")
    elseif control == 5 then
      io.write("❤️  Hp: ", armour.Amax_hp,
        "\027[", control, ";", shift, "H")
      io.write("❤️  Hp: ", plr.armour.Amax_hp,"\n")
    elseif control == 6 then
      io.write("🛡️  Defence: ", armour.Adefense,
        "\027[", control, ";", shift, "H")
      io.write("🛡️  Defence: ", plr.armour.Adefense,"\n")
    elseif control == 7 then
      io.write("🥾 Dexterity: ", armour.Adexterity," %",
        "\027[", control, ";", shift, "H")
      io.write("🥾 Dexterity: ", plr.armour.Adexterity," %","\n")
    else
      print()
    end
  end
  io.write("\027[", 9, ";", 1, "H")
  showCommands(commands)
end

function Screen:show(map, player, commands, state, bt, armour, sword)
  -- padroes
  bt = bt or {}
  sword = sword or {}
  armour = armour or {}
  -- decisao de tela
  if state == "mapa" then
    mapeando(map, player, commands)
  elseif state == "batalha" then
    batalha(map, player, commands, bt)
  elseif state == "gameover" then
    mapeando(map, player, commands, bt)
  elseif state == "inventario" then 
    inventario(player, commands)
  elseif state == "newArmour" then
    showNewArmour(player, armour, commands)
  elseif state == "newSword" then
    showNewSword(player, sword, commands)
  else
    print ("-------else switch state")
    mapeando(map, player, commands)
  end
end

return Screen