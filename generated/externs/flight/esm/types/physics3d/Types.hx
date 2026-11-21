package flight.esm.types.physics3d;

#if (js && flight_esm)
typedef Physics3DBallAndSocketJoint = flight.esm.types.physics3d.Types.Physics3DJoint;

typedef Physics3DBallAndSocketJointOptions = flight.esm.types.physics3d.Types.Physics3DJointOptions;

typedef Physics3DBodyType = String;

typedef Physics3DCollider = { local:flight.esm.types.collision.Types.CollisionColliderShape3D, world:flight.esm.types.collision.Types.CollisionColliderShape3D, material:flight.esm.types.physics3d.Types.Physics3DMaterial, filter:flight.esm.types.physics3d.Types.Physics3DCollisionFilter, sensor:Bool };

typedef Physics3DCollisionExplanation = { unsupportedKinds:Array<String>, status:String };

typedef Physics3DCollisionFilter = { categoryBits:Float, maskBits:Float, groupIndex:Float };

typedef Physics3DConeTwistJoint = { enableSwingLimit:Bool, swingLimitY:Float, swingLimitZ:Float, enableTwistLimit:Bool, lowerTwistAngle:Float, upperTwistAngle:Float, enableLimitSpring:Bool, limitFrequencyHz:Float, limitDampingRatio:Float, swingLimitImpulse:Float, lowerTwistImpulse:Float, upperTwistImpulse:Float, kind:String, bodyA:Float, bodyB:Float, localAnchorAX:Float, localAnchorAY:Float, localAnchorAZ:Float, localAnchorBX:Float, localAnchorBY:Float, localAnchorBZ:Float, collideConnected:Bool, breakForce:Float, breakTorque:Float, broken:Bool, impulse0:Float, impulse1:Float, impulse2:Float, impulse3:Float, impulse4:Float, impulse5:Float, rAX:Float, rAY:Float, rAZ:Float, rBX:Float, rBY:Float, rBZ:Float, localRotationAX:Float, localRotationAY:Float, localRotationAZ:Float, localRotationAW:Float, localRotationBX:Float, localRotationBY:Float, localRotationBZ:Float, localRotationBW:Float };

typedef Physics3DConeTwistJointOptions = { ?enableSwingLimit:Null<Bool>, ?swingLimitY:Null<Float>, ?swingLimitZ:Null<Float>, ?enableTwistLimit:Null<Bool>, ?lowerTwistAngle:Null<Float>, ?upperTwistAngle:Null<Float>, ?enableLimitSpring:Null<Bool>, ?limitFrequencyHz:Null<Float>, ?limitDampingRatio:Null<Float>, ?localRotationAX:Null<Float>, ?localRotationAY:Null<Float>, ?localRotationAZ:Null<Float>, ?localRotationAW:Null<Float>, ?localRotationBX:Null<Float>, ?localRotationBY:Null<Float>, ?localRotationBZ:Null<Float>, ?localRotationBW:Null<Float>, bodyA:Float, bodyB:Float, ?localAnchorAX:Null<Float>, ?localAnchorAY:Null<Float>, ?localAnchorAZ:Null<Float>, ?localAnchorBX:Null<Float>, ?localAnchorBY:Null<Float>, ?localAnchorBZ:Null<Float>, ?collideConnected:Null<Bool>, ?breakForce:Null<Float>, ?breakTorque:Null<Float> };

typedef Physics3DContact = { bodyA:Float, bodyB:Float, colliderA:Float, colliderB:Float, normalX:Float, normalY:Float, normalZ:Float, pointCount:Float, points:Array<flight.esm.types.physics3d.Types.Physics3DContactPoint>, friction:Float, restitution:Float, enabled:Bool, sensor:Bool, touching:Bool };

typedef Physics3DContactCallback = ((world:flight.esm.types.physics3d.Types.Physics3DWorld, contact:flight.esm.types.physics3d.Types.Physics3DContact) -> Void);

typedef Physics3DContactConstraint = { contact:Float, tangent0X:Float, tangent0Y:Float, tangent0Z:Float, tangent1X:Float, tangent1Y:Float, tangent1Z:Float, pointCount:Float, points:Array<flight.esm.types.physics3d.Types.Physics3DContactConstraintPoint> };

typedef Physics3DContactConstraintPoint = { featureId:Float, normalImpulse:Float, tangentImpulse0:Float, tangentImpulse1:Float, normalMass:Float, tangentMass0:Float, tangentMass1:Float, bias:Float };

typedef Physics3DContactEvents = { began:Array<flight.esm.types.physics3d.Types.Physics3DContact>, ended:Array<flight.esm.types.physics3d.Types.Physics3DContact> };

typedef Physics3DContactHooks = { preSolve:Null<flight.esm.types.physics3d.Types.Physics3DContactCallback>, postSolve:Null<flight.esm.types.physics3d.Types.Physics3DContactCallback> };

typedef Physics3DContactIntakeGuard = ((world:flight.esm.types.physics3d.Types.Physics3DWorld) -> Void);

typedef Physics3DContactPoint = { x:Float, y:Float, z:Float, depth:Float, featureId:Float, rAX:Float, rAY:Float, rAZ:Float, rBX:Float, rBY:Float, rBZ:Float };

typedef Physics3DDebugFeature = String;

typedef Physics3DDebugGeometry = { lines:Array<flight.esm.types.physics3d.Types.Physics3DDebugLine>, lineCount:Float, spheres:Array<flight.esm.types.physics3d.Types.Physics3DDebugSphere>, sphereCount:Float };

typedef Physics3DDebugGeometryOptions = { drawCentersOfMass:Bool, drawColliders:Bool, drawContacts:Bool, drawJoints:Bool, centerOfMassRadius:Float, contactNormalLength:Float };

typedef Physics3DDebugLine = { feature:flight.esm.types.physics3d.Types.Physics3DDebugFeature, bodyA:Float, bodyB:Float, x0:Float, y0:Float, z0:Float, x1:Float, y1:Float, z1:Float };

typedef Physics3DDebugSphere = { feature:flight.esm.types.physics3d.Types.Physics3DDebugFeature, bodyA:Float, bodyB:Float, x:Float, y:Float, z:Float, radius:Float };

typedef Physics3DDistanceJoint = { length:Float, enableSpring:Bool, frequencyHz:Float, dampingRatio:Float, enableLimit:Bool, minLength:Float, maxLength:Float, lowerLimitImpulse:Float, upperLimitImpulse:Float, kind:String, bodyA:Float, bodyB:Float, localAnchorAX:Float, localAnchorAY:Float, localAnchorAZ:Float, localAnchorBX:Float, localAnchorBY:Float, localAnchorBZ:Float, collideConnected:Bool, breakForce:Float, breakTorque:Float, broken:Bool, impulse0:Float, impulse1:Float, impulse2:Float, impulse3:Float, impulse4:Float, impulse5:Float, rAX:Float, rAY:Float, rAZ:Float, rBX:Float, rBY:Float, rBZ:Float };

typedef Physics3DDistanceJointOptions = { ?length:Null<Float>, ?enableSpring:Null<Bool>, ?frequencyHz:Null<Float>, ?dampingRatio:Null<Float>, ?enableLimit:Null<Bool>, ?minLength:Null<Float>, ?maxLength:Null<Float>, bodyA:Float, bodyB:Float, ?localAnchorAX:Null<Float>, ?localAnchorAY:Null<Float>, ?localAnchorAZ:Null<Float>, ?localAnchorBX:Null<Float>, ?localAnchorBY:Null<Float>, ?localAnchorBZ:Null<Float>, ?collideConnected:Null<Bool>, ?breakForce:Null<Float>, ?breakTorque:Null<Float> };

typedef Physics3DFixedJoint = { kind:String, bodyA:Float, bodyB:Float, localAnchorAX:Float, localAnchorAY:Float, localAnchorAZ:Float, localAnchorBX:Float, localAnchorBY:Float, localAnchorBZ:Float, collideConnected:Bool, breakForce:Float, breakTorque:Float, broken:Bool, impulse0:Float, impulse1:Float, impulse2:Float, impulse3:Float, impulse4:Float, impulse5:Float, rAX:Float, rAY:Float, rAZ:Float, rBX:Float, rBY:Float, rBZ:Float, localRotationAX:Float, localRotationAY:Float, localRotationAZ:Float, localRotationAW:Float, localRotationBX:Float, localRotationBY:Float, localRotationBZ:Float, localRotationBW:Float };

typedef Physics3DFixedJointOptions = flight.esm.types.physics3d.Types.Physics3DJointFrameOptions;

