package flight.esm.types.skeleton3d;

#if (js && flight_esm)
typedef Skeleton3DValidationDiagnostic = { jointCount:Float, inverseBindMatricesLength:Float, expectedInverseBindMatricesLength:Float, message:String };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
