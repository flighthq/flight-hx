package flight._hl._fn;

extern class RequirementCodegen {
	@:hlNative("flight", "flight_create_requirement_codegen_plan")
	public static function createRequirementCodegenPlan(catalog:flight._hl.RequirementCatalog, requirements:flight._hl.RequirementSet, backend:hl.Bytes):flight._hl.RequirementCodegenPlan;
	@:hlNative("flight", "flight_free_requirement_codegen_plan")
	public static function freeRequirementCodegenPlan(ptr:flight._hl.RequirementCodegenPlan):Void;
}
