package flight._internal;

#if js
typedef _Url = js.html.URL;
#else
#error "URL-backed transpiled modules require a target runtime implementation."
#end
