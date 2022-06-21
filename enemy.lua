Enemy = {}

function Enemy:new(difficulty)
  control = math.random(1, 3)
  if control == 1 then
  	newObj = {
      nameE = "Esqueleto",
      hp = 10+(math.floor(3*(difficulty/2))),
      max_hp = 10+(math.floor(3*(difficulty/2))),
      damage = 1+(math.floor(1*(difficulty/2))),
      defense = 1+(math.floor(1*(difficulty/2))),
      accuracy = 20+(math.floor(5*(difficulty/2))),
      dexterity = 10+(math.floor(5*(difficulty/2))),
      critical = 10+(math.floor(5*(difficulty/2)))
    }
  elseif control == 2 then
    newObj = {
      nameE = "Golem",
      hp = 15+(math.floor(5*(difficulty/2))),
      max_hp = 15+(math.floor(5*(difficulty/2))),
      damage = 1+(math.floor(1*(difficulty/2))),
      defense = 1+(math.floor(1*(difficulty/2))),
      accuracy = 10+(math.floor(5*(difficulty/2))),
      dexterity = 0,
      critical = 0
    }
  else
  	newObj = {
      nameE = "Rato grande",
      hp = 5+(math.floor(5*(difficulty/2))),
      max_hp = 5+(math.floor(1*(difficulty/2))),
      damage = 1+(math.floor(1*(difficulty/2))),
      defense = 0,
      accuracy = 5+(math.floor(5*(difficulty/2))),
      dexterity = 20+(math.floor(5*(difficulty/2))),
      critical = 0
    }
  end
  self.__index = self
  return setmetatable(newObj, self)
end

function Enemy:show(enemy)
	print('Name = ' .. enemy.name)
  print('HP = ' .. enemy.hp)
  print('Max HP = ' .. enemy.max_hp)
  print('damage = ' .. enemy.damage)
  print('defense = ' .. enemy.defense)
  print('accuracy = ' .. enemy.accuracy)
  print('dexterity = ' .. enemy.dexterity)
  print('critical = ' .. enemy.critical)
end

function Enemy:hurt(enemy, hpLoss)
  enemy.hp = enemy.hp - hpLoss
  return enemy
end

return Enemy