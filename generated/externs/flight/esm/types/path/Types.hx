package flight.esm.types.path;

#if (js && flight_esm)
typedef ContourOrientation = String;

typedef Path = flight.esm.types.path_contract.Types.PathRaw;

typedef PathCommand = Float;

typedef PathMesh = { vertices:Array<Float>, indices:Array<Float> };

typedef PathMeshTyped = { vertices:js.lib.Float32Array, indices:js.lib.Uint32Array };

typedef PathMorph = flight.esm.types.path_contract.Types.PathMorphRaw;

typedef PathMorphCreationExplanation = { supported:Bool, reason:flight.esm.types.path.Types.PathMorphCreationReason, contour:Null<Float> };

typedef PathMorphCreationReason = String;

typedef PathSegment = { kind:String };

typedef PathWinding = String;

typedef StrokeCap = String;

typedef StrokeJoin = String;

typedef StrokePathTessellationExplanation = { supported:Bool, reason:flight.esm.types.path.Types.StrokePathTessellationReason, subpath:Null<Float> };

typedef StrokePathTessellationReason = String;

typedef StrokeStyle = { ?width:Null<Float>, ?cap:Null<String>, ?join:Null<String>, ?miterLimit:Null<Float>, ?dash:Null<Array<Float>>, ?dashOffset:Null<Float> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
