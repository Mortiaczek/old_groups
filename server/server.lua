Citizen.CreateThread(function()
	local file = LoadResourceFile(GetCurrentResourceName(), "./groups.json")
	local groups = GroupSystem.groups
    if file ~= nil then
        for k,v in pairs(json.decode(file)) do
            groups[v.name] = {
                name = v.name,
                fullname = v.fullname,
                shortname = v.shortname
            }
            print('^2Wczytwano^0 grupe ^3'..v.fullname..'^0 [^4'..v.name..'^0].')
            TriggerClientEvent('groups:addGroup', -1, 
            {
                name = v.name,
                fullname = v.fullname,
                shortname = v.shortname
            })
        end
	end
end)

RegisterNetEvent('groups:loadGroupsForClient', function()
    local groups = GroupSystem.groups
    for k,v in pairs(groups) do
        TriggerClientEvent('groups:addGroup', -1, 
        {
            name = v.name,
            fullname = v.fullname,
            shortname = v.shortname
        })
    end
end)

ESX.RegisterServerCallback('groups:createNewGroup', function(source, cb, data)
    local groups = GroupSystem.groups
    local result = false
    if GroupSystem.groups[data.name] then
        result = false
    else
        GroupSystem.groups[data.name] = {
            name = data.name,
            fullname = data.fullname,
            shortname = data.shortname
        }
        SaveResourceFile(GetCurrentResourceName(), "groups.json", json.encode(GroupSystem.groups), -1)
        result = true
        TriggerClientEvent('groups:addGroup', -1, 
        {
            name = data.name,
            fullname = data.fullname,
            shortname = data.shortname
        })
    end
    cb(result)
end)

ESX.RegisterServerCallback('groups:getPlayerGroups', function(source,cb)
    local player = ESX.GetPlayerFromId(source)
    if player then
        local playerIdentifier = player.identifier
        MySQL.query('SELECT * FROM users_groups WHERE identifier = ?', {playerIdentifier}, function(result)
            local playerGroups = {}
            for _, v in ipairs(result) do
                table.insert(playerGroups, v.groupname)
            end
            cb(playerGroups)
        end)
    else
        cb(nil)
    end
end)

RegisterNetEvent('groups:addGroup', function(group)
    local player = ESX.GetPlayerFromId(source)
    local playerIdentifier = player.identifier

    local insert = MySQL.insert.await('INSERT INTO users_groups (identifier, groupname) VALUES (?, ?)', {playerIdentifier, group})
    player.triggerEvent('groups:notify', 'Otrzymano nową grupe: '..GroupSystem.groups[group].fullname, 'info', 2000)
end)

RegisterNetEvent('groups:removeGroup', function(group)
    local player = ESX.GetPlayerFromId(source)
    local playerIdentifier = player.identifier

    MySQL.insert('DELETE FROM users_groups WHERE identifier = ? AND groupname = ?', {playerIdentifier, group})
    player.triggerEvent('groups:notify', 'Utracono grupe: '..GroupSystem.groups[group].fullname, 'error', 2000)
end)

RegisterNetEvent('groups:notifyforid', function(id, msg, type, time)
    local player = ESX.GetPlayerFromId(id)
    player.triggerEvent('groups:notify', msg, type, time)
end)