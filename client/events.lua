RegisterNetEvent('groups:addGroup', function(data)
    GroupSystem.groups[data.name] = {
        name = data.name,
        fullname = data.fullname,
        shortname = data.shortname
    }
end)

RegisterNetEvent('group:openGroupMaker', function()
    toggleNuiFrame(true)
    debugPrint('otwieranie ui')
end)

RegisterNetEvent('groups:addGroupForPlayer', function(group, adminid)
    if not GroupSystem.playerGroups[group] then
        TriggerServerEvent('groups:addGroup', group)
    else
        TriggerServerEvent('groups:notifyforid', adminid, 'Podany gracz posiada już tę grupę!', 'error', 2000)
    end
    Wait(200)
    GroupSystem.functions.setPlayerGroups()
end)

RegisterNetEvent('groups:notify', function(msg, type, time)
    notify(msg, type, time)
end)

RegisterNetEvent('groups:removeGroupForPlayer', function(group, adminid)
    if GroupSystem.playerGroups[group] then
        TriggerServerEvent('groups:removeGroup', group)
        GroupSystem.playerGroups[group] = nil
    else
        TriggerServerEvent('groups:notifyforid', adminid, 'Podany gracz nie posiada tej grupy!', 'error', 2000)
    end
    Wait(200)
    GroupSystem.functions.setPlayerGroups()
end)