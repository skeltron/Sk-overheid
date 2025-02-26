ESX.RegisterServerCallback("Sk-overheid:checkspeler", function(src, callback, model)
    local player = ESX.GetPlayerFromId(src)

    if not player then
        callback(false)
        return
    end

    player.job = ESX.GetPlayerFromId(src).job
    local job = player.job.name
    local jobcontrole = whitelistjobs(model)

    if jobcontrole then 
        for _, v in pairs(jobcontrole) do 
            if string.lower(v) == string.lower(job) then
                callback(true)
                return
            end
        end
      
        callback(false)
        return
    end    

    callback(true)
end)

whitelistjobs = function(model) 
    for _, v in pairs(overheidvoertuigen) do 
        if string.lower(v.model) == string.lower(model) then
            return v.jobcontrole
        end
    end
    return nil
end
