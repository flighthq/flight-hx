package flight._internal;

#if js
typedef _TextDecoder = js.html.TextDecoder;
#else
#error "TextDecoder-backed transpiled modules require a target runtime implementation."
#end
