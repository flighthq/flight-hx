package flight._cpp;

@:unreflective
@:native("FlightNode")
private extern class FlightNodePointerNative {}

abstract FlightNodePointerArray(cpp.RawConstPointer<cpp.ConstStar<FlightNodePointerNative>>) {}
