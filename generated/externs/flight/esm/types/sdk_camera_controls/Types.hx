package flight.esm.types.sdk_camera_controls;

#if (js && flight_esm)
typedef CameraShake = flight.esm.types.camera_controls.Types.CameraShake;

typedef CameraShakeOffset = flight.esm.types.camera_controls.Types.CameraShakeOffset;

typedef CameraShakeOptions = flight.esm.types.camera_controls.Types.CameraShakeOptions;

typedef FlyCameraController = flight.esm.types.camera_controls.Types.FlyCameraController;

typedef FlyCameraControllerOptions = flight.esm.types.camera_controls.Types.FlyCameraControllerOptions;

typedef OrbitCameraController = flight.esm.types.camera_controls.Types.OrbitCameraController;

typedef OrbitCameraControllerOptions = flight.esm.types.camera_controls.Types.OrbitCameraControllerOptions;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
