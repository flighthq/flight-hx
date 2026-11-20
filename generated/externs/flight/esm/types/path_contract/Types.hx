package flight.esm.types.path_contract;

#if (js && flight_esm)
typedef ContourOrientation = flight.esm.types.path.Types.ContourOrientation;

typedef Path = flight.esm.types.path.Types.Path;

typedef PathCommand = flight.esm.types.path.Types.PathCommand;

typedef PathMesh = flight.esm.types.path.Types.PathMesh;

typedef PathMeshTyped = flight.esm.types.path.Types.PathMeshTyped;

typedef PathMorph = flight.esm.types.path.Types.PathMorph;

typedef PathMorphBuildResult = { ?contour:Null<Float>, issue:flight.esm.types.path.Types.PathMorphCreationReason, ?morph:Null<flight.esm.types.path_contract.Types.PathMorphRaw> };

typedef PathMorphCreationExplanation = flight.esm.types.path.Types.PathMorphCreationExplanation;

typedef PathMorphCreationReason = flight.esm.types.path.Types.PathMorphCreationReason;

typedef PathMorphRaw = { commands:Array<Float>, startData:Array<Float>, endData:Array<Float>, winding:flight.esm.types.path.Types.PathWinding };

typedef PathRaw = { commands:Array<Float>, data:Array<Float>, winding:flight.esm.types.path.Types.PathWinding };

typedef PathSegment = flight.esm.types.path.Types.PathSegment;

typedef PathWinding = flight.esm.types.path.Types.PathWinding;

typedef StrokeCap = flight.esm.types.path.Types.StrokeCap;

typedef StrokeJoin = flight.esm.types.path.Types.StrokeJoin;

typedef StrokePathGeometry = { issue:flight.esm.types.path.Types.StrokePathTessellationReason, ?issueSubpath:Null<Float>, pieces:Array<flight.esm.types.path_contract.Types.StrokePathPieceGeometry> };

typedef StrokePathPieceGeometry = { closed:Bool, endCap:Array<Float>, left:Array<Float>, right:Array<Float>, startCap:Array<Float> };

typedef StrokePathTessellationExplanation = flight.esm.types.path.Types.StrokePathTessellationExplanation;

typedef StrokePathTessellationReason = flight.esm.types.path.Types.StrokePathTessellationReason;

typedef StrokeStyle = flight.esm.types.path.Types.StrokeStyle;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
