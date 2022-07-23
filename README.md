# ND_Fuel
 ND Fuel Script for qb-core

This is a modified version of ND Fuel script for qb-core with Jerry Can support.

Open issue for any feature requests or issues obviously.

Original Creator :

https://github.com/Andyyy7666

QB-Hud integration: 
Go to qb-hud/client.lua 

Edit line 632 from
lastFuelCheck = math.floor(exports['LegacyFuel']:GetFuel(vehicle)) 
to 
lastFuelCheck = math.floor(exports['ND_Fuel']:GetFuel(vehicle))

And edit line 798 from
if exports['LegacyFuel']:GetFuel(GetVehiclePedIsIn(ped, false)) <= 20 then -- At 20% Fuel Left 
TO 
if exports['ND_Fuel']:GetFuel(GetVehiclePedIsIn(ped, false)) <= 20 then -- At 20% Fuel Left



