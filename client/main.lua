check = nil

Citizen.CreateThread(function() 
    while true do 
        Wait(2)

        local ped = PlayerPedId()
        local sleep = false
        local inVeh  = IsPedInAnyVehicle(ped, true)

        if (inVeh) then 
            local veh = GetVehiclePedIsIn(ped, false)  
            if (veh ~= check) then 
                check = veh
                
                local bestuurder = GetPedInVehicleSeat(veh, -1)
                if bestuurder == ped then
                    local model = GetDisplayNameFromVehicleModel(GetEntityModel(veh))
                    
                    ESX.TriggerServerCallback("Sk-overheid:checkspeler", function(isOk)
                        if not isOk then 
                            TaskLeaveVehicle(ped, veh, 16)
                            check = nil
                            ESX.ShowNotification("Dit voertuig is niet voor jou bestemd")
                        end
                    end, model)
                end
            else
                sleep = true
            end
        else
            sleep = true
        end   

        if (sleep) then 
            Wait(1500)    
        end
    end
end)
