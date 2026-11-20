package flight;

#if hl

typedef Scene2DResources = flight._hl.Scene2DResources;

#elseif cpp

typedef Scene2DResources = flight._cpp.Scene2DResources;

#elseif (js && flight_esm)

typedef Scene2DResources = flight._js.Scene2DResources;

#elseif js

#error "flight.Scene2DResources on js requires flight_esm."

#else

#error "flight.Scene2DResources: no backend for this target."

#end

#if (js && flight_esm)
extern inline function areScene2dResourceFailureGuardsEnabled(guardState:Dynamic):Bool {
	return flight._js._fn.Scene2DResources.areScene2dResourceFailureGuardsEnabled(guardState);
}
#else
extern inline function areScene2dResourceFailureGuardsEnabled(guardState:Dynamic):Bool {
#if hl
	return flight._hl._fn.Scene2DResources.areScene2dResourceFailureGuardsEnabled(guardState);
#elseif cpp
	return flight._cpp._fn.Scene2DResources.areScene2dResourceFailureGuardsEnabled(guardState);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2DResources.areScene2dResourceFailureGuardsEnabled(guardState);
#else
	#error "flight.Scene2DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disableScene2dResourceFailureGuards(guardState:Dynamic):Void {
	flight._js._fn.Scene2DResources.disableScene2dResourceFailureGuards(guardState);
}
#else
extern inline function disableScene2dResourceFailureGuards(guardState:Dynamic):Void {
#if hl
	flight._hl._fn.Scene2DResources.disableScene2dResourceFailureGuards(guardState);
#elseif cpp
	flight._cpp._fn.Scene2DResources.disableScene2dResourceFailureGuards(guardState);
#elseif (js && flight_esm)
	flight._js._fn.Scene2DResources.disableScene2dResourceFailureGuards(guardState);
#else
	#error "flight.Scene2DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableScene2dResourceFailureGuards(guardState:Dynamic, logState:Dynamic, clock:Dynamic):Void {
	flight._js._fn.Scene2DResources.enableScene2dResourceFailureGuards(guardState, logState, clock);
}
#end
#if (js && flight_esm)
extern inline function resolveScene2dResources(out:Scene2DResources, document:Dynamic, options:Null<ResolveScene2DResourcesOptions>, guardState:Dynamic):Void {
	flight._js._fn.Scene2DResources.resolveScene2dResources(out, document, options, guardState);
}
#else
extern inline function resolveScene2dResources(out:Scene2DResources, document:Dynamic, options:ResolveScene2DResourcesOptions, guardState:Dynamic):Void {
#if hl
	flight._hl._fn.Scene2DResources.resolveScene2dResources(out, document, options, guardState);
#elseif cpp
	flight._cpp._fn.Scene2DResources.resolveScene2dResources(out, document, options, guardState);
#elseif (js && flight_esm)
	flight._js._fn.Scene2DResources.resolveScene2dResources(out, document, options, guardState);
#else
	#error "flight.Scene2DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createScene2dDocument():Dynamic {
	return flight._js._fn.Scene2DResources.createScene2dDocument();
}
#else
extern inline function createScene2dDocument():Dynamic {
#if hl
	return flight._hl._fn.Scene2DResources.createScene2dDocument();
#elseif cpp
	return flight._cpp._fn.Scene2DResources.createScene2dDocument();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2DResources.createScene2dDocument();
#else
	#error "flight.Scene2DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createScene2dSlotReference():Dynamic {
	return flight._js._fn.Scene2DResources.createScene2dSlotReference();
}
#else
extern inline function createScene2dSlotReference():Dynamic {
#if hl
	return flight._hl._fn.Scene2DResources.createScene2dSlotReference();
#elseif cpp
	return flight._cpp._fn.Scene2DResources.createScene2dSlotReference();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2DResources.createScene2dSlotReference();
#else
	#error "flight.Scene2DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createScene2dDocumentFromBytes(source:Dynamic, registry:Scene2DDocumentImporterRegistry, context:Null<Scene2DDocumentImportContext>, guardState:Dynamic):Null<Dynamic> {
	return flight._js._fn.Scene2DResources.createScene2dDocumentFromBytes(source, registry, context, guardState);
}
#else
extern inline function createScene2dDocumentFromBytes(source:Dynamic, sourceLen:Int, registry:Scene2DDocumentImporterRegistry, context:Scene2DDocumentImportContext, guardState:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Scene2DResources.createScene2dDocumentFromBytes(source, sourceLen, registry, context, guardState);
#elseif cpp
	return flight._cpp._fn.Scene2DResources.createScene2dDocumentFromBytes(source, sourceLen, registry, context, guardState);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2DResources.createScene2dDocumentFromBytes(source, sourceLen, registry, context, guardState);
#else
	#error "flight.Scene2DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createScene2dDocumentImporterRegistry():Scene2DDocumentImporterRegistry {
	return flight._js._fn.Scene2DResources.createScene2dDocumentImporterRegistry();
}
#else
extern inline function createScene2dDocumentImporterRegistry():Scene2DDocumentImporterRegistry {
#if hl
	return flight._hl._fn.Scene2DResources.createScene2dDocumentImporterRegistry();
#elseif cpp
	return flight._cpp._fn.Scene2DResources.createScene2dDocumentImporterRegistry();
#elseif (js && flight_esm)
	return flight._js._fn.Scene2DResources.createScene2dDocumentImporterRegistry();
#else
	#error "flight.Scene2DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerScene2dDocumentImporter(registry:Scene2DDocumentImporterRegistry, kind:String, matches:Scene2DDocumentImporterMatcher, importDocument:Scene2DDocumentImporter):Void {
	flight._js._fn.Scene2DResources.registerScene2dDocumentImporter(registry, kind, matches, importDocument);
}
#else
extern inline function registerScene2dDocumentImporter(registry:Scene2DDocumentImporterRegistry, kind:String, matches:Scene2DDocumentImporterMatcher, importDocument:Scene2DDocumentImporter):Void {
#if hl
	flight._hl._fn.Scene2DResources.registerScene2dDocumentImporter(registry, cast kind, matches, importDocument);
#elseif cpp
	flight._cpp._fn.Scene2DResources.registerScene2dDocumentImporter(registry, cast kind, matches, importDocument);
#elseif (js && flight_esm)
	flight._js._fn.Scene2DResources.registerScene2dDocumentImporter(registry, kind, matches, importDocument);
#else
	#error "flight.Scene2DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function unregisterScene2dDocumentImporter(registry:Scene2DDocumentImporterRegistry, kind:String):Bool {
	return flight._js._fn.Scene2DResources.unregisterScene2dDocumentImporter(registry, kind);
}
#else
extern inline function unregisterScene2dDocumentImporter(registry:Scene2DDocumentImporterRegistry, kind:String):Bool {
#if hl
	return flight._hl._fn.Scene2DResources.unregisterScene2dDocumentImporter(registry, cast kind);
#elseif cpp
	return flight._cpp._fn.Scene2DResources.unregisterScene2dDocumentImporter(registry, cast kind);
#elseif (js && flight_esm)
	return flight._js._fn.Scene2DResources.unregisterScene2dDocumentImporter(registry, kind);
#else
	#error "flight.Scene2DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainScene2dResourceCoverage(out:Scene2DResourceCoverageExplanation, document:Scene2DDocument):Void {
	flight._js._fn.Scene2DResources.explainScene2dResourceCoverage(out, document);
}
#else
extern inline function explainScene2dResourceCoverage(out:Scene2DResourceCoverageExplanation, document:Scene2DDocument):Void {
#if hl
	flight._hl._fn.Scene2DResources.explainScene2dResourceCoverage(out, document);
#elseif cpp
	flight._cpp._fn.Scene2DResources.explainScene2dResourceCoverage(out, document);
#elseif (js && flight_esm)
	flight._js._fn.Scene2DResources.explainScene2dResourceCoverage(out, document);
#else
	#error "flight.Scene2DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setScene2dSlotReferenceContent(reference:Scene2DSlotReference, content:Null<Dynamic>):Void {
	flight._js._fn.Scene2DResources.setScene2dSlotReferenceContent(reference, content);
}
#else
extern inline function setScene2dSlotReferenceContent(reference:Scene2DSlotReference, content:Null<flight.FlightNode>):Void {
#if hl
	flight._hl._fn.Scene2DResources.setScene2dSlotReferenceContent(reference, content);
#elseif cpp
	flight._cpp._fn.Scene2DResources.setScene2dSlotReferenceContent(reference, content);
#elseif (js && flight_esm)
	flight._js._fn.Scene2DResources.setScene2dSlotReferenceContent(reference, content);
#else
	#error "flight.Scene2DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeScene2DdocumentRef(ptr:Scene2DDocument):Void {
	flight._js._fn.Scene2DResources.freeScene2DdocumentRef(ptr);
}
#else
extern inline function freeScene2DdocumentRef(ptr:Scene2DDocument):Void {
#if hl
	flight._hl._fn.Scene2DResources.freeScene2DdocumentRef(ptr);
#elseif cpp
	flight._cpp._fn.Scene2DResources.freeScene2DdocumentRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2DResources.freeScene2DdocumentRef(ptr);
#else
	#error "flight.Scene2DResources: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeScene2DdocumentImporterRegistry(ptr:Scene2DDocumentImporterRegistry):Void {
	flight._js._fn.Scene2DResources.freeScene2DdocumentImporterRegistry(ptr);
}
#else
extern inline function freeScene2DdocumentImporterRegistry(ptr:Scene2DDocumentImporterRegistry):Void {
#if hl
	flight._hl._fn.Scene2DResources.freeScene2DdocumentImporterRegistry(ptr);
#elseif cpp
	flight._cpp._fn.Scene2DResources.freeScene2DdocumentImporterRegistry(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Scene2DResources.freeScene2DdocumentImporterRegistry(ptr);
#else
	#error "flight.Scene2DResources: no backend for this target."
#end
}
#end
