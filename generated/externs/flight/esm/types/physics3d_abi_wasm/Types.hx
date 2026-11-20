package flight.esm.types.physics3d_abi_wasm;

#if (js && flight_esm)
typedef Physics3DAbi = flight.esm.types.physics3d_abi.Types.Physics3DAbi;

typedef Physics3DAbiBodyBuffer = flight.esm.types.physics3d_abi.Types.Physics3DAbiBodyBuffer;

typedef Physics3DAbiCommandBuffer = flight.esm.types.physics3d_abi.Types.Physics3DAbiCommandBuffer;

typedef Physics3DAbiContactBuffer = flight.esm.types.physics3d_abi.Types.Physics3DAbiContactBuffer;

typedef Physics3DAbiContactHook = flight.esm.types.physics3d_abi.Types.Physics3DAbiContactHook;

typedef Physics3DAbiContactHooks = flight.esm.types.physics3d_abi.Types.Physics3DAbiContactHooks;

typedef Physics3DAbiContactSelection = flight.esm.types.physics3d_abi.Types.Physics3DAbiContactSelection;

typedef Physics3DAbiExecutionResult = flight.esm.types.physics3d_abi.Types.Physics3DAbiExecutionResult;

typedef Physics3DAbiExecutionStatus = flight.esm.types.physics3d_abi.Types.Physics3DAbiExecutionStatus;

typedef Physics3DAbiJointBuffer = flight.esm.types.physics3d_abi.Types.Physics3DAbiJointBuffer;

typedef Physics3DAbiObjectId = flight.esm.types.physics3d_abi.Types.Physics3DAbiObjectId;

typedef Physics3DAbiQueryBuffer = flight.esm.types.physics3d_abi.Types.Physics3DAbiQueryBuffer;

typedef Physics3DAbiStepStatus = flight.esm.types.physics3d_abi.Types.Physics3DAbiStepStatus;

typedef Physics3DAbiWorldHandle = flight.esm.types.physics3d_abi.Types.Physics3DAbiWorldHandle;

typedef Physics3DAbiWorldStatus = flight.esm.types.physics3d_abi.Types.Physics3DAbiWorldStatus;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
