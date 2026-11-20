package flight.esm.types.physics2d;

#if (js && flight_esm)
typedef Physics2DBodyType = String;

typedef Physics2DBrokenJoint = { joint:flight.esm.types.physics2d.Types.Physics2DJoint, forceX:Float, forceY:Float, torque:Float };

typedef Physics2DCollider = { local:flight.esm.types.collision.Types.CollisionBuiltInShape2D, world:flight.esm.types.collision.Types.CollisionBuiltInShape2D, material:flight.esm.types.physics2d.Types.Physics2DMaterial, filter:flight.esm.types.physics2d.Types.Physics2DCollisionFilter, sensor:Bool };

typedef Physics2DCollisionExplanation = { unsupportedKinds:Array<String>, status:String };

typedef Physics2DCollisionFilter = { categoryBits:Float, maskBits:Float, groupIndex:Float };

typedef Physics2DContact = { bodyA:Float, bodyB:Float, colliderA:Float, colliderB:Float, normalX:Float, normalY:Float, pointCount:Float, points:Array<flight.esm.types.physics2d.Types.Physics2DContactPoint>, friction:Float, restitution:Float, enabled:Bool, sensor:Bool, touching:Bool };

typedef Physics2DContactCallback = ((world:flight.esm.types.physics2d.Types.Physics2DWorld, contact:flight.esm.types.physics2d.Types.Physics2DContact) -> Void);

typedef Physics2DContactEvents = { began:Array<flight.esm.types.physics2d.Types.Physics2DContact>, ended:Array<flight.esm.types.physics2d.Types.Physics2DContact> };

typedef Physics2DContactHooks = { preSolve:Null<flight.esm.types.physics2d.Types.Physics2DContactCallback>, postSolve:Null<flight.esm.types.physics2d.Types.Physics2DContactCallback> };

typedef Physics2DContactIntakeGuard = ((world:flight.esm.types.physics2d.Types.Physics2DWorld) -> Void);

typedef Physics2DContactPoint = { x:Float, y:Float, depth:Float, featureId:Float, rAX:Float, rAY:Float, rBX:Float, rBY:Float, normalImpulse:Float, tangentImpulse:Float, normalMass:Float, tangentMass:Float, bias:Float };

typedef Physics2DDebugCircle = { feature:flight.esm.types.physics2d.Types.Physics2DDebugFeature, bodyA:Float, bodyB:Float, x:Float, y:Float, radius:Float };

typedef Physics2DDebugFeature = String;

typedef Physics2DDebugGeometry = { lines:Array<flight.esm.types.physics2d.Types.Physics2DDebugLine>, lineCount:Float, circles:Array<flight.esm.types.physics2d.Types.Physics2DDebugCircle>, circleCount:Float };

typedef Physics2DDebugGeometryOptions = { drawCentersOfMass:Bool, drawColliders:Bool, drawContacts:Bool, drawJoints:Bool, centerOfMassRadius:Float, contactNormalLength:Float, pointRadius:Float };

typedef Physics2DDebugLine = { feature:flight.esm.types.physics2d.Types.Physics2DDebugFeature, bodyA:Float, bodyB:Float, x0:Float, y0:Float, x1:Float, y1:Float };

typedef Physics2DDistanceJoint = { length:Float, frequencyHz:Float, dampingRatio:Float, kind:String, bodyA:Float, bodyB:Float, localAnchorAX:Float, localAnchorAY:Float, localAnchorBX:Float, localAnchorBY:Float, collideConnected:Bool, impulse0:Float, impulse1:Float, impulse2:Float, rAX:Float, rAY:Float, rBX:Float, rBY:Float, breakForce:Float, breakTorque:Float };

typedef Physics2DDistanceJointOptions = { length:Float, ?frequencyHz:Null<Float>, ?dampingRatio:Null<Float>, bodyA:Float, bodyB:Float, ?localAnchorAX:Null<Float>, ?localAnchorAY:Null<Float>, ?localAnchorBX:Null<Float>, ?localAnchorBY:Null<Float>, ?collideConnected:Null<Bool>, ?breakForce:Null<Float>, ?breakTorque:Null<Float> };

typedef Physics2DGearCoordinateKind = String;

