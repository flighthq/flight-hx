// Derived by tools/derive-cairo-aliases.mjs from the generated canvas surface. Do not edit.
package flighthq.scene2dCairo;

import Math as HxMath;
import flighthq._internal._Runtime;
import flighthq.scene2dCanvas.CanvasBackground as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasBackground;
import flighthq.scene2dCanvas.CanvasBitmapText as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasBitmapText;
import flighthq.scene2dCanvas.CanvasBitmapTextureResolver as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasBitmapTextureResolver;
import flighthq.scene2dCanvas.CanvasCache as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasCache;
import flighthq.scene2dCanvas.CanvasClip as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasClip;
import flighthq.scene2dCanvas.CanvasElement as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasElement;
import flighthq.scene2dCanvas.CanvasImageTextureResolver as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasImageTextureResolver;
import flighthq.scene2dCanvas.CanvasMaterials as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasMaterials;
import flighthq.scene2dCanvas.CanvasNode2D as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasNode2D;
import flighthq.scene2dCanvas.CanvasParticleEmitter2D as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasParticleEmitter2D;
import flighthq.scene2dCanvas.CanvasQuadBatch as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasQuadBatch;
import flighthq.scene2dCanvas.CanvasRenderState as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasRenderState;
import flighthq.scene2dCanvas.CanvasRenderTarget as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasRenderTarget;
import flighthq.scene2dCanvas.CanvasRenderTexture as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasRenderTexture;
import flighthq.scene2dCanvas.CanvasRenderTexturePool as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasRenderTexturePool;
import flighthq.scene2dCanvas.CanvasRenderTextureResolver as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasRenderTextureResolver;
import flighthq.scene2dCanvas.CanvasRichText as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasRichText;
import flighthq.scene2dCanvas.CanvasScale9Shape as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasScale9Shape;
import flighthq.scene2dCanvas.CanvasShape as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasShape;
import flighthq.scene2dCanvas.CanvasShapeCommands as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasShapeCommands;
import flighthq.scene2dCanvas.CanvasShapeRasterizer as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasShapeRasterizer;
import flighthq.scene2dCanvas.CanvasShapeRegistry as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasShapeRegistry;
import flighthq.scene2dCanvas.CanvasSprite as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasSprite;
import flighthq.scene2dCanvas.CanvasTextInput as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasTextInput;
import flighthq.scene2dCanvas.CanvasTextLabel as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasTextLabel;
import flighthq.scene2dCanvas.CanvasTextureResolver as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasTextureResolver;
import flighthq.scene2dCanvas.CanvasTilemap as Facade_Scene2dCanvas_flighthq_scene2dCanvas_CanvasTilemap;
import flighthq.scene2dCanvas.EnableCanvasTextureResolverGuards as Facade_Scene2dCanvas_flighthq_scene2dCanvas_EnableCanvasTextureResolverGuards;
import flighthq.scene2dCanvas.ExplainCanvasTextureResolution as Facade_Scene2dCanvas_flighthq_scene2dCanvas_ExplainCanvasTextureResolution;
import flighthq.types.CanvasRenderState;
import flighthq.types.CanvasRenderTextureExplanation;
import flighthq.types.CanvasRenderTexturePool;
import flighthq.types.CanvasShapeCommand;
import flighthq.types.CanvasTextureResolver;
import flighthq.types.CanvasTextureResolvers;
import flighthq.types.Matrix;
import flighthq.types.Node2D;
import flighthq.types.RenderCache;
import flighthq.types.RenderCacheRefreshOptions;
import flighthq.types.RenderState;
import flighthq.types.RenderTargetDescriptor;
import flighthq.types.RenderTexture;
import flighthq.types.Scene2DRenderer;
import flighthq.types.Scene3DGraphSyncPolicy;
import flighthq.types.ShapeRasterizer;
import flighthq.types.SpriteRenderer;
import flighthq.types.Texture;
import flighthq.types.TextureResolutionExplanation;
import flighthq.types.TextureSourceKind;

