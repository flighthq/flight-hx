package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/scene3d-wgpu")
extern class Scene3DWgpu {
  public static final animatedNormalWgpuModifierSnippet:flight.esm.types.render_wgpu_contract.Types.WgpuModifierSnippet;
  public static function areWgpuScene3DCustomShaderGuardsEnabled(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Bool;
  public static function areWgpuScene3DForwardLightSelectionGuardsEnabled(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Bool;
  public static function bakeWgpuEnvironmentIbl(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, environment:flight.esm.types.lighting_contract.Types.Environment):Void;
  public static final dissolveWgpuModifierSnippet:flight.esm.types.render_wgpu_contract.Types.WgpuModifierSnippet;
  public static final emissiveWgpuModifierSnippet:flight.esm.types.render_wgpu_contract.Types.WgpuModifierSnippet;
  public static function enableWgpuScene3DCustomShaderGuards(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, logState:Null<flight.esm.types.log.Types.LogState>):Void;
  public static function enableWgpuScene3DForwardLightSelectionGuards(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, logState:Null<flight.esm.types.log.Types.LogState>):Void;
  public static final envReflectWgpuModifierSnippet:flight.esm.types.render_wgpu_contract.Types.WgpuModifierSnippet;
  public static function explainWgpuScene3DCoverage(out:Array<flight.esm.types.render_contract.Types.SceneCoverageEntry>, state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, usage:Dynamic, catalog:flight.esm.types.render_contract.Types.SceneCoverageCatalog):Void;
  public static function explainWgpuScene3DForwardLightSelection(lights:flight.esm.types.lighting_contract.Types.Scene3DLightsLike, ?selection:Null<flight.esm.types.scene3d_wgpu_contract.Types.WgpuScene3DForwardLightList>):flight.esm.types.lighting_contract.Types.Scene3DForwardLightSelectionExplanation;
  public static final fogWgpuModifierSnippet:flight.esm.types.render_wgpu_contract.Types.WgpuModifierSnippet;
  public static function getWgpuCustomMaterialShaderSource(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, shaderKey:String):Null<String>;
  public static function getWgpuMeshMaterialRenderer(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, kind:String):Null<flight.esm.types.render_wgpu_contract.Types.WgpuMeshMaterialRenderer>;
  public static function getWgpuScene3DTime(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Float;
  public static function hasWgpuScene3DCoverage(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, usage:Dynamic):Bool;
  public static function prepareWgpuScene3DForwardLights(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, sceneRenderList:flight.esm.types.render_contract.Types.Scene3DRenderList, lights:flight.esm.types.lighting_contract.Types.Scene3DLightsLike):flight.esm.types.scene3d_wgpu_contract.Types.WgpuScene3DForwardLightList;
  public static function registerBuiltInWgpuModifierSnippets(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuBlinnPhongMaterial(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuCustomMaterialShader(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, shaderKey:String, wgslSource:String):Void;
  public static function registerWgpuCustomShaderMaterial(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuDepthMaterial(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuEmissiveMaterial(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuGpuSkinning(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuLambertMaterial(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuMatcapMaterial(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuMeshMaterialRenderer(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, kind:String, renderer:flight.esm.types.render_wgpu_contract.Types.WgpuMeshMaterialRenderer):Void;
  public static function registerWgpuModifierSnippet(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, snippet:flight.esm.types.render_wgpu_contract.Types.WgpuModifierSnippet):Void;
  public static function registerWgpuNormalMaterial(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuParticleEmitter3DPass(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuPhongMaterial(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuScene3DRenderPreset(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuShadedMaterial(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuSpecularGlossinessPbrMaterial(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuStandardPbrMaterial(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuToonMaterial(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuUnlitMaterial(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuVertexColorMaterial(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function registerWgpuWireframeMaterial(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState):Void;
  public static function renderWgpuEnvironmentSkybox(renderPass:flight.esm.types.render_wgpu_contract.Types.WgpuRenderPass, environment:flight.esm.types.lighting_contract.Types.Environment, camera:flight.esm.types.camera.Types.Camera3D, aspect:Float):Void;
  public static function renderWgpuScene3D(pass:flight.esm.types.render_wgpu_contract.Types.WgpuRenderPass, scene:flight.esm.types.scene3d.Types.Node3D, camera:flight.esm.types.camera.Types.Camera3D, lights:flight.esm.types.lighting_contract.Types.Scene3DLightsLike, ?forwardLights:Null<flight.esm.types.scene3d_wgpu_contract.Types.WgpuScene3DForwardLightList>):Void;
  public static function renderWgpuScene3DShadowMap(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, scene:flight.esm.types.scene3d.Types.Node3D, shadowCamera:flight.esm.types.camera.Types.Camera3D, directionalLight:Null<flight.esm.types.lighting_contract.Types.DirectionalLight>):Void;
  public static function resolveWgpuMeshMaterialRenderer(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, material:Null<flight.esm.types.materials_contract.Types.Material>):Null<flight.esm.types.render_wgpu_contract.Types.WgpuMeshMaterialRenderer>;
  public static function resolveWgpuModifierSnippet(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, kind:String):Null<flight.esm.types.render_wgpu_contract.Types.WgpuModifierSnippet>;
  public static final rimWgpuModifierSnippet:flight.esm.types.render_wgpu_contract.Types.WgpuModifierSnippet;
  public static function setWgpuScene3DTime(state:flight.esm.types.render_wgpu_contract.Types.WgpuRenderState, seconds:Float):Void;
  public static final toonWgpuModifierSnippet:flight.esm.types.render_wgpu_contract.Types.WgpuModifierSnippet;
  public static final vertexDisplaceWgpuModifierSnippet:flight.esm.types.render_wgpu_contract.Types.WgpuModifierSnippet;
  public static final wgpuBlinnPhongMeshMaterialRenderer:flight.esm.types.render_wgpu_contract.Types.WgpuMeshMaterialRenderer;
  public static final wgpuCustomShaderMeshMaterialRenderer:flight.esm.types.render_wgpu_contract.Types.WgpuMeshMaterialRenderer;
  public static final wgpuDepthMeshMaterialRenderer:flight.esm.types.render_wgpu_contract.Types.WgpuMeshMaterialRenderer;
  public static final wgpuEmissiveMeshMaterialRenderer:flight.esm.types.render_wgpu_contract.Types.WgpuMeshMaterialRenderer;
  public static final wgpuLambertMeshMaterialRenderer:flight.esm.types.render_wgpu_contract.Types.WgpuMeshMaterialRenderer;
  public static final wgpuMatcapMeshMaterialRenderer:flight.esm.types.render_wgpu_contract.Types.WgpuMeshMaterialRenderer;
  public static final wgpuNormalMeshMaterialRenderer:flight.esm.types.render_wgpu_contract.Types.WgpuMeshMaterialRenderer;
  public static final wgpuPhongMeshMaterialRenderer:flight.esm.types.render_wgpu_contract.Types.WgpuMeshMaterialRenderer;
  public static final wgpuScene3DRenderPreset:flight.esm.types.render_wgpu_contract.Types.WgpuRenderRegistries;
  public static final wgpuShadedMeshMaterialRenderer:flight.esm.types.render_wgpu_contract.Types.WgpuMeshMaterialRenderer;
  public static final wgpuSkinningAdapter:flight.esm.types.render_wgpu_contract.Types.WgpuSkinningAdapter;
  public static final wgpuSpecularGlossinessPbrMeshMaterialRenderer:flight.esm.types.render_wgpu_contract.Types.WgpuMeshMaterialRenderer;
  public static final wgpuStandardPbrMeshMaterialRenderer:flight.esm.types.render_wgpu_contract.Types.WgpuMeshMaterialRenderer;
  public static final wgpuToonMeshMaterialRenderer:flight.esm.types.render_wgpu_contract.Types.WgpuMeshMaterialRenderer;
  public static final wgpuUnlitMeshMaterialRenderer:flight.esm.types.render_wgpu_contract.Types.WgpuMeshMaterialRenderer;
  public static final wgpuVertexColorMeshMaterialRenderer:flight.esm.types.render_wgpu_contract.Types.WgpuMeshMaterialRenderer;
  public static final wgpuWireframeMeshMaterialRenderer:flight.esm.types.render_wgpu_contract.Types.WgpuMeshMaterialRenderer;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
