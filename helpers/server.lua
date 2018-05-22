XRPLifeServer = {}
XRPLifeServer.Helpers = {}

---------------------------------------------------------------------------
-- Finds a players certain identifier
---------------------------------------------------------------------------
XRPLifeServer.Helpers.PlayerIdentifier = function(type, id)
    local identifiers = {}
    local numIdentifiers = GetNumPlayerIdentifiers(id)

    for a = 0, numIdentifiers do
        table.insert(identifiers, GetPlayerIdentifier(id, a))
    end

    for b = 1, #identifiers do
        if string.find(identifiers[b], type, 1) then
            return identifiers[b]
        end
    end
    return false
end

---------------------------------------------------------------------------
-- Debug Message
---------------------------------------------------------------------------
XRPLifeServer.Helpers.DebugMessage = function(message)
    print(tostring("[XRPLife Debug]: " .. message))
end

---------------------------------------------------------------------------
-- Stringsplit
---------------------------------------------------------------------------
XRPLifeServer.Helpers.Stringsplit = function(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

---------------------------------------------------------------------------
-- Checks players rank position compared to another
---------------------------------------------------------------------------
XRPLifeServer.Helpers.CheckPlayerRankPosition = function(RankOne, RankTwo)
    local ranks = XRPLifeConfig["admin"].Ranks
    local OnePos = 0
    local TwoPos = 0
    for a = 1, #ranks do
        if RankOne == ranks[a] then
            OnePos = a
            break
        end
    end
    for b = 1, #ranks do
        if RankTwo == ranks[b] then
            TwoPos = b
            break
        end
    end
    if OnePos == TwoPos then
        return "equal"
    elseif OnePos > TwoPos then
        return "greater"
    elseif OnePos < TwoPos then
        return "less"
    end
end

---------------------------------------------------------------------------
-- Checks if players perm matches
---------------------------------------------------------------------------
XRPLifeServer.Helpers.CheckPlayerRankPerm = function(Rank, Perm)
    local perms = XRPLifeConfig["admin"].RankPerms[Rank]
    for a = 1 , #perms do
        if perms[a] == Perm then
            return true
        end
    end
    return false
end

XRPLifeServer.Helpers.DebugMessage("Helpers - server.lua Loaded")