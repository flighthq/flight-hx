// Derived by tools/derive-cairo-aliases.mjs from the generated canvas surface. Do not edit.
package flight;

import Math as HxMath;
import flight._internal._Runtime;
import flight._Scene2DCanvas as Facade_Scene2DCanvas_flight__Scene2DCanvas;
import flight.types.CanvasRenderState;
import flight.types.CanvasRenderTextureExplanation;
import flight.types.CanvasRenderTexturePool;
import flight.types.CanvasShapeCommand;
import flight.types.CanvasTextureResolver;
import flight.types.CanvasTextureResolvers;
import flight.types.Matrix;
import flight.types.Node2D;
import flight.types.RenderCache;
import flight.types.RenderCacheRefreshOptions;
import flight.types.RenderState;
import flight.types.RenderTargetDescriptor;
import flight.types.RenderTexture;
import flight.types.Scene2DKindUsage;
import flight.types.Scene2DRenderer;
import flight.types.Scene3DGraphSyncPolicy;
import flight.types.SceneCoverageCatalog;
import flight.types.SceneCoverageEntry;
import flight.types.ShapeRasterizer;
import flight.types.SpriteRenderer;
import flight.types.Texture;
import flight.types.TextureResolutionExplanation;
import flight.types.TextureSourceKind;