class Scene2dCairo {
  public static inline function acquireCairoRenderTexture(state:CanvasRenderState, pool:CanvasRenderTexturePool, descriptor:RenderTargetDescriptor):RenderTexture { return flighthq.scene2dCanvas.Scene2dCanvas.acquireCanvasRenderTexture(state, pool, descriptor); }
  public static inline function bindCairoRenderTexture(state:CanvasRenderState, renderTexture:RenderTexture):Null<flighthq._internal.dom.HTMLCanvasElement> { return flighthq.scene2dCanvas.Scene2dCanvas.bindCanvasRenderTexture(state, renderTexture); }
  public static inline function connectCairoTextureResolverMisses(resolvers:CanvasTextureResolvers, state:RenderState):Void { flighthq.scene2dCanvas.Scene2dCanvas.connectCanvasTextureResolverMisses(resolvers, state); }
  public static inline function copyCairoRenderStateRegistrations(target:CanvasRenderState, source:CanvasRenderState):Void { flighthq.scene2dCanvas.Scene2dCanvas.copyCanvasRenderStateRegistrations(target, source); }
  public static inline function createCairoCacheState(screenState:CanvasRenderState):CanvasRenderState { return flighthq.scene2dCanvas.Scene2dCanvas.createCanvasCacheState(screenState); }
  public static inline function createCairoElement(width:Float, height:Float, ?pixelRatio:Float):flighthq._internal.dom.HTMLCanvasElement { return flighthq.scene2dCanvas.Scene2dCanvas.createCanvasElement(width, height, pixelRatio); }
  public static inline function createCairoOffscreenRenderState(screenState:CanvasRenderState):CanvasRenderState { return flighthq.scene2dCanvas.Scene2dCanvas.createCanvasOffscreenRenderState(screenState); }
  public static inline function createCairoRenderState(canvas:flighthq._internal.dom.HTMLCanvasElement, ?options:{ @:optional var backgroundColor:Null<Float>; @:optional var contextAttributes:Null<flighthq._internal.dom.CanvasRenderingContext2DSettings>; @:optional var imageSmoothingEnabled:Null<Bool>; @:optional var imageSmoothingQuality:Null<flighthq._internal.dom.ImageSmoothingQuality>; @:optional var pixelRatio:Null<Float>; @:optional var renderTransform:Null<Matrix>; @:optional var roundPixels:Null<Bool>; @:optional var sceneGraphSyncPolicy:Null<Scene3DGraphSyncPolicy>; }):CanvasRenderState { return flighthq.scene2dCanvas.Scene2dCanvas.createCanvasRenderState(canvas, options); }
  public static inline function createCairoRenderTexturePool():CanvasRenderTexturePool { return flighthq.scene2dCanvas.Scene2dCanvas.createCanvasRenderTexturePool(); }
  public static inline function createCairoShapeRasterizer(resolvers:CanvasTextureResolvers):ShapeRasterizer { return flighthq.scene2dCanvas.Scene2dCanvas.createCanvasShapeRasterizer(resolvers); }
  public static inline function createCairoTextureResolvers():CanvasTextureResolvers { return flighthq.scene2dCanvas.Scene2dCanvas.createCanvasTextureResolvers(); }
  public static inline function destroyCairoRenderState(state:CanvasRenderState):Void { flighthq.scene2dCanvas.Scene2dCanvas.destroyCanvasRenderState(state); }
  public static inline function destroyCairoRenderTexture(state:CanvasRenderState, renderTexture:RenderTexture):Void { flighthq.scene2dCanvas.Scene2dCanvas.destroyCanvasRenderTexture(state, renderTexture); }
  public static inline function destroyCairoRenderTexturePool(state:CanvasRenderState, pool:CanvasRenderTexturePool):Void { flighthq.scene2dCanvas.Scene2dCanvas.destroyCanvasRenderTexturePool(state, pool); }
  public static inline function enableCairoBlendMode(state:CanvasRenderState):Void { flighthq.scene2dCanvas.Scene2dCanvas.enableCanvasBlendMode(state); }
  public static inline function enableCairoClip(state:CanvasRenderState):Void { flighthq.scene2dCanvas.Scene2dCanvas.enableCanvasClip(state); }
  public static inline function enableCairoRenderCache(state:RenderState):Void { flighthq.scene2dCanvas.Scene2dCanvas.enableCanvasRenderCache(state); }
  public static inline function enableCairoTextInput():Void { flighthq.scene2dCanvas.Scene2dCanvas.enableCanvasTextInput(); }
  public static inline function enableCairoTextureResolverGuards(state:CanvasRenderState):Void { flighthq.scene2dCanvas.Scene2dCanvas.enableCanvasTextureResolverGuards(state); }
  public static inline function explainCairoRenderTexture(state:CanvasRenderState, renderTexture:RenderTexture):CanvasRenderTextureExplanation { return flighthq.scene2dCanvas.Scene2dCanvas.explainCanvasRenderTexture(state, renderTexture); }
  public static inline function explainCairoTextureResolution(resolvers:CanvasTextureResolvers, texture:Texture):TextureResolutionExplanation { return flighthq.scene2dCanvas.Scene2dCanvas.explainCanvasTextureResolution(resolvers, texture); }
  public static inline function getCairoRenderStateTextureResolvers(state:CanvasRenderState):CanvasTextureResolvers { return flighthq.scene2dCanvas.Scene2dCanvas.getCanvasRenderStateTextureResolvers(state); }
  public static inline function refreshCairoRenderCache(cacheState:CanvasRenderState, cache:RenderCache, source:Node2D, ?options:RenderCacheRefreshOptions):Bool { return flighthq.scene2dCanvas.Scene2dCanvas.refreshCanvasRenderCache(cacheState, cache, source, options); }
  public static inline function registerCairoBitmapTextureResolver(resolvers:CanvasTextureResolvers):Void { flighthq.scene2dCanvas.Scene2dCanvas.registerCanvasBitmapTextureResolver(resolvers); }
  public static inline function registerCairoImageTextureResolver(resolvers:CanvasTextureResolvers):Void { flighthq.scene2dCanvas.Scene2dCanvas.registerCanvasImageTextureResolver(resolvers); }
  public static inline function registerCairoRenderTextureResolver(resolvers:CanvasTextureResolvers, state:CanvasRenderState):Void { flighthq.scene2dCanvas.Scene2dCanvas.registerCanvasRenderTextureResolver(resolvers, state); }
  public static inline function registerCairoShapeCommands(state:RenderState, commands:Array<CanvasShapeCommand<String>>):Void { flighthq.scene2dCanvas.Scene2dCanvas.registerCanvasShapeCommands(state, commands); }
  public static inline function registerCairoTextureResolver(resolvers:CanvasTextureResolvers, sourceKind:TextureSourceKind, resolver:Null<CanvasTextureResolver>):Void { flighthq.scene2dCanvas.Scene2dCanvas.registerCanvasTextureResolver(resolvers, sourceKind, resolver); }
  public static inline function releaseCairoRenderTexture(state:CanvasRenderState, pool:CanvasRenderTexturePool, renderTexture:RenderTexture):Void { flighthq.scene2dCanvas.Scene2dCanvas.releaseCanvasRenderTexture(state, pool, renderTexture); }
  public static inline function renderCairoBackground(state:CanvasRenderState):Void { flighthq.scene2dCanvas.Scene2dCanvas.renderCanvasBackground(state); }
  public static inline function renderCairoScene2D(state:CanvasRenderState, source:Node2D):Void { flighthq.scene2dCanvas.Scene2dCanvas.renderCanvasScene2D(state, source); }
  public static inline function renderIntoCairoRenderTexture(state:CanvasRenderState, renderTexture:RenderTexture, callback:CanvasRenderState->Void):Void { flighthq.scene2dCanvas.Scene2dCanvas.renderIntoCanvasRenderTexture(state, renderTexture, callback); }
  public static inline function setCairoRenderTransform2D(state:CanvasRenderState, transform:Matrix):Void { flighthq.scene2dCanvas.Scene2dCanvas.setCanvasRenderTransform2D(state, transform); }
  public static inline function withCairoRenderTextures<T>(state:CanvasRenderState, pool:CanvasRenderTexturePool, descriptors:Array<RenderTargetDescriptor>, callback:Array<RenderTexture>->T):T { return flighthq.scene2dCanvas.Scene2dCanvas.withCanvasRenderTextures(state, pool, descriptors, callback); }
  public static var defaultCairoBeginFill(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoBeginFill():CanvasShapeCommand<String> return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasBeginFill;
  public static var defaultCairoBeginGradientFill(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoBeginGradientFill():CanvasShapeCommand<String> return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasBeginGradientFill;
  public static var defaultCairoBitmapTextRenderer(get, never):SpriteRenderer;
  static inline function get_defaultCairoBitmapTextRenderer():SpriteRenderer return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasBitmapTextRenderer;
  public static var defaultCairoCubicCurveTo(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoCubicCurveTo():CanvasShapeCommand<String> return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasCubicCurveTo;
  public static var defaultCairoCurveTo(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoCurveTo():CanvasShapeCommand<String> return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasCurveTo;
  public static var defaultCairoDrawCircle(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoDrawCircle():CanvasShapeCommand<String> return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasDrawCircle;
  public static var defaultCairoDrawEllipse(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoDrawEllipse():CanvasShapeCommand<String> return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasDrawEllipse;
  public static var defaultCairoDrawPath(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoDrawPath():CanvasShapeCommand<String> return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasDrawPath;
  public static var defaultCairoDrawRectangle(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoDrawRectangle():CanvasShapeCommand<String> return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasDrawRectangle;
  public static var defaultCairoDrawRoundRectangle(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoDrawRoundRectangle():CanvasShapeCommand<String> return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasDrawRoundRectangle;
  public static var defaultCairoEndFill(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoEndFill():CanvasShapeCommand<String> return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasEndFill;
  public static var defaultCairoLineGradientStyle(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoLineGradientStyle():CanvasShapeCommand<String> return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasLineGradientStyle;
  public static var defaultCairoLineStyle(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoLineStyle():CanvasShapeCommand<String> return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasLineStyle;
  public static var defaultCairoLineTo(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoLineTo():CanvasShapeCommand<String> return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasLineTo;
  public static var defaultCairoMorphShapeRenderer(get, never):Scene2DRenderer;
  static inline function get_defaultCairoMorphShapeRenderer():Scene2DRenderer return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasMorphShapeRenderer;
  public static var defaultCairoMoveTo(get, never):CanvasShapeCommand<String>;
  static inline function get_defaultCairoMoveTo():CanvasShapeCommand<String> return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasMoveTo;
  public static var defaultCairoParticleEmitter2DRenderer(get, never):SpriteRenderer;
  static inline function get_defaultCairoParticleEmitter2DRenderer():SpriteRenderer return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasParticleEmitter2DRenderer;
  public static var defaultCairoQuadBatchRenderer(get, never):SpriteRenderer;
  static inline function get_defaultCairoQuadBatchRenderer():SpriteRenderer return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasQuadBatchRenderer;
  public static var defaultCairoRichTextRenderer(get, never):Scene2DRenderer;
  static inline function get_defaultCairoRichTextRenderer():Scene2DRenderer return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasRichTextRenderer;
  public static var defaultCairoScale9ShapeRenderer(get, never):Scene2DRenderer;
  static inline function get_defaultCairoScale9ShapeRenderer():Scene2DRenderer return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasScale9ShapeRenderer;
  public static var defaultCairoShapeCommands(get, never):Array<CanvasShapeCommand<String>>;
  static inline function get_defaultCairoShapeCommands():Array<CanvasShapeCommand<String>> return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasShapeCommands;
  public static var defaultCairoShapeRenderer(get, never):Scene2DRenderer;
  static inline function get_defaultCairoShapeRenderer():Scene2DRenderer return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasShapeRenderer;
  public static var defaultCairoSpriteRenderer(get, never):Scene2DRenderer;
  static inline function get_defaultCairoSpriteRenderer():Scene2DRenderer return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasSpriteRenderer;
  public static var defaultCairoTextLabelRenderer(get, never):Scene2DRenderer;
  static inline function get_defaultCairoTextLabelRenderer():Scene2DRenderer return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasTextLabelRenderer;
  public static var defaultCairoTextureShapeCommands(get, never):Array<CanvasShapeCommand<String>>;
  static inline function get_defaultCairoTextureShapeCommands():Array<CanvasShapeCommand<String>> return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasTextureShapeCommands;
  public static var defaultCairoTilemapRenderer(get, never):SpriteRenderer;
  static inline function get_defaultCairoTilemapRenderer():SpriteRenderer return flighthq.scene2dCanvas.Scene2dCanvas.defaultCanvasTilemapRenderer;
  #if lime
  /** Native window-backed presentable surface; handwritten in CairoSurface.hx. */
  public static inline function createCairoSurface(window:lime.ui.Window):flighthq._internal.dom.HTMLCanvasElement { return flighthq.scene2dCairo.CairoSurface.createCairoSurface(window); }
  #end
}
