package flight.esm.types.path_boolean;

#if (js && flight_esm)
typedef ComputePathBooleanFunction = ((arg0:Array<flight.esm.types.path_boolean.Types.PathBooleanContour>, arg1:Array<flight.esm.types.path_boolean.Types.PathBooleanContour>, arg2:flight.esm.types.path_boolean.Types.PathBooleanOperation, arg3:flight.esm.types.path_boolean.Types.PathBooleanFillRule) -> Array<flight.esm.types.path_boolean.Types.PathBooleanContour>);

typedef PathBooleanContour = Array<Float>;

typedef PathBooleanExplanation = { operation:flight.esm.types.path_boolean.Types.PathBooleanExplanationOperation, reason:flight.esm.types.path_boolean.Types.PathBooleanExplanationReason };

typedef PathBooleanExplanationOperation = String;

typedef PathBooleanExplanationReason = String;

typedef PathBooleanFillRule = String;

typedef PathBooleanKernel = flight.esm.types.path_boolean_contract.Types.PathBooleanKernelRaw;

typedef PathBooleanOperation = String;

typedef PathBooleanOptions = { ?fillRule:Null<String>, ?tolerance:Null<Float> };

typedef PathOffsetEnd = String;

typedef PathOffsetJoin = String;

typedef PathOffsetOptions = { ?join:Null<String>, ?end:Null<String>, ?miterLimit:Null<Float>, ?tolerance:Null<Float>, ?arcTolerance:Null<Float> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
