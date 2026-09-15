package flight._internal;

#if js
typedef _IntlDateTimeFormat = js.lib.intl.DateTimeFormat;
#else
#error "Intl.DateTimeFormat-backed transpiled modules require a target runtime implementation."
#end
