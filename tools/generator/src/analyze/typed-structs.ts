import { createHash } from 'node:crypto';
import path from 'node:path';
import ts from 'typescript';

import { portConfig } from '../../port.config.ts';

import { sourcePathToHaxePackage, sourcePathToImplementationModule } from './inventory.ts';
import { upstreamTypeScriptProgram } from './program.ts';

// Target-conditional class emission is default-off. Every enabled schema is an
// explicit canonical identity so an upstream declaration cannot enter silently.
export const cppStructInitTypedStructIds: readonly string[] = [
  '@flighthq/types:upstream/packages/types/src/Camera2D.ts#Camera2D',
  '@flighthq/types:upstream/packages/types/src/ParticleEmitterState.ts#ParticleEmitterState',
];

const cppStructInitTypedStructIdSet = new Set(cppStructInitTypedStructIds);

export interface TypedStructCandidate {
  emission: 'audit-only' | 'direct';
  name: string;
  packageName: string;
  purpose: string;
  source: string;
}

export interface TypedStructField {
  name: string;
  optional: boolean;
  readonly: boolean;
  receiverSensitive: boolean;
  requiredUndefined: boolean;
  type: string;
}

export interface TypedStructFieldBinding {
  field: TypedStructField;
  schemaHaxeType: string;
  schemaId: string;
  schemaName: string;
}

export interface TypedStructConstructionBinding {
  fieldNames: string[];
  schemaHaxeType: string;
  schemaId: string;
  schemaName: string;
}

export interface TypedStructEscape {
  column: number;
  member?: string | undefined;
  reason:
    | 'computed-key'
    | 'dynamic-enumeration'
    | 'incompatible-union'
    | 'instanceof'
    | 'presence-sensitive'
    | 'receiver-sensitive-method'
    | 'unknown-member';
  source: string;
  line: number;
}

export interface TypedStructMemberEscape {
  member: string;
  reason: 'computed-symbol-member' | 'receiver-sensitive-method';
  source: string;
}

export interface TypedStructSchemaAudit {
  accesses: {
    calls: number;
    reads: number;
    writes: number;
  };
  declarationFingerprint: string;
  declarationKind: 'interface' | 'type';
  eligible: boolean;
  emission: {
    directAccesses: number;
    mode: 'audit-only' | 'direct';
    pendingAccesses: number;
    reflectiveSurvivors: Array<{
      accesses: number;
      reason: string;
    }>;
  };
  escapes: TypedStructEscape[];
  fields: TypedStructField[];
  id: string;
  memberEscapes: TypedStructMemberEscape[];
  name: string;
  packageName: string;
  purpose: string;
  reasons: Array<
    | 'callable-schema'
    | 'constructable-schema'
    | 'declaration-merge'
    | 'index-signature'
    | 'instanceof-use'
    | 'presence-sensitive-use'
    | 'unsupported-shape'
  >;
  source: string;
}

export interface TypedStructAudit {
  candidates: TypedStructSchemaAudit[];
  schemaVersion: 3;
  summary: {
    auditOnlySchemas: number;
    bindableAccesses: number;
    candidates: number;
    directAccesses: number;
    directSchemas: number;
    eligible: number;
    escapes: number;
    fields: number;
    ineligible: number;
    pendingAccesses: number;
    reflectiveSurvivors: number;
  };
  upstreamCommit: string;
}

export interface TypedStructResolution {
  kind: 'incompatible' | 'matched' | 'none';
  schemas: TypedStructSchemaAudit[];
}

export interface TypedStructRegistry {
  report: TypedStructAudit;
  resolve(type: ts.Type): TypedStructResolution;
  resolveCppStructInitConstruction(type: ts.Type): TypedStructConstructionBinding | undefined;
  resolveField(type: ts.Type, member: string, property?: ts.Symbol): TypedStructFieldBinding | undefined;
}

const directTypedStructCandidates: readonly TypedStructCandidate[] = [
  {
    emission: 'direct',
    name: 'Vector2',
    packageName: '@flighthq/types',
    purpose: 'two-component numeric geometry leaf',
    source: 'upstream/packages/types/src/Vector2.ts',
  },
  {
    emission: 'direct',
    name: 'Vector3',
    packageName: '@flighthq/types',
    purpose: 'three-component numeric geometry leaf',
    source: 'upstream/packages/types/src/Vector3.ts',
  },
  {
    emission: 'direct',
    name: 'Quaternion',
    packageName: '@flighthq/types',
    purpose: 'four-component rotation leaf',
    source: 'upstream/packages/types/src/Quaternion.ts',
  },
  {
    emission: 'direct',
    name: 'Matrix3',
    packageName: '@flighthq/types',
    purpose: '3x3 matrix holder',
    source: 'upstream/packages/types/src/Matrix3.ts',
  },
  {
    emission: 'direct',
    name: 'Matrix4',
    packageName: '@flighthq/types',
    purpose: '4x4 matrix holder',
    source: 'upstream/packages/types/src/Matrix4.ts',
  },
  {
    emission: 'direct',
    name: 'Rectangle',
    packageName: '@flighthq/types',
    purpose: 'four-component rectangle leaf',
    source: 'upstream/packages/types/src/Rectangle.ts',
  },
  {
    emission: 'direct',
    name: 'ColorTransform',
    packageName: '@flighthq/types',
    purpose: 'render-hot RGBA multiplier and offset record',
    source: 'upstream/packages/types/src/ColorTransform.ts',
  },
];

export const tranche4TypedStructCandidates: readonly TypedStructCandidate[] = [
  {
    emission: 'direct',
    name: 'ApplicationLoopOptions',
    packageName: '@flighthq/types',
    purpose: 'application-loop option record',
    source: 'upstream/packages/types/src/ApplicationLoopOptions.ts',
  },
  {
    emission: 'direct',
    name: 'AudioBusOptions',
    packageName: '@flighthq/types',
    purpose: 'audio-bus option record',
    source: 'upstream/packages/types/src/AudioBus.ts',
  },
  {
    emission: 'direct',
    name: 'AudioPlayOptions',
    packageName: '@flighthq/types',
    purpose: 'audio-playback option record',
    source: 'upstream/packages/types/src/AudioResource.ts',
  },
  {
    emission: 'direct',
    name: 'BinPackOptions',
    packageName: '@flighthq/types',
    purpose: 'bin-packing option record',
    source: 'upstream/packages/types/src/BinPack.ts',
  },
  {
    emission: 'direct',
    name: 'BitmapTextOptions',
    packageName: '@flighthq/types',
    purpose: 'bitmap-text option record',
    source: 'upstream/packages/types/src/BitmapText.ts',
  },
  {
    emission: 'direct',
    name: 'DeviceCapabilities',
    packageName: '@flighthq/types',
    purpose: 'device capability result record',
    source: 'upstream/packages/types/src/DeviceCapabilities.ts',
  },
  {
    emission: 'direct',
    name: 'DeviceDisplayMetrics',
    packageName: '@flighthq/types',
    purpose: 'device display-metrics result record',
    source: 'upstream/packages/types/src/DeviceDisplayMetrics.ts',
  },
  {
    emission: 'direct',
    name: 'FileDialogHandle',
    packageName: '@flighthq/types',
    purpose: 'file-dialog result handle',
    source: 'upstream/packages/types/src/Dialog.ts',
  },
  {
    emission: 'direct',
    name: 'FilmicToneMapOptions',
    packageName: '@flighthq/types',
    purpose: 'filmic tone-map option record',
    source: 'upstream/packages/types/src/FilmicToneMapOptions.ts',
  },
  {
    emission: 'direct',
    name: 'FontMetrics',
    packageName: '@flighthq/types',
    purpose: 'font-metrics result record',
    source: 'upstream/packages/types/src/FontMetrics.ts',
  },
  {
    emission: 'direct',
    name: 'GlyphAtlasOptions',
    packageName: '@flighthq/types',
    purpose: 'glyph-atlas option record',
    source: 'upstream/packages/types/src/GlyphSource.ts',
  },
  {
    emission: 'direct',
    name: 'GlyphMetrics',
    packageName: '@flighthq/types',
    purpose: 'glyph-metrics result record',
    source: 'upstream/packages/types/src/GlyphSource.ts',
  },
  {
    emission: 'direct',
    name: 'GlyphRasterizeOptions',
    packageName: '@flighthq/types',
    purpose: 'glyph-rasterization option record',
    source: 'upstream/packages/types/src/GlyphSource.ts',
  },
  {
    emission: 'direct',
    name: 'HapticsCapabilities',
    packageName: '@flighthq/types',
    purpose: 'haptics capability result record',
    source: 'upstream/packages/types/src/Haptics.ts',
  },
  {
    emission: 'direct',
    name: 'InputGamepadAxisData',
    packageName: '@flighthq/types',
    purpose: 'gamepad-axis input result record',
    source: 'upstream/packages/types/src/InputGamepadData.ts',
  },
  {
    emission: 'direct',
    name: 'InputGamepadButtonData',
    packageName: '@flighthq/types',
    purpose: 'gamepad-button input result record',
    source: 'upstream/packages/types/src/InputGamepadData.ts',
  },
  {
    emission: 'direct',
    name: 'InputGamepadConnectData',
    packageName: '@flighthq/types',
    purpose: 'gamepad-connection input result record',
    source: 'upstream/packages/types/src/InputGamepadData.ts',
  },
  {
    emission: 'direct',
    name: 'InputTextData',
    packageName: '@flighthq/types',
    purpose: 'text-input result record',
    source: 'upstream/packages/types/src/InputTextData.ts',
  },
  {
    emission: 'direct',
    name: 'InteractionPointerOptions',
    packageName: '@flighthq/types',
    purpose: 'interaction-pointer option record',
    source: 'upstream/packages/types/src/InteractionManager.ts',
  },
  {
    emission: 'direct',
    name: 'PathBooleanOptions',
    packageName: '@flighthq/types',
    purpose: 'path-boolean option record',
    source: 'upstream/packages/types/src/PathBooleanOptions.ts',
  },
  {
    emission: 'direct',
    name: 'PathOffsetOptions',
    packageName: '@flighthq/types',
    purpose: 'path-offset option record',
    source: 'upstream/packages/types/src/PathOffsetOptions.ts',
  },
  {
    emission: 'direct',
    name: 'RenderCacheRefreshOptions',
    packageName: '@flighthq/types',
    purpose: 'render-cache refresh option record',
    source: 'upstream/packages/types/src/RenderCacheRefreshOptions.ts',
  },
  {
    emission: 'direct',
    name: 'StatusBarInfo',
    packageName: '@flighthq/types',
    purpose: 'status-bar result record',
    source: 'upstream/packages/types/src/StatusBar.ts',
  },
  {
    emission: 'direct',
    name: 'TextMetrics',
    packageName: '@flighthq/types',
    purpose: 'text-metrics result record',
    source: 'upstream/packages/types/src/TextMetrics.ts',
  },
  {
    emission: 'direct',
    name: 'TrayBalloonOptions',
    packageName: '@flighthq/types',
    purpose: 'tray-balloon option record',
    source: 'upstream/packages/types/src/Tray.ts',
  },
  {
    emission: 'direct',
    name: 'VideoPlayOptions',
    packageName: '@flighthq/types',
    purpose: 'video-playback option record',
    source: 'upstream/packages/types/src/VideoResource.ts',
  },
  {
    emission: 'direct',
    name: 'VideoResourceLoadOptions',
    packageName: '@flighthq/types',
    purpose: 'video-resource load option record',
    source: 'upstream/packages/types/src/VideoResource.ts',
  },
  {
    emission: 'direct',
    name: 'SignalThrottleOptions',
    packageName: '@flighthq/signals',
    purpose: 'signal-throttle option record',
    source: 'upstream/packages/signals/src/throttle.ts',
  },
];

