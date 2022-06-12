-------------------- Strez Tsunami (ESX Conversion) --------------------
-- Code
ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(30)
  end
end)

-- Tsunami Aftershock Effects
function TsunamiEffect()
    local startStamina = 30
    while startStamina > 0 do 
        Wait(1000)
        startStamina = startStamina - 1
        RestorePlayerStamina(PlayerId(), 1.0)
        if math.random(1, 100) < 9 then
            if not IsPedRagdoll(PlayerPedId()) and IsPedOnFoot(PlayerPedId()) and not IsPedSwimming(PlayerPedId()) then
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.06)
                SetPedToRagdollWithFall(PlayerPedId(), 0, 0, 1, GetEntityForwardVector(PlayerPedId()), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
            end
        end
    end
    startStamina = 0
end

-------------------- Custom Tsunami Email --------------------

RegisterNetEvent('strez:client:SendMailTsunamiCustom', function(text)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.5)
    Wait(math.random(7000, 13000))
	-- Change this trigger to your smartphone email system (We use qs-smartphone)
    TriggerServerEvent('qs-smartphone:server:sendNewMail', {
        sender = 'Met Office',
        subject = 'Emergency Broadcast',
        message = 'The Met Office has issued a TSUNAMI WARNING for London, United Kingdom. Please start heading home or somewhere local for SAFETY!',
        button = {}
    })
end)

-------------------- Manual Tsunami Email --------------------

-- Manual Warning Email
RegisterNetEvent('strez:client:SendMailTsunamiManual', function(text)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.5)
    Wait(math.random(7000, 13000))
    TriggerServerEvent('qs-smartphone:server:sendNewMail', {
        sender = 'Met Office',
        subject = 'Emergency Broadcast',
        message = 'The Met Office has issued a TSUNAMI WARNING for London, United Kingdom. Please start heading home or somewhere local for SAFETY!',
        button = {}
    })
    Wait(math.random(30000, 60000))
    TriggerServerEvent('cd_easytime:StartTsunamiCountdown', -1, boolean)
    TsunamiEffect()
end)

-------------------- Auto Restart Tsunami Email --------------------

-- 15 Minutes Reminder
RegisterNetEvent('strez:client:SendMailTsunamiAuto15', function(text)
        TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.5)
        Wait(math.random(7000, 13000))
        TriggerServerEvent('qs-smartphone:server:sendNewMail', {
        sender = 'Met Office',
        subject = 'Emergency Broadcast',
        message = 'The Met Office has issued a TSUNAMI WARNING for London, United Kingdom. Please start heading home or somewhere local for SAFETY!',
        button = {}
    })
        Wait(math.random(15000, 25000))
        TriggerServerEvent('cd_easytime:StartTsunamiCountdown', -1, boolean)
        TsunamiEffect()
end)
-- 5 Minutes Reminder
RegisterNetEvent('strez:client:SendMailTsunamiAuto5', function(text)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.5)
    Wait(math.random(7000, 13000))
    Wait(35000)
	TriggerEvent('InteractSound_CL:PlayOnOne', 'raidsiren', 0.1)
    TriggerServerEvent('qs-smartphone:server:sendNewMail', {
        sender = 'Met Office',
        subject = 'Emergency Broadcast',
        message = 'The Met Office has issued a TSUNAMI WARNING for London, United Kingdom. Please start heading home or somewhere local for SAFETY!',
        button = {}
    })
    Wait(math.random(10000, 20000))
    TsunamiEffect()
end)
-- 1 Minutes Reminder
RegisterNetEvent('strez:client:SendMailTsunamiAuto1', function(text)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'Alert', 0.5)
    Wait(math.random(7000, 13000))
    TriggerServerEvent('qs-smartphone:server:sendNewMail', {
        sender = 'Met Office',
        subject = 'Emergency Broadcast',
        message = 'The Met Office has issued a TSUNAMI WARNING for London, United Kingdom. Please start heading home or somewhere local for SAFETY!',
        button = {}
    })
    Wait(math.random(13000, 23000))
    TsunamiEffect()
end)