class Scene2DCairo {
  public static inline function acquireCairoRenderTexture(state:CanvasRenderState, pool:CanvasRenderTexturePool, descriptor:RenderTargetDescriptor):RenderTexture { return flight.Scene2DCanvas.acquireCanvasRenderTexture(state, pool, descriptor); }
  public static inline function bindCairoRenderTexture(state:CanvasRenderState, renderTexture:RenderTexture):Null<flight._internal.dom.HTMLCanvasElement> { return flight.Scene2DCanvas.bindCanvasRenderTexture(state, renderTexture); }
  public static inline function connectCairoTextureResolverMisses(resolvers:CanvasTextureResolvers, state:RenderState):Void { flight.Scene2DCanvas.connectCanvasTextureResolverMisses(resolvers, state); }
  public static inline function copyCairoRenderStateRegistrations(target:CanvasRenderState, source:CanvasRenderState):Void { flight.Scene2DCanvas.copyCanvasRenderStateRegistrations(target, source); }
  public static inline function createCairoCacheState(screenState:CanvasRenderState):CanvasRenderState { return flight.Scene2DCanvas.createCanvasCacheState(screenState); }
  public static inline function createCairoElement(width:Float, height:Float, ?pixelRatio:Float):flight._internal.dom.HTMLCanvasElement { return flight.Scene2DCanvas.createCanvasElement(width, height, pixelRatio); }
  public static inline function createCairoOffscreenRenderState(screenState:CanvasRenderState):CanvasRenderState { return flight.Scene2DCanvas.createCanvasOffscreenRenderState(screenState); }
  public static inline function createCairoRenderState(canvas:flight._internal.dom.HTMLCanvasElement, ?options:{ @:optional var backgroundColor:Null<Float>; @:optional var contextAttributes:Null<flight._internal.dom.CanvasRenderingContext2DSettings>; @:optional var imageSmoothingEnabled:Null<Bool>; @:optional var imageSmoothingQuality:Null<flight._internal.dom.ImageSmoothingQuality>; @:optional var pixelRatio:Null<Float>; @:optional var renderTransform:Null<Matrix>; @:optional var roundPixels:Null<Bool>; @:optional var sceneGraphSyncPolicy:Null<Scene3DGraphSyncPolicy>; }):CanvasRenderState { return flight.Scene2DCanvas.createCanvasRenderState(canvas, options); }
  public static inline function createCairoRenderTexturePool():CanvasRenderTexturePool { return flight.Scene2DCanvas.createCanvasRenderTexturePool(); }
  public static inline function createCairoShapeRasterizer(resolvers:CanvasTextureResolvers):ShapeRasterizer { return flight.Scene2DCanvas.createCanvasShapeRasterizer(resolvers); }
  public static inline function createCairoTextureResolvers():CanvasTextureResolvers { return flight.Scene2DCanvas.createCanvasTextureResolvers(); }
  public static inline function destroyCairoRenderState(state:CanvasRenderState):Void { flight.Scene2DCanvas.destroyCanvasRenderState(state); }
  public static inline function destroyCairoRenderTexture(state:CanvasRenderState, renderTexture:RenderTexture):Void { flight.Scene2DCanvas.destroyCanvasRenderTexture(state, renderTexture); }
  public static inline function destroyCairoRenderTexturePool(state:CanvasRenderState, pool:CanvasRenderTexturePool):Void { flight.Scene2DCanvas.destroyCanvasRenderTexturePool(state, pool); }
  public static inline function enableCairoBlendMode(state:CanvasRenderState):Void { flight.Scene2DCanvas.enableCanvasBlendMode(state); }
  public static inline function enableCairoClip(state:CanvasRenderState):Void { flight.Scene2DCanvas.enableCanvasClip(state); }
  public static inline function enableCairoRenderCache(state:RenderState):Void { flight.Scene2DCanvas.enableCanvasRenderCache(state); }
  public static inline function enableCairoTextInput():Void { flight.Scene2DCanvas.enableCanvasTextInput(); }
  public static inline function enableCairoTextureResolverGuards(state:CanvasRenderState):Void { flight.Scene2DCanvas.enableCanvasTextureResolverGuards(state); }
  public static inline function explainCairoRenderTexture(state:CanvasRenderState, renderTexture:RenderTexture):CanvasRenderTextureExplanation { return flight.Scene2DCanvas.explainCanvasRenderTexture(state, renderTexture); }
  public static inline function explainCairoScene2DCoverage(out:Array<SceneCoverageEntry>, state:CanvasRenderState, usage:Scene2DKindUsage, catalog:SceneCoverageCatalog):Void { flight.Scene2DCanvas.explainCanvasScene2DCoverage(out, state, usage, catalog); }
  public static inline function explainCairoTextureResolution(resolvers:CanvasTextureResolvers, texture:Texture):TextureResolutionExplanation { return flight.Scene2DCanvas.explainCanvasTextureResolution(resolvers, texture); }
  public static inline function getCairoRenderStateTextureResolvers(state:CanvasRenderState):CanvasTextureResolvers { return flight.Scene2DCanvas.getCanvasRenderStateTextureResolvers(state); }
  public static inline function hasCairoScene2DCoverage(state:CanvasRenderState, usage:Scene2DKindUsage):Bool { return flight.Scene2DCanvas.hasCanvasScene2DCoverage(state, usage); }
  public static inline function refreshCairoRenderCache(cacheState:CanvasRenderState, cache:RenderCache, source:Node2D, ?options:RenderCacheRefreshOptions):Bool { return flight.Scene2DCanvas.refreshCanvasRenderCache(cacheState, cache, source, options); }
  public static inline function registerCairoBitmapTextureResolver(resolvers:CanvasTextureResolvers):Void { flight.Scene2DCanvas.registerCanvasBitmapTextureResolver(resolvers); }
  public static inline function registerCairoImageTextureResolver(resolvers:CanvasTextureResolvers):Void { flight.Scene2DCanvas.registerCanvasImageTextureResolver(resolvers); }
  public static inline function registerCairoRenderTextureResolver(resolvers:CanvasTextureResolvers, state:CanvasRenderState):Void { flight.Scene2DCanvas.registerCanvasRenderTextureResolver(resolvers, state); }
  public static inline function registerCairoShapeCommands(state:RenderState, commands:Array<CanvasShapeCommand<String>>):Void { flight.Scene2DCanvas.registerCanvasShapeCommands(state, commands); }
  public static inline function registerCairoTextureResolver(resolvers:CanvasTextureResolvers, sourceKind:TextureSourceKind, resolver:Null<CanvasTextureResolver>):Void { flight.Scene2DCanvas.registerCanvasTextureResolver(resolvers, sourceKind, resolver); }
  public static inline function releaseCairoRenderTexture(state:CanvasRenderState, pool:CanvasRenderTexturePool, renderTexture:RenderTexture):Void { flight.Scene2DCanvas.releaseCanvasRenderTexture(state, pool, renderTexture); }
  public static inline function renderCairoBackground(state:CanvasRenderState):Void { flight.Scene2DCanvas.renderCanvasBackground(state); }
  public static inline function renderCairoScene2D(state:CanvasRenderState, source:Node2D):Void { flight.Scene2DCanvas.renderCanvasScene2D(state, source); }
  public static inline function renderIntoCairoRenderTexture(state:CanvasRenderState, renderTexture:RenderTexture, callback:CanvasRenderState->Void):Void { flight.Scene2DCanvas.renderIntoCanvasRenderTexture(state, renderTexture, callback); }
  public static inline function setCairoRenderTransform2D(state:CanvasRenderState, transform:Matrix):Void { flight.Scene2DCanvas.setCanvasRenderTransform2D(state, transform); }
  public static inline function withCairoRenderTextures<T>(state:CanvasRenderState, pool:CanvasRenderTexturePool, descriptors:Array<RenderTargetDescriptor>, callback:Array<RenderTexture>->T):T { return flight.Scene2DCanvas.withCanvasRenderTextures(state, pool, descriptors, callback); }
  public static var defaultCairoBeginFill(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoBeginFill():CanvasShapeCommand<String> return flight.Scene2DCanvas.defaultCanvasBeginFill;
  public static var defaultCairoBeginGradientFill(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoBeginGradientFill():CanvasShapeCommand<String> return flight.Scene2DCanvas.defaultCanvasBeginGradientFill;
  public static var defaultCairoBitmapTextRenderer(get, never):SpriteRenderer;
  static inline function get_defaultCairoBitmapTextRenderer():SpriteRenderer return flight.Scene2DCanvas.defaultCanvasBitmapTextRenderer;
  public static var defaultCairoCubicCurveTo(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoCubicCurveTo():CanvasShapeCommand<String> return flight.Scene2DCanvas.defaultCanvasCubicCurveTo;
  public static var defaultCairoCurveTo(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoCurveTo():CanvasShapeCommand<String> return flight.Scene2DCanvas.defaultCanvasCurveTo;
  public static var defaultCairoDrawCircle(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoDrawCircle():CanvasShapeCommand<String> return flight.Scene2DCanvas.defaultCanvasDrawCircle;
  public static var defaultCairoDrawEllipse(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoDrawEllipse():CanvasShapeCommand<String> return flight.Scene2DCanvas.defaultCanvasDrawEllipse;
  public static var defaultCairoDrawPath(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoDrawPath():CanvasShapeCommand<String> return flight.Scene2DCanvas.defaultCanvasDrawPath;
  public static var defaultCairoDrawRectangle(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoDrawRectangle():CanvasShapeCommand<String> return flight.Scene2DCanvas.defaultCanvasDrawRectangle;
  public static var defaultCairoDrawRoundRectangle(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoDrawRoundRectangle():CanvasShapeCommand<String> return flight.Scene2DCanvas.defaultCanvasDrawRoundRectangle;
  public static var defaultCairoEndFill(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoEndFill():CanvasShapeCommand<String> return flight.Scene2DCanvas.defaultCanvasEndFill;
  public static var defaultCairoLineGradientStyle(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoLineGradientStyle():CanvasShapeCommand<String> return flight.Scene2DCanvas.defaultCanvasLineGradientStyle;
  public static var defaultCairoLineStyle(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoLineStyle():CanvasShapeCommand<String> return flight.Scene2DCanvas.defaultCanvasLineStyle;
  public static var defaultCairoLineTo(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoLineTo():CanvasShapeCommand<String> return flight.Scene2DCanvas.defaultCanvasLineTo;
  public static var defaultCairoMorphShapeRenderer(get, never):Scene2DRenderer;
  static inline function get_defaultCairoMorphShapeRenderer():Scene2DRenderer return flight.Scene2DCanvas.defaultCanvasMorphShapeRenderer;
  public static var defaultCairoMoveTo(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoMoveTo():CanvasShapeCommand<String> return flight.Scene2DCanvas.defaultCanvasMoveTo;
  public static var defaultCairoParticleEmitter2DRenderer(get, never):SpriteRenderer;
  static inline function get_defaultCairoParticleEmitter2DRenderer():SpriteRenderer return flight.Scene2DCanvas.defaultCanvasParticleEmitter2DRenderer;
  public static var defaultCairoQuadBatchRenderer(get, never):SpriteRenderer;
  static inline function get_defaultCairoQuadBatchRenderer():SpriteRenderer return flight.Scene2DCanvas.defaultCanvasQuadBatchRenderer;
  public static var defaultCairoRichTextRenderer(get, never):Scene2DRenderer;
  static inline function get_defaultCairoRichTextRenderer():Scene2DRenderer return flight.Scene2DCanvas.defaultCanvasRichTextRenderer;
  public static var defaultCairoScale9ShapeRenderer(get, never):Scene2DRenderer;
  static inline function get_defaultCairoScale9ShapeRenderer():Scene2DRenderer return flight.Scene2DCanvas.defaultCanvasScale9ShapeRenderer;
  public static var defaultCairoShapeCommands(get, never):Array<CanvasShapeCommand<String>>;
  static inline function get_defaultCairoShapeCommands():Array<CanvasShapeCommand<String>> return flight.Scene2DCanvas.defaultCanvasShapeCommands;
  public static var defaultCairoShapeRenderer(get, never):Scene2DRenderer;
  static inline function get_defaultCairoShapeRenderer():Scene2DRenderer return flight.Scene2DCanvas.defaultCanvasShapeRenderer;
  public static var defaultCairoSpriteRenderer(get, never):Scene2DRenderer;
  static inline function get_defaultCairoSpriteRenderer():Scene2DRenderer return flight.Scene2DCanvas.defaultCanvasSpriteRenderer;
  public static var defaultCairoTextLabelRenderer(get, never):Scene2DRenderer;
  static inline function get_defaultCairoTextLabelRenderer():Scene2DRenderer return flight.Scene2DCanvas.defaultCanvasTextLabelRenderer;
  public static var defaultCairoTextureShapeCommands(get, never):Array<CanvasShapeCommand<String>>;
  static inline function get_defaultCairoTextureShapeCommands():Array<CanvasShapeCommand<String>> return flight.Scene2DCanvas.defaultCanvasTextureShapeCommands;
  public static var defaultCairoTilemapRenderer(get, never):SpriteRenderer;
  static inline function get_defaultCairoTilemapRenderer():SpriteRenderer return flight.Scene2DCanvas.defaultCanvasTilemapRenderer;
  #if lime
  /** Native window-backed presentable surface; handwritten in CairoSurface.hx. */
  public static inline function createCairoSurface(window:lime.ui.Window):flight._internal.dom.HTMLCanvasElement { return flight._internal.scene2DCairo.CairoSurface.createCairoSurface(window); }
  #end
}
