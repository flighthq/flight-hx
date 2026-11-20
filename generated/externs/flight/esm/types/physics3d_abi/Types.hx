package flight.esm.types.physics3d_abi;

#if (js && flight_esm)
typedef Physics3DAbi = { version:Float, capabilities:Float, createWorld:(() -> Float), destroyWorld:((world:Float) -> Bool), getWorldStatus:((world:Float) -> flight.esm.types.physics3d_abi.Types.Physics3DAbiWorldStatus), execute:((world:Float, commands:flight.esm.types.physics3d_abi.Types.Physics3DAbiCommandBuffer, out:flight.esm.types.physics3d_abi.Types.Physics3DAbiExecutionResult) -> Bool), step:((world:Float, dt:Float, hooks:Null<flight.esm.types.physics3d_abi.Types.Physics3DAbiContactHooks>) -> flight.esm.types.physics3d_abi.Types.Physics3DAbiStepStatus), readBodies:((world:Float, bodyIds:Null<js.lib.Uint32Array>, out:flight.esm.types.physics3d_abi.Types.Physics3DAbiBodyBuffer) -> Bool), readContacts:((world:Float, selection:flight.esm.types.physics3d_abi.Types.Physics3DAbiContactSelection, out:flight.esm.types.physics3d_abi.Types.Physics3DAbiContactBuffer) -> Bool), readJoints:((world:Float, out:flight.esm.types.physics3d_abi.Types.Physics3DAbiJointBuffer) -> Bool), queryPoint:((world:Float, x:Float, y:Float, z:Float, filter:Null<flight.esm.types.physics3d.Types.Physics3DQueryFilter>, out:flight.esm.types.physics3d_abi.Types.Physics3DAbiQueryBuffer) -> Bool), queryRay:((world:Float, originX:Float, originY:Float, originZ:Float, directionX:Float, directionY:Float, directionZ:Float, maxFraction:Float, closestOnly:Bool, filter:Null<flight.esm.types.physics3d.Types.Physics3DQueryFilter>, out:flight.esm.types.physics3d_abi.Types.Physics3DAbiQueryBuffer) -> Bool), queryRegion:((world:Float, region:flight.esm.types.spatial.Types.SpatialAabb3D, filter:Null<flight.esm.types.physics3d.Types.Physics3DQueryFilter>, out:flight.esm.types.physics3d_abi.Types.Physics3DAbiQueryBuffer) -> Bool), queryShapeCast:((world:Float, shape:flight.esm.types.collision.Types.CollisionBuiltInShape3D, dx:Float, dy:Float, dz:Float, maxFraction:Float, filter:Null<flight.esm.types.physics3d.Types.Physics3DQueryFilter>, out:flight.esm.types.physics3d_abi.Types.Physics3DAbiQueryBuffer) -> Bool) };

typedef Physics3DAbiBodyBuffer = { ids:js.lib.Uint32Array, flags:js.lib.Uint32Array, values:js.lib.Float64Array, count:Float, requiredCount:Float };

typedef Physics3DAbiCommandBuffer = { data:js.lib.Uint8Array, byteLength:Float, commandCount:Float };

typedef Physics3DAbiContactBuffer = { ids:js.lib.Uint32Array, flags:js.lib.Uint32Array, pointStarts:js.lib.Uint32Array, pointCounts:js.lib.Uint32Array, values:js.lib.Float64Array, pointFeatureIds:js.lib.Uint32Array, pointValues:js.lib.Float64Array, count:Float, pointCount:Float, requiredCount:Float, requiredPointCount:Float };

typedef Physics3DAbiContactHook = ((contact:flight.esm.types.physics3d_abi.Types.Physics3DAbiContactBuffer) -> Void);

typedef Physics3DAbiContactHooks = { buffer:flight.esm.types.physics3d_abi.Types.Physics3DAbiContactBuffer, preSolve:Null<flight.esm.types.physics3d_abi.Types.Physics3DAbiContactHook>, postSolve:Null<flight.esm.types.physics3d_abi.Types.Physics3DAbiContactHook> };

typedef Physics3DAbiContactSelection = String;

typedef Physics3DAbiExecutionResult = { status:flight.esm.types.physics3d_abi.Types.Physics3DAbiExecutionStatus, commandIndex:Float, byteOffset:Float, commandKind:Float };

typedef Physics3DAbiExecutionStatus = String;

typedef Physics3DAbiJointBuffer = { ids:js.lib.Uint32Array, flags:js.lib.Uint32Array, values:js.lib.Float64Array, count:Float, requiredCount:Float };

typedef Physics3DAbiObjectId = Float;

typedef Physics3DAbiQueryBuffer = { bodyIds:js.lib.Uint32Array, colliderIds:js.lib.Uint32Array, values:js.lib.Float64Array, count:Float, requiredCount:Float };

typedef Physics3DAbiStepStatus = String;

typedef Physics3DAbiWorldHandle = Float;

typedef Physics3DAbiWorldStatus = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
