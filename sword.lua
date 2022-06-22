Sword = {}

function Sword:new(difficulty, control)
  ctl = control or math.random(2, 10)
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
      Saccuracy = 20 + (difficulty*5),
      Scritical = 30 + (difficulty*5)
    }
  elseif ctl == 3 then
  	SnewObj = {
      Sname = "Espada Reta",
      Sdamage = 3 + difficulty,
      Saccuracy = 20 + (difficulty*5),
      Scritical = 10 + (difficulty*5)
    }
  elseif ctl == 4 then
    SnewObj = {
      Sname = "Besta",
      Sdamage = 3 + difficulty,
      Saccuracy = 10 + (difficulty*5),
      Scritical = 30 + (difficulty*5)
    }
  elseif ctl == 5 then
    SnewObj = {
      Sname = "Rapieira",
      Sdamage = 2 + difficulty,
      Saccuracy = 20 + (difficulty*5),
      Scritical = 10 + (difficulty*5)
    }
  elseif ctl == 6 then
    SnewObj = {
      Sname = "Tocha de Batalha",
      Sdamage = 1 + difficulty,
      Saccuracy = 20 + (difficulty*5),
      Scritical = 40 + (difficulty*5)
    }
  elseif ctl == 7 then
    SnewObj = {
      Sname = "Katana",
      Sdamage = 3 + difficulty,
      Saccuracy = 20 + (difficulty*5),
      Scritical = 30 + (difficulty*5)
    }
  elseif ctl == 8 then
    SnewObj = {
      Sname = "Pique",
      Sdamage = 2 + difficulty,
      Saccuracy = 30 + (difficulty*5),
      Scritical = 20 + (difficulty*5)
    }
  elseif ctl == 9 then
    SnewObj = {
      Sname = "Clava",
      Sdamage = 2 + difficulty,
      Saccuracy = 20 + (difficulty*5),
      Scritical = 20 + (difficulty*5)
    }
  elseif ctl == 10 then
    SnewObj = {
      Sname = "Arco Longo",
      Sdamage = 4 + difficulty,
      Saccuracy = 40 + (difficulty*5),
      Scritical = 10 + (difficulty*5)
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