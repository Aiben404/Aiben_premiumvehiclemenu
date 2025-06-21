local json = require("json")
local token = "YOUR_BOT_TOKEN_HERE" -- Insert your Discord bot token here (Line 33)
local endpoint = "https://discord.com/api/guilds/" .. Config.GuildID .. "/members/"

function hasRequiredRole(discordID, cb)
    PerformHttpRequest(endpoint .. discordID, function(statusCode, body)
        if statusCode == 200 then
            local data = json.decode(body)
            if data and data.roles then
                for _, roleID in ipairs(data.roles) do
                    for _, allowedID in ipairs(Config.AllowedRoleIDs) do
                        if roleID == allowedID then
                            cb(true)
                            return
                        end
                    end
                end
            end
        end
        cb(false)
    end, "GET", "", {
        ["Authorization"] = "Bot " .. token,
        ["Content-Type"] = "application/json"
    })
end

RegisterServerEvent("premium_vehiclemenu:openMenu", function()
    local src = source
    local identifiers = GetPlayerIdentifiers(src)
    local discordID = nil

    for _, id in ipairs(identifiers) do
        if string.sub(id, 1, 8) == "discord:" then
            discordID = string.sub(id, 9)
            break
        end
    end

    if not discordID then
        TriggerClientEvent("ox_lib:notify", src, {
            type = "error",
            description = "Discord not found. Make sure you’re connected through Discord."
        })
        return
    end

    hasRequiredRole(discordID, function(hasRole)
        if hasRole then
            TriggerClientEvent("premium_vehiclemenu:showMenu", src, Config.Vehicles)
        else
            TriggerClientEvent("ox_lib:notify", src, {
                type = "error",
                description = "You do not have the required Discord role."
            })
        end
    end)
end)

RegisterServerEvent("premium_vehiclemenu:spawnVehicle", function(vehicleName)
    TriggerClientEvent("premium_vehiclemenu:spawn", source, vehicleName)
end)
