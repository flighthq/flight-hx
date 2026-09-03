var cursor:ShapeCommandArgumentCursorInternal__shapeBounds = cast null;
cursor = cast {
  argumentCount: 0.0,
  argumentOffset: 0.0,
  commands: commands,
  getArgument: function(relativeIndex:Float):Null<ShapeCommandToken> {
    if (relativeIndex < 0 || relativeIndex >= cursor.argumentCount) return cast _Runtime.UNDEFINED;
    return cursor.commands[Std.int(cursor.argumentOffset + relativeIndex)];
  },
  length: 0.0,
};
return cursor;
