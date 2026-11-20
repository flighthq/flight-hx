package flight.esm.types.camera_controls;

#if (js && flight_esm)
typedef CameraShake = { trauma:Float, decay:Float, frequency:Float, translationAmplitude:Float, rotationAmplitude:Float, time:Float };

typedef CameraShakeOffset = { rotationX:Float, rotationY:Float, rotationZ:Float, x:Float, y:Float, z:Float };

typedef CameraShakeOptions = { ?decay:Null<Float>, ?frequency:Null<Float>, ?rotationAmplitude:Null<Float>, ?translationAmplitude:Null<Float> };

typedef FlyCameraController = { goalPitch:Float, goalYaw:Float, maxPitch:Float, minPitch:Float, pitch:Float, position:flight.esm.types.geometry.Types.Vector3, smoothTime:Float, yaw:Float };

typedef FlyCameraControllerOptions = { ?maxPitch:Null<Float>, ?minPitch:Null<Float>, ?pitch:Null<Float>, ?position:Null<flight.esm.types.geometry.Types.Vector3Like>, ?smoothTime:Null<Float>, ?yaw:Null<Float> };

typedef OrbitCameraController = { azimuth:Float, distance:Float, goalAzimuth:Float, goalDistance:Float, goalPolar:Float, maxDistance:Float, maxPolar:Float, minDistance:Float, minPolar:Float, polar:Float, smoothTime:Float, target:flight.esm.types.geometry.Types.Vector3 };

typedef OrbitCameraControllerOptions = { ?azimuth:Null<Float>, ?distance:Null<Float>, ?maxDistance:Null<Float>, ?maxPolar:Null<Float>, ?minDistance:Null<Float>, ?minPolar:Null<Float>, ?polar:Null<Float>, ?smoothTime:Null<Float>, ?target:Null<flight.esm.types.geometry.Types.Vector3Like> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
