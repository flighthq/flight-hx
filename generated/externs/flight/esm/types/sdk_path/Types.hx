package flight.esm.types.sdk_path;

#if (js && flight_esm)
typedef ContourOrientation = flight.esm.types.path.Types.ContourOrientation;

typedef Path = flight.esm.types.path.Types.Path;

typedef PathCommand = flight.esm.types.path.Types.PathCommand;

typedef PathMesh = flight.esm.types.path.Types.PathMesh;

typedef PathMeshTyped = flight.esm.types.path.Types.PathMeshTyped;

typedef PathMorph = flight.esm.types.path.Types.PathMorph;

typedef PathMorphCreationExplanation = flight.esm.types.path.Types.PathMorphCreationExplanation;

typedef PathMorphCreationReason = flight.esm.types.path.Types.PathMorphCreationReason;

typedef PathSegment = flight.esm.types.path.Types.PathSegment;

typedef PathWinding = flight.esm.types.path.Types.PathWinding;

typedef StrokeCap = flight.esm.types.path.Types.StrokeCap;

typedef StrokeJoin = flight.esm.types.path.Types.StrokeJoin;

typedef StrokePathTessellationExplanation = flight.esm.types.path.Types.StrokePathTessellationExplanation;

typedef StrokePathTessellationReason = flight.esm.types.path.Types.StrokePathTessellationReason;

typedef StrokeStyle = flight.esm.types.path.Types.StrokeStyle;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
