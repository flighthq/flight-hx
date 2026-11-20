package flight.esm.types.camera_contract;

#if (js && flight_esm)
typedef Camera2D = flight.esm.types.camera.Types.Camera2D;

typedef Camera2DFollowOptions = flight.esm.types.camera.Types.Camera2DFollowOptions;

typedef Camera2DOptions = flight.esm.types.camera.Types.Camera2DOptions;

typedef Camera3D = flight.esm.types.camera.Types.Camera3D;

typedef Camera3DLike = flight.esm.types.camera.Types.Camera3DLike;

typedef Camera3DOptions = flight.esm.types.camera.Types.Camera3DOptions;

typedef Camera3DViewExplanation = flight.esm.types.camera.Types.Camera3DViewExplanation;

typedef OrthographicProjection = flight.esm.types.camera.Types.OrthographicProjection;

typedef OrthographicProjectionOptions = flight.esm.types.camera.Types.OrthographicProjectionOptions;

typedef PerspectiveProjection = flight.esm.types.camera.Types.PerspectiveProjection;

typedef PerspectiveProjectionOptions = flight.esm.types.camera.Types.PerspectiveProjectionOptions;

typedef Projection = flight.esm.types.camera.Types.Projection;

typedef RawProjection = flight.esm.types.camera.Types.RawProjection;

typedef RawProjectionOptions = flight.esm.types.camera.Types.RawProjectionOptions;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
