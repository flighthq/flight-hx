package flight.esm.types.sdk_power;

#if (js && flight_esm)
typedef ElectronPowerCapabilities = flight.esm.types.power.Types.ElectronPowerCapabilities;

typedef HostPowerBatteryHealthCapability = flight.esm.types.power.Types.HostPowerBatteryHealthCapability;

typedef HostPowerCapabilities = flight.esm.types.power.Types.HostPowerCapabilities;

typedef HostPowerChangeCapability = flight.esm.types.power.Types.HostPowerChangeCapability;

typedef HostPowerIdleCapability = flight.esm.types.power.Types.HostPowerIdleCapability;

typedef HostPowerKeepAwakeCapability = flight.esm.types.power.Types.HostPowerKeepAwakeCapability;

typedef HostPowerSessionLockCapability = flight.esm.types.power.Types.HostPowerSessionLockCapability;

typedef HostPowerStatusCapability = flight.esm.types.power.Types.HostPowerStatusCapability;

typedef HostPowerSuspensionCapability = flight.esm.types.power.Types.HostPowerSuspensionCapability;

typedef HostPowerThermalCapability = flight.esm.types.power.Types.HostPowerThermalCapability;

typedef Power = flight.esm.types.power.Types.Power;

typedef PowerBatteryHealth = flight.esm.types.power.Types.PowerBatteryHealth;

typedef PowerBatteryHealthState = flight.esm.types.power.Types.PowerBatteryHealthState;

typedef PowerIdleState = flight.esm.types.power.Types.PowerIdleState;

typedef PowerKeepAwakeAcquireReason = flight.esm.types.power.Types.PowerKeepAwakeAcquireReason;

typedef PowerKeepAwakeAcquireResult = flight.esm.types.power.Types.PowerKeepAwakeAcquireResult;

typedef PowerKeepAwakeMode = flight.esm.types.power.Types.PowerKeepAwakeMode;

typedef PowerKeepAwakeReleaseReason = flight.esm.types.power.Types.PowerKeepAwakeReleaseReason;

typedef PowerKeepAwakeReleaseResult = flight.esm.types.power.Types.PowerKeepAwakeReleaseResult;

typedef PowerStatus = flight.esm.types.power.Types.PowerStatus;

typedef PowerThermalState = flight.esm.types.power.Types.PowerThermalState;

typedef WebPowerCapabilities = flight.esm.types.power.Types.WebPowerCapabilities;

typedef WebPowerReadingCapabilities = flight.esm.types.power.Types.WebPowerReadingCapabilities;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