typedef Physics3DGeneric6DofJoint = { lowerLinearX:Float, lowerLinearY:Float, lowerLinearZ:Float, upperLinearX:Float, upperLinearY:Float, upperLinearZ:Float, lowerAngularX:Float, lowerAngularY:Float, lowerAngularZ:Float, upperAngularX:Float, upperAngularY:Float, upperAngularZ:Float, enableLimitSpring:Bool, limitFrequencyHz:Float, limitDampingRatio:Float, lowerLimitImpulses:Array<Float>, upperLimitImpulses:Array<Float>, kind:String, bodyA:Float, bodyB:Float, localAnchorAX:Float, localAnchorAY:Float, localAnchorAZ:Float, localAnchorBX:Float, localAnchorBY:Float, localAnchorBZ:Float, collideConnected:Bool, breakForce:Float, breakTorque:Float, broken:Bool, impulse0:Float, impulse1:Float, impulse2:Float, impulse3:Float, impulse4:Float, impulse5:Float, rAX:Float, rAY:Float, rAZ:Float, rBX:Float, rBY:Float, rBZ:Float, localRotationAX:Float, localRotationAY:Float, localRotationAZ:Float, localRotationAW:Float, localRotationBX:Float, localRotationBY:Float, localRotationBZ:Float, localRotationBW:Float };

typedef Physics3DGeneric6DofJointOptions = { ?lowerLinearX:Null<Float>, ?lowerLinearY:Null<Float>, ?lowerLinearZ:Null<Float>, ?upperLinearX:Null<Float>, ?upperLinearY:Null<Float>, ?upperLinearZ:Null<Float>, ?lowerAngularX:Null<Float>, ?lowerAngularY:Null<Float>, ?lowerAngularZ:Null<Float>, ?upperAngularX:Null<Float>, ?upperAngularY:Null<Float>, ?upperAngularZ:Null<Float>, ?enableLimitSpring:Null<Bool>, ?limitFrequencyHz:Null<Float>, ?limitDampingRatio:Null<Float>, ?localRotationAX:Null<Float>, ?localRotationAY:Null<Float>, ?localRotationAZ:Null<Float>, ?localRotationAW:Null<Float>, ?localRotationBX:Null<Float>, ?localRotationBY:Null<Float>, ?localRotationBZ:Null<Float>, ?localRotationBW:Null<Float>, bodyA:Float, bodyB:Float, ?localAnchorAX:Null<Float>, ?localAnchorAY:Null<Float>, ?localAnchorAZ:Null<Float>, ?localAnchorBX:Null<Float>, ?localAnchorBY:Null<Float>, ?localAnchorBZ:Null<Float>, ?collideConnected:Null<Bool>, ?breakForce:Null<Float>, ?breakTorque:Null<Float> };

typedef Physics3DHingeJoint = { enableLimit:Bool, lowerAngle:Float, upperAngle:Float, enableMotor:Bool, motorSpeed:Float, maxMotorTorque:Float, motorImpulse:Float, enableLimitSpring:Bool, limitFrequencyHz:Float, limitDampingRatio:Float, lowerLimitImpulse:Float, upperLimitImpulse:Float, kind:String, bodyA:Float, bodyB:Float, localAnchorAX:Float, localAnchorAY:Float, localAnchorAZ:Float, localAnchorBX:Float, localAnchorBY:Float, localAnchorBZ:Float, collideConnected:Bool, breakForce:Float, breakTorque:Float, broken:Bool, impulse0:Float, impulse1:Float, impulse2:Float, impulse3:Float, impulse4:Float, impulse5:Float, rAX:Float, rAY:Float, rAZ:Float, rBX:Float, rBY:Float, rBZ:Float, localRotationAX:Float, localRotationAY:Float, localRotationAZ:Float, localRotationAW:Float, localRotationBX:Float, localRotationBY:Float, localRotationBZ:Float, localRotationBW:Float };

typedef Physics3DHingeJointOptions = { ?enableLimit:Null<Bool>, ?lowerAngle:Null<Float>, ?upperAngle:Null<Float>, ?enableMotor:Null<Bool>, ?motorSpeed:Null<Float>, ?maxMotorTorque:Null<Float>, ?enableLimitSpring:Null<Bool>, ?limitFrequencyHz:Null<Float>, ?limitDampingRatio:Null<Float>, ?localRotationAX:Null<Float>, ?localRotationAY:Null<Float>, ?localRotationAZ:Null<Float>, ?localRotationAW:Null<Float>, ?localRotationBX:Null<Float>, ?localRotationBY:Null<Float>, ?localRotationBZ:Null<Float>, ?localRotationBW:Null<Float>, bodyA:Float, bodyB:Float, ?localAnchorAX:Null<Float>, ?localAnchorAY:Null<Float>, ?localAnchorAZ:Null<Float>, ?localAnchorBX:Null<Float>, ?localAnchorBY:Null<Float>, ?localAnchorBZ:Null<Float>, ?collideConnected:Null<Bool>, ?breakForce:Null<Float>, ?breakTorque:Null<Float> };

