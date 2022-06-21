local Map = require('map')
local Player = require('player')
local Screen = require('screen')
local Batalha = require('batalha')
local Sword = require('sword')
local Armour = require('armour')

commandsMap = [[

  Controles
  W: para cima
  s: para baixo
  d: para direita
  a: para esquerda
  i: inventario
]]

commandsBat = [[

  Controles
  a: Atacar
  f: Fugir (Chance de falhar)
  p: Pocao (+20 HP)
]]

--vars glob
difficulty = 1
state = "mapa"
map = {}
mapW = 6 -- largura
mapH = 6 -- proundidade
playerPos = {x = 2, y = 2} -- pos inicial

function start()
  os.execute("clear")
  -- batalha
  bt = {}
  difficulty = 1
  -- Player
  playerPos = {x = 2, y = 2}
  plr = Player:new("Jhon") -- nome
  
  plr.sword = Sword:new(difficulty, 1)
  plr.armour = Armour:new(difficulty, 1)
  plr = Player:equiparSword(plr)
  plr = Player:equiparArmour(plr)
  plr.hp = plr.max_hp -- compensar pela armadura
  -- Mapa
  map = make_maze(map, mapW, mapH, playerPos)
  -- estado inicial
  state = "mapa"
  -- screen start
  os.execute("clear") -- limpa tela
  Screen:show(map, plr, commandsMap, state, bt)
end

function resetMap(map)
  map = {}
  map = make_maze(map, mapW+2, mapH+2, playerPos)
  return map
end

-- script inicial
start()

-- LOGICA DO JOGO
-- ler input
function lerInput(map, playerPos, difficulty, state)
  
  return playerPos
end
-- tentar andar
function tryWalk(x, y, map)
  if map[x][y] == "X" then
    os.execute("clear")
    state = "mapa"
    return 0

  elseif map[x][y] == " " then
    os.execute("clear")
    state = "mapa"
    print()
    return 1

  elseif map[x][y] == "E" then
    os.execute("clear")
    state = "batalha"
    return 2

  elseif map[x][y] == "C" then
    os.execute("clear")
    print("Encontrou bau!")
    state = "mapa"
    print()
    return 3

  elseif map[x][y] == "K" then
    os.execute("clear")
    print("Fase Concluida!")
    state = "mapa"
    print()
    return 4

  else
    os.execute("clear")
    print("Tente novamente")
    print()
  end
end

function levelCheck()
  if plr.xp >= plr.max_xp then
    plr.xp = 0 -- reseta xp
    plr.level = plr.level + 1 -- lvl ++
    plr.max_xp = plr.max_xp + (plr.level*10) -- equacao de xp max
    print("Level up! um atributo foi incrementado!")
    plr = Player:addStat(plr)
  else
  end
end


function batalhar()
  -- cria batalha
  bt = Batalha:new(plr, difficulty)
  Screen:show(map, plr, commandsBat, state, bt)

  while state == "batalha" do
    local line = io.read()
    if line == "a" then
      -- ATACAR
      bt = Batalha:plrToEnm(bt)
      if bt.player.hp < 1 then
        -- Recomeca
        os.execute("clear")
        state = "gameover"  -- GAME OVER
        return state
      end
      if bt.enemy.hp < 1 then
        -- POS BATALHA
        state = "mapa"
        os.execute("clear")
        print("Batalha vencida! +20 xp")
        plr = bt.player
        plr.xp = plr.xp + 20
        levelCheck()
        break
      end
    elseif line == "f" then
      -- FUGIR
      fugir = Batalha:flee(bt)
      if fugir == "fugiu" then
        -- POS BATALHA
        os.execute("clear")
        print("batalha encerrada")
        plr = bt.player
        state = "mapa"
      elseif fugir == "falhou" then
        -- toma dano se falhar
        bt = Batalha:enmToPlr(bt)
        if bt.player.hp < 1 then
          os.execute("clear")
          state = "gameover"  -- GAME OVER
          return state
        end
      else
        print("error 1")
      end
    elseif line == "p" then
      -- POCAO
      if bt.player.potion > 0 then 
        bt.player = Player:usePot(bt.player)
        os.execute("clear")
        print("Pocao usada!")
      else
        os.execute("clear")
        print("Sem pocoes para usar...")
      end
    else
      os.execute("clear")
      print("Tente novamente")
    end
    -- se vc perdeu ->
    Screen:show(map, plr, commandsBat, state, bt)
    if state == "gameover" then
      setmetatable(plr, false)
      setmetatable(map, false)
      setmetatable(bt, false)
      start()
    end
  end
  bt = {}
  if state == "batalha" then
    Screen:show(map, plr, commandsBat, state, bt)
  elseif state == "mapa" then
    Screen:show(map, plr, commandsMap, state, bt)
  end
end

while 1 == 1 do
  --playerPos = lerInput(map, playerPos, difficulty, state)
  
  newPlayerPos = playerPos -- pos temp
  
  local line = io.read()
  if line == "w" then
    control = tryWalk(playerPos.x-1, playerPos.y, map)
    newPlayerPos = {x = playerPos.x-1, y = playerPos.y}
  elseif line == "s" then
    control = tryWalk(playerPos.x+1, playerPos.y, map)
    newPlayerPos = {x = playerPos.x+1, y = playerPos.y}
  elseif line == "d" then
    control = tryWalk(playerPos.x, playerPos.y+1, map)
    newPlayerPos = {x = playerPos.x, y = playerPos.y+1}
  elseif line == "a" then
    control = tryWalk(playerPos.x, playerPos.y-1, map)
    newPlayerPos = {x = playerPos.x, y = playerPos.y-1}
  else
    os.execute("clear")
    print("Tente novamente")
    print()
  end

  if control == 0 then
    -- PAREDE
    print("Parede! Va por outro lugar")
    print()
    Screen:show(map, plr, commandsMap, state, bt)
  elseif control == 1 then
    -- ANDAR --
    --Anda o personagem no mapa
    map[playerPos.x][playerPos.y] = " "
    playerPos = newPlayerPos
    map[playerPos.x][playerPos.y] = "P"
    Screen:show(map, plr, commandsMap, state, bt)
  elseif control == 2 then 
    -- BATALHA --
    --Anda o personagem no mapa
    map[playerPos.x][playerPos.y] = " "
    playerPos = newPlayerPos
    map[playerPos.x][playerPos.y] = "P"
    state = batalhar()
    if state == "gameover" then
      print()
      print()
      print("  GAME OVER  ")
      print()
      print("  APERTE ENTER PARA RECOMEÇAR  ")
      print()
      local line = io.read()
      if line == "w" then
        start()
      else
        start()
      end
    end

  elseif control == 3 then 
    -- BAU -- 
    --Anda o personagem no mapa
    map[playerPos.x][playerPos.y] = " "
    playerPos = newPlayerPos
    map[playerPos.x][playerPos.y] = "P"
    Player:addStat(plr) -- abre o bau
    Screen:show(map, plr, commandsMap, state, bt)
  elseif control == 4 then 
    -- PROXIMA FASE -- 
    --Anda o personagem no mapa
    playerPos = {x = 2, y = 2} -- pos inicial
    map = resetMap(map)
    map[playerPos.x][playerPos.y] = "P"
    difficulty = difficulty + 1
    state = "mapa"
    os.execute("clear")
    Screen:show(map, plr, commandsMap, state, bt)
  else
    Screen:show(map, plr, commandsMap, state, bt)
  end
end