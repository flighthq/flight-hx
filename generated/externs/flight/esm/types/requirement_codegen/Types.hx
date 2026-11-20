package flight.esm.types.requirement_codegen;

#if (js && flight_esm)
typedef RequirementCodegenPlan = { backend:String, declined:Array<flight.esm.types.requirement_codegen.Types.RequirementDeclination>, entries:Array<flight.esm.types.requirement_catalog.Types.RequirementCatalogEntry>, unresolved:Array<flight.esm.types.requirement.Types.Requirement> };

typedef RequirementDeclination = { reason:String, requirement:flight.esm.types.requirement.Types.Requirement };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