export const tranche5TypedStructCandidates: readonly TypedStructCandidate[] = [
  {
    emission: 'direct',
    name: 'Aabb',
    packageName: '@flighthq/types',
    purpose: '3D axis-aligned bounds entity',
    source: 'upstream/packages/types/src/Aabb.ts',
  },
  {
    emission: 'direct',
    name: 'AabbLike',
    packageName: '@flighthq/types',
    purpose: 'structural 3D axis-aligned bounds carrier',
    source: 'upstream/packages/types/src/Aabb.ts',
  },
  {
    emission: 'direct',
    name: 'HasTransform3D',
    packageName: '@flighthq/types',
    purpose: 'authored node 3D transform aggregate',
    source: 'upstream/packages/types/src/HasTransform3D.ts',
  },
  {
    emission: 'direct',
    name: 'HasTransform3DRuntime',
    packageName: '@flighthq/types',
    purpose: 'cached node 3D transform aggregate',
    source: 'upstream/packages/types/src/HasTransform3D.ts',
  },
  {
    emission: 'direct',
    name: 'HasTransform2D',
    packageName: '@flighthq/types',
    purpose: 'authored node 2D transform aggregate',
    source: 'upstream/packages/types/src/HasTransform2D.ts',
  },
  {
    emission: 'direct',
    name: 'HasTransform2DRuntime',
    packageName: '@flighthq/types',
    purpose: 'cached node 2D transform aggregate',
    source: 'upstream/packages/types/src/HasTransform2D.ts',
  },
  {
    emission: 'direct',
    name: 'HasBoundsRectangleRuntime',
    packageName: '@flighthq/types',
    purpose: 'cached node rectangle-bounds aggregate',
    source: 'upstream/packages/types/src/HasBoundsRectangle.ts',
  },
  {
    emission: 'direct',
    name: 'BoundingSphere',
    packageName: '@flighthq/types',
    purpose: '3D bounding-sphere aggregate',
    source: 'upstream/packages/types/src/BoundingSphere.ts',
  },
  {
    emission: 'direct',
    name: 'Camera',
    packageName: '@flighthq/types',
    purpose: '3D camera aggregate',
    source: 'upstream/packages/types/src/Camera.ts',
  },
  {
    emission: 'direct',
    name: 'PerspectiveProjection',
    packageName: '@flighthq/types',
    purpose: 'perspective-camera projection aggregate',
    source: 'upstream/packages/types/src/Camera.ts',
  },
  {
    emission: 'direct',
    name: 'OrthographicProjection',
    packageName: '@flighthq/types',
    purpose: 'orthographic-camera projection aggregate',
    source: 'upstream/packages/types/src/Camera.ts',
  },
  {
    emission: 'direct',
    name: 'Camera2D',
    packageName: '@flighthq/types',
    purpose: '2D camera hot-state aggregate',
    source: 'upstream/packages/types/src/Camera2D.ts',
  },
  {
    emission: 'direct',
    name: 'Camera2DFollowOptions',
    packageName: '@flighthq/types',
    purpose: '2D camera follow aggregate',
    source: 'upstream/packages/types/src/Camera2D.ts',
  },
  {
    emission: 'direct',
    name: 'Camera2DOptions',
    packageName: '@flighthq/types',
    purpose: '2D camera construction aggregate',
    source: 'upstream/packages/types/src/Camera2D.ts',
  },
  {
    emission: 'direct',
    name: 'Capsule',
    packageName: '@flighthq/types',
    purpose: '3D capsule-bounds aggregate',
    source: 'upstream/packages/types/src/Capsule.ts',
  },
  {
    emission: 'direct',
    name: 'Plane',
    packageName: '@flighthq/types',
    purpose: '3D plane aggregate',
    source: 'upstream/packages/types/src/Plane.ts',
  },
  {
    emission: 'direct',
    name: 'Frustum',
    packageName: '@flighthq/types',
    purpose: '3D frustum aggregate',
    source: 'upstream/packages/types/src/Frustum.ts',
  },
  {
    emission: 'direct',
    name: 'SpatialAabb',
    packageName: '@flighthq/types',
    purpose: '2D spatial-index bounds aggregate',
    source: 'upstream/packages/types/src/Spatial.ts',
  },
  {
    emission: 'direct',
    name: 'Obb',
    packageName: '@flighthq/types',
    purpose: '3D oriented-bounds aggregate',
    source: 'upstream/packages/types/src/Obb.ts',
  },
  {
    emission: 'direct',
    name: 'Ray3D',
    packageName: '@flighthq/types',
    purpose: '3D ray aggregate',
    source: 'upstream/packages/types/src/Ray3D.ts',
  },
];

interface TypedStructCandidateGroup {
  names: readonly string[];
  packageName: string;
  purpose: string;
  source: string;
}

export const tranche6aDirectTypedStructIds: readonly string[] = [
  '@flighthq/types:upstream/packages/types/src/ParticleEmitterConfig.ts#ParticleEmitterConfig',
  '@flighthq/types:upstream/packages/types/src/Matrix.ts#Matrix',
  '@flighthq/types:upstream/packages/types/src/Surface.ts#Surface',
  '@flighthq/types:upstream/packages/types/src/ParticleEmitter.ts#ParticleEmitterData',
  '@flighthq/types:upstream/packages/types/src/TextureAtlasRegion.ts#TextureAtlasRegion',
  '@flighthq/types:upstream/packages/types/src/ParticleEmitterState.ts#ParticleEmitterState',
  '@flighthq/types:upstream/packages/types/src/Screen.ts#ScreenInfo',
  '@flighthq/types:upstream/packages/types/src/MeshGeometry.ts#MeshGeometry',
];

export const tranche6bDirectTypedStructIds: readonly string[] = [
  '@flighthq/types:upstream/packages/types/src/Texture.ts#Texture',
  '@flighthq/types:upstream/packages/types/src/ImageResource.ts#ImageResource',
  '@flighthq/types:upstream/packages/types/src/ApplicationWindow.ts#ApplicationWindow',
  '@flighthq/types:upstream/packages/types/src/TextureAtlas.ts#TextureAtlas',
  '@flighthq/types:upstream/packages/types/src/SpritesheetFrameData.ts#SpritesheetFrameData',
  '@flighthq/types:upstream/packages/types/src/Menu.ts#MenuItemTemplate',
  '@flighthq/particles-formats:upstream/packages/particles-formats/src/starlingPexSchema.ts#StarlingPexDocument',
  '@flighthq/particles-formats:upstream/packages/particles-formats/src/libgdxSchema.ts#LibgdxParticleDocument',
  '@flighthq/types:upstream/packages/types/src/ApplicationWindow.ts#WindowOptions',
  '@flighthq/types:upstream/packages/types/src/GlyphSource.ts#GlyphAtlasRuntime',
  '@flighthq/types:upstream/packages/types/src/SpritesheetPlayer.ts#SpritesheetPlayer',
  '@flighthq/types:upstream/packages/types/src/Mesh.ts#Mesh',
];

function directTypedStructCandidatesFromGroups(
  groups: readonly TypedStructCandidateGroup[],
): readonly TypedStructCandidate[] {
  return groups.flatMap((group) =>
    group.names.map((name) => ({
      emission: 'direct' as const,
      name,
      packageName: group.packageName,
      purpose: group.purpose,
      source: group.source,
    })),
  );
}

// Checker-derived tranche-six identities are kept literal so upstream declarations cannot
// silently enter the allowlist. Backend-owned host contracts, renderer/material records,
// open or presence-sensitive shapes, declaration merges, and aliases of existing direct
// identities remain outside this tranche.
export const tranche6TypedStructCandidates: readonly TypedStructCandidate[] = directTypedStructCandidatesFromGroups([
  {
    names: ['MeshGeometryOptions'],
    packageName: '@flighthq/mesh',
    purpose: 'broad scene document',
    source: 'upstream/packages/mesh/src/meshGeometry.ts',
  },
  {
    names: ['LoadSceneOptions'],
    packageName: '@flighthq/scene-resources',
    purpose: 'broad scene document',
    source: 'upstream/packages/scene-resources/src/loadSceneOptions.ts',
  },
  {
    names: ['ResolveSceneResourcesOptions'],
    packageName: '@flighthq/scene-resources',
    purpose: 'broad scene document',
    source: 'upstream/packages/scene-resources/src/resolveSceneResources.ts',
  },
  {
    names: ['SceneResourceRevealOptions'],
    packageName: '@flighthq/scene-resources',
    purpose: 'broad scene document',
    source: 'upstream/packages/scene-resources/src/revealSceneResourcesOnResolve.ts',
  },
  {
    names: ['SceneMaterialTextureRegistry'],
    packageName: '@flighthq/scene-resources',
    purpose: 'broad scene document',
    source: 'upstream/packages/scene-resources/src/sceneMaterialTextureRegistry.ts',
  },
  {
    names: ['SceneResourceInFlight', 'SceneResourceResolver', 'SceneResourceResolverOptions'],
    packageName: '@flighthq/scene-resources',
    purpose: 'broad scene document',
    source: 'upstream/packages/scene-resources/src/sceneResourceResolver.ts',
  },
  {
    names: ['SceneResourceEvent', 'SceneResourceSignals'],
    packageName: '@flighthq/scene-resources',
    purpose: 'broad scene document',
    source: 'upstream/packages/scene-resources/src/sceneResourceSignals.ts',
  },
  {
    names: ['AnimationClip'],
    packageName: '@flighthq/types',
    purpose: 'broad scene document',
    source: 'upstream/packages/types/src/AnimationClip.ts',
  },
  {
    names: ['Billboard'],
    packageName: '@flighthq/types',
    purpose: 'broad scene document',
    source: 'upstream/packages/types/src/Billboard.ts',
  },
  {
    names: ['Mesh'],
    packageName: '@flighthq/types',
    purpose: 'broad scene document',
    source: 'upstream/packages/types/src/Mesh.ts',
  },
  {
    names: ['MeshGeometry', 'MeshSubset', 'VertexAttribute', 'VertexAttributeLayout'],
    packageName: '@flighthq/types',
    purpose: 'broad scene document',
    source: 'upstream/packages/types/src/MeshGeometry.ts',
  },
  {
    names: ['NodeSignals'],
    packageName: '@flighthq/types',
    purpose: 'broad scene document',
    source: 'upstream/packages/types/src/NodeSignals.ts',
  },
  {
    names: ['Scene', 'SceneRuntime'],
    packageName: '@flighthq/types',
    purpose: 'broad scene document',
    source: 'upstream/packages/types/src/Scene.ts',
  },
  {
    names: ['SceneAnimationTarget'],
    packageName: '@flighthq/types',
    purpose: 'broad scene document',
    source: 'upstream/packages/types/src/SceneAnimationTarget.ts',
  },
  {
    names: ['SceneNodeTraits'],
    packageName: '@flighthq/types',
    purpose: 'broad scene document',
    source: 'upstream/packages/types/src/SceneNode.ts',
  },
  {
    names: ['EmbeddedSceneResourceRef', 'ExternalSceneResourceRef'],
    packageName: '@flighthq/types',
    purpose: 'broad scene document',
    source: 'upstream/packages/types/src/SceneResourceRef.ts',
  },
  {
    names: ['Signal', 'SignalData'],
    packageName: '@flighthq/types',
    purpose: 'broad scene document',
    source: 'upstream/packages/types/src/Signal.ts',
  },
  {
    names: ['TweenManager'],
    packageName: '@flighthq/types',
    purpose: 'broad scene document',
    source: 'upstream/packages/types/src/TweenManager.ts',
  },
  {
    names: [
      'AssetDescriptor',
      'AssetEntry',
      'AssetGroupLoadOptions',
      'AssetLibrary',
      'AssetLibraryRuntime',
      'AssetLoadProgress',
      'AssetLoaderAdapter',
    ],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/Assets.ts',
  },
  {
    names: ['AttractorForce'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/AttractorForce.ts',
  },
  {
    names: ['AudioBus', 'AudioMixer', 'AudioMixerOptions'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/AudioBus.ts',
  },
  {
    names: ['AudioChannel', 'AudioResource', 'AudioResourceUrl'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/AudioResource.ts',
  },
  {
    names: ['BitmapFont', 'BitmapFontData', 'BitmapFontGlyphData', 'BitmapFontKerningData', 'BitmapFontParseOptions'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/BitmapFont.ts',
  },
  {
    names: ['CircleCollider'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/CircleCollider.ts',
  },
  {
    names: ['CubeTexture'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/CubeTexture.ts',
  },
  {
    names: ['DragForce'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/DragForce.ts',
  },
  {
    names: ['Font', 'FontUrl'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/Font.ts',
  },
  {
    names: ['FontResource'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/FontResource.ts',
  },
  {
    names: ['GlyphAtlas', 'GlyphAtlasRuntime', 'GlyphAtlasShelf', 'GlyphEntry', 'GlyphRasterizedBitmap', 'GlyphSource'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/GlyphSource.ts',
  },
  {
    names: ['GridSliceOptions'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/GridSliceOptions.ts',
  },
  {
    names: ['ImageResource'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/ImageResource.ts',
  },
  {
    names: ['ImageResourceCompressed'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/ImageResourceCompressed.ts',
  },
  {
    names: ['ParticleConfigIssue'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/ParticleConfigIssue.ts',
  },
  {
    names: ['ColorKeyframe', 'CurveKeyframe'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/ParticleCurve.ts',
  },
  {
    names: ['ParticleEmitter', 'ParticleEmitterData', 'ParticleEmitterRuntime'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/ParticleEmitter.ts',
  },
  {
    names: ['ParticleEmitterConfig'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/ParticleEmitterConfig.ts',
  },
  {
    names: ['ParticleEmitterSignals'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/ParticleEmitterSignals.ts',
  },
  {
    names: ['ParticleEmitterState'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/ParticleEmitterState.ts',
  },
  {
    names: ['ParticleObjectsState'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/ParticleObjectsState.ts',
  },
  {
    names: ['ParticleObjectsUpdateOptions'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/ParticleObjectsUpdateOptions.ts',
  },
  {
    names: ['PlaneCollider'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/PlaneCollider.ts',
  },
  {
    names: ['RectangleCollider'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/RectangleCollider.ts',
  },
  {
    names: ['ResourceLoader'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/ResourceLoader.ts',
  },
  {
    names: ['ResourceLoaderItemSignals'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/ResourceLoaderItemSignals.ts',
  },
  {
    names: ['ResourceLoaderOptions'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/ResourceLoaderOptions.ts',
  },
  {
    names: ['ResourceLoadHandle'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/ResourceLoadHandle.ts',
  },
  {
    names: ['ResourceLoadItem'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/ResourceLoadItem.ts',
  },
  {
    names: ['ResourceLoadReport'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/ResourceLoadReport.ts',
  },
  {
    names: ['Sampler'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/Sampler.ts',
  },
  {
    names: ['SphereCollider'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/SphereCollider.ts',
  },
  {
    names: ['Spritesheet'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/Spritesheet.ts',
  },
  {
    names: ['SpritesheetAnimation'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/SpritesheetAnimation.ts',
  },
  {
    names: ['SpritesheetAnimationData'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/SpritesheetAnimationData.ts',
  },
  {
    names: ['SpritesheetData'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/SpritesheetData.ts',
  },
  {
    names: ['SpritesheetFrame'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/SpritesheetFrame.ts',
  },
  {
    names: ['SpritesheetFrameData'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/SpritesheetFrameData.ts',
  },
  {
    names: ['SpritesheetPlayer'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/SpritesheetPlayer.ts',
  },
  {
    names: ['SpritesheetValidationDiagnostic'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/SpritesheetValidationDiagnostic.ts',
  },
  {
    names: ['Surface'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/Surface.ts',
  },
  {
    names: ['Texture'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/Texture.ts',
  },
  {
    names: ['TextureAtlas'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/TextureAtlas.ts',
  },
  {
    names: ['TextureAtlasRegion'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/TextureAtlasRegion.ts',
  },
  {
    names: ['TextureUvTransform'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/TextureUvTransform.ts',
  },
  {
    names: ['Tileset'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/Tileset.ts',
  },
  {
    names: ['TurbulenceForce'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/TurbulenceForce.ts',
  },
  {
    names: ['VideoChannel', 'VideoResource', 'VideoResourceUrl'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/VideoResource.ts',
  },
  {
    names: ['VideoTexture'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/VideoTexture.ts',
  },
  {
    names: ['VortexForce'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/VortexForce.ts',
  },
  {
    names: ['WindForce'],
    packageName: '@flighthq/types',
    purpose: 'broad asset document',
    source: 'upstream/packages/types/src/WindForce.ts',
  },
  {
    names: ['App', 'AppLoginItem', 'AppLoginItemLike'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/App.ts',
  },
  {
    names: ['Application'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/Application.ts',
  },
  {
    names: ['ApplicationWindow', 'WindowBounds', 'WindowOptions'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/ApplicationWindow.ts',
  },
  {
    names: ['ClipboardBookmark', 'ClipboardWriteItem'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/Clipboard.ts',
  },
  {
    names: ['ClipboardWatch'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/ClipboardWatch.ts',
  },
  {
    names: ['Connectivity', 'ConnectivityReachability', 'ConnectivityReachabilityOptions', 'ConnectivityStatus'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/Connectivity.ts',
  },
  {
    names: ['DeviceInfo', 'SafeAreaInsets'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/Device.ts',
  },
  {
    names: [
      'FileDialogFilter',
      'MessageDialogOptions',
      'MessageDialogResult',
      'OpenDirectoryDialogOptions',
      'OpenFileDialogOptions',
      'PromptDialogOptions',
      'SaveFileDialogOptions',
    ],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/Dialog.ts',
  },
  {
    names: ['FileEntry', 'FilePermissions', 'FileStat', 'FileSystemUsage', 'FileWalkOptions', 'FileWatchEvent'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/FileSystem.ts',
  },
  {
    names: ['GeoPosition', 'GeoPositionResult', 'GeolocationRequestOptions'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/Geolocation.ts',
  },
  {
    names: ['IpcBackendCapabilities', 'IpcChannel', 'IpcMessageEvent', 'IpcTarget'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/Ipc.ts',
  },
  {
    names: ['IpcSignals'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/IpcSignals.ts',
  },
  {
    names: ['AppLifecycle'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/Lifecycle.ts',
  },
  {
    names: ['Matrix'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/Matrix.ts',
  },
  {
    names: ['MediaSessionActionDetails', 'MediaSessionArtwork', 'MediaSessionMetadata', 'MediaSessionPositionState'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/MediaSession.ts',
  },
  {
    names: ['MenuItemTemplate'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/Menu.ts',
  },
  {
    names: ['MenuSignals'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/MenuSignals.ts',
  },
  {
    names: [
      'NotificationAction',
      'NotificationCapabilities',
      'NotificationChannel',
      'NotificationRequest',
      'NotificationSchedule',
      'ScheduledNotification',
    ],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/Notification.ts',
  },
  {
    names: ['ParsedAccelerator'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/ParsedAccelerator.ts',
  },
  {
    names: ['PlatformInfo'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/Platform.ts',
  },
  {
    names: ['Power', 'PowerStatus'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/Power.ts',
  },
  {
    names: ['PowerBatteryHealth'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/PowerBatteryHealth.ts',
  },
  {
    names: ['ParsedProtocolUrl', 'ProtocolHandler'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/Protocol.ts',
  },
  {
    names: ['ScreenInfo'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/Screen.ts',
  },
  {
    names: ['ScreenChangeEvent', 'ScreenChangedMetrics'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/ScreenChangeEvent.ts',
  },
  {
    names: ['ScreenMode'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/ScreenMode.ts',
  },
  {
    names: ['ScreenSignals'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/ScreenSignals.ts',
  },
  {
    names: [
      'AmbientLightReading',
      'MotionReading',
      'OrientationReading',
      'PressureReading',
      'ProximityReading',
      'QuaternionReading',
      'RotationRateReading',
      'SensorReading',
      'SensorSubscribeOptions',
      'Sensors',
    ],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/Sensors.ts',
  },
  {
    names: ['ShareContent', 'ShareOptions', 'ShareResult'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/Share.ts',
  },
  {
    names: ['ShareSignals'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/ShareSignals.ts',
  },
  {
    names: ['ShellOpenExternalOptions', 'ShellOpenPathOptions', 'ShellShortcutLink'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/Shell.ts',
  },
  {
    names: ['ShortcutEvent'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/ShortcutEvent.ts',
  },
  {
    names: ['ShortcutSignals'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/ShortcutSignals.ts',
  },
  {
    names: ['StatusBar', 'StatusBarStyleEntry'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/StatusBar.ts',
  },
  {
    names: ['StorageChange', 'StorageMigration', 'StorageNamespace', 'StorageQuota', 'StorageSignals'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/Storage.ts',
  },
  {
    names: ['TrayCapabilities', 'TrayEventData', 'TrayIcon', 'TrayIconOptions'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/Tray.ts',
  },
  {
    names: [
      'AppUpdater',
      'UpdateInfo',
      'UpdateProgress',
      'UpdaterConfig',
      'UpdaterError',
      'UpdaterSignatureConfig',
      'UpdaterState',
    ],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/Updater.ts',
  },
  {
    names: ['WebcamCaptureOptions', 'WebcamPhoto', 'WebcamVideo'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/Webcam.ts',
  },
  {
    names: ['WebcamStream'],
    packageName: '@flighthq/types',
    purpose: 'broad host document',
    source: 'upstream/packages/types/src/WebcamStream.ts',
  },
  {
    names: ['BitmapFontCharRecord', 'BitmapFontKerningRecord', 'BitmapFontPageRecord', 'BitmapFontRecord'],
    packageName: '@flighthq/bitmapfont-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/bitmapfont-formats/src/bitmapFontRecord.ts',
  },
  {
    names: ['ParticleFormatCodec'],
    packageName: '@flighthq/particles-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/particles-formats/src/formatRegistry.ts',
  },
  {
    names: ['LibgdxParseOptions', 'LibgdxParseResult', 'LibgdxParsed'],
    packageName: '@flighthq/particles-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/particles-formats/src/libgdxParse.ts',
  },
  {
    names: ['LibgdxParticleDocument', 'LibgdxRangeValue'],
    packageName: '@flighthq/particles-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/particles-formats/src/libgdxSchema.ts',
  },
  {
    names: ['LibgdxSerializeOptions'],
    packageName: '@flighthq/particles-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/particles-formats/src/libgdxSerialize.ts',
  },
  {
    names: ['ParseParticleConfigOptions', 'ParticleConfigParseResult'],
    packageName: '@flighthq/particles-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/particles-formats/src/parseParticleConfig.ts',
  },
  {
    names: ['ParticleDesignerParseOptions', 'ParticleDesignerParsed'],
    packageName: '@flighthq/particles-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/particles-formats/src/particleDesignerParse.ts',
  },
  {
    names: ['ParticleDesignerDocument'],
    packageName: '@flighthq/particles-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/particles-formats/src/particleDesignerSchema.ts',
  },
  {
    names: ['ParticleDesignerSerializeOptions'],
    packageName: '@flighthq/particles-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/particles-formats/src/particleDesignerSerialize.ts',
  },
  {
    names: ['PixiParseResult', 'PixiParsed'],
    packageName: '@flighthq/particles-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/particles-formats/src/pixiParse.ts',
  },
  {
    names: ['ParticleSerializeResult'],
    packageName: '@flighthq/particles-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/particles-formats/src/serializeResult.ts',
  },
  {
    names: ['SpineParsed'],
    packageName: '@flighthq/particles-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/particles-formats/src/spineParse.ts',
  },
  {
    names: ['SpineAlphaKeyframe', 'SpineParticleDocument', 'SpineRangeValue', 'SpineTintKeyframe'],
    packageName: '@flighthq/particles-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/particles-formats/src/spineSchema.ts',
  },
  {
    names: ['StarlingPexParseOptions', 'StarlingPexParseResult', 'StarlingPexParsed'],
    packageName: '@flighthq/particles-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/particles-formats/src/starlingPexParse.ts',
  },
  {
    names: ['StarlingPexColor', 'StarlingPexDocument'],
    packageName: '@flighthq/particles-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/particles-formats/src/starlingPexSchema.ts',
  },
  {
    names: ['StarlingPexSerializeOptions'],
    packageName: '@flighthq/particles-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/particles-formats/src/starlingPexSerialize.ts',
  },
  {
    names: ['UnityParseOptions', 'UnityParsed'],
    packageName: '@flighthq/particles-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/particles-formats/src/unityParse.ts',
  },
  {
    names: [
      'UnityAnimationCurve',
      'UnityBurst',
      'UnityColor',
      'UnityColorOverLifetime',
      'UnityCurveKey',
      'UnityEmission',
      'UnityGradient',
      'UnityGradientAlphaKey',
      'UnityGradientColorKey',
      'UnityMinMaxValue',
      'UnityParticleDocument',
      'UnityRotationOverLifetime',
      'UnityShape',
      'UnitySizeOverLifetime',
    ],
    packageName: '@flighthq/particles-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/particles-formats/src/unitySchema.ts',
  },
  {
    names: ['UnitySerializeOptions'],
    packageName: '@flighthq/particles-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/particles-formats/src/unitySerialize.ts',
  },
  {
    names: [
      'GltfAccessor',
      'GltfAccessorSparse',
      'GltfAnimation',
      'GltfAnimationChannel',
      'GltfAnimationSampler',
      'GltfBuffer',
      'GltfBufferView',
      'GltfDocument',
      'GltfImage',
      'GltfImportOptions',
      'GltfMaterial',
      'GltfMesh',
      'GltfMorphTarget',
      'GltfNode',
      'GltfNormalTextureInfo',
      'GltfOcclusionTextureInfo',
      'GltfPbrMetallicRoughness',
      'GltfPrimitive',
      'GltfSampler',
      'GltfScene',
      'GltfSkin',
      'GltfTexture',
      'GltfTextureInfo',
      'GltfTextureTransform',
    ],
    packageName: '@flighthq/scene-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/scene-formats/src/gltfSchema.ts',
  },
  {
    names: ['Md5Joint', 'Md5Mesh', 'Md5Vertex', 'Md5Weight'],
    packageName: '@flighthq/scene-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/scene-formats/src/md5Schema.ts',
  },
  {
    names: ['ObjMaterial', 'ObjMaterialLibrary'],
    packageName: '@flighthq/scene-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/scene-formats/src/objSchema.ts',
  },
  {
    names: ['SkinInfluence'],
    packageName: '@flighthq/scene-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/scene-formats/src/shared.ts',
  },
  {
    names: ['ThreeDsMaterial', 'ThreeDsMesh'],
    packageName: '@flighthq/scene-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/scene-formats/src/threeDsSchema.ts',
  },
  {
    names: ['ShapeBitmapReference', 'ShapeJsonFormatOptions', 'ShapeJsonParseOptions'],
    packageName: '@flighthq/shape-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/shape-formats/src/shapeJson.ts',
  },
  {
    names: ['AsepriteParsed'],
    packageName: '@flighthq/spritesheet-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/spritesheet-formats/src/asepriteParse.ts',
  },
  {
    names: [
      'AsepriteArrayDocument',
      'AsepriteArrayFrame',
      'AsepriteBaseFrame',
      'AsepriteFrameTag',
      'AsepriteHashDocument',
      'AsepriteHashFrame',
      'AsepriteLayer',
      'AsepriteMeta',
      'AsepriteRect',
      'AsepriteSize',
    ],
    packageName: '@flighthq/spritesheet-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/spritesheet-formats/src/asepriteSchema.ts',
  },
  {
    names: ['AsepriteSerializeOptions'],
    packageName: '@flighthq/spritesheet-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/spritesheet-formats/src/asepriteSerialize.ts',
  },
  {
    names: ['CocosPlistParsed'],
    packageName: '@flighthq/spritesheet-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/spritesheet-formats/src/cocosPlistParse.ts',
  },
  {
    names: ['CocosPlistDocument', 'CocosPlistFrame', 'CocosPlistMetadata'],
    packageName: '@flighthq/spritesheet-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/spritesheet-formats/src/cocosPlistSchema.ts',
  },
  {
    names: ['LibgdxAtlasParseOptions'],
    packageName: '@flighthq/spritesheet-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/spritesheet-formats/src/libgdxAtlasParse.ts',
  },
  {
    names: ['LibgdxAtlasDocument', 'LibgdxAtlasPage', 'LibgdxAtlasRegion'],
    packageName: '@flighthq/spritesheet-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/spritesheet-formats/src/libgdxAtlasSchema.ts',
  },
  {
    names: ['SpritesheetParseOptions'],
    packageName: '@flighthq/spritesheet-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/spritesheet-formats/src/spritesheetDetect.ts',
  },
  {
    names: ['StarlingParseOptions', 'StarlingParsed'],
    packageName: '@flighthq/spritesheet-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/spritesheet-formats/src/starlingParse.ts',
  },
  {
    names: ['StarlingDocument', 'StarlingSubTexture'],
    packageName: '@flighthq/spritesheet-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/spritesheet-formats/src/starlingSchema.ts',
  },
  {
    names: ['TexturePackerParsed'],
    packageName: '@flighthq/spritesheet-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/spritesheet-formats/src/texturePackerParse.ts',
  },
  {
    names: [
      'TexturePackerArrayDocument',
      'TexturePackerArrayFrame',
      'TexturePackerFrameTag',
      'TexturePackerHashDocument',
      'TexturePackerHashFrame',
      'TexturePackerMeta',
      'TexturePackerPivot',
      'TexturePackerRect',
      'TexturePackerSize',
    ],
    packageName: '@flighthq/spritesheet-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/spritesheet-formats/src/texturePackerSchema.ts',
  },
  {
    names: ['TexturePackerSerializeOptions'],
    packageName: '@flighthq/spritesheet-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/spritesheet-formats/src/texturePackerSerialize.ts',
  },
  {
    names: ['ByteReader'],
    packageName: '@flighthq/texture-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/texture-formats/src/byteReader.ts',
  },
  {
    names: [
      'TextureAtlasAsepriteArrayDocument',
      'TextureAtlasAsepriteArrayFrame',
      'TextureAtlasAsepriteBaseFrame',
      'TextureAtlasAsepriteFrameTag',
      'TextureAtlasAsepriteHashDocument',
      'TextureAtlasAsepriteHashFrame',
      'TextureAtlasAsepriteMeta',
      'TextureAtlasAsepriteRect',
      'TextureAtlasAsepriteSize',
    ],
    packageName: '@flighthq/textureatlas-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/textureatlas-formats/src/textureAtlasAsepriteSchema.ts',
  },
  {
    names: ['TextureAtlasPackerParseOptions'],
    packageName: '@flighthq/textureatlas-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/textureatlas-formats/src/textureAtlasPackerParse.ts',
  },
  {
    names: [
      'TextureAtlasPackerArrayDocument',
      'TextureAtlasPackerArrayFrame',
      'TextureAtlasPackerFrameTag',
      'TextureAtlasPackerHashDocument',
      'TextureAtlasPackerHashFrame',
      'TextureAtlasPackerMeta',
      'TextureAtlasPackerPivot',
      'TextureAtlasPackerRect',
      'TextureAtlasPackerSize',
    ],
    packageName: '@flighthq/textureatlas-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/textureatlas-formats/src/textureAtlasPackerSchema.ts',
  },
  {
    names: ['TextureAtlasStarlingParseOptions'],
    packageName: '@flighthq/textureatlas-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/textureatlas-formats/src/textureAtlasStarlingParse.ts',
  },
  {
    names: ['TiledParseOptions'],
    packageName: '@flighthq/tilemap-formats',
    purpose: 'broad serialization document',
    source: 'upstream/packages/tilemap-formats/src/tiledOptions.ts',
  },
  {
    names: ['XmlElement'],
    packageName: '@flighthq/xml',
    purpose: 'broad serialization document',
    source: 'upstream/packages/xml/src/xmlParse.ts',
  },
]);

export const initialTypedStructCandidates: readonly TypedStructCandidate[] = [
  ...directTypedStructCandidates,
  ...tranche4TypedStructCandidates,
  ...tranche5TypedStructCandidates,
  ...tranche6TypedStructCandidates,
];

interface InternalSchema {
  audit: TypedStructSchemaAudit;
  fields: ReadonlyMap<
    string,
    {
      audit: TypedStructField;
      declarations: ReadonlySet<ts.Declaration>;
    }
  >;
  symbol: ts.Symbol;
}

interface ReferencedSchemas {
  blockedMappedType: boolean;
  schemas: Set<InternalSchema>;
}

const registryCache = new WeakMap<ts.Program, Map<string, TypedStructRegistry>>();
const fingerprintPrinter = ts.createPrinter({ removeComments: true });

export function typedStructRegistry(
  workspaceDirectory: string,
  upstreamCommit: string,
  candidates: readonly TypedStructCandidate[] = initialTypedStructCandidates,
  programAndChecker = upstreamTypeScriptProgram(workspaceDirectory),
): TypedStructRegistry {
  const cacheKey = `${upstreamCommit}|${candidates
    .map((candidate) => `${candidate.packageName}:${candidate.source}#${candidate.name}:${candidate.emission}`)
    .join('|')}`;
  const cached = registryCache.get(programAndChecker.program)?.get(cacheKey);
  if (cached) return cached;

  const registry = createTypedStructRegistry(
    workspaceDirectory,
    upstreamCommit,
    candidates,
    programAndChecker.program,
    programAndChecker.checker,
  );
  const programCache = registryCache.get(programAndChecker.program) ?? new Map<string, TypedStructRegistry>();
  programCache.set(cacheKey, registry);
  registryCache.set(programAndChecker.program, programCache);
  return registry;
}

export function createTypedStructRegistry(
  workspaceDirectory: string,
  upstreamCommit: string,
  candidates: readonly TypedStructCandidate[],
  program: ts.Program,
  checker: ts.TypeChecker,
): TypedStructRegistry {
  const schemas = candidates.map((candidate) => analyzeCandidate(candidate, workspaceDirectory, program, checker));
  const bySymbol = new Map(schemas.map((schema) => [canonicalSymbol(schema.symbol, checker), schema]));
  const resolve = (type: ts.Type): TypedStructResolution =>
    resolveType(type, checker, bySymbol, new Set<ts.Type>(), new Set<ts.Symbol>());
  const resolveOwnedField = (
    type: ts.Type,
    member: string,
    property = checker.getPropertyOfType(type, member),
  ):
    | {
        field: TypedStructField;
        schema: InternalSchema;
      }
    | undefined => {
    const resolution = resolve(type);
    if (resolution.kind !== 'matched') return undefined;
    const schema = schemas.find((candidate) => candidate.audit.id === resolution.schemas[0]?.id);
    const field = schema?.fields.get(member);
    if (!schema || !field || !property || !isCandidateFieldDeclaration(property, field.declarations)) {
      return undefined;
    }
    return { field: field.audit, schema };
  };

  auditUses(workspaceDirectory, program, checker, schemas, resolve, resolveOwnedField);
  for (const schema of schemas) {
    if (schema.audit.escapes.some((escape) => escape.reason === 'presence-sensitive')) {
      addReason(schema.audit, 'presence-sensitive-use');
    }
    if (schema.audit.escapes.some((escape) => escape.reason === 'instanceof')) {
      addReason(schema.audit, 'instanceof-use');
    }
    schema.audit.eligible = schema.audit.reasons.length === 0;
    const accesses = sum(Object.values(schema.audit.accesses), (count) => count);
    schema.audit.emission.directAccesses =
      schema.audit.eligible && schema.audit.emission.mode === 'direct' ? accesses : 0;
    schema.audit.emission.pendingAccesses =
      schema.audit.eligible && schema.audit.emission.mode === 'audit-only' ? accesses : 0;
    schema.audit.emission.reflectiveSurvivors =
      schema.audit.eligible && schema.audit.emission.mode === 'direct' ? reflectiveSurvivors(schema.audit.escapes) : [];
    schema.audit.escapes.sort(compareEscapes);
    schema.audit.memberEscapes.sort(
      (left, right) =>
        left.member.localeCompare(right.member) ||
        left.reason.localeCompare(right.reason) ||
        left.source.localeCompare(right.source),
    );
  }

  const report: TypedStructAudit = {
    candidates: schemas.map((schema) => schema.audit),
    schemaVersion: 3,
    summary: {
      auditOnlySchemas: schemas.filter((schema) => schema.audit.emission.mode === 'audit-only').length,
      bindableAccesses: sum(schemas, (schema) =>
        schema.audit.eligible ? sum(Object.values(schema.audit.accesses), (count) => count) : 0,
      ),
      candidates: schemas.length,
      directAccesses: sum(schemas, (schema) => schema.audit.emission.directAccesses),
      directSchemas: schemas.filter((schema) => schema.audit.eligible && schema.audit.emission.mode === 'direct')
        .length,
      eligible: schemas.filter((schema) => schema.audit.eligible).length,
      escapes: sum(schemas, (schema) => schema.audit.escapes.length),
      fields: sum(schemas, (schema) => schema.audit.fields.length),
      ineligible: schemas.filter((schema) => !schema.audit.eligible).length,
      pendingAccesses: sum(schemas, (schema) => schema.audit.emission.pendingAccesses),
      reflectiveSurvivors: sum(schemas, (schema) =>
        sum(schema.audit.emission.reflectiveSurvivors, (survivor) => survivor.accesses),
      ),
    },
    upstreamCommit,
  };

  return {
    report,
    resolve,
    resolveCppStructInitConstruction(type) {
      const resolution = resolve(type);
      const schema = resolution.kind === 'matched' ? resolution.schemas[0] : undefined;
      if (
        resolution.schemas.length !== 1 ||
        !schema ||
        !schema.eligible ||
        schema.emission.mode !== 'direct' ||
        !cppStructInitTypedStructIdSet.has(schema.id)
      ) {
        return undefined;
      }
      return {
        fieldNames: schema.fields.map((field) => field.name),
        schemaHaxeType: typedStructHaxeType(schema),
        schemaId: schema.id,
        schemaName: schema.name,
      };
    },
    resolveField(type, member, property) {
      const owned = resolveOwnedField(type, member, property);
      if (
        !owned ||
        !owned.schema.audit.eligible ||
        owned.schema.audit.emission.mode !== 'direct' ||
        owned.field.receiverSensitive
      ) {
        return undefined;
      }
      return {
        field: owned.field,
        schemaHaxeType: typedStructHaxeType(owned.schema.audit),
        schemaId: owned.schema.audit.id,
        schemaName: owned.schema.audit.name,
      };
    },
  };
}

function typedStructHaxeType(schema: TypedStructSchemaAudit): string {
  const moduleName = sourcePathToImplementationModule(schema.source);
  const modulePath = `${sourcePathToHaxePackage(schema.packageName, schema.source)}.${moduleName}`;
  return moduleName === schema.name ? modulePath : `${modulePath}.${schema.name}`;
}

function analyzeCandidate(
  candidate: TypedStructCandidate,
  workspaceDirectory: string,
  program: ts.Program,
  checker: ts.TypeChecker,
): InternalSchema {
  const absoluteSource = path.resolve(workspaceDirectory, candidate.source);
  const source = program.getSourceFile(absoluteSource);
  if (!source)
    throw new Error(`Typed-struct candidate source is missing from the TypeScript program: ${candidate.source}`);
  const declaration = source.statements.find(
    (statement) =>
      (ts.isInterfaceDeclaration(statement) || ts.isTypeAliasDeclaration(statement)) &&
      statement.name.text === candidate.name,
  );
  if (!declaration || (!ts.isInterfaceDeclaration(declaration) && !ts.isTypeAliasDeclaration(declaration))) {
    throw new Error(`Typed-struct candidate declaration is missing: ${candidate.source}#${candidate.name}`);
  }
  const symbol = checker.getSymbolAtLocation(declaration.name);
  if (!symbol) throw new Error(`Typed-struct candidate has no symbol: ${candidate.source}#${candidate.name}`);
  const type = checker.getTypeAtLocation(declaration.name);
  const reasons: TypedStructSchemaAudit['reasons'] = [];
  if (checker.isArrayType(type) || checker.isTupleType(type) || (type.flags & ts.TypeFlags.Object) === 0) {
    reasons.push('unsupported-shape');
  }
  if (checker.getIndexInfosOfType(type).length > 0) reasons.push('index-signature');
  if (checker.getSignaturesOfType(type, ts.SignatureKind.Call).length > 0) reasons.push('callable-schema');
  if (checker.getSignaturesOfType(type, ts.SignatureKind.Construct).length > 0) reasons.push('constructable-schema');
  const declarations = canonicalSymbol(symbol, checker).declarations?.filter(
    (item) => ts.isInterfaceDeclaration(item) || ts.isTypeAliasDeclaration(item),
  );
  if ((declarations?.length ?? 0) > 1) reasons.push('declaration-merge');

  const fields: TypedStructField[] = [];
  const internalFields = new Map<
    string,
    {
      audit: TypedStructField;
      declarations: ReadonlySet<ts.Declaration>;
    }
  >();
  const memberEscapes: TypedStructMemberEscape[] = [];
  for (const property of checker.getPropertiesOfType(type)) {
    const propertyDeclarations = property.declarations ?? [];
    const computedDeclaration = propertyDeclarations.find(
      (item) => (ts.isPropertySignature(item) || ts.isMethodSignature(item)) && ts.isComputedPropertyName(item.name),
    );
    if (computedDeclaration || property.getName().startsWith('__@')) {
      const name =
        computedDeclaration &&
        (ts.isPropertySignature(computedDeclaration) || ts.isMethodSignature(computedDeclaration))
          ? computedDeclaration.name.getText(computedDeclaration.getSourceFile())
          : property.getName();
      memberEscapes.push({
        member: name,
        reason: 'computed-symbol-member',
        source: declarationLocation(propertyDeclarations[0] ?? declaration, workspaceDirectory),
      });
      continue;
    }
    const location = propertyDeclarations[0] ?? declaration;
    const propertyType = checker.getTypeOfSymbolAtLocation(property, location);
    const receiverSensitive = propertyDeclarations.some(isReceiverSensitiveMember);
    const field: TypedStructField = {
      name: property.getName(),
      optional: (property.flags & ts.SymbolFlags.Optional) !== 0,
      readonly: propertyDeclarations.some(hasReadonlyModifier),
      receiverSensitive,
      requiredUndefined: (property.flags & ts.SymbolFlags.Optional) === 0 && typeIncludesUndefined(propertyType),
      type: checker.typeToString(
        propertyType,
        location,
        ts.TypeFormatFlags.NoTruncation | ts.TypeFormatFlags.UseAliasDefinedOutsideCurrentScope,
      ),
    };
    fields.push(field);
    internalFields.set(field.name, {
      audit: field,
      declarations: new Set(propertyDeclarations),
    });
    if (receiverSensitive) {
      memberEscapes.push({
        member: field.name,
        reason: 'receiver-sensitive-method',
        source: declarationLocation(location, workspaceDirectory),
      });
    }
  }
  fields.sort((left, right) => left.name.localeCompare(right.name));

  const audit: TypedStructSchemaAudit = {
    accesses: { calls: 0, reads: 0, writes: 0 },
    declarationFingerprint: fingerprint(declaration, source),
    declarationKind: ts.isInterfaceDeclaration(declaration) ? 'interface' : 'type',
    eligible: false,
    emission: {
      directAccesses: 0,
      mode: candidate.emission,
      pendingAccesses: 0,
      reflectiveSurvivors: [],
    },
    escapes: [],
    fields,
    id: `${candidate.packageName}:${candidate.source}#${candidate.name}`,
    memberEscapes,
    name: candidate.name,
    packageName: candidate.packageName,
    purpose: candidate.purpose,
    reasons,
    source: candidate.source,
  };
  return { audit, fields: internalFields, symbol };
}

function auditUses(
  workspaceDirectory: string,
  program: ts.Program,
  checker: ts.TypeChecker,
  schemas: InternalSchema[],
  resolve: (type: ts.Type) => TypedStructResolution,
  resolveOwnedField: (
    type: ts.Type,
    member: string,
    property?: ts.Symbol,
  ) =>
    | {
        field: TypedStructField;
        schema: InternalSchema;
      }
    | undefined,
): void {
  const byId = new Map(schemas.map((schema) => [schema.audit.id, schema]));
  const visit = (node: ts.Node): void => {
    if (ts.isPropertyAccessExpression(node)) {
      const resolution = resolve(checker.getTypeAtLocation(node.expression));
      if (resolution.kind === 'incompatible') {
        for (const audit of resolution.schemas) {
          addEscape(audit, node, workspaceDirectory, 'incompatible-union', node.name.text);
        }
      } else if (resolution.kind === 'matched') {
        const audit = resolution.schemas[0]!;
        if (isPresenceSensitiveMember(node)) {
          addEscape(audit, node, workspaceDirectory, 'presence-sensitive', node.name.text);
        } else {
          const owned = resolveOwnedField(
            checker.getTypeAtLocation(node.expression),
            node.name.text,
            checker.getSymbolAtLocation(node.name),
          );
          if (!owned || owned.schema !== byId.get(audit.id)) {
            addEscape(audit, node, workspaceDirectory, 'unknown-member', node.name.text);
          } else if (owned.field.receiverSensitive && isCalledProperty(node)) {
            addEscape(audit, node, workspaceDirectory, 'receiver-sensitive-method', node.name.text);
          } else {
            audit.accesses[propertyAccessMode(node)] += 1;
          }
        }
      }
    } else if (ts.isElementAccessExpression(node)) {
      addResolutionEscape(
        resolve(checker.getTypeAtLocation(node.expression)),
        node,
        workspaceDirectory,
        'computed-key',
      );
    } else if (ts.isBinaryExpression(node) && node.operatorToken.kind === ts.SyntaxKind.InKeyword) {
      addResolutionEscape(
        resolve(checker.getTypeAtLocation(node.right)),
        node,
        workspaceDirectory,
        'presence-sensitive',
      );
    } else if (ts.isBinaryExpression(node) && node.operatorToken.kind === ts.SyntaxKind.InstanceOfKeyword) {
      addResolutionEscape(resolve(checker.getTypeAtLocation(node.left)), node, workspaceDirectory, 'instanceof');
    } else if (ts.isCallExpression(node)) {
      const presenceArgument = presenceSensitiveCallArgument(node);
      if (presenceArgument) {
        addResolutionEscape(
          resolve(checker.getTypeAtLocation(presenceArgument)),
          node,
          workspaceDirectory,
          'presence-sensitive',
        );
      }
      const enumerationArgument = dynamicEnumerationCallArgument(node);
      if (enumerationArgument) {
        addResolutionEscape(
          resolve(checker.getTypeAtLocation(enumerationArgument)),
          node,
          workspaceDirectory,
          'dynamic-enumeration',
        );
      }
    } else if (ts.isSpreadAssignment(node) || ts.isSpreadElement(node)) {
      addResolutionEscape(
        resolve(checker.getTypeAtLocation(node.expression)),
        node,
        workspaceDirectory,
        'dynamic-enumeration',
      );
    }
    ts.forEachChild(node, visit);
  };

  for (const source of program.getSourceFiles().filter(isProductionUpstreamSource)) visit(source);
}

function isCandidateFieldDeclaration(property: ts.Symbol, declarations: ReadonlySet<ts.Declaration>): boolean {
  const propertyDeclarations = property.declarations ?? [];
  return propertyDeclarations.length > 0 && propertyDeclarations.every((declaration) => declarations.has(declaration));
}

function resolveType(
  type: ts.Type,
  checker: ts.TypeChecker,
  bySymbol: ReadonlyMap<ts.Symbol, InternalSchema>,
  seenTypes: Set<ts.Type>,
  seenAliases: Set<ts.Symbol>,
): TypedStructResolution {
  if (isNullish(type)) return { kind: 'none', schemas: [] };
  if (type.isUnion()) {
    const members = type.types.filter((item) => !isNullish(item));
    const resolutions = members.map((item) =>
      resolveType(item, checker, bySymbol, new Set(seenTypes), new Set(seenAliases)),
    );
    const schemas = uniqueSchemas(resolutions.flatMap((item) => item.schemas));
    const matched =
      schemas.length === 1 &&
      resolutions.length > 0 &&
      resolutions.every(
        (item) => item.kind === 'matched' && item.schemas.length === 1 && item.schemas[0]?.id === schemas[0]?.id,
      );
    return { kind: matched ? 'matched' : schemas.length > 0 ? 'incompatible' : 'none', schemas };
  }

  const references = referencedSchemas(type, checker, bySymbol, seenTypes, seenAliases);
  const schemas = uniqueSchemas([...references.schemas].map((schema) => schema.audit));
  if (references.blockedMappedType || schemas.length > 1) {
    return { kind: schemas.length > 0 ? 'incompatible' : 'none', schemas };
  }
  return { kind: schemas.length === 1 ? 'matched' : 'none', schemas };
}

function referencedSchemas(
  type: ts.Type,
  checker: ts.TypeChecker,
  bySymbol: ReadonlyMap<ts.Symbol, InternalSchema>,
  seenTypes: Set<ts.Type>,
  seenAliases: Set<ts.Symbol>,
): ReferencedSchemas {
  if (seenTypes.has(type)) return { blockedMappedType: false, schemas: new Set() };
  seenTypes.add(type);
  const result: ReferencedSchemas = { blockedMappedType: false, schemas: new Set() };
  let transparentWrapper = false;
  const addSymbol = (symbol: ts.Symbol | undefined): void => {
    if (!symbol) return;
    const canonical = canonicalSymbol(symbol, checker);
    if (['EntityWithoutRuntime', 'Readonly'].includes(canonical.getName())) transparentWrapper = true;
    const schema = bySymbol.get(canonical);
    if (schema) result.schemas.add(schema);
    if (seenAliases.has(canonical)) return;
    seenAliases.add(canonical);
    if (['Omit', 'Partial', 'Pick', 'Record'].includes(canonical.getName())) {
      result.blockedMappedType = true;
    }
    for (const declaration of canonical.declarations ?? []) {
      if (!ts.isTypeAliasDeclaration(declaration)) continue;
      collectSchemasFromTypeNode(declaration.type, checker, bySymbol, result, seenAliases);
    }
  };
  addSymbol(type.aliasSymbol);
  addSymbol(type.getSymbol());
  if (transparentWrapper) {
    const arguments_ =
      type.aliasTypeArguments ??
      ((type.flags & ts.TypeFlags.Object) !== 0 && (type as ts.ObjectType).objectFlags & ts.ObjectFlags.Reference
        ? checker.getTypeArguments(type as ts.TypeReference)
        : []);
    for (const argument of arguments_) {
      mergeReferences(result, referencedSchemas(argument, checker, bySymbol, seenTypes, seenAliases));
    }
  }
  if (type.isIntersection()) {
    for (const member of type.types) {
      mergeReferences(result, referencedSchemas(member, checker, bySymbol, seenTypes, seenAliases));
    }
  }
  const constraint = checker.getBaseConstraintOfType(type);
  if (constraint && constraint !== type) {
    mergeReferences(result, referencedSchemas(constraint, checker, bySymbol, seenTypes, seenAliases));
  }
  return result;
}

function collectSchemasFromTypeNode(
  node: ts.TypeNode,
  checker: ts.TypeChecker,
  bySymbol: ReadonlyMap<ts.Symbol, InternalSchema>,
  result: ReferencedSchemas,
  seenAliases: Set<ts.Symbol>,
): void {
  if (ts.isParenthesizedTypeNode(node) || ts.isTypeOperatorNode(node)) {
    collectSchemasFromTypeNode(node.type, checker, bySymbol, result, seenAliases);
    return;
  }
  if (ts.isUnionTypeNode(node) || ts.isIntersectionTypeNode(node)) {
    for (const member of node.types) {
      collectSchemasFromTypeNode(member, checker, bySymbol, result, seenAliases);
    }
    return;
  }
  if (!ts.isTypeReferenceNode(node)) return;

  const symbol = checker.getSymbolAtLocation(node.typeName);
  if (!symbol) return;
  const canonical = canonicalSymbol(symbol, checker);
  const schema = bySymbol.get(canonical);
  if (schema) result.schemas.add(schema);
  if (['Omit', 'Partial', 'Pick', 'Record'].includes(canonical.getName())) {
    result.blockedMappedType = true;
    return;
  }
  if (['EntityWithoutRuntime', 'Readonly'].includes(canonical.getName())) {
    for (const argument of node.typeArguments ?? []) {
      collectSchemasFromTypeNode(argument, checker, bySymbol, result, seenAliases);
    }
    return;
  }
  if (seenAliases.has(canonical)) return;
  seenAliases.add(canonical);
  for (const declaration of canonical.declarations ?? []) {
    if (ts.isTypeAliasDeclaration(declaration)) {
      collectSchemasFromTypeNode(declaration.type, checker, bySymbol, result, seenAliases);
    }
  }
}

function mergeReferences(target: ReferencedSchemas, source: ReferencedSchemas): void {
  target.blockedMappedType ||= source.blockedMappedType;
  for (const schema of source.schemas) target.schemas.add(schema);
}

function canonicalSymbol(symbol: ts.Symbol, checker: ts.TypeChecker): ts.Symbol {
  return (symbol.flags & ts.SymbolFlags.Alias) !== 0 ? checker.getAliasedSymbol(symbol) : symbol;
}

function addResolutionEscape(
  resolution: TypedStructResolution,
  node: ts.Node,
  workspaceDirectory: string,
  reason: TypedStructEscape['reason'],
): void {
  for (const audit of resolution.schemas) addEscape(audit, node, workspaceDirectory, reason);
}

function addEscape(
  audit: TypedStructSchemaAudit,
  node: ts.Node,
  workspaceDirectory: string,
  reason: TypedStructEscape['reason'],
  member?: string,
): void {
  const sourceFile = node.getSourceFile();
  const position = sourceFile.getLineAndCharacterOfPosition(node.getStart(sourceFile));
  audit.escapes.push({
    column: position.character + 1,
    ...(member ? { member } : {}),
    reason,
    source: path.relative(workspaceDirectory, sourceFile.fileName).split(path.sep).join('/'),
    line: position.line + 1,
  });
}

function propertyAccessMode(node: ts.PropertyAccessExpression): keyof TypedStructSchemaAudit['accesses'] {
  if (isCalledProperty(node)) return 'calls';
  const parent = node.parent;
  if (
    (ts.isBinaryExpression(parent) &&
      parent.left === node &&
      parent.operatorToken.kind >= ts.SyntaxKind.FirstAssignment &&
      parent.operatorToken.kind <= ts.SyntaxKind.LastAssignment) ||
    ((ts.isPrefixUnaryExpression(parent) || ts.isPostfixUnaryExpression(parent)) &&
      (parent.operator === ts.SyntaxKind.PlusPlusToken || parent.operator === ts.SyntaxKind.MinusMinusToken))
  ) {
    return 'writes';
  }
  return 'reads';
}

function isCalledProperty(node: ts.PropertyAccessExpression): boolean {
  return ts.isCallExpression(node.parent) && node.parent.expression === node;
}

function isPresenceSensitiveMember(node: ts.PropertyAccessExpression): boolean {
  return node.name.text === 'hasOwnProperty' && isCalledProperty(node);
}

function presenceSensitiveCallArgument(node: ts.CallExpression): ts.Expression | undefined {
  if (
    ts.isPropertyAccessExpression(node.expression) &&
    ts.isIdentifier(node.expression.expression) &&
    node.expression.expression.text === 'Object' &&
    ['hasOwn', 'getOwnPropertyDescriptor'].includes(node.expression.name.text)
  ) {
    return node.arguments[0];
  }
  if (
    ts.isPropertyAccessExpression(node.expression) &&
    node.expression.name.text === 'call' &&
    ts.isPropertyAccessExpression(node.expression.expression) &&
    node.expression.expression.name.text === 'hasOwnProperty'
  ) {
    return node.arguments[0];
  }
  return undefined;
}

function dynamicEnumerationCallArgument(node: ts.CallExpression): ts.Expression | undefined {
  if (
    ts.isPropertyAccessExpression(node.expression) &&
    ts.isIdentifier(node.expression.expression) &&
    node.expression.expression.text === 'Object' &&
    ['entries', 'keys', 'values'].includes(node.expression.name.text)
  ) {
    return node.arguments[0];
  }
  return undefined;
}

function isReceiverSensitiveMember(node: ts.Declaration): boolean {
  if (ts.isMethodSignature(node) || ts.isMethodDeclaration(node)) return true;
  if (!ts.isPropertySignature(node) || !node.type || !ts.isFunctionTypeNode(node.type)) return false;
  return node.type.parameters.some((parameter) => ts.isIdentifier(parameter.name) && parameter.name.text === 'this');
}

function hasReadonlyModifier(node: ts.Declaration): boolean {
  return (
    ts.canHaveModifiers(node) &&
    ts.getModifiers(node)?.some((modifier) => modifier.kind === ts.SyntaxKind.ReadonlyKeyword) === true
  );
}

function typeIncludesUndefined(type: ts.Type): boolean {
  return type.isUnion()
    ? type.types.some((member) => typeIncludesUndefined(member))
    : (type.flags & ts.TypeFlags.Undefined) !== 0;
}

function isNullish(type: ts.Type): boolean {
  return (type.flags & (ts.TypeFlags.Null | ts.TypeFlags.Undefined)) !== 0;
}

function isProductionUpstreamSource(source: ts.SourceFile): boolean {
  const normalized = source.fileName.split(path.sep).join('/');
  const packageDirectory = /\/upstream\/packages\/([^/]+)\/src\//u.exec(normalized)?.[1];
  return (
    packageDirectory !== undefined &&
    // Direct-access coverage is measured against the packages that can reach generated IR.
    !(packageDirectory in portConfig.excludedPackages) &&
    !/\.(?:test|spec)\.tsx?$/u.test(normalized) &&
    !normalized.endsWith('.d.ts')
  );
}

function declarationLocation(node: ts.Node, workspaceDirectory: string): string {
  const source = node.getSourceFile();
  const position = source.getLineAndCharacterOfPosition(node.getStart(source));
  return `${path.relative(workspaceDirectory, source.fileName).split(path.sep).join('/')}:${String(position.line + 1)}`;
}

function fingerprint(node: ts.Node, source: ts.SourceFile): string {
  const normalized = fingerprintPrinter.printNode(ts.EmitHint.Unspecified, node, source).replace(/\s+/gu, ' ').trim();
  return `sha256:${createHash('sha256').update(normalized).digest('hex')}`;
}

function addReason(audit: TypedStructSchemaAudit, reason: TypedStructSchemaAudit['reasons'][number]): void {
  if (!audit.reasons.includes(reason)) audit.reasons.push(reason);
  audit.reasons.sort();
}

function uniqueSchemas(schemas: TypedStructSchemaAudit[]): TypedStructSchemaAudit[] {
  return [...new Map(schemas.map((schema) => [schema.id, schema])).values()].sort((left, right) =>
    left.id.localeCompare(right.id),
  );
}

function compareEscapes(left: TypedStructEscape, right: TypedStructEscape): number {
  return (
    left.source.localeCompare(right.source) ||
    left.line - right.line ||
    left.column - right.column ||
    left.reason.localeCompare(right.reason) ||
    (left.member ?? '').localeCompare(right.member ?? '')
  );
}

function reflectiveSurvivors(
  escapes: readonly TypedStructEscape[],
): TypedStructSchemaAudit['emission']['reflectiveSurvivors'] {
  const accessesByReason = new Map<string, number>();
  for (const escape of escapes) {
    accessesByReason.set(escape.reason, (accessesByReason.get(escape.reason) ?? 0) + 1);
  }
  return [...accessesByReason]
    .map(([reason, accesses]) => ({ accesses, reason }))
    .sort((left, right) => left.reason.localeCompare(right.reason));
}

function sum<T>(items: readonly T[], select: (item: T) => number): number {
  return items.reduce((total, item) => total + select(item), 0);
}
