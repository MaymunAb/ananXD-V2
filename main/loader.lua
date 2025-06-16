local placeID = game.PlaceId
local gameID = game.GameId

if gameID == 4153755477 then
	--create a cart ride
elseif placeID == 6441847031 then
	--chaos
elseif placeID == 286090429 then
	--arsenal
else
	local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/MaymunAb/ananXD-V2/refs/heads/main/UI-Library.lua"))()
	lib:CreateNotification("Warning", "Unsupported game detected, running universal script")
end
