package flight._internal;

#if js
typedef _IntlNumberFormat = js.lib.intl.NumberFormat;
#else
#error "Intl.NumberFormat-backed transpiled modules require a target runtime implementation."
#end
