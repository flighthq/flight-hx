// Maintained structural contract shared by DOM-like event targets.
package flighthq._internal.dom;

typedef EventTarget = {
  var addEventListener:(type:String, listener:EventListener, ?options:flighthq._internal._Union2<Bool, AddEventListenerOptions>)->Void;
  var dispatchEvent:Event->Bool;
  var removeEventListener:(type:String, listener:EventListener, ?options:flighthq._internal._Union2<Bool, EventListenerOptions>)->Void;
};