typedef Physics2DGearJoint = { coordinateA:flight.esm.types.physics2d.Types.Physics2DGearCoordinateKind, coordinateB:flight.esm.types.physics2d.Types.Physics2DGearCoordinateKind, axisAX:Float, axisAY:Float, axisBX:Float, axisBY:Float, ratio:Float, constant:Float, kind:String, bodyA:Float, bodyB:Float, localAnchorAX:Float, localAnchorAY:Float, localAnchorBX:Float, localAnchorBY:Float, collideConnected:Bool, impulse0:Float, impulse1:Float, impulse2:Float, rAX:Float, rAY:Float, rBX:Float, rBY:Float, breakForce:Float, breakTorque:Float };

typedef Physics2DGearJointOptions = { coordinateA:flight.esm.types.physics2d.Types.Physics2DGearCoordinateKind, coordinateB:flight.esm.types.physics2d.Types.Physics2DGearCoordinateKind, constant:Float, ?axisAX:Null<Float>, ?axisAY:Null<Float>, ?axisBX:Null<Float>, ?axisBY:Null<Float>, ?ratio:Null<Float>, bodyA:Float, bodyB:Float, ?localAnchorAX:Null<Float>, ?localAnchorAY:Null<Float>, ?localAnchorBX:Null<Float>, ?localAnchorBY:Null<Float>, ?collideConnected:Null<Bool>, ?breakForce:Null<Float>, ?breakTorque:Null<Float> };

typedef Physics2DJoint = { kind:String, bodyA:Float, bodyB:Float, localAnchorAX:Float, localAnchorAY:Float, localAnchorBX:Float, localAnchorBY:Float, collideConnected:Bool, impulse0:Float, impulse1:Float, impulse2:Float, rAX:Float, rAY:Float, rBX:Float, rBY:Float, breakForce:Float, breakTorque:Float };

typedef Physics2DJointEvents = { broke:Array<flight.esm.types.physics2d.Types.Physics2DBrokenJoint> };

typedef Physics2DJointKind = String;

typedef Physics2DJointOptions = { bodyA:Float, bodyB:Float, ?localAnchorAX:Null<Float>, ?localAnchorAY:Null<Float>, ?localAnchorBX:Null<Float>, ?localAnchorBY:Null<Float>, ?collideConnected:Null<Bool>, ?breakForce:Null<Float>, ?breakTorque:Null<Float> };

typedef Physics2DJointReaction = { forceX:Float, forceY:Float, torque:Float };

typedef Physics2DJointResolution = { jointIndex:Float, kind:String, bodyA:Float, bodyB:Float, bodyAFound:Bool, bodyAUsed:Bool, bodyBFound:Bool, solverRegistered:Bool, status:flight.esm.types.physics2d.Types.Physics2DJointResolutionStatus };

typedef Physics2DJointResolutionExplanation = { joints:Array<flight.esm.types.physics2d.Types.Physics2DJointResolution>, readyCount:Float, status:String };

typedef Physics2DJointResolutionGuard = ((world:flight.esm.types.physics2d.Types.Physics2DWorld) -> Void);

typedef Physics2DJointResolutionStatus = String;

typedef Physics2DJointSolver = { prepare:((world:flight.esm.types.physics2d.Types.Physics2DWorld, joint:flight.esm.types.physics2d.Types.Physics2DJoint, dt:Float) -> Void), solve:((world:flight.esm.types.physics2d.Types.Physics2DWorld, joint:flight.esm.types.physics2d.Types.Physics2DJoint) -> Void), ?usesBodyA:Null<Bool>, ?keepsBodiesAwake:Null<Bool>, ?swapEnds:Null<((joint:flight.esm.types.physics2d.Types.Physics2DJoint) -> Bool)>, ?warmStart:Null<((world:flight.esm.types.physics2d.Types.Physics2DWorld, joint:flight.esm.types.physics2d.Types.Physics2DJoint) -> Void)>, ?scaleAccumulatedImpulses:Null<((joint:flight.esm.types.physics2d.Types.Physics2DJoint, timestepRatio:Float) -> Void)>, ?clearAccumulatedImpulses:Null<((joint:flight.esm.types.physics2d.Types.Physics2DJoint) -> Void)>, ?writeReaction:Null<((world:flight.esm.types.physics2d.Types.Physics2DWorld, joint:flight.esm.types.physics2d.Types.Physics2DJoint, inverseTimestep:Float, out:flight.esm.types.physics2d.Types.Physics2DJointReaction) -> Bool)> };

