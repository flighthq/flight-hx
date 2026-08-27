// Maintained runtime support for generated Flight Haxe.
package flight._internal;

/** Portable value behind a JavaScript constructor-shaped global.
 *
 * Abstract-backed Haxe values have no class object that can serve both
 * `Reflect.construct` and `instanceof`. The toolkit keeps those two operations
 * together explicitly instead of making generated code guess at a target
 * representation. Optional static members cover the small standard-library
 * surface Flight actually reads from constructors.
 */
@:keep
class _HostConstructor {
  public var any:Dynamic = null;
  public var isView:Dynamic = null;
  public var now:Dynamic = null;

  final factory:Null<Array<Dynamic>->Dynamic>;
  final instanceCheck:Null<Dynamic->Bool>;

  public function new(?factory:Array<Dynamic>->Dynamic, ?instanceCheck:Dynamic->Bool) {
    this.factory = factory;
    this.instanceCheck = instanceCheck;
  }

  public function construct(arguments:Array<Dynamic>):Dynamic {
    if (factory == null) throw 'Host constructor has no portable construction operation';
    return factory(arguments);
  }

  public function isInstance(value:Dynamic):Bool {
    return instanceCheck != null && instanceCheck(value);
  }

  public function hasStaticMember(name:String):Bool {
    return switch (name) {
      case 'any': any != null;
      case 'isView': isView != null;
      case 'now': now != null;
      default: false;
    };
  }
}
