local Enemy = require('enemy')

Batalha = {}

function Batalha:new(plr, difficulty)
  enm = Enemy:new(difficulty)
	newObj = {
    player = plr,
    enemy = enm,
    turnNum = 1,
    turn = "Player"
  }
  self.__index = self
  return setmetatable(newObj, self)
end

function Batalha:plrToEnm(bt)
  -- jogador ataca o inimigo
  dmg = math.max(bt.player.damage - bt.enemy.defense, 1)
  -- CHANCE CRIT MAXIMA == 60
  if math.min(math.random(1, 100),60) < bt.player.critical then
    dmg = dmg*2
  end
  if math.min(math.random(1, 100),60) < (bt.player.accuracy -     bt.enemy.dexterity) then
    os.execute("clear")
    io.write("Errei o inimigo!\n")
    -- vez do inimigo
    bt = bt:enmToPlr(bt)
    return bt
  else
    os.execute("clear")
    io.write("Ataquei o monstro","e causei ", dmg, " de dano!\n")
    bt.enemy = bt.enemy:hurt(bt.enemy, dmg)
    bt.turnNum = bt.turnNum + 1
    bt.turn = "Enemy"
  end
  -- inimigo ataca em seguida
  bt = bt:enmToPlr(bt)
  return bt
end

function Batalha:enmToPlr(bt)
  dmg = math.max(bt.enemy.damage - bt.player.defense, 1)
  -- CHANCE CRIT MAXIMA == 60
  if math.min(math.random(1, 100),60) < bt.enemy.critical then
    dmg = dmg*2
  end
  if math.min(math.random(1, 100),60) < (math.max(bt.enemy.accuracy -     bt.player.dexterity, 1)) then
    io.write("O inimigo errou!\n")
    return bt
  else
    io.write("O monstro contra-atacou e causou ", dmg, " de dano!\n")
    bt.player = bt.player:hurt(bt.player, dmg)
    bt.turnNum = bt.turnNum + 1
    bt.turn = "Player"
  end
  return bt
end

function Batalha:flee(bt)
  fleeChance = math.min((bt.player.dexterity), 100)
  if math.random(1, 100) > fleeChance then
    return "falhou"
  else
    return "fugiu"
  end
end

return Batalha