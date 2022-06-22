Player = {}
--atributos base
hp = 30
max_hp = 30
damage = 1
defense = 1
accuracy = 1
dexterity = 1
critical = 1
potion = 0

function Player:new(nome)
  nome = nome or "nome"
	newObj = {
    name = nome,
    hp = 30,
    max_hp = 30,
    damage = 1,
    defense = 1,
    accuracy = 10,
    dexterity = 0,
    critical = 0,
    potion = 0,
    level = 1,
    xp = 0,
    max_xp = 20,
    sword = {},
    armour = {}
  }
  self.__index = self
  return setmetatable(newObj, self)
end

function Player:show(player)
	print('Name = ', player.name)
  print('HP = ', player.hp)
  print('Max HP = ', player.max_hp)
  print('damage = ', player.damage)
  print('defense = ', player.defense)
  print('accuracy = ', player.accuracy)
  print('dexterity = ', player.dexterity)
  print('critical = ', player.critical)
end

function Player:hurt(player, hpLoss)
  player.hp = player.hp - hpLoss
  return player
end

function Player:usePot(player) -- usar pot ganha "potHeal" vida
  potHeal = 20

  if player.potion > 0 then
    player.hp = player.hp + potHeal
    if player.max_hp < player.hp then
      player.hp = player.max_hp
    end
    player.potion = player.potion - 1
  else
    print("Sem pocao para usar")
  end
  return player
end

function Player:addStat(player) -- abrindo bau ganha 1 stat random
  control = math.random(1, 6)
  curaBau = 5

  if control == 1 then -- HP increase
    io.write("HP maximo incrementado e ",curaBau," vida restaurada!\n")
    player.max_hp = player.max_hp + 10
    if player.hp+curaBau < player.max_hp then
      player.hp = player.hp +curaBau
    else
      player.hp = player.max_hp
    end
    return player

  elseif control == 2 then -- Damage increase
    io.write("Dano incrementado e ",curaBau," vida restaurada!\n")
    player.damage = player.damage + 1
    if player.hp+curaBau < player.max_hp then
      player.hp = player.hp +curaBau
    else
      player.hp = player.max_hp
    end
    return player

  elseif control == 3 then -- Defense increase
    io.write("Defesa incrementada e ",curaBau," vida restaurada!\n")
    player.defense = player.defense + 1
    if player.hp+curaBau < player.max_hp then
      player.hp = player.hp +curaBau
    else
      player.hp = player.max_hp
    end
    return player

  elseif control == 4 then -- Accuracy increase
    io.write("Precisao incrementada e ",curaBau," vida restaurada!\n")
    player.accuracy = player.accuracy + 5
    if player.hp+curaBau < player.max_hp then
      player.hp = player.hp +curaBau
    else
      player.hp = player.max_hp
    end
    return player

  elseif control == 5 then -- Dexterity increase
    io.write("Destreza incrementada e ",curaBau," vida restaurada!\n")
    player.dexterity = player.dexterity + 5
    if player.hp+curaBau < player.max_hp then
      player.hp = player.hp +curaBau
    else
      player.hp = player.max_hp
    end
    return player

  elseif control == 6 then -- Critical increase
    io.write("Chance critica incrementado e ",curaBau," vida restaurada!\n")
    player.critical = player.critical + 5
    if player.hp+curaBau < player.max_hp then
      player.hp = player.hp +curaBau
    else
      player.hp = player.max_hp
    end
    return player
  else
    io.write("Nada acontece!\n")
  end
end

function Player:desequiparSword(plr)
  -- Atualiza os atributos espada
  plr.damage = plr.damage - plr.sword.Sdamage
  plr.accuracy = plr.accuracy - plr.sword.Saccuracy
  plr.critical = plr.critical - plr.sword.Scritical
  return plr
end

function Player:desequiparArmour(plr)
  -- Atualiza os atributos espada
  plr.max_hp = plr.max_hp - plr.armour.Amax_hp
  plr.defense = plr.defense - plr.armour.Adefense
  plr.dexterity = plr.dexterity - plr.armour.Adexterity
  return plr
end

function Player:equiparSword(plr)
  -- Atualiza os atributos espada
  plr.damage = plr.damage + plr.sword.Sdamage
  plr.accuracy = plr.accuracy + plr.sword.Saccuracy
  plr.critical = plr.critical + plr.sword.Scritical
  return plr
end

function Player:equiparArmour(plr)
  -- Atualiza os atributos armadura
  plr.max_hp = plr.max_hp + plr.armour.Amax_hp
  plr.defense = plr.defense + plr.armour.Adefense
  plr.dexterity = plr.dexterity + plr.armour.Adexterity
  return plr
end

return Player