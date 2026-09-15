package flight._internal;

#if js
typedef _IntlCollator = js.lib.intl.Collator;
#else
#error "Intl.Collator-backed transpiled modules require a target runtime implementation."
#end
