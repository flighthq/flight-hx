package flight._js;

// JS backend value type: an ESM value is a plain object, so the binding is a
// structural typedef — no import needed for the shape. DRAFT.
#if js
typedef Vector2 = {var x:Float; var y:Float;}
#end
