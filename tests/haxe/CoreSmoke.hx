package;

import flight.Math.*;
import flight.types.Vector2Like;
import flight._internal._Async;
import flight._internal._HostValueLut;
import flight._internal._Runtime;
import flight._internal.DynamicObject;

@:access(flight._Entity)
class CoreSmoke {
  static function main():Void {
    // Number.isSafeInteger through the exact emitted form (callProperty on the
    // LUT Number namespace): physics2d timestep validation depends on it.
    final numberNamespace:Dynamic = flight._internal._HostValueLut.get('Number');
    if (flight._internal._Runtime.callProperty(numberNamespace, 'isSafeInteger', cast ([8.0] : Array<Dynamic>)) != true) {
      throw 'Number.isSafeInteger(8) should be true';
    }
    if (flight._internal._Runtime.callProperty(numberNamespace, 'isSafeInteger', cast ([1.5] : Array<Dynamic>)) != false) {
      throw 'Number.isSafeInteger(1.5) should be false';
    }
    if (flight._internal._Runtime.callProperty(numberNamespace, 'isSafeInteger', cast ([9007199254740992.0] : Array<Dynamic>)) != false) {
      throw 'Number.isSafeInteger(2^53) should be false';
    }

    // Cairo alias surface: the derived Cairo-named entry points and typedefs
    // must forward to the canvas originals with reference identity.
    final cairoResolvers:flight.types.CairoTextureResolvers = flight.Scene2DCairo.createCairoTextureResolvers();
    final canvasResolvers:Dynamic = cairoResolvers;
    if (canvasResolvers == null) throw 'cairo alias returned null resolvers';
    if (flight.Scene2DCairo.defaultCairoShapeCommands != flight.Scene2DCanvas.defaultCanvasShapeCommands) {
      throw 'cairo alias lost reference identity';
    }
    final shapeCommandRegistrarTypecheck:flight.types.RenderState->Void = typecheckShapeCommandRegistrars;
    if (shapeCommandRegistrarTypecheck == null) throw 'shape command registrar typecheck failed';
    final typedProtocolObjectTypecheck:flight.types.TweenManager->flight.types.Shape->flight._internal.dom.AudioContext->flight.types.AudioResource->Void = typecheckTypedProtocolObjects;
    if (typedProtocolObjectTypecheck == null) throw 'typed protocol object typecheck failed';
    final physicsSolverTypecheck:flight.types.Physics2DWorld->Void = typecheckPhysicsSolverArity;
    if (physicsSolverTypecheck == null) throw 'physics solver arity typecheck failed';
    #if lime
    final glSurfaceTypecheck:lime.ui.Window->flight._internal.dom.HTMLCanvasElement = flight.Sdk.createGlSurface;
    final cairoSurfaceTypecheck:lime.ui.Window->flight._internal.dom.HTMLCanvasElement = flight.Sdk.createCairoSurface;
    if (glSurfaceTypecheck == null || cairoSurfaceTypecheck == null) throw 'SDK host surface typecheck failed';
    #end
    if (clamp(12, 0, 10) != 10) throw 'clamp failed';
    StaticLoweringSmoke.run();
    StaticIndexSmoke.run();
    if (quarterForSmoke(8) != 2) throw 'loop lowering failed';
    if (_Runtime.isError('not an error')) throw 'non-Error identity failed';
    if (!_Runtime.isError(_Runtime.error('expected'))) throw 'Error identity failed';
    if (_Runtime.fround(5.6789) != 5.678899765014648) throw 'Math.fround binary32 rounding failed';
    if (!DynamicObject.is(Math.NaN, Math.NaN)) throw 'Object.is NaN identity failed';
    final negativeZero = haxe.io.FPHelper.i64ToDouble(0, 0x80000000);
    if (DynamicObject.is(0.0, negativeZero)) throw 'Object.is signed zero identity failed';
    if (!_Runtime.isIterable([]) || _Runtime.isIterable({width: 1.0})) throw 'iterable presence probe failed';

    final dynamicProductLeft:Dynamic = {value: 0.8};
    final dynamicProductRight:Dynamic = {value: 1.0};
    final dynamicProductSink:Dynamic = {value: 0.0};
    _Runtime.setField(
      dynamicProductSink,
      'value',
      _Runtime.multiplyNumbers(
        _Runtime.field(dynamicProductLeft, 'value'),
        _Runtime.field(dynamicProductRight, 'value')
      )
    );
    if (_Runtime.field(dynamicProductSink, 'value') != 0.8) throw 'dynamic fractional product was truncated';

    var synchronousFlowPrefix = 0;
    final synchronousFlow = _Async.continueFlow(_Async.flowNormal(), function() {
      synchronousFlowPrefix = 1;
      return _Async.flowNormal();
    });
    if (synchronousFlowPrefix != 1 || synchronousFlow != null) throw 'async synchronous prefix was deferred';
    var synchronousIterations = 0;
    final synchronousLoop = _Async.repeatFlow(function() {
      synchronousIterations++;
      return synchronousIterations < 3 ? _Async.flowContinue() : _Async.flowBreak();
    });
    if (synchronousIterations != 3) throw 'synchronous async flow loop was deferred';

    #if js
    if (synchronousLoop != null) throw 'JavaScript synchronous flow returned a pending outcome';
    var awaitedContinuationRan = false;
    _Async.flatMap(_Async.resolve(null), function(_) {
      awaitedContinuationRan = true;
      return null;
    });
    if (awaitedContinuationRan) throw 'real await continuation ran synchronously';

    final thrownMarkers:Array<Dynamic> = [{}, 'primitive', _Runtime.error('identity')];
    for (thrownMarker in thrownMarkers) {
      final caughtMarker:Dynamic = js.Syntax.code(
        '(function(throwValue, marker) { try { throwValue(marker); } catch (error) { return error; } })({0}, {1})',
        _Runtime.throwValue,
        thrownMarker,
      );
      if (caughtMarker != thrownMarker) throw 'raw thrown value lost identity';
    }
    #end

    final point:Vector2Like = {x: 0.0, y: 0.0};
    final random = createRandomSource(0x1234);
    randomInsideUnitDisc(random, point);
    if (point.x * point.x + point.y * point.y > 1) throw 'random point escaped unit disc';
    FmodSmoke.run();

    final vector = flight.Geometry.createVector2(3, 4);
    if (flight.Geometry.getVector2Length(vector) != 5) throw 'geometry failed';
    final sdkVector = flight.Sdk.createVector2(6, 8);
    if (flight.Sdk.getVector2Length(sdkVector) != 10) throw 'sdk facade failed';
    final mutableVector = flight.Geometry.createVector3(1, 2, 3);
    final vectorAlias = mutableVector;
    flight.Geometry.setVector3(mutableVector, 4, 5, 6);
    if (vectorAlias.x != 4 || vectorAlias.y != 5 || vectorAlias.z != 6) {
      throw 'typed struct out parameter lost alias identity';
    }

    TypedStructTranche4Smoke.run();
    TypedStructClassSmoke.run();
    TypedStructParticleClassSmoke.run();
    RuntimeToolkitSmoke.run();

    final box = flight.Mesh.createBoxMeshGeometry(2, 4, 6);
    if (box.bounds == null || box.bounds.min.x != -1 || box.bounds.max.y != 2 || box.bounds.max.z != 3) {
      throw 'mesh bounds failed';
    }
    final entity = flight._Entity.createEntity({value: 1});
    if (entity.value != 1) throw 'entity failed';
    final signal:flight.types.Signal<Void->Void> = flight.Signals.createSignal();
    var emitted = false;
    flight.Signals.connectSignal(signal, function() emitted = true);
    flight.Signals.emitSignal(signal);
    if (!emitted) throw 'signals failed';
    final valueSignal:flight.types.Signal<Float->Void> = flight.Signals.createSignal();
    var emittedValue = 0.0;
    flight.Signals.connectSignal(valueSignal, function(value:Float) emittedValue = value);
    flight.Signals.emitSignal(valueSignal, 4.5);
    if (emittedValue != 4.5) throw 'signal arguments failed';
    final tupleSignal:flight.types.Signal<Float->Float->Float->Void> = flight.Signals.createSignal();
    var emittedTuple = '';
    flight.Signals.connectSignal(tupleSignal, function(a:Float, b:Float, c:Float) {
      emittedTuple = '$a,$b,$c';
    });
    flight.Signals.emitSignal(tupleSignal, 1, 2, 4);
    if (emittedTuple != '1,2,4') throw 'signal rest arguments failed';

    final tweenTarget:{var x:Float;} = {x: 0.0};
    final tween = flight._Tween.makeTween__tween(
      tweenTarget,
      1.0,
      cast {x: 2.0},
      null,
      function(value:Float):Float return value
    );
    if (tween.properties.length != 1 || tween.properties[0].key != 'x') {
      throw 'Array map callback ABI lost Tween properties';
    }
    final dynamicMapped:Array<String> = cast _Runtime.callProperty(
      cast ['one', 'two'],
      'map',
      [_Runtime.haxeArity(function(value:String):String return value.toUpperCase(), 1)]
    );
    if (dynamicMapped.join(',') != 'ONE,TWO') throw 'dynamic Array map callback ABI failed';

    final cursorTokens:Array<flight.types.ShapeCommandToken> = cast (
      ['moveTo', 2.0, 10.0, 20.0] : Array<Dynamic>
    );
    final cursorRuntime = new flight._internal.ShapeCommandArgumentCursorRuntime(cursorTokens);
    flight._Shape.setShapeCommandArgumentCursor__shapeBounds(cast cursorRuntime, 2.0, 2.0);
    final publicCursor:flight.types.ShapeCommandArgumentCursor = cast cursorRuntime;
    if (publicCursor.length != 2.0 || publicCursor.getArgument(0.0) != 10.0 || publicCursor.getArgument(2.0) != null) {
      throw 'shape command cursor lost its portable derived length or indexed arguments';
    }

    final circleCommands:Array<flight.types.ShapeCommandToken> = cast (
      [
        'beginFill',
        2.0,
        0x4488cc,
        1.0,
        'drawCircle',
        3.0,
        100.0,
        100.0,
        100.0,
        'endFill',
        0.0,
      ] : Array<Dynamic>
    );
    final circleRegions = flight.Shape.getShapeFillRegions(circleCommands);
    if (circleRegions == null || circleRegions.length != 1) {
      throw 'circle shape fill command walker failed';
    }
    final defaultToleranceMesh = flight.Path.tessellatePath(
      circleRegions[0].path,
      #if js
      cast _Runtime.field(_Runtime, 'UNDEFINED')
      #else
      cast null
      #end
    );
    if (defaultToleranceMesh.vertices.length != 128 || defaultToleranceMesh.indices.length != 186) {
      throw 'omitted Float argument did not retain tessellation default: ${defaultToleranceMesh.vertices.length}/${defaultToleranceMesh.indices.length}';
    }

    final missingAlpha:Array<Dynamic> = [{}];
    if (flight._ParticlesFormats.firstAlpha__spineParse(missingAlpha) != 1) {
      throw 'nullish Float assertion bypassed the upstream alpha fallback';
    }

    final booleanCircle = flight.Path.createPath();
    flight.Path.appendPathCircle(booleanCircle, 160, 150, 80);
    final booleanRoundRectangle = flight.Path.createPath();
    flight.Path.appendPathRoundRectangle(booleanRoundRectangle, 170, 90, 140, 120, cast 16);
    final booleanUnion = flight.PathBoolean.unionPaths(booleanCircle, booleanRoundRectangle);
    if (booleanUnion.commands.length == 0 || booleanUnion.data.length == 0) {
      throw 'Martinez path boolean returned an empty union';
    }

    final endFillState:flight.types.CanvasShapeDrawState = cast {
      bitmapSrc: null,
      fillMatrix: null,
      fillMatrixInverse: null,
      hasFill: true,
      hasPendingPath: false,
    };
    flight.Scene2DCanvas.defaultCanvasEndFill.draw(
      cast null,
      endFillState,
      cast [],
      0.0
    );
    if (endFillState.hasFill) throw 'Canvas shape handler arity normalization failed';

    #if !js
    final decoder = _Runtime.construct(_HostValueLut.get('TextDecoder'), []);
    final decoded = _Runtime.callProperty(decoder, 'decode', [new flight._internal._UInt8Array([104, 105])]);
    if (decoded != 'hi') throw 'portable TextDecoder failed';

    final buffer = _Runtime.construct(_HostValueLut.get('ArrayBuffer'), [4]);
    final view = _Runtime.construct(_HostValueLut.get('DataView'), [buffer]);
    final bytes = new flight._internal._UInt8Array(_Runtime.field(view, 'buffer'));
    _Runtime.callProperty(view, 'setUint32', [0, 0x01020304, true]);
    if (flight._internal._StaticIndex.readUint8Array(bytes, 0) != 4) {
      throw 'portable ArrayBuffer DataView-to-typed-array sharing failed';
    }
    flight._internal._StaticIndex.writeUint8Array(bytes, 3, 8);
    if (_Runtime.callProperty(view, 'getUint32', [0, true]) != 0x08020304) {
      throw 'portable ArrayBuffer typed-array-to-DataView sharing failed';
    }

    var asyncValue = 0;
    _Async.flatMap(_Async.resolve(4), function(value:Int) {
      asyncValue = value + 1;
      return value;
    });
    if (asyncValue != 5) throw 'portable promise flatMap failed';

    var recovered = false;
    _Async.recover(_Async.reject('expected'), function(_) {
      recovered = true;
      return null;
    });
    if (!recovered) throw 'portable promise recovery failed';
    #end
  }

