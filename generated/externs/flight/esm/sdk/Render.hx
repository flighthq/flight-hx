package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/render")
extern class Render {
  public static final RenderCacheKind:String;
  public static final SCENE2D_WORKING_COLOR_SPACE:flight.esm.types.render_contract.Types.RenderTargetColorSpace;
  public static function areColorAdjustmentsEnabled(state:flight.esm.types.render_contract.Types.RenderState):Bool;
  public static function createCanvasHostSurface(host:flight.esm.types.surface.Types.HostCanvasCapability, width:Float, height:Float):Null<flight.esm.types.surface.Types.CanvasSurface>;
  public static function createRenderCache():flight.esm.types.render_contract.Types.RenderCache;
  public static function createRenderView<State, Target>(renderState:State, renderTarget:Target, viewport:flight.esm.types.node.Types.Viewport):flight.esm.types.render.Types.RenderView<State, Target>;
  public static function destroyCanvasHostSurface(surface:flight.esm.types.surface.Types.CanvasSurface):Void;
  public static function destroyRenderState(state:flight.esm.types.render_contract.Types.RenderState):Void;
  public static function disableSceneRenderGuards():Void;
  public static function disposeScene2DRender(state:flight.esm.types.render_contract.Types.RenderState, root:flight.esm.types.node.Types.NodeAny):Void;
  public static function enableColorAdjustments(state:flight.esm.types.render_contract.Types.RenderState):Void;
  public static function enableRenderRegistriesGuards(state:flight.esm.types.render_contract.Types.RenderState, logState:Null<flight.esm.types.log.Types.LogState>):Void;
  public static function enableRenderRegistrySignals(state:flight.esm.types.render_contract.Types.RenderState):flight.esm.types.render_contract.Types.RenderRegistrySignals;
  public static function enableSceneRenderGuards(logState:Null<flight.esm.types.log.Types.LogState>):Void;
  public static function explainRenderRegistriesMisses(state:flight.esm.types.render_contract.Types.RenderState):flight.esm.types.render_contract.Types.RenderRegistriesMissExplanation;
  public static function explainScene2DPipelineCoverage(state:flight.esm.types.render_contract.Types.RenderState, scene:flight.esm.types.node.Types.NodeAny):flight.esm.types.render_contract.Types.Scene2DPipelineCoverageExplanation;
  public static function explainScene3DPipelineCoverage(state:flight.esm.types.render_contract.Types.RenderState, scene:flight.esm.types.node.Types.NodeAny, materialRenderers:Null<js.lib.Map<String, Dynamic>>):flight.esm.types.render_contract.Types.Scene3DPipelineCoverageExplanation;
  public static function getCanvasHostSurface(surface:flight.esm.types.surface.Types.CanvasSurface):Null<flight.esm.types.surface.Types.HostCanvasCapability>;
  public static function mergeRenderOptions(...options:flight.esm.types.render_contract.Types.RenderStateOptions):flight.esm.types.render_contract.Types.RenderStateOptions;
  public static function prepareScene2DRender(state:flight.esm.types.render_contract.Types.RenderState, source:flight.esm.types.scene2d_contract.Types.Node2D):Bool;
  public static function prepareScene3DRender(state:flight.esm.types.render_contract.Types.RenderState, scene:flight.esm.types.scene3d.Types.Node3D, camera:flight.esm.types.camera.Types.Camera3D, lights:flight.esm.types.lighting_contract.Types.Scene3DLightsLike, ?viewportAspect:Null<Float>):flight.esm.types.render_contract.Types.Scene3DRenderList;
  public static function registerNodeRenderer(state:flight.esm.types.render_contract.Types.RenderState, kind:String, renderer:flight.esm.types.render_contract.Types.NodeRenderer):Void;
  public static function registerNodeRenderers(state:flight.esm.types.render_contract.Types.RenderState, entries:Array<Array<Dynamic>>):Void;
  public static function registerRenderCacheNodeRenderer(state:flight.esm.types.render_contract.Types.RenderState, renderer:flight.esm.types.render_contract.Types.NodeRenderer):Void;
  public static function resizeRenderView<State, Target>(view:flight.esm.types.render.Types.RenderView<State, Target>, logicalWidth:Float, logicalHeight:Float, devicePixelRatio:Float, resize:flight.esm.types.render.Types.RenderViewResize<State, Target>):Void;
  public static function useRenderCache(state:flight.esm.types.render_contract.Types.RenderState, source:flight.esm.types.node.Types.NodeAny, cache:flight.esm.types.render_contract.Types.RenderCache):flight.esm.types.render_contract.Types.RenderCacheAdapter;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
