package flight._internal.dom;

typedef AddEventListenerOptions = {
  >EventListenerOptions,
  @:optional var once:Bool;
  @:optional var passive:Bool;
  @:optional var signal:AbortSignal;
};