  static function quarterForSmoke(value:Float):Float {
    var result = value;
    for (_ in 0...2) result /= 2;
    return result;
  }

  static function typecheckShapeCommandRegistrars(state:flight.types.RenderState):Void {
    flight.Scene2DCanvas.registerCanvasShapeCommands(state, flight.Scene2DCanvas.defaultCanvasShapeCommands);
    flight.Scene2DCanvas.registerCanvasShapeCommands(state, flight.Scene2DCanvas.defaultCanvasTextureShapeCommands);
    flight.Scene2DGl.registerGlShapeCommands(state, flight.Scene2DGl.defaultGlShapeCommands);
    flight.Scene2DGl.registerGlShapeCommands(state, flight.Scene2DGl.defaultGlTextureShapeCommands);
    flight.Scene2DWgpu.registerWgpuShapeCommands(state, flight.Scene2DWgpu.defaultWgpuShapeCommands);
    flight.Scene2DWgpu.registerWgpuShapeCommands(state, flight.Scene2DWgpu.defaultWgpuTextureShapeCommands);
    flight.Scene2DCairo.registerCairoShapeCommands(state, flight.Scene2DCairo.defaultCairoShapeCommands);
    flight.Scene2DCairo.registerCairoShapeCommands(state, flight.Scene2DCairo.defaultCairoTextureShapeCommands);
    flight.Sdk.registerCanvasShapeCommands(state, flight.Sdk.defaultCanvasShapeCommands);
    flight.Sdk.registerGlShapeCommands(state, flight.Sdk.defaultGlShapeCommands);
    flight.Sdk.registerWgpuShapeCommands(state, flight.Sdk.defaultWgpuShapeCommands);
  }

  static function typecheckTypedProtocolObjects(
    manager:flight.types.TweenManager,
    shape:flight.types.Shape,
    context:flight._internal.dom.AudioContext,
    audio:flight.types.AudioResource,
  ):Void {
    flight.Tween.createTween(manager, shape, 1.0, {x: 2.0, y: 3.0});
    flight.Sdk.createTween(manager, shape, 1.0, {x: 2.0, y: 3.0});
    flight.Sdk.playAudioResource(context, audio, {gain: 1});
  }

  static function typecheckPhysicsSolverArity(world:flight.types.Physics2DWorld):Void {
    flight.Physics2D.registerPhysics2DJointSolver(
      world,
      flight.Physics2D.Physics2DMouseJointKind,
      flight.Physics2D.physics2DMouseJointSolver,
    );
    flight.Sdk.registerPhysics2DJointSolver(
      world,
      flight.Sdk.Physics2DWheelJointKind,
      flight.Sdk.physics2DWheelJointSolver,
    );
  }
}