typedef Physics2DMassData = { mass:Float, inertia:Float, centerX:Float, centerY:Float };

typedef Physics2DMaterial = { density:Float, friction:Float, restitution:Float };

typedef Physics2DMouseJoint = { targetX:Float, targetY:Float, maxForce:Float, frequencyHz:Float, dampingRatio:Float, kind:String, bodyA:Float, bodyB:Float, localAnchorAX:Float, localAnchorAY:Float, localAnchorBX:Float, localAnchorBY:Float, collideConnected:Bool, impulse0:Float, impulse1:Float, impulse2:Float, rAX:Float, rAY:Float, rBX:Float, rBY:Float, breakForce:Float, breakTorque:Float };

typedef Physics2DMouseJointOptions = { body:Float, targetX:Float, targetY:Float, maxForce:Float, ?localAnchorX:Null<Float>, ?localAnchorY:Null<Float>, ?frequencyHz:Null<Float>, ?dampingRatio:Null<Float>, ?breakForce:Null<Float>, ?breakTorque:Null<Float> };

typedef Physics2DPrismaticJoint = { localAxisAX:Float, localAxisAY:Float, referenceAngle:Float, enableMotor:Bool, motorSpeed:Float, maxMotorForce:Float, motorImpulse:Float, enableLimit:Bool, lowerTranslation:Float, upperTranslation:Float, enableLimitSpring:Bool, limitFrequencyHz:Float, limitDampingRatio:Float, kind:String, bodyA:Float, bodyB:Float, localAnchorAX:Float, localAnchorAY:Float, localAnchorBX:Float, localAnchorBY:Float, collideConnected:Bool, impulse0:Float, impulse1:Float, impulse2:Float, rAX:Float, rAY:Float, rBX:Float, rBY:Float, breakForce:Float, breakTorque:Float };

typedef Physics2DPrismaticJointOptions = { ?localAxisAX:Null<Float>, ?localAxisAY:Null<Float>, ?referenceAngle:Null<Float>, ?enableMotor:Null<Bool>, ?motorSpeed:Null<Float>, ?maxMotorForce:Null<Float>, ?enableLimit:Null<Bool>, ?lowerTranslation:Null<Float>, ?upperTranslation:Null<Float>, ?enableLimitSpring:Null<Bool>, ?limitFrequencyHz:Null<Float>, ?limitDampingRatio:Null<Float>, bodyA:Float, bodyB:Float, ?localAnchorAX:Null<Float>, ?localAnchorAY:Null<Float>, ?localAnchorBX:Null<Float>, ?localAnchorBY:Null<Float>, ?collideConnected:Null<Bool>, ?breakForce:Null<Float>, ?breakTorque:Null<Float> };

typedef Physics2DPulleyJoint = { groundAnchorAX:Float, groundAnchorAY:Float, groundAnchorBX:Float, groundAnchorBY:Float, ratio:Float, constant:Float, kind:String, bodyA:Float, bodyB:Float, localAnchorAX:Float, localAnchorAY:Float, localAnchorBX:Float, localAnchorBY:Float, collideConnected:Bool, impulse0:Float, impulse1:Float, impulse2:Float, rAX:Float, rAY:Float, rBX:Float, rBY:Float, breakForce:Float, breakTorque:Float };

typedef Physics2DPulleyJointOptions = { groundAnchorAX:Float, groundAnchorAY:Float, groundAnchorBX:Float, groundAnchorBY:Float, constant:Float, ?ratio:Null<Float>, bodyA:Float, bodyB:Float, ?localAnchorAX:Null<Float>, ?localAnchorAY:Null<Float>, ?localAnchorBX:Null<Float>, ?localAnchorBY:Null<Float>, ?collideConnected:Null<Bool>, ?breakForce:Null<Float>, ?breakTorque:Null<Float> };

typedef Physics2DQueryFilter = { categoryBits:Float, maskBits:Float, includeSensors:Bool, includeDynamic:Bool, includeKinematic:Bool, includeStatic:Bool };

typedef Physics2DQueryHit = { body:flight.esm.types.physics2d.Types.RigidBody2D, collider:flight.esm.types.physics2d.Types.Physics2DCollider, colliderIndex:Float };

