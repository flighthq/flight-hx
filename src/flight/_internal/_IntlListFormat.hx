package flight._internal;

#if js
typedef _IntlListFormat = js.lib.intl.ListFormat;
#else
#error "Intl.ListFormat-backed transpiled modules require a target runtime implementation."
#end
