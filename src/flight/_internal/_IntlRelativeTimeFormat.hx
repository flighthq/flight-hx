package flight._internal;

#if js
typedef _IntlRelativeTimeFormat = js.lib.intl.RelativeTimeFormat;
#else
#error "Intl.RelativeTimeFormat-backed transpiled modules require a target runtime implementation."
#end
