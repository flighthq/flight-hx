package flight._internal;

#if js
typedef _Date = js.lib.Date;
#else
#error "flight-compiler's transpiled SDK currently requires the JavaScript target runtime."
#end
