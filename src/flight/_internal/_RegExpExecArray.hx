package flight._internal;

#if js
typedef _RegExpExecArray = js.lib.RegExp.RegExpMatch;
#else
typedef _RegExpExecArray = Array<String>;
#end
