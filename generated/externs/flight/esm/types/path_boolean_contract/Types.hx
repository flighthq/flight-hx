package flight.esm.types.path_boolean_contract;

#if (js && flight_esm)
typedef ComputePathBooleanFunction = flight.esm.types.path_boolean.Types.ComputePathBooleanFunction;

typedef PathBooleanContour = flight.esm.types.path_boolean.Types.PathBooleanContour;

typedef PathBooleanExplanation = flight.esm.types.path_boolean.Types.PathBooleanExplanation;

typedef PathBooleanExplanationOperation = flight.esm.types.path_boolean.Types.PathBooleanExplanationOperation;

typedef PathBooleanExplanationReason = flight.esm.types.path_boolean.Types.PathBooleanExplanationReason;

typedef PathBooleanFillRule = flight.esm.types.path_boolean.Types.PathBooleanFillRule;

typedef PathBooleanKernel = flight.esm.types.path_boolean.Types.PathBooleanKernel;

typedef PathBooleanKernelRaw = { computePathBoolean:flight.esm.types.path_boolean.Types.ComputePathBooleanFunction };

typedef PathBooleanOperation = flight.esm.types.path_boolean.Types.PathBooleanOperation;

typedef PathBooleanOptions = flight.esm.types.path_boolean.Types.PathBooleanOptions;

typedef PathOffsetEnd = flight.esm.types.path_boolean.Types.PathOffsetEnd;

typedef PathOffsetJoin = flight.esm.types.path_boolean.Types.PathOffsetJoin;

typedef PathOffsetOptions = flight.esm.types.path_boolean.Types.PathOffsetOptions;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