typedef Physics2DQueryResult = { hits:Array<flight.esm.types.physics2d.Types.Physics2DQueryHit>, hitCount:Float };

typedef Physics2DRayHit = { fraction:Float, x:Float, y:Float, normalX:Float, normalY:Float, body:flight.esm.types.physics2d.Types.RigidBody2D, collider:flight.esm.types.physics2d.Types.Physics2DCollider, colliderIndex:Float };

typedef Physics2DRayResult = { hits:Array<flight.esm.types.physics2d.Types.Physics2DRayHit>, hitCount:Float };

typedef Physics2DRevoluteJoint = { enableMotor:Bool, motorSpeed:Float, maxMotorTorque:Float, motorImpulse:Float, enableLimit:Bool, lowerAngle:Float, upperAngle:Float, referenceAngle:Float, enableLimitSpring:Bool, limitFrequencyHz:Float, limitDampingRatio:Float, kind:String, bodyA:Float, bodyB:Float, localAnchorAX:Float, localAnchorAY:Float, localAnchorBX:Float, localAnchorBY:Float, collideConnected:Bool, impulse0:Float, impulse1:Float, impulse2:Float, rAX:Float, rAY:Float, rBX:Float, rBY:Float, breakForce:Float, breakTorque:Float };

typedef Physics2DRevoluteJointOptions = { ?enableMotor:Null<Bool>, ?motorSpeed:Null<Float>, ?maxMotorTorque:Null<Float>, ?enableLimit:Null<Bool>, ?lowerAngle:Null<Float>, ?upperAngle:Null<Float>, ?referenceAngle:Null<Float>, ?enableLimitSpring:Null<Bool>, ?limitFrequencyHz:Null<Float>, ?limitDampingRatio:Null<Float>, bodyA:Float, bodyB:Float, ?localAnchorAX:Null<Float>, ?localAnchorAY:Null<Float>, ?localAnchorBX:Null<Float>, ?localAnchorBY:Null<Float>, ?collideConnected:Null<Bool>, ?breakForce:Null<Float>, ?breakTorque:Null<Float> };

typedef Physics2DRopeJoint = { maxLength:Float, kind:String, bodyA:Float, bodyB:Float, localAnchorAX:Float, localAnchorAY:Float, localAnchorBX:Float, localAnchorBY:Float, collideConnected:Bool, impulse0:Float, impulse1:Float, impulse2:Float, rAX:Float, rAY:Float, rBX:Float, rBY:Float, breakForce:Float, breakTorque:Float };

typedef Physics2DRopeJointOptions = { maxLength:Float, bodyA:Float, bodyB:Float, ?localAnchorAX:Null<Float>, ?localAnchorAY:Null<Float>, ?localAnchorBX:Null<Float>, ?localAnchorBY:Null<Float>, ?collideConnected:Null<Bool>, ?breakForce:Null<Float>, ?breakTorque:Null<Float> };

typedef Physics2DShapeCastResult = { body:Null<flight.esm.types.physics2d.Types.RigidBody2D>, collider:Null<flight.esm.types.physics2d.Types.Physics2DCollider>, colliderIndex:Float, hit:Bool, fraction:Float, x:Float, y:Float, normalX:Float, normalY:Float };

typedef Physics2DSolverConfig = { allowSleeping:Bool, sleepLinearThreshold:Float, sleepAngularThreshold:Float, timeToSleep:Float, velocityIterations:Float, positionIterations:Float, penetrationSlop:Float, positionCorrection:Float, restitutionThreshold:Float, warmStarting:Bool, continuousCollision:Bool, maxCcdSubsteps:Float, maxCcdRotationSubsteps:Float };

typedef Physics2DStepExplanation = { bodyStateValid:Bool, contactStateValid:Bool, gravityValid:Bool, jointStateValid:Bool, previousTimestepValid:Bool, solverConfigValid:Bool, timestepValid:Bool, velocityIterationsValid:Bool, positionIterationsValid:Bool, status:String };

typedef Physics2DStepGuard = ((world:flight.esm.types.physics2d.Types.Physics2DWorld, dt:Float) -> Void);

typedef Physics2DWeldJoint = { referenceAngle:Float, kind:String, bodyA:Float, bodyB:Float, localAnchorAX:Float, localAnchorAY:Float, localAnchorBX:Float, localAnchorBY:Float, collideConnected:Bool, impulse0:Float, impulse1:Float, impulse2:Float, rAX:Float, rAY:Float, rBX:Float, rBY:Float, breakForce:Float, breakTorque:Float };

