package flight._cpp._fn;

extern class RequirementCatalog {
	@:native("flight_create_requirement_catalog")
	public static function createRequirementCatalog(entries:cpp.Star<cpp.Void>, entriesLen:Int, translations:cpp.Star<cpp.Void>, translationsLen:Int, dispositions:cpp.Star<cpp.Void>, dispositionsLen:Int):flight._cpp.RequirementCatalog;
	@:native("flight_get_requirement_catalog_entries")
	public static function getRequirementCatalogEntries(out:cpp.Star<cpp.Void>, catalog:flight._cpp.RequirementCatalog):Void;
	@:native("flight_register_requirement_catalog_entry")
	public static function registerRequirementCatalogEntry(catalog:flight._cpp.RequirementCatalog, entry:flight._cpp.RequirementCatalogEntry):Void;
	@:native("flight_unregister_requirement_catalog_entry")
	public static function unregisterRequirementCatalogEntry(catalog:flight._cpp.RequirementCatalog, entry:flight._cpp.RequirementCatalogEntry):Bool;
	@:native("flight_free_requirement_catalog")
	public static function freeRequirementCatalog(ptr:flight._cpp.RequirementCatalog):Void;
}
