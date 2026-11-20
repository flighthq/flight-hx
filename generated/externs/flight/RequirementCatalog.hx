package flight;

#if hl

typedef RequirementCatalog = flight._hl.RequirementCatalog;

#elseif cpp

typedef RequirementCatalog = flight._cpp.RequirementCatalog;

#elseif (js && flight_esm)

typedef RequirementCatalog = flight._js.RequirementCatalog;

#elseif js

#error "flight.RequirementCatalog on js requires flight_esm."

#else

#error "flight.RequirementCatalog: no backend for this target."

#end

#if (js && flight_esm)
extern inline function createRequirementCatalog(entries:Dynamic, translations:Dynamic, dispositions:Dynamic):RequirementCatalog {
	return flight._js._fn.RequirementCatalog.createRequirementCatalog(entries, translations, dispositions);
}
#else
extern inline function createRequirementCatalog(entries:Dynamic, entriesLen:Int, translations:Dynamic, translationsLen:Int, dispositions:Dynamic, dispositionsLen:Int):RequirementCatalog {
#if hl
	return flight._hl._fn.RequirementCatalog.createRequirementCatalog(entries, entriesLen, translations, translationsLen, dispositions, dispositionsLen);
#elseif cpp
	return flight._cpp._fn.RequirementCatalog.createRequirementCatalog(entries, entriesLen, translations, translationsLen, dispositions, dispositionsLen);
#elseif (js && flight_esm)
	return flight._js._fn.RequirementCatalog.createRequirementCatalog(entries, entriesLen, translations, translationsLen, dispositions, dispositionsLen);
#else
	#error "flight.RequirementCatalog: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function findRequirementCatalogEntries(out:Dynamic, catalog:RequirementCatalog, backend:String, facet:RequirementFacet, kind:String):Void {
	flight._js._fn.RequirementCatalog.findRequirementCatalogEntries(out, catalog, backend, facet, kind);
}
#end
#if (js && flight_esm)
extern inline function getRequirementCatalogEntries(out:Dynamic, catalog:RequirementCatalog):Void {
	flight._js._fn.RequirementCatalog.getRequirementCatalogEntries(out, catalog);
}
#else
extern inline function getRequirementCatalogEntries(out:Dynamic, catalog:RequirementCatalog):Void {
#if hl
	flight._hl._fn.RequirementCatalog.getRequirementCatalogEntries(out, catalog);
#elseif cpp
	flight._cpp._fn.RequirementCatalog.getRequirementCatalogEntries(out, catalog);
#elseif (js && flight_esm)
	flight._js._fn.RequirementCatalog.getRequirementCatalogEntries(out, catalog);
#else
	#error "flight.RequirementCatalog: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerRequirementCatalogEntry(catalog:RequirementCatalog, entry:RequirementCatalogEntry):Void {
	flight._js._fn.RequirementCatalog.registerRequirementCatalogEntry(catalog, entry);
}
#else
extern inline function registerRequirementCatalogEntry(catalog:RequirementCatalog, entry:RequirementCatalogEntry):Void {
#if hl
	flight._hl._fn.RequirementCatalog.registerRequirementCatalogEntry(catalog, entry);
#elseif cpp
	flight._cpp._fn.RequirementCatalog.registerRequirementCatalogEntry(catalog, entry);
#elseif (js && flight_esm)
	flight._js._fn.RequirementCatalog.registerRequirementCatalogEntry(catalog, entry);
#else
	#error "flight.RequirementCatalog: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function unregisterRequirementCatalogEntry(catalog:RequirementCatalog, entry:RequirementCatalogEntry):Bool {
	return flight._js._fn.RequirementCatalog.unregisterRequirementCatalogEntry(catalog, entry);
}
#else
extern inline function unregisterRequirementCatalogEntry(catalog:RequirementCatalog, entry:RequirementCatalogEntry):Bool {
#if hl
	return flight._hl._fn.RequirementCatalog.unregisterRequirementCatalogEntry(catalog, entry);
#elseif cpp
	return flight._cpp._fn.RequirementCatalog.unregisterRequirementCatalogEntry(catalog, entry);
#elseif (js && flight_esm)
	return flight._js._fn.RequirementCatalog.unregisterRequirementCatalogEntry(catalog, entry);
#else
	#error "flight.RequirementCatalog: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeRequirementCatalog(ptr:RequirementCatalog):Void {
	flight._js._fn.RequirementCatalog.freeRequirementCatalog(ptr);
}
#else
extern inline function freeRequirementCatalog(ptr:RequirementCatalog):Void {
#if hl
	flight._hl._fn.RequirementCatalog.freeRequirementCatalog(ptr);
#elseif cpp
	flight._cpp._fn.RequirementCatalog.freeRequirementCatalog(ptr);
#elseif (js && flight_esm)
	flight._js._fn.RequirementCatalog.freeRequirementCatalog(ptr);
#else
	#error "flight.RequirementCatalog: no backend for this target."
#end
}
#end