typedef Physics2DWeldJointOptions = { ?referenceAngle:Null<Float>, bodyA:Float, bodyB:Float, ?localAnchorAX:Null<Float>, ?localAnchorAY:Null<Float>, ?localAnchorBX:Null<Float>, ?localAnchorBY:Null<Float>, ?collideConnected:Null<Bool>, ?breakForce:Null<Float>, ?breakTorque:Null<Float> };

typedef Physics2DWheelJoint = { localAxisAX:Float, localAxisAY:Float, restTranslation:Float, frequencyHz:Float, dampingRatio:Float, enableMotor:Bool, motorSpeed:Float, maxMotorTorque:Float, motorImpulse:Float, kind:String, bodyA:Float, bodyB:Float, localAnchorAX:Float, localAnchorAY:Float, localAnchorBX:Float, localAnchorBY:Float, collideConnected:Bool, impulse0:Float, impulse1:Float, impulse2:Float, rAX:Float, rAY:Float, rBX:Float, rBY:Float, breakForce:Float, breakTorque:Float };

typedef Physics2DWheelJointOptions = { ?localAxisAX:Null<Float>, ?localAxisAY:Null<Float>, ?restTranslation:Null<Float>, ?frequencyHz:Null<Float>, ?dampingRatio:Null<Float>, ?enableMotor:Null<Bool>, ?motorSpeed:Null<Float>, ?maxMotorTorque:Null<Float>, bodyA:Float, bodyB:Float, ?localAnchorAX:Null<Float>, ?localAnchorAY:Null<Float>, ?localAnchorBX:Null<Float>, ?localAnchorBY:Null<Float>, ?collideConnected:Null<Bool>, ?breakForce:Null<Float>, ?breakTorque:Null<Float> };

typedef Physics2DWorld = { version:Float, bodies:Array<flight.esm.types.physics2d.Types.RigidBody2D>, bodyByIndex:js.lib.Map<Float, flight.esm.types.physics2d.Types.RigidBody2D>, contacts:Array<flight.esm.types.physics2d.Types.Physics2DContact>, joints:Array<flight.esm.types.physics2d.Types.Physics2DJoint>, jointSolvers:js.lib.Map<String, flight.esm.types.physics2d.Types.Physics2DJointSolver>, jointCollisionSuppressions:js.lib.Map<Float, js.lib.Map<Float, Float>>, events:flight.esm.types.physics2d.Types.Physics2DContactEvents, jointEvents:flight.esm.types.physics2d.Types.Physics2DJointEvents, contactHooks:flight.esm.types.physics2d.Types.Physics2DContactHooks, index:flight.esm.types.spatial.Types.SpatialIndexBackend2D, config:flight.esm.types.physics2d.Types.Physics2DSolverConfig, islandParents:js.lib.Map<Float, Float>, islandSleepTimers:js.lib.Map<Float, Float>, solveIslandByRoot:js.lib.Map<Float, Float>, solveIslandRoots:Array<Float>, solveIslandBodyStarts:Array<Float>, solveIslandBodyCounts:Array<Float>, solveIslandContactStarts:Array<Float>, solveIslandContactCounts:Array<Float>, solveIslandJointStarts:Array<Float>, solveIslandJointCounts:Array<Float>, solveIslandBodyIndices:Array<Float>, solveIslandContactIndices:Array<Float>, solveIslandJointIndices:Array<Float>, solveIslandCursors:Array<Float>, gravityX:Float, gravityY:Float, previousTimestep:Float, nextBodyIndex:Float };

typedef RigidBody2D = { index:Float, type:flight.esm.types.physics2d.Types.Physics2DBodyType, x:Float, y:Float, angle:Float, velocityX:Float, velocityY:Float, angularVelocity:Float, forceX:Float, forceY:Float, torque:Float, mass:Float, inverseMass:Float, inertia:Float, inverseInertia:Float, centerX:Float, centerY:Float, linearDamping:Float, angularDamping:Float, gravityScale:Float, fixedRotation:Bool, bullet:Bool, sleeping:Bool, sleepEnabled:Bool, sleepTimer:Float, colliders:Array<flight.esm.types.physics2d.Types.Physics2DCollider> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