typedef Physics3DJoint = { kind:String, bodyA:Float, bodyB:Float, localAnchorAX:Float, localAnchorAY:Float, localAnchorAZ:Float, localAnchorBX:Float, localAnchorBY:Float, localAnchorBZ:Float, collideConnected:Bool, breakForce:Float, breakTorque:Float, broken:Bool, impulse0:Float, impulse1:Float, impulse2:Float, impulse3:Float, impulse4:Float, impulse5:Float, rAX:Float, rAY:Float, rAZ:Float, rBX:Float, rBY:Float, rBZ:Float };

typedef Physics3DJointEvents = { broke:Array<flight.esm.types.physics3d.Types.Physics3DJoint> };

typedef Physics3DJointExplanation = { kind:String, index:Float, hasSolver:Bool, bodiesResolvable:Bool, status:String };

typedef Physics3DJointFrameOptions = { ?localRotationAX:Null<Float>, ?localRotationAY:Null<Float>, ?localRotationAZ:Null<Float>, ?localRotationAW:Null<Float>, ?localRotationBX:Null<Float>, ?localRotationBY:Null<Float>, ?localRotationBZ:Null<Float>, ?localRotationBW:Null<Float>, bodyA:Float, bodyB:Float, ?localAnchorAX:Null<Float>, ?localAnchorAY:Null<Float>, ?localAnchorAZ:Null<Float>, ?localAnchorBX:Null<Float>, ?localAnchorBY:Null<Float>, ?localAnchorBZ:Null<Float>, ?collideConnected:Null<Bool>, ?breakForce:Null<Float>, ?breakTorque:Null<Float> };

typedef Physics3DJointFrames = { localRotationAX:Float, localRotationAY:Float, localRotationAZ:Float, localRotationAW:Float, localRotationBX:Float, localRotationBY:Float, localRotationBZ:Float, localRotationBW:Float };

typedef Physics3DJointKind = String;

typedef Physics3DJointOptions = { bodyA:Float, bodyB:Float, ?localAnchorAX:Null<Float>, ?localAnchorAY:Null<Float>, ?localAnchorAZ:Null<Float>, ?localAnchorBX:Null<Float>, ?localAnchorBY:Null<Float>, ?localAnchorBZ:Null<Float>, ?collideConnected:Null<Bool>, ?breakForce:Null<Float>, ?breakTorque:Null<Float> };

typedef Physics3DJointReaction = { forceX:Float, forceY:Float, forceZ:Float, torqueX:Float, torqueY:Float, torqueZ:Float };

typedef Physics3DJointResolutionGuard = ((world:flight.esm.types.physics3d.Types.Physics3DWorld) -> Void);

typedef Physics3DJointSolver = { prepare:((world:flight.esm.types.physics3d.Types.Physics3DWorld, joint:flight.esm.types.physics3d.Types.Physics3DJoint, dt:Float) -> Void), solve:((world:flight.esm.types.physics3d.Types.Physics3DWorld, joint:flight.esm.types.physics3d.Types.Physics3DJoint, dt:Float) -> Void), ?usesBodyA:Null<Bool>, ?keepsBodiesAwake:Null<Bool>, ?swapEnds:Null<((joint:flight.esm.types.physics3d.Types.Physics3DJoint) -> Bool)>, ?writeReaction:Null<((joint:flight.esm.types.physics3d.Types.Physics3DJoint, inverseDt:Float, out:flight.esm.types.physics3d.Types.Physics3DJointReaction) -> Bool)>, ?warmStart:Null<((world:flight.esm.types.physics3d.Types.Physics3DWorld, joint:flight.esm.types.physics3d.Types.Physics3DJoint) -> Void)>, ?scaleAccumulatedImpulses:Null<((joint:flight.esm.types.physics3d.Types.Physics3DJoint, timestepRatio:Float) -> Void)>, ?clearAccumulatedImpulses:Null<((joint:flight.esm.types.physics3d.Types.Physics3DJoint) -> Void)> };

