local currentResourceName = GetCurrentResourceName()

CreateThread(function()
	while true do
		Wait(Config.RefreshPlayerGroupsTime)
      GroupSystem.functions.setPlayerGroups()
	end
end)

function notify(msg, type, time)
    ESX.ShowNotification(msg, type, time)
end

function debugPrint(...)
    if not Config.Debug then return end
    local args <const> = { ... }
    local appendStr = ''
    for _, v in ipairs(args) do
      appendStr = appendStr .. ' ' .. tostring(v)
    end
    local msgTemplate = '^3[%s]^0%s'
    local finalMsg = msgTemplate:format(currentResourceName, appendStr)
    print(finalMsg)
end

function GroupSystem.functions.createGroup(groupdata)
  ESX.TriggerServerCallback('groups:createNewGroup', function(result) 
    if result then
      notify('Pomyślnie utworzono grupę!', 'success', 2000)
    else
      notify('Wystąpił błąd podczas tworzenie grupy, najprawdopodbniej podana grupa już istnieje!', 'error', 2000)
    end
  end, groupdata)
end

function GroupSystem.functions.getGroups()
  TriggerServerEvent('groups:loadGroupsForClient')
  Wait(100)
  return GroupSystem.groups
end

function GroupSystem.functions.setPlayerGroups()
  GroupSystem.functions.getGroups()
  ESX.TriggerServerCallback('groups:getPlayerGroups', function(result) 
    if result == nil or not next(result) then
      debugPrint('^4Przeładowano^0 grupy gracza. Gracz nie posiada żadnych grup')
    else
        GroupSystem.playerGroups = {}
        debugPrint('^4Przeładowano^0 grupy gracza.')
        if next(result) then
            for k,v in pairs(result) do
                GroupSystem.playerGroups[v] = true
            end
        end
    end
  end)
end

function GroupSystem.functions.getIfPlayerInGroup(group)
  GroupSystem.functions.setPlayerGroups()
  Wait(100)
  local result = false 
  if GroupSystem.playerGroups[group] then
    result = true
  else
    result = false
  end
  return result
end

exports('getIfPlayerInGroup', GroupSystem.functions.getIfPlayerInGroup)