Sword = {}

function Sword:new(difficulty, control)
  ctl = control or math.random(1, 5)
  if ctl == 1 then
  	SnewObj = {
      Sname = "Graveto",
      Sdamage = 1,
      Saccuracy = 20,
      Scritical = 0
    }
  elseif ctl == 2 then
    SnewObj = {
      Sname = "Adaga",
      Sdamage = 1 + difficulty,
      Saccuracy = 20 + (difficulty*2),
      Scritical = 30 + (difficulty*2)
    }
  elseif ctl == 3 then
  	SnewObj = {
      Sname = "Espada Reta",
      Sdamage = 3 + difficulty,
      Saccuracy = 20 + (difficulty*2),
      Scritical = 10 + (difficulty*2)
    }
  elseif ctl == 4 then
    SnewObj = {
      Sname = "Besta",
      Sdamage = 3 + difficulty,
      Saccuracy = 10 + (difficulty*2),
      Scritical = 30 + (difficulty*2)
    }
  elseif ctl == 5 then
    SnewObj = {
      Sname = "Rapieira",
      Sdamage = 2 + difficulty,
      Saccuracy = 20 + (difficulty*2),
      Scritical = 10 + (difficulty*2)
    }
  else
    SnewObj = {
      Sname = "Rapieira",
      Sdamage = 2 + difficulty,
      Saccuracy = 20 + (difficulty*2),
      Scritical = 10 + (difficulty*2)
    }
  end
  self.__index = self
  return setmetatable(SnewObj, self)
end

function Sword:show(sword)
	print('Arma = ' .. sword.Sname)
  print('Damage = ' .. sword.Sdamage)
  print('Accuracy = ' .. sword.Saccuracy)
  print('Critical = ' .. sword.Scritical)
end

return Sword