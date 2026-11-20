package flight._hl._fn;

extern class RequirementCatalog {
	@:hlNative("flight", "flight_create_requirement_catalog")
	public static function createRequirementCatalog(entries:hl.Bytes, entriesLen:Int, translations:hl.Bytes, translationsLen:Int, dispositions:hl.Bytes, dispositionsLen:Int):flight._hl.RequirementCatalog;
	@:hlNative("flight", "flight_get_requirement_catalog_entries")
	public static function getRequirementCatalogEntries(out:hl.Bytes, catalog:flight._hl.RequirementCatalog):Void;
	@:hlNative("flight", "flight_register_requirement_catalog_entry")
	public static function registerRequirementCatalogEntry(catalog:flight._hl.RequirementCatalog, entry:flight._hl.RequirementCatalogEntry):Void;
	@:hlNative("flight", "flight_unregister_requirement_catalog_entry")
	public static function unregisterRequirementCatalogEntry(catalog:flight._hl.RequirementCatalog, entry:flight._hl.RequirementCatalogEntry):Bool;
	@:hlNative("flight", "flight_free_requirement_catalog")
	public static function freeRequirementCatalog(ptr:flight._hl.RequirementCatalog):Void;
}
