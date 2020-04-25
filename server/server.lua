local Tunnel = module('_core', 'libs/Tunnel')
local Proxy = module('_core', 'libs/Proxy')

API = Proxy.getInterface('API')
cAPI = Tunnel.getInterface('API')

RegisterServerEvent('trew_hud_ui:getServerInfo')
AddEventHandler('trew_hud_ui:getServerInfo', function()
	local _source = source
	local User = API.getUserFromSource(_source)

	if User == nil then
        return
	end

	local Character = User:getCharacter()
	
	if Character == nil then
		return
	end

	local hunger = json.decode(Character:getData(Character:getId(), 'charTable', 'hunger'))
	local thirst = json.decode(Character:getData(Character:getId(), 'charTable', 'thirst'))

	local info = {
		hunger = tonumber(hunger),
		thirst = tonumber(thirst),
		money = Character:getMoney(),
		level = Character:getLevel(),
	}
	
	TriggerClientEvent('trew_hud_ui:setInfo', _source, info) 
end)

RegisterServerEvent('trew_hud_ui:syncCarLights')
AddEventHandler('trew_hud_ui:syncCarLights', function(status)
	local _source = source
    local User = API.getUserFromSource(_source)

	TriggerClientEvent('trew_hud_ui:syncCarLights', -1, _source, status)
end)
