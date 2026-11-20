package flight.esm.types.physics2d_abi;

#if (js && flight_esm)
typedef Physics2DAbi = { version:Float, capabilities:Float, createWorld:(() -> Float), destroyWorld:((world:Float) -> Bool), getWorldStatus:((world:Float) -> flight.esm.types.physics2d_abi.Types.Physics2DAbiWorldStatus), execute:((world:Float, commands:flight.esm.types.physics2d_abi.Types.Physics2DAbiCommandBuffer, out:flight.esm.types.physics2d_abi.Types.Physics2DAbiExecutionResult) -> Bool), step:((world:Float, dt:Float, hooks:Null<flight.esm.types.physics2d_abi.Types.Physics2DAbiContactHooks>) -> flight.esm.types.physics2d_abi.Types.Physics2DAbiStepStatus), readBodies:((world:Float, bodyIds:Null<js.lib.Uint32Array>, out:flight.esm.types.physics2d_abi.Types.Physics2DAbiBodyBuffer) -> Bool), readContacts:((world:Float, selection:flight.esm.types.physics2d_abi.Types.Physics2DAbiContactSelection, out:flight.esm.types.physics2d_abi.Types.Physics2DAbiContactBuffer) -> Bool), readJoints:((world:Float, out:flight.esm.types.physics2d_abi.Types.Physics2DAbiJointBuffer) -> Bool), queryPoint:((world:Float, x:Float, y:Float, filter:Null<flight.esm.types.physics2d.Types.Physics2DQueryFilter>, out:flight.esm.types.physics2d_abi.Types.Physics2DAbiQueryBuffer) -> Bool), queryRay:((world:Float, originX:Float, originY:Float, directionX:Float, directionY:Float, maxFraction:Float, closestOnly:Bool, filter:Null<flight.esm.types.physics2d.Types.Physics2DQueryFilter>, out:flight.esm.types.physics2d_abi.Types.Physics2DAbiQueryBuffer) -> Bool), queryRegion:((world:Float, region:flight.esm.types.spatial.Types.SpatialAabb2D, filter:Null<flight.esm.types.physics2d.Types.Physics2DQueryFilter>, out:flight.esm.types.physics2d_abi.Types.Physics2DAbiQueryBuffer) -> Bool), queryShapeCast:((world:Float, shape:flight.esm.types.collision.Types.CollisionBuiltInShape2D, dx:Float, dy:Float, maxFraction:Float, filter:Null<flight.esm.types.physics2d.Types.Physics2DQueryFilter>, out:flight.esm.types.physics2d_abi.Types.Physics2DAbiQueryBuffer) -> Bool) };

typedef Physics2DAbiBodyBuffer = { ids:js.lib.Uint32Array, flags:js.lib.Uint32Array, values:js.lib.Float64Array, count:Float, requiredCount:Float };

typedef Physics2DAbiCommandBuffer = { data:js.lib.Uint8Array, byteLength:Float, commandCount:Float };

typedef Physics2DAbiContactBuffer = { ids:js.lib.Uint32Array, flags:js.lib.Uint32Array, pointStarts:js.lib.Uint32Array, pointCounts:js.lib.Uint32Array, values:js.lib.Float64Array, pointFeatureIds:js.lib.Uint32Array, pointValues:js.lib.Float64Array, count:Float, pointCount:Float, requiredCount:Float, requiredPointCount:Float };

typedef Physics2DAbiContactHook = ((contact:flight.esm.types.physics2d_abi.Types.Physics2DAbiContactBuffer) -> Void);

typedef Physics2DAbiContactHooks = { buffer:flight.esm.types.physics2d_abi.Types.Physics2DAbiContactBuffer, preSolve:Null<flight.esm.types.physics2d_abi.Types.Physics2DAbiContactHook>, postSolve:Null<flight.esm.types.physics2d_abi.Types.Physics2DAbiContactHook> };

typedef Physics2DAbiContactSelection = String;

typedef Physics2DAbiExecutionResult = { status:flight.esm.types.physics2d_abi.Types.Physics2DAbiExecutionStatus, commandIndex:Float, byteOffset:Float, commandKind:Float };

typedef Physics2DAbiExecutionStatus = String;

typedef Physics2DAbiJointBuffer = { ids:js.lib.Uint32Array, flags:js.lib.Uint32Array, values:js.lib.Float64Array, count:Float, requiredCount:Float };

typedef Physics2DAbiObjectId = Float;

typedef Physics2DAbiQueryBuffer = { bodyIds:js.lib.Uint32Array, colliderIds:js.lib.Uint32Array, values:js.lib.Float64Array, count:Float, requiredCount:Float };

typedef Physics2DAbiStepStatus = String;

typedef Physics2DAbiWorldHandle = Float;

typedef Physics2DAbiWorldStatus = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
