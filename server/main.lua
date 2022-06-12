-------------------- Strez Tsunami (ESX Conversion) --------------------
-- Code
ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(30)
  end
end)

-------------------- Custom Tsunami Email --------------------

-- Custom Warning Email
RegisterCommand('tsunamialert', function(source, args)
    local msg = table.concat(args, ' ')
    local len = tonumber(string.len(msg))
    if len <= 255 then
        TriggerClientEvent('strez:client:SendMailTsunamiCustom', -1, msg)
    else
		TriggerClientEvent('okokNotify:Alert', source, 'Tsunami', 'Exceeds maximum characters', 3000, 'error')
    end
end, 'god')

-------------------- Manual Tsunami Email --------------------

-- Manual 15 Minute Tsunami Warning
RegisterCommand('tsunamidefault', function(source, args)
    TriggerClientEvent('strez:client:SendMailTsunamiManual', -1)
end, 'god')

-------------------- Auto Restart Tsunami Email --------------------

-- 15 Minutes Reminder
AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 900 then
        TriggerClientEvent('strez:client:SendMailTsunamiAuto15', -1)
    end
end)
-- 5 Minutes Reminder
AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 600 then
        TriggerClientEvent('strez:client:SendMailTsunamiAuto5', -1)
    end
end)
-- 1 Minutes Reminder
AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 60 then
        TriggerClientEvent('strez:client:SendMailTsunamiAuto1', -1)
    end
end)