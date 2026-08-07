package flighthq._internal;

// Standard-toolkit lookup table for external type names referenced by generated Flight code that
// have no generated or checker-mapped Haxe declaration of their own. Ambient host identities live
// in `_internal/dom/`; this table owns the remaining browser aliases and renderer-internal shapes.
// Generation imports each referenced name from this module (see `importExternalTypesFromLut` in
// tools/generator), so the stable key resolves on every target.
//
// On the JS target each host global maps to its real `js.html` extern for accurate typing; on all
// other targets (and for shapes with no DOM equivalent) it degrades to `Dynamic`. Every value of
// these types already flows through `Dynamic` in the generated runtime, so this only tightens
// typing on JS and never changes behaviour elsewhere.
//
// The host-toolkit dependency audit fails generation when a referenced entry is absent. Dynamic
// entries are reported as explicit toolkit debt; the transpiler never changes the source type to
// make that debt compile.

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
typedef GLenum = Float;
typedef WgpuRichTextData = Dynamic;
typedef WgpuScale9ShapeData = Dynamic;
typedef WgpuShapeData = Dynamic;
typedef WgpuTextLabelData = Dynamic;
typedef WgpuVideoData = Dynamic;
