// Maintained runtime support for generated Flight Haxe.
package flighthq._internal;

/** Portable DOMException identity used by cancellation and validation paths. */
@:keep
class _DOMException extends haxe.Exception {
  public final name:String;

  public function new(?message:String, ?name:String) {
    super(message == null ? '' : message);
    this.name = name == null || name == '' ? 'Error' : name;
  }
}
