ESX.RegisterCommand({'groupmaker', 'gm', 'makegroup', 'newgroup'}, 'admin', function(xPlayer, args, showError)
    xPlayer.triggerEvent('group:openGroupMaker')
end, false, {help = 'Otwórz panel tworzenie grupy.'})

ESX.RegisterCommand('addPlayerGroup', 'admin', function(xPlayer, args, showError)
	if GroupSystem.groups[args.group] then
        args.playerId.triggerEvent('groups:addGroupForPlayer', args.group, xPlayer.source)
    else
        xPlayer.triggerEvent('groups:notify', 'Nie znaleziono podanej grupy!', 'error', 2000)
    end
end, true, {help = 'Dodaj frakcje graczowi', validate = true, arguments = {
	{name = 'playerId', help = 'ID gracza', type = 'player'},
	{name = 'group', help = 'Nazwa grupy', type = 'string'}
}})

ESX.RegisterCommand('removePlayerGroup', 'admin', function(xPlayer, args, showError)
	if GroupSystem.groups[args.group] then
        args.playerId.triggerEvent('groups:removeGroupForPlayer', args.group, xPlayer.source)
    else
        xPlayer.triggerEvent('groups:notify', 'Nie znaleziono podanej grupy!', 'error', 2000)
    end
end, true, {help = 'Dodaj frakcje graczowi', validate = true, arguments = {
	{name = 'playerId', help = 'ID gracza', type = 'player'},
	{name = 'group', help = 'Nazwa grupy', type = 'string'}
}})