package flight.esm.types.ipc_contract;

#if (js && flight_esm)
typedef HostIpcCapabilities = flight.esm.types.ipc.Types.HostIpcCapabilities;

typedef HostIpcHandleCapability = flight.esm.types.ipc.Types.HostIpcHandleCapability;

typedef HostIpcInvokeCapability = flight.esm.types.ipc.Types.HostIpcInvokeCapability;

typedef HostIpcMessageCapability = flight.esm.types.ipc.Types.HostIpcMessageCapability;

typedef HostIpcSendCapability = flight.esm.types.ipc.Types.HostIpcSendCapability;

typedef HostIpcTargetedSendCapability<Target> = flight.esm.types.ipc.Types.HostIpcTargetedSendCapability<Target>;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
