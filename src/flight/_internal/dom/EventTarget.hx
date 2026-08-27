// Maintained structural contract shared by DOM-like event targets.
package flight._internal.dom;

typedef EventTarget = {
  var addEventListener:(type:String, listener:EventListener, ?options:flight._internal._Union2<Bool, AddEventListenerOptions>)->Void;
  var dispatchEvent:Event->Bool;
  var removeEventListener:(type:String, listener:EventListener, ?options:flight._internal._Union2<Bool, EventListenerOptions>)->Void;
};
