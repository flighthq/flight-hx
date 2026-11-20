package flight.esm.types.sdk_physics2d_abi;

#if (js && flight_esm)
typedef Physics2DAbi = flight.esm.types.physics2d_abi.Types.Physics2DAbi;

typedef Physics2DAbiBodyBuffer = flight.esm.types.physics2d_abi.Types.Physics2DAbiBodyBuffer;

typedef Physics2DAbiCommandBuffer = flight.esm.types.physics2d_abi.Types.Physics2DAbiCommandBuffer;

typedef Physics2DAbiContactBuffer = flight.esm.types.physics2d_abi.Types.Physics2DAbiContactBuffer;

typedef Physics2DAbiContactHook = flight.esm.types.physics2d_abi.Types.Physics2DAbiContactHook;

typedef Physics2DAbiContactHooks = flight.esm.types.physics2d_abi.Types.Physics2DAbiContactHooks;

typedef Physics2DAbiContactSelection = flight.esm.types.physics2d_abi.Types.Physics2DAbiContactSelection;

typedef Physics2DAbiExecutionResult = flight.esm.types.physics2d_abi.Types.Physics2DAbiExecutionResult;

typedef Physics2DAbiExecutionStatus = flight.esm.types.physics2d_abi.Types.Physics2DAbiExecutionStatus;

typedef Physics2DAbiJointBuffer = flight.esm.types.physics2d_abi.Types.Physics2DAbiJointBuffer;

typedef Physics2DAbiObjectId = flight.esm.types.physics2d_abi.Types.Physics2DAbiObjectId;

typedef Physics2DAbiQueryBuffer = flight.esm.types.physics2d_abi.Types.Physics2DAbiQueryBuffer;

typedef Physics2DAbiStepStatus = flight.esm.types.physics2d_abi.Types.Physics2DAbiStepStatus;

typedef Physics2DAbiWorldHandle = flight.esm.types.physics2d_abi.Types.Physics2DAbiWorldHandle;

typedef Physics2DAbiWorldStatus = flight.esm.types.physics2d_abi.Types.Physics2DAbiWorldStatus;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
