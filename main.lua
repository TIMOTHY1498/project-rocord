local httpservice = game.HttpService
local url = "paste your webhook token or url here..."

--[[
// project-rocord

This project is made by @timothy1498
Credit me before using it on your game
]]--


game.Players.PlayerAdded:Connect(function(plr)
	local datajoin = {
		["content"] = plr.Name.." was joined the game",
		["username"] = "[SYSTEM]"
	}
	httpservice:RequestAsync({
		Url = url, --// plr.Name was joined the game
		--// join link
		Method = "POST",
		Headers = {
			["Content-Type"] = "application/json", --// JSON Only!
		},
		Body = httpservice:JSONEncode(datajoin),
	})
	
	plr.Chatted:connect(function(msg)
		local data = {
			["content"] = msg,
			["username"] = plr.Name
		}
		httpservice:RequestAsync({
			Url = url,
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json", --// JSON Only!
			},
			Body = httpservice:JSONEncode(data),
		})
	end)
end)

game.Players.PlayerRemoving:Connect(function(plr)
	local datajoin = {
		["content"] = plr.Name.." was left the game",
		["username"] = "[SYSTEM]"
	}
	httpservice:RequestAsync({
		Url = url, --// plr.Name was left the game
		Method = "POST",
		Headers = {
			["Content-Type"] = "application/json", --// JSON Only!
		},
		Body = httpservice:JSONEncode(datajoin),
	})
end)

print("timblox-discblox-api (Made with love by PakTimoGus124 (timothy1498_boi))")