typedef Physics3DMassData = { mass:Float, inertiaXX:Float, inertiaYY:Float, inertiaZZ:Float, inertiaXY:Float, inertiaXZ:Float, inertiaYZ:Float, centerX:Float, centerY:Float, centerZ:Float };

typedef Physics3DMaterial = { density:Float, friction:Float, restitution:Float };

typedef Physics3DQueryFilter = { categoryBits:Float, maskBits:Float, includeSensors:Bool, includeDynamic:Bool, includeKinematic:Bool, includeStatic:Bool };

typedef Physics3DQueryHit = { body:flight.esm.types.physics3d.Types.RigidBody3D, collider:flight.esm.types.physics3d.Types.Physics3DCollider, colliderIndex:Float };

typedef Physics3DQueryResult = { hits:Array<flight.esm.types.physics3d.Types.Physics3DQueryHit>, hitCount:Float };

typedef Physics3DRayHit = { fraction:Float, x:Float, y:Float, z:Float, normalX:Float, normalY:Float, normalZ:Float, body:flight.esm.types.physics3d.Types.RigidBody3D, collider:flight.esm.types.physics3d.Types.Physics3DCollider, colliderIndex:Float };

typedef Physics3DRayResult = { hits:Array<flight.esm.types.physics3d.Types.Physics3DRayHit>, hitCount:Float };

typedef Physics3DRotationalCcdEnvelope = { angularTravel:Float, sampleCount:Float, maxAngularIncrement:Float, maxPointArcTravel:Float, targetIncrementMet:Bool };

typedef Physics3DSequentialImpulseConfig = { velocityIterations:Float, positionIterations:Float, penetrationSlop:Float, positionCorrection:Float, restitutionThreshold:Float, warmStarting:Bool };

typedef Physics3DSequentialImpulseState = { constraints:Array<flight.esm.types.physics3d.Types.Physics3DContactConstraint>, constraintByContact:js.lib.Map<flight.esm.types.physics3d.Types.Physics3DContact, flight.esm.types.physics3d.Types.Physics3DContactConstraint> };

typedef Physics3DShapeCastResult = { body:Null<flight.esm.types.physics3d.Types.RigidBody3D>, collider:Null<flight.esm.types.physics3d.Types.Physics3DCollider>, colliderIndex:Float, hit:Bool, fraction:Float, x:Float, y:Float, z:Float, normalX:Float, normalY:Float, normalZ:Float };

typedef Physics3DSliderJoint = { enableLimit:Bool, lowerTranslation:Float, upperTranslation:Float, enableMotor:Bool, motorSpeed:Float, maxMotorForce:Float, motorImpulse:Float, enableLimitSpring:Bool, limitFrequencyHz:Float, limitDampingRatio:Float, lowerLimitImpulse:Float, upperLimitImpulse:Float, kind:String, bodyA:Float, bodyB:Float, localAnchorAX:Float, localAnchorAY:Float, localAnchorAZ:Float, localAnchorBX:Float, localAnchorBY:Float, localAnchorBZ:Float, collideConnected:Bool, breakForce:Float, breakTorque:Float, broken:Bool, impulse0:Float, impulse1:Float, impulse2:Float, impulse3:Float, impulse4:Float, impulse5:Float, rAX:Float, rAY:Float, rAZ:Float, rBX:Float, rBY:Float, rBZ:Float, localRotationAX:Float, localRotationAY:Float, localRotationAZ:Float, localRotationAW:Float, localRotationBX:Float, localRotationBY:Float, localRotationBZ:Float, localRotationBW:Float };

typedef Physics3DSliderJointOptions = { ?enableLimit:Null<Bool>, ?lowerTranslation:Null<Float>, ?upperTranslation:Null<Float>, ?enableMotor:Null<Bool>, ?motorSpeed:Null<Float>, ?maxMotorForce:Null<Float>, ?enableLimitSpring:Null<Bool>, ?limitFrequencyHz:Null<Float>, ?limitDampingRatio:Null<Float>, ?localRotationAX:Null<Float>, ?localRotationAY:Null<Float>, ?localRotationAZ:Null<Float>, ?localRotationAW:Null<Float>, ?localRotationBX:Null<Float>, ?localRotationBY:Null<Float>, ?localRotationBZ:Null<Float>, ?localRotationBW:Null<Float>, bodyA:Float, bodyB:Float, ?localAnchorAX:Null<Float>, ?localAnchorAY:Null<Float>, ?localAnchorAZ:Null<Float>, ?localAnchorBX:Null<Float>, ?localAnchorBY:Null<Float>, ?localAnchorBZ:Null<Float>, ?collideConnected:Null<Bool>, ?breakForce:Null<Float>, ?breakTorque:Null<Float> };

