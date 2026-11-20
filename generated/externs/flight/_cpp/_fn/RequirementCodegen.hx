package flight._cpp._fn;

extern class RequirementCodegen {
	@:native("flight_create_requirement_codegen_plan")
	public static function createRequirementCodegenPlan(catalog:flight._cpp.RequirementCatalog, requirements:flight._cpp.RequirementSet, backend:cpp.ConstCharStar):flight._cpp.RequirementCodegenPlan;
	@:native("flight_free_requirement_codegen_plan")
	public static function freeRequirementCodegenPlan(ptr:flight._cpp.RequirementCodegenPlan):Void;
}
