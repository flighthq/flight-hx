package flight._internal;

#if js
@:native("Intl") extern class _Intl {}
#else
#error "Intl-backed transpiled modules require a target runtime implementation."
#end
