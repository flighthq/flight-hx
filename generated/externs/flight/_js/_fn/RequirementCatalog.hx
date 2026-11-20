package flight._js._fn;

@:jsRequire("@flighthq/requirement-catalog")
extern class RequirementCatalog {
	@:native("createRequirementCatalog")
	public static function createRequirementCatalog(entries:Dynamic, translations:Dynamic, dispositions:Dynamic):flight._js.RequirementCatalog;
	@:native("findRequirementCatalogEntries")
	public static function findRequirementCatalogEntries(out:Dynamic, catalog:flight._js.RequirementCatalog, backend:String, facet:flight._js.RequirementFacet, kind:String):Void;
	@:native("getRequirementCatalogEntries")
	public static function getRequirementCatalogEntries(out:Dynamic, catalog:flight._js.RequirementCatalog):Void;
	@:native("registerRequirementCatalogEntry")
	public static function registerRequirementCatalogEntry(catalog:flight._js.RequirementCatalog, entry:flight._js.RequirementCatalogEntry):Void;
	@:native("unregisterRequirementCatalogEntry")
	public static function unregisterRequirementCatalogEntry(catalog:flight._js.RequirementCatalog, entry:flight._js.RequirementCatalogEntry):Bool;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeRequirementCatalog(ptr:flight._js.RequirementCatalog):Void {}
}
