// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

typedef RequirementCatalog = flight._cpp.RequirementCatalog;

var BUILT_IN_REQUIREMENT_BACKENDS(get, set):Array<RequirementBackend>;

private extern inline function get_BUILT_IN_REQUIREMENT_BACKENDS():Array<RequirementBackend> return flight._cpp._attempt.Attempt_RequirementCatalog_BUILT_IN_REQUIREMENT_BACKENDS.BUILT_IN_REQUIREMENT_BACKENDS;

private extern inline function set_BUILT_IN_REQUIREMENT_BACKENDS(value:Array<RequirementBackend>):Array<RequirementBackend> return flight._cpp._attempt.Attempt_RequirementCatalog_BUILT_IN_REQUIREMENT_BACKENDS.BUILT_IN_REQUIREMENT_BACKENDS = value;

var BUILT_IN_REQUIREMENT_CATALOG_ENTRIES(get, set):Array<RequirementCatalogEntry>;

private extern inline function get_BUILT_IN_REQUIREMENT_CATALOG_ENTRIES():Array<RequirementCatalogEntry> return flight._cpp._attempt.Attempt_RequirementCatalog_BUILT_IN_REQUIREMENT_CATALOG_ENTRIES.BUILT_IN_REQUIREMENT_CATALOG_ENTRIES;

private extern inline function set_BUILT_IN_REQUIREMENT_CATALOG_ENTRIES(value:Array<RequirementCatalogEntry>):Array<RequirementCatalogEntry> return flight._cpp._attempt.Attempt_RequirementCatalog_BUILT_IN_REQUIREMENT_CATALOG_ENTRIES.BUILT_IN_REQUIREMENT_CATALOG_ENTRIES = value;

var BUILT_IN_REQUIREMENT_DISPOSITIONS(get, set):Array<RequirementDisposition>;

private extern inline function get_BUILT_IN_REQUIREMENT_DISPOSITIONS():Array<RequirementDisposition> return flight._cpp._attempt.Attempt_RequirementCatalog_BUILT_IN_REQUIREMENT_DISPOSITIONS.BUILT_IN_REQUIREMENT_DISPOSITIONS;

private extern inline function set_BUILT_IN_REQUIREMENT_DISPOSITIONS(value:Array<RequirementDisposition>):Array<RequirementDisposition> return flight._cpp._attempt.Attempt_RequirementCatalog_BUILT_IN_REQUIREMENT_DISPOSITIONS.BUILT_IN_REQUIREMENT_DISPOSITIONS = value;

var BUILT_IN_REQUIREMENT_TRANSLATIONS(get, set):Array<RequirementTranslation>;

private extern inline function get_BUILT_IN_REQUIREMENT_TRANSLATIONS():Array<RequirementTranslation> return flight._cpp._attempt.Attempt_RequirementCatalog_BUILT_IN_REQUIREMENT_TRANSLATIONS.BUILT_IN_REQUIREMENT_TRANSLATIONS;

private extern inline function set_BUILT_IN_REQUIREMENT_TRANSLATIONS(value:Array<RequirementTranslation>):Array<RequirementTranslation> return flight._cpp._attempt.Attempt_RequirementCatalog_BUILT_IN_REQUIREMENT_TRANSLATIONS.BUILT_IN_REQUIREMENT_TRANSLATIONS = value;

extern inline function createRequirementCatalog(?entries:Array<flight.RequirementCatalogEntry>, ?translations:Array<flight.RequirementTranslation>, ?dispositions:Array<flight.RequirementDisposition>):flight.RequirementCatalog {
  return flight._cpp._attempt.Attempt_RequirementCatalog_createRequirementCatalog.createRequirementCatalog(entries, translations, dispositions);
}

extern inline function findRequirementCatalogEntries(catalog:flight.RequirementCatalog, backend:String, facet:flight.RequirementFacet, kind:flight.Kind):Array<flight.RequirementCatalogEntry> {
  return flight._cpp._attempt.Attempt_RequirementCatalog_findRequirementCatalogEntries.findRequirementCatalogEntries(catalog, backend, facet, kind);
}

extern inline function getRequirementCatalogEntries(catalog:flight.RequirementCatalog):Array<flight.RequirementCatalogEntry> {
  return flight._cpp._attempt.Attempt_RequirementCatalog_getRequirementCatalogEntries.getRequirementCatalogEntries(catalog);
}

extern inline function registerRequirementCatalogEntry(catalog:flight.RequirementCatalog, entry:flight.RequirementCatalogEntry):Void {
  flight._cpp._attempt.Attempt_RequirementCatalog_registerRequirementCatalogEntry.registerRequirementCatalogEntry(catalog, entry);
}

extern inline function unregisterRequirementCatalogEntry(catalog:flight.RequirementCatalog, entry:flight.RequirementCatalogEntry):Bool {
  return flight._cpp._attempt.Attempt_RequirementCatalog_unregisterRequirementCatalogEntry.unregisterRequirementCatalogEntry(catalog, entry);
}
