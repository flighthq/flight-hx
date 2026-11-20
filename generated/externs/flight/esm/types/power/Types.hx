package flight.esm.types.power;

#if (js && flight_esm)
typedef ElectronPowerCapabilities = { change:flight.esm.types.power.Types.HostPowerChangeCapability, status:flight.esm.types.power.Types.HostPowerStatusCapability, idle:flight.esm.types.power.Types.HostPowerIdleCapability, batteryHealth:flight.esm.types.power.Types.HostPowerBatteryHealthCapability, keepAwake:flight.esm.types.power.Types.HostPowerKeepAwakeCapability, sessionLock:flight.esm.types.power.Types.HostPowerSessionLockCapability, suspension:flight.esm.types.power.Types.HostPowerSuspensionCapability, ?thermal:Null<flight.esm.types.power.Types.HostPowerThermalCapability> };

typedef HostPowerBatteryHealthCapability = { getBatteryHealth:((out:flight.esm.types.power.Types.PowerBatteryHealth) -> flight.esm.types.power.Types.PowerBatteryHealth) };

typedef HostPowerCapabilities = { ?batteryHealth:Null<flight.esm.types.power.Types.HostPowerBatteryHealthCapability>, ?change:Null<flight.esm.types.power.Types.HostPowerChangeCapability>, ?idle:Null<flight.esm.types.power.Types.HostPowerIdleCapability>, ?keepAwake:Null<flight.esm.types.power.Types.HostPowerKeepAwakeCapability>, ?sessionLock:Null<flight.esm.types.power.Types.HostPowerSessionLockCapability>, ?status:Null<flight.esm.types.power.Types.HostPowerStatusCapability>, ?suspension:Null<flight.esm.types.power.Types.HostPowerSuspensionCapability>, ?thermal:Null<flight.esm.types.power.Types.HostPowerThermalCapability> };

typedef HostPowerChangeCapability = { subscribe:((listener:Dynamic) -> Dynamic) };

typedef HostPowerIdleCapability = { getIdleState:((thresholdSeconds:Float) -> flight.esm.types.power.Types.PowerIdleState), getIdleTimeSeconds:(() -> Float) };

typedef HostPowerKeepAwakeCapability = { acquire:((mode:flight.esm.types.power.Types.PowerKeepAwakeMode) -> js.lib.Promise<flight.esm.types.power.Types.PowerKeepAwakeAcquireResult>), ?destroy:Null<(() -> Void)>, isActive:(() -> Bool), release:(() -> js.lib.Promise<flight.esm.types.power.Types.PowerKeepAwakeReleaseResult>) };

typedef HostPowerSessionLockCapability = { subscribeLock:((listener:Dynamic) -> Dynamic), subscribeUnlock:((listener:Dynamic) -> Dynamic) };

typedef HostPowerStatusCapability = { getStatus:((out:flight.esm.types.power.Types.PowerStatus) -> flight.esm.types.power.Types.PowerStatus) };

typedef HostPowerSuspensionCapability = { subscribeResume:((listener:Dynamic) -> Dynamic), subscribeSuspend:((listener:Dynamic) -> Dynamic) };

typedef HostPowerThermalCapability = { getThermalState:(() -> flight.esm.types.power.Types.PowerThermalState), subscribeThermalStateChange:((listener:Dynamic) -> Dynamic) };

typedef Power = { onChange:Null<flight.esm.types.signals.Types.Signal<flight.esm.types.power.Types.PowerStatus>>, onCharging:Null<flight.esm.types.signals.Types.Signal<Void>>, onDischarging:Null<flight.esm.types.signals.Types.Signal<Void>>, onIdleStateChange:Null<flight.esm.types.signals.Types.Signal<Void>>, onLockScreen:Null<flight.esm.types.signals.Types.Signal<Void>>, onResume:Null<flight.esm.types.signals.Types.Signal<Void>>, onSuspend:Null<flight.esm.types.signals.Types.Signal<Void>>, onThermalStateChange:Null<flight.esm.types.signals.Types.Signal<flight.esm.types.power.Types.PowerThermalState>>, onUnlockScreen:Null<flight.esm.types.signals.Types.Signal<Void>> };

typedef PowerBatteryHealth = { capacityWearLevel:Float, cycleCount:Float, healthState:flight.esm.types.power.Types.PowerBatteryHealthState, temperatureCelsius:Float, voltage:Float };

typedef PowerBatteryHealthState = String;

typedef PowerIdleState = String;

typedef PowerKeepAwakeAcquireReason = String;

typedef PowerKeepAwakeAcquireResult = { reason:flight.esm.types.power.Types.PowerKeepAwakeAcquireReason };

typedef PowerKeepAwakeMode = String;

typedef PowerKeepAwakeReleaseReason = String;

typedef PowerKeepAwakeReleaseResult = { reason:flight.esm.types.power.Types.PowerKeepAwakeReleaseReason };

typedef PowerStatus = { batteryLevel:Float, chargingTime:Float, dischargingTime:Float, isBatteryLow:Bool, isCharging:Bool, isLowPower:Bool, isOnBattery:Bool, thermalState:flight.esm.types.power.Types.PowerThermalState };

typedef PowerThermalState = String;

typedef WebPowerCapabilities = { change:flight.esm.types.power.Types.HostPowerChangeCapability, status:flight.esm.types.power.Types.HostPowerStatusCapability, keepAwake:flight.esm.types.power.Types.HostPowerKeepAwakeCapability, suspension:flight.esm.types.power.Types.HostPowerSuspensionCapability };

typedef WebPowerReadingCapabilities = { change:flight.esm.types.power.Types.HostPowerChangeCapability, status:flight.esm.types.power.Types.HostPowerStatusCapability };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
