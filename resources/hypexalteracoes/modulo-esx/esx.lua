ESX = {}

ESX.banSystem = {}

local function get_user_identifiers(user_id)
    local source = ESX.getUserSource(user_id)
    return source and GetPlayerIdentifiers(source) or { user_id }
end

local function get_player_identifiers_query_params(player_identifiers)
    local params = {}
    for i, identifier in ipairs(player_identifiers) do
        params["@player_" .. identifier:split(":")[1]] = identifier
    end

    return params
end

function ESX.banSystem.start()
    MySQL.ready(function ()
        MySQL.Async.execute([[
            CREATE TABLE IF NOT EXISTS flux_bans (
                id CHAR(36) PRIMARY KEY,
                player_license CHAR(48) UNIQUE,
                player_steam CHAR(21) UNIQUE,
                player_discord CHAR(26) UNIQUE,
                player_fivem VARCHAR(20) UNIQUE,
                player_live CHAR(20) UNIQUE,
                player_xbl CHAR(20) UNIQUE
            );
        ]])
    end)

    AddEventHandler("playerConnecting", function (name, setMessage, deferrals)
        deferrals.defer()

        local player_identifiers = GetPlayerIdentifiers(source)
        if #player_identifiers > 0 then
            local ban_id = ESX.banSystem.getBanId(player_identifiers)
            if ban_id then
                deferrals.done(("[Flux Anticheat] Você está banido (ban_id = %s)"):format(ban_id))
            else
                deferrals.done()
            end
        end
    end)
end

function ESX.banSystem.getBanId(player_identifiers)
    return MySQL.Sync.fetchScalar([[
        SELECT id FROM flux_bans WHERE
            player_license = @player_license
            OR player_steam = @player_steam
            OR player_discord = @player_discord
            OR player_fivem = @player_fivem
            OR player_live = @player_live
            OR player_xbl = @player_xbl
    ]], get_player_identifiers_query_params(player_identifiers))
end

function ESX.banSystem.isBanned(player_identifiers)
    return MySQL.Sync.fetchScalar([[
        SELECT EXISTS(
            SELECT * FROM flux_bans WHERE
                player_license = @player_license
                OR player_steam = @player_steam
                OR player_discord = @player_discord
                OR player_fivem = @player_fivem
                OR player_live = @player_live
                OR player_xbl = @player_xbl
        );
    ]], get_player_identifiers_query_params(player_identifiers)) ~= 0
end

function ESX.banSystem.ban(player_identifiers)
    MySQL.Sync.execute(
        "INSERT IGNORE INTO flux_bans VALUES(UUID(), @player_license, @player_steam, @player_discord, @player_fivem, @player_live, @player_xbl);",
        get_player_identifiers_query_params(player_identifiers)
    )

    return ESX.banSystem.getBanId(player_identifiers)
end

function ESX.banSystem.unban(player_identifiers)
    MySQL.Sync.execute([[
        DELETE FROM flux_bans WHERE
            player_license = @player_license
            OR player_steam = @player_steam
            OR player_discord = @player_discord
            OR player_fivem = @player_fivem
            OR player_live = @player_live
            OR player_xbl = @player_xbl;
        ]], get_player_identifiers_query_params(player_identifiers))
end

function ESX.banSystem.unbanById(id)
    MySQL.Sync.execute("DELETE FROM flux_bans WHERE id = @id;", { id = id })
end

function ESX.start()
    TriggerEvent('esx:getSharedObject', function(obj)
        ESX.internal = obj
    end)
    ESX.banSystem.start()
end

function ESX.getUserId(source)
    local xPlayer = ESX.internal.GetPlayerFromId(source)
    if xPlayer then
        return xPlayer.getIdentifier()
    end

    return nil
end

function ESX.getUserSource(user_id)
    local xPlayer = ESX.internal.GetPlayerFromIdentifier(user_id)
    if xPlayer then
        return xPlayer.source
    end

    return nil
end

function ESX.getUserIdentity(user_id)
    local user = MySQL.Sync.fetchAll("SELECT firstname, lastname, dateofbirth, phone_number FROM users WHERE identifier = @identifier", {
        identifier = user_id
    })[1]

    if user then
        local birth_day, birth_month, birth_year = user.dateofbirth:match("(%d+)/(%d+)/(%d+)")
        local birth_timestamp = os.time({ day = birth_day, month = birth_month, year = birth_year })

        return {
            user_id = user_id,
            registration = "000AAA",
            phone = user.phone_number,
            firstname = user.firstname,
            name = user.lastname,
            age = math.floor(os.difftime(os.time(), birth_timestamp) / (365 * 24 * 60 * 60))
        }
    end

    return nil
end

function ESX.hasPermission(user_id, permission)
    local source = ESX.getUserSource(user_id)
    if source then
        return IsPlayerAceAllowed(source, permission) ~= 0
    end

    return false
end

function ESX.setBanned(user_id, banned)
    local player_identifiers = get_user_identifiers(user_id)

    if banned then
        ESX.banSystem.ban(player_identifiers)
    else
        ESX.banSystem.unban(player_identifiers)
    end
end

function ESX.isBanned(user_id)
    return ESX.banSystem.isBanned(get_user_identifiers(user_id))
end

function ESX.isUserPlateOwner(user_id, plate)
    return MySQL.Sync.fetchScalar("SELECT EXISTS(SELECT * FROM owned_vehicles WHERE owner = @owner AND plate = @plate);", {
        ["@owner"] = user_id,
        ["@plate"] = plate
    }) ~= 0
end

function string:split(separator)
    local parts = {}
    for part in string.gmatch(self, "([^" .. (separator or "%s") .. "]+)") do
        table.insert(parts, part);
    end

    return parts
end