typedef Physics3DSolverConfig = { allowSleeping:Bool, sleepLinearThreshold:Float, sleepAngularThreshold:Float, timeToSleep:Float, substeps:Float, continuousCollision:Bool, maxCcdSubsteps:Float, maxCcdRotationSubsteps:Float, sequentialImpulse:flight.esm.types.physics3d.Types.Physics3DSequentialImpulseConfig };

typedef Physics3DStepExplanation = { bodyStateValid:Bool, colliderStateValid:Bool, contactStateValid:Bool, gravityValid:Bool, jointStateValid:Bool, solverConfigValid:Bool, substepsValid:Bool, timestepValid:Bool, velocityIterationsValid:Bool, positionIterationsValid:Bool, status:String };

typedef Physics3DStepGuard = ((world:flight.esm.types.physics3d.Types.Physics3DWorld, dt:Float) -> Void);

typedef Physics3DWorld = { version:Float, bodies:Array<flight.esm.types.physics3d.Types.RigidBody3D>, bodyByIndex:js.lib.Map<Float, flight.esm.types.physics3d.Types.RigidBody3D>, index:flight.esm.types.spatial.Types.SpatialIndexBackend3D, contacts:Array<flight.esm.types.physics3d.Types.Physics3DContact>, joints:Array<flight.esm.types.physics3d.Types.Physics3DJoint>, jointSolvers:js.lib.Map<String, flight.esm.types.physics3d.Types.Physics3DJointSolver>, jointCollisionSuppressions:js.lib.Map<Float, js.lib.Map<Float, Float>>, events:flight.esm.types.physics3d.Types.Physics3DContactEvents, jointEvents:flight.esm.types.physics3d.Types.Physics3DJointEvents, contactHooks:flight.esm.types.physics3d.Types.Physics3DContactHooks, solver:flight.esm.types.physics3d.Types.Physics3DSequentialImpulseState, config:flight.esm.types.physics3d.Types.Physics3DSolverConfig, islandParents:js.lib.Map<Float, Float>, islandSleepTimers:js.lib.Map<Float, Float>, solveIslandByRoot:js.lib.Map<Float, Float>, solveIslandRoots:Array<Float>, solveIslandBodyStarts:Array<Float>, solveIslandBodyCounts:Array<Float>, solveIslandContactStarts:Array<Float>, solveIslandContactCounts:Array<Float>, solveIslandJointStarts:Array<Float>, solveIslandJointCounts:Array<Float>, solveIslandBodyIndices:Array<Float>, solveIslandContactIndices:Array<Float>, solveIslandJointIndices:Array<Float>, solveIslandCursors:Array<Float>, gravityX:Float, gravityY:Float, gravityZ:Float, previousTimestep:Float, nextBodyIndex:Float };

typedef RigidBody3D = { index:Float, type:flight.esm.types.physics3d.Types.Physics3DBodyType, x:Float, y:Float, z:Float, orientationX:Float, orientationY:Float, orientationZ:Float, orientationW:Float, velocityX:Float, velocityY:Float, velocityZ:Float, angularVelocityX:Float, angularVelocityY:Float, angularVelocityZ:Float, forceX:Float, forceY:Float, forceZ:Float, torqueX:Float, torqueY:Float, torqueZ:Float, mass:Float, inverseMass:Float, inertiaXX:Float, inertiaYY:Float, inertiaZZ:Float, inertiaXY:Float, inertiaXZ:Float, inertiaYZ:Float, inverseInertiaXX:Float, inverseInertiaYY:Float, inverseInertiaZZ:Float, inverseInertiaXY:Float, inverseInertiaXZ:Float, inverseInertiaYZ:Float, inverseInertiaWorldXX:Float, inverseInertiaWorldYY:Float, inverseInertiaWorldZZ:Float, inverseInertiaWorldXY:Float, inverseInertiaWorldXZ:Float, inverseInertiaWorldYZ:Float, centerX:Float, centerY:Float, centerZ:Float, linearDamping:Float, angularDamping:Float, gravityScale:Float, fixedRotation:Bool, bullet:Bool, sleeping:Bool, sleepEnabled:Bool, sleepTimer:Float, colliders:Array<flight.esm.types.physics3d.Types.Physics3DCollider> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
