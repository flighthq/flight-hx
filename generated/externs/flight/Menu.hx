package flight;

#if (js && flight_esm)
extern inline function cloneMenuTemplate(template:Dynamic):Dynamic {
	return flight._js._fn.Menu.cloneMenuTemplate(template);
}
#else
extern inline function cloneMenuTemplate(template:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Menu.cloneMenuTemplate(template);
#elseif cpp
	return flight._cpp._fn.Menu.cloneMenuTemplate(template);
#elseif (js && flight_esm)
	return flight._js._fn.Menu.cloneMenuTemplate(template);
#else
	#error "flight.Menu: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableMenuSignals(state:MenuSignalsState):Dynamic {
	return flight._js._fn.Menu.enableMenuSignals(state);
}
#else
extern inline function enableMenuSignals(state:MenuSignalsState):Dynamic {
#if hl
	return flight._hl._fn.Menu.enableMenuSignals(state);
#elseif cpp
	return flight._cpp._fn.Menu.enableMenuSignals(state);
#elseif (js && flight_esm)
	return flight._js._fn.Menu.enableMenuSignals(state);
#else
	#error "flight.Menu: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getMenuSignals(state:MenuSignalsState):Null<Dynamic> {
	return flight._js._fn.Menu.getMenuSignals(state);
}
#else
extern inline function getMenuSignals(state:MenuSignalsState):Dynamic {
#if hl
	return flight._hl._fn.Menu.getMenuSignals(state);
#elseif cpp
	return flight._cpp._fn.Menu.getMenuSignals(state);
#elseif (js && flight_esm)
	return flight._js._fn.Menu.getMenuSignals(state);
#else
	#error "flight.Menu: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function validateMenuItemTemplate(template:Dynamic):Null<String> {
	return flight._js._fn.Menu.validateMenuItemTemplate(template);
}
#else
extern inline function validateMenuItemTemplate(template:Dynamic):String {
#if hl
	return cast flight._hl._fn.Menu.validateMenuItemTemplate(template);
#elseif cpp
	return cast flight._cpp._fn.Menu.validateMenuItemTemplate(template);
#elseif (js && flight_esm)
	return cast flight._js._fn.Menu.validateMenuItemTemplate(template);
#else
	#error "flight.Menu: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createMenuHighlight():MenuHighlight {
	return flight._js._fn.Menu.createMenuHighlight();
}
#else
extern inline function createMenuHighlight():MenuHighlight {
#if hl
	return flight._hl._fn.Menu.createMenuHighlight();
#elseif cpp
	return flight._cpp._fn.Menu.createMenuHighlight();
#elseif (js && flight_esm)
	return flight._js._fn.Menu.createMenuHighlight();
#else
	#error "flight.Menu: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createMenuSelect():MenuSelect {
	return flight._js._fn.Menu.createMenuSelect();
}
#else
extern inline function createMenuSelect():MenuSelect {
#if hl
	return flight._hl._fn.Menu.createMenuSelect();
#elseif cpp
	return flight._cpp._fn.Menu.createMenuSelect();
#elseif (js && flight_esm)
	return flight._js._fn.Menu.createMenuSelect();
#else
	#error "flight.Menu: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachMenuHighlight(hostMenuHighlight:HostMenuHighlightCapability, highlight:MenuHighlight):Void {
	flight._js._fn.Menu.attachMenuHighlight(hostMenuHighlight, highlight);
}
#else
extern inline function attachMenuHighlight(hostMenuHighlight:HostMenuHighlightCapability, highlight:MenuHighlight):Void {
#if hl
	flight._hl._fn.Menu.attachMenuHighlight(hostMenuHighlight, highlight);
#elseif cpp
	flight._cpp._fn.Menu.attachMenuHighlight(hostMenuHighlight, highlight);
#elseif (js && flight_esm)
	flight._js._fn.Menu.attachMenuHighlight(hostMenuHighlight, highlight);
#else
	#error "flight.Menu: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachMenuSelect(hostMenuSelect:HostMenuSelectCapability, select:MenuSelect):Void {
	flight._js._fn.Menu.attachMenuSelect(hostMenuSelect, select);
}
#else
extern inline function attachMenuSelect(hostMenuSelect:HostMenuSelectCapability, select:MenuSelect):Void {
#if hl
	flight._hl._fn.Menu.attachMenuSelect(hostMenuSelect, select);
#elseif cpp
	flight._cpp._fn.Menu.attachMenuSelect(hostMenuSelect, select);
#elseif (js && flight_esm)
	flight._js._fn.Menu.attachMenuSelect(hostMenuSelect, select);
#else
	#error "flight.Menu: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachMenuHighlight(highlight:MenuHighlight):Void {
	flight._js._fn.Menu.detachMenuHighlight(highlight);
}
#else
extern inline function detachMenuHighlight(highlight:MenuHighlight):Void {
#if hl
	flight._hl._fn.Menu.detachMenuHighlight(highlight);
#elseif cpp
	flight._cpp._fn.Menu.detachMenuHighlight(highlight);
#elseif (js && flight_esm)
	flight._js._fn.Menu.detachMenuHighlight(highlight);
#else
	#error "flight.Menu: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachMenuSelect(select:MenuSelect):Void {
	flight._js._fn.Menu.detachMenuSelect(select);
}
#else
extern inline function detachMenuSelect(select:MenuSelect):Void {
#if hl
	flight._hl._fn.Menu.detachMenuSelect(select);
#elseif cpp
	flight._cpp._fn.Menu.detachMenuSelect(select);
#elseif (js && flight_esm)
	flight._js._fn.Menu.detachMenuSelect(select);
#else
	#error "flight.Menu: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeMenuHighlight(highlight:MenuHighlight):Void {
	flight._js._fn.Menu.disposeMenuHighlight(highlight);
}
#else
extern inline function disposeMenuHighlight(highlight:MenuHighlight):Void {
#if hl
	flight._hl._fn.Menu.disposeMenuHighlight(highlight);
#elseif cpp
	flight._cpp._fn.Menu.disposeMenuHighlight(highlight);
#elseif (js && flight_esm)
	flight._js._fn.Menu.disposeMenuHighlight(highlight);
#else
	#error "flight.Menu: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeMenuSelect(select:MenuSelect):Void {
	flight._js._fn.Menu.disposeMenuSelect(select);
}
#else
extern inline function disposeMenuSelect(select:MenuSelect):Void {
#if hl
	flight._hl._fn.Menu.disposeMenuSelect(select);
#elseif cpp
	flight._cpp._fn.Menu.disposeMenuSelect(select);
#elseif (js && flight_esm)
	flight._js._fn.Menu.disposeMenuSelect(select);
#else
	#error "flight.Menu: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMenuItemTemplateRef(ptr:MenuItemTemplate):Void {
	flight._js._fn.Menu.freeMenuItemTemplateRef(ptr);
}
#else
extern inline function freeMenuItemTemplateRef(ptr:MenuItemTemplate):Void {
#if hl
	flight._hl._fn.Menu.freeMenuItemTemplateRef(ptr);
#elseif cpp
	flight._cpp._fn.Menu.freeMenuItemTemplateRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Menu.freeMenuItemTemplateRef(ptr);
#else
	#error "flight.Menu: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMenuSignalsRef(ptr:MenuSignals):Void {
	flight._js._fn.Menu.freeMenuSignalsRef(ptr);
}
#else
extern inline function freeMenuSignalsRef(ptr:MenuSignals):Void {
#if hl
	flight._hl._fn.Menu.freeMenuSignalsRef(ptr);
#elseif cpp
	flight._cpp._fn.Menu.freeMenuSignalsRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Menu.freeMenuSignalsRef(ptr);
#else
	#error "flight.Menu: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMenuHighlight(ptr:MenuHighlight):Void {
	flight._js._fn.Menu.freeMenuHighlight(ptr);
}
#else
extern inline function freeMenuHighlight(ptr:MenuHighlight):Void {
#if hl
	flight._hl._fn.Menu.freeMenuHighlight(ptr);
#elseif cpp
	flight._cpp._fn.Menu.freeMenuHighlight(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Menu.freeMenuHighlight(ptr);
#else
	#error "flight.Menu: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMenuSelect(ptr:MenuSelect):Void {
	flight._js._fn.Menu.freeMenuSelect(ptr);
}
#else
extern inline function freeMenuSelect(ptr:MenuSelect):Void {
#if hl
	flight._hl._fn.Menu.freeMenuSelect(ptr);
#elseif cpp
	flight._cpp._fn.Menu.freeMenuSelect(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Menu.freeMenuSelect(ptr);
#else
	#error "flight.Menu: no backend for this target."
#end
}
#end
