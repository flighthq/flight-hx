package flight._internal;

import flight.types.ShapeCommandToken;

// @:keep — generated shape-bounds code reaches getArgument only via dynamic
// dispatch (_Runtime.callProperty), so DCE must not strip it (matches the
// @:keep on the other reflectively-reached _internal runtime classes).
@:keep
@:noCompletion
class ShapeCommandArgumentCursorRuntime {
  public var argumentCount:Float;
  public var argumentOffset:Float;
  public final commands:Array<ShapeCommandToken>;
  public var length:Float;

  public function new(commands:Array<ShapeCommandToken>) {
    this.argumentCount = 0.0;
    this.argumentOffset = 0.0;
    this.commands = commands;
    this.length = 0.0;
  }

  public function getArgument(relativeIndex:Float):Null<ShapeCommandToken> {
    if (relativeIndex < 0 || relativeIndex >= argumentCount) return null;
    return commands[Std.int(argumentOffset + relativeIndex)];
  }
}
