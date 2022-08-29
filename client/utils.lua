function toggleNuiFrame(shouldShow)
    SetNuiFocus(shouldShow, shouldShow)
    SendReactMessage('setVisible', shouldShow)
end

function SendReactMessage(action, data)
    SendNUIMessage({
      action = action,
      data = data
    })
end

RegisterNUICallback('hideFrame', function(_, cb)
  toggleNuiFrame(false)
  debugPrint('Użyto ESC -> schowano ui')
  cb({})
end)

RegisterNUICallback('createGroup', function(data, cb)
  GroupSystem.functions.createGroup(data)
  cb({})
end)

RegisterCommand('groupslist', function()
  local groups = GroupSystem.functions.getGroups()
  print('Lista grup: ')
  for k,v in pairs(groups) do
    print(v.fullname..' [^4'..v.name..'^0][^4'..v.shortname..'^0]')
  end
end)

RegisterCommand('mygroups', function() 
  GroupSystem.functions.setPlayerGroups()
  Wait(200)
  local playergroups = GroupSystem.playerGroups
  print('Lista grupy gracza:')
  for k,v in pairs(playergroups) do
    print(GroupSystem.groups[k].fullname)
  end
end)