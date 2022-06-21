Armour = {}

function Armour:new(difficulty, control)
  ctl = control or math.random(1, 4)
  if ctl == 1 then
  	AnewObj = {
      Aname = "Trapos",
      Amax_hp = 5,
      Adefense = 0,
      Adexterity = 10

    }
  elseif ctl == 2 then
    AnewObj = {
      Aname = "Armadura de Couro",
      Amax_hp = 5 + (3*difficulty),
      Adefense = 2 + difficulty,
      Adexterity = 5 + (math.min((5*difficulty), 60))
    }
  elseif ctl == 3 then
  	AnewObj = {
      Aname = "Vestes de Tecido",
      Amax_hp = 5 + (2*difficulty),
      Adefense = 0 + difficulty,
      Adexterity = 10 + (math.min((5*difficulty), 80))
    }
  elseif ctl == 4 then
  	AnewObj = {
      Aname = "Armadura de Placa",
      Amax_hp = 10 + (5*difficulty),
      Adefense = 3 + difficulty,
      Adexterity = 0
    }
  else
    AnewObj = {
      Aname = "Armadura de Placa",
      Amax_hp = 10 + (5*difficulty),
      Adefense = 3 + difficulty,
      Adexterity = 0
    }
  end
  self.__index = self
  return setmetatable(AnewObj, self)
end

function Armour:show(armour)
	print('Name = ' .. armour.Aname)
  print('Max HP = ' .. armour.Amax_hp)
  print('defense = ' .. armour.Adefense)
  print('dexterity = ' .. armour.Adexterity)
end

return Armour