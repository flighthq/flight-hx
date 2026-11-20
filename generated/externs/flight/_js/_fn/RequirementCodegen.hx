package flight._js._fn;

@:jsRequire("@flighthq/requirement-codegen")
extern class RequirementCodegen {
	@:native("createRequirementCodegenPlan")
	public static function createRequirementCodegenPlan(catalog:flight._js.RequirementCatalog, requirements:flight._js.RequirementSet, backend:String):flight._js.RequirementCodegenPlan;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeRequirementCodegenPlan(ptr:flight._js.RequirementCodegenPlan):Void {}
}
