package flight._internal;

#if js
typedef _IntlPluralRules = js.lib.intl.PluralRules;
#else
#error "Intl.PluralRules-backed transpiled modules require a target runtime implementation."
#end
