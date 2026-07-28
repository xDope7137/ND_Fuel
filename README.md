# ND_Fuel

A fuel system for QBCore FiveM servers, extending [Andyyy7666's ND Fuel](https://github.com/Andyyy7666) with jerry can support.

![Status](https://img.shields.io/badge/status-archived-lightgrey)
![Platform](https://img.shields.io/badge/platform-FiveM-orange)
![Framework](https://img.shields.io/badge/framework-QBCore-blue)
![Language](https://img.shields.io/badge/language-Lua-000080)

> **Archived.** Built in 2022 and kept public as a reference. Not actively maintained.

## What it does

- Vehicle refuelling at pumps, with fuel consumption tracked per vehicle
- Jerry can support for refuelling away from a station
- Exposes `GetFuel` as an export, so HUDs and other resources can read fuel level

## Requirements

- A FiveM server
- QBCore

## Installation

1. Copy the `ND_Fuel` folder into your server's `resources` directory.
2. Add it to your `server.cfg`:

   ```cfg
   ensure ND_Fuel
   ```

3. Make sure no other fuel resource (`LegacyFuel`, `cdn-fuel`, and so on) is running at the same time.
4. Restart the server.

## qb-hud integration

`qb-hud` reads fuel from `LegacyFuel` by default. Two lines need repointing in `qb-hud/client.lua`:

**Around line 632:**

```diff
- lastFuelCheck = math.floor(exports['LegacyFuel']:GetFuel(vehicle))
+ lastFuelCheck = math.floor(exports['ND_Fuel']:GetFuel(vehicle))
```

**Around line 798:**

```diff
- if exports['LegacyFuel']:GetFuel(GetVehiclePedIsIn(ped, false)) <= 20 then
+ if exports['ND_Fuel']:GetFuel(GetVehiclePedIsIn(ped, false)) <= 20 then
```

The `<= 20` threshold is the low-fuel warning point, as a percentage. Adjust to taste.

## Configuration

See `config.lua` for fuel consumption rates, pricing and pump locations.

## Exports

```lua
exports['ND_Fuel']:GetFuel(vehicle)     -- returns the vehicle's current fuel level
```

## Credits

Original author: **[Andyyy7666](https://github.com/Andyyy7666)**. This repository is a modified version adding jerry can support and qb-core compatibility, with contributions from DetErDugget and Rika Venturiano.
