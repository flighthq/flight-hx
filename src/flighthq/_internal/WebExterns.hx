package flighthq._internal;

// Lookup table for type names referenced by generated Flight code that have no Haxe declaration
// of their own: browser/DOM host globals and a handful of renderer-internal data shapes whose
// concrete type is target-specific. Generation imports each referenced name from this module (see
// `importExternalTypesFromLut` in tools/generator), so the reference resolves on every target.
//
// On the JS target each host global maps to its real `js.html` extern for accurate typing; on all
// other targets (and for shapes with no DOM equivalent) it degrades to `Dynamic`. Every value of
// these types already flows through `Dynamic` in the generated runtime, so this only tightens
// typing on JS and never changes behaviour elsewhere.
//
// Add an entry here whenever generation reports (via a Haxe "Type not found") a new referenced-but-
// undeclared name; a missing entry fails loudly at compile time rather than silently.

#if (js && html5)
typedef Clipboard = js.html.Clipboard;
typedef Geolocation = js.html.Geolocation;
typedef Screen = js.html.Screen;
typedef Storage = js.html.Storage;
// `MediaSession` has no `js.html` extern in the pinned Haxe standard library.
typedef MediaSession = Dynamic;
#else
typedef Clipboard = Dynamic;
typedef Geolocation = Dynamic;
typedef Screen = Dynamic;
typedef Storage = Dynamic;
typedef MediaSession = Dynamic;
#end

// Renderer-internal data shapes with no portable/DOM equivalent.
typedef WgpuRichTextData = Dynamic;
typedef WgpuScale9ShapeData = Dynamic;
typedef WgpuShapeData = Dynamic;
typedef WgpuTextLabelData = Dynamic;
typedef WgpuVideoData = Dynamic;
