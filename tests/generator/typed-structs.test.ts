import { execFileSync } from 'node:child_process';
import { mkdirSync, readFileSync, rmSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import ts from 'typescript';

import { auditTypedStructClassFeasibility } from '../../tools/generator/src/analyze/typed-struct-classes.ts';
import { auditTypedStructProvenance } from '../../tools/generator/src/analyze/typed-struct-provenance.ts';
import {
  cppStructInitTypedStructIds,
  createTypedStructRegistry,
  discoverTypedStructUniverse,
  reviewedTypedStructDirectAdditions,
  typedStructRegistry,
  typedStructStableId,
  type TypedStructCandidate,
} from '../../tools/generator/src/analyze/typed-structs.ts';
import { upstreamTypeScriptProgram } from '../../tools/generator/src/analyze/program.ts';
import { validateCppStructInitProvenance } from '../../tools/generator/src/emit/core.ts';
import { emitHaxeModule } from '../../tools/generator/src/emit/haxe.ts';
import {
  typedStructClassFeasibilitySummary,
  typedStructProvenanceSummary,
  typedStructSummary,
} from '../../tools/generator/src/emit/reports.ts';
import { lowerTypeScriptSource } from '../../tools/generator/src/lower/typescript.ts';
import type { IrExpression, IrTypedStructBinding } from '../../tools/generator/src/model/ir.ts';

const fixtureCandidate: TypedStructCandidate = {
  emission: 'direct',
  name: 'Vector2',
  packageName: '@flighthq/types',
  purpose: 'fixture numeric leaf',
  source: 'upstream/packages/types/src/Vector2.ts',
};

describe('typed struct stable declaration identity', () => {
  it('locks the previous report through the approved migration dispositions', () => {
    const workspace = path.resolve('.');
    const { program } = upstreamTypeScriptProgram(workspace);
    const discovery = discoverTypedStructUniverse(workspace, program);
    const particleEmitterData = discovery.candidates.find((candidate) => candidate.name === 'ParticleEmitterData');

    expect(discovery.migration.summary).toEqual({
      baseline: 405,
      kindChanged: 2,
      newAuditOnly: 1_356,
      preserved: 231,
      relocated: 146,
      removed: 3,
      renamed: 23,
    });
    expect(discovery.migration).toMatchObject({
      baselineUpstreamCommit: '5d24729f7360475e28a105ae0caeeaa2e1328260',
      sourceReportSha256: '01780f464ad52d5b386fc4d707fbd00a7d1ccc1e1f15426fbc514c7c59f410a3',
    });
    expect(discovery.candidates).toHaveLength(2_006);
    expect(discovery.candidates.filter((candidate) => candidate.emission === 'direct')).toHaveLength(650);
    const relocated = discovery.candidates.filter((candidate) => candidate.migration.status === 'relocated');
    expect(relocated).toHaveLength(146);
    expect(
      relocated.every(
        (candidate) =>
          candidate.packageName === '@flighthq/types' && candidate.definingPackageName === '@flighthq/types',
      ),
    ).toBe(true);
    expect(
      new Set(
        discovery.candidates.map((candidate) =>
          typedStructStableId(candidate.packageName, candidate.declarationKind, candidate.name),
        ),
      ).size,
    ).toBe(discovery.candidates.length);
    expect(particleEmitterData).toMatchObject({
      configuredPackageName: '@flighthq/types',
      configuredSource: 'upstream/packages/types/src/ParticleEmitter.ts',
      declarationKind: 'interface',
      definingPackageName: '@flighthq/types',
      packageName: '@flighthq/types',
      source: 'upstream/packages/types/src/ParticleEmitter2D.ts',
      sourceResolution: 'relocated',
      migration: {
        baselineId: '@flighthq/types:interface#ParticleEmitterData',
        status: 'relocated',
      },
    });
    expect(
      particleEmitterData &&
        typedStructStableId(
          particleEmitterData.packageName,
          particleEmitterData.declarationKind,
          particleEmitterData.name,
        ),
    ).toBe('@flighthq/types:interface#ParticleEmitterData');
  });

  it('admits new rows as audit-only unless explicitly reviewed for direct emission', () => {
    const workspace = path.resolve('.');
    const { program } = upstreamTypeScriptProgram(workspace);
    const discovery = discoverTypedStructUniverse(workspace, program);
    const byId = new Map(
      discovery.candidates.map((candidate) => [
        typedStructStableId(candidate.packageName, candidate.declarationKind, candidate.name),
        candidate,
      ]),
    );

    const newlyDiscovered = discovery.candidates.filter((candidate) => candidate.migration.status === 'new');
    expect(newlyDiscovered).toHaveLength(1_604);
    expect(newlyDiscovered.filter((candidate) => candidate.emission === 'audit-only')).toHaveLength(1_356);
    const newDirect = newlyDiscovered.filter((candidate) => candidate.emission === 'direct');
    expect(newDirect).toHaveLength(248);
    expect(newDirect).toEqual(
      expect.arrayContaining([
        expect.objectContaining({
          name: 'BitmapRegion',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free bitmap region',
        }),
        expect.objectContaining({
          name: 'CanvasRenderTarget',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Canvas render target',
        }),
        expect.objectContaining({
          name: 'GlRenderStateRuntime',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL render-state runtime',
        }),
        expect.objectContaining({
          name: 'GlRenderTarget',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL render target',
        }),
        expect.objectContaining({
          name: 'RenderTarget',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free portable render target',
        }),
        expect.objectContaining({
          name: 'RenderTargetDescriptor',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free render-target descriptor',
        }),
        expect.objectContaining({
          name: 'RichText',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free rich text',
        }),
        expect.objectContaining({
          name: 'RichTextContent',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free rich-text content',
        }),
        expect.objectContaining({
          name: 'RichTextData',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free rich-text data',
        }),
        expect.objectContaining({
          name: 'TextLayoutGroup',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free text-layout group',
        }),
        expect.objectContaining({
          name: 'TextLayoutResult',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free text-layout result',
        }),
        expect.objectContaining({
          name: 'WgpuRenderStateRuntime',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGPU render-state runtime',
        }),
        expect.objectContaining({
          name: 'WgpuRenderTarget',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGPU render target',
        }),
        expect.objectContaining({
          name: 'Physics2DWorld',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free physics world',
        }),
        expect.objectContaining({
          name: 'Physics2DContact',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free physics contact',
        }),
        expect.objectContaining({
          name: 'Physics2DSolverConfig',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free physics solver config',
        }),
        expect.objectContaining({
          name: 'Physics2DCollider',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free physics collider',
        }),
        expect.objectContaining({
          name: 'ClipRegion',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free clip region',
        }),
        expect.objectContaining({
          name: 'CanvasRenderEffectContext',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Canvas render-effect context',
        }),
        expect.objectContaining({
          name: 'GlRenderEffectContext',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL render-effect context',
        }),
        expect.objectContaining({
          name: 'WgpuRenderEffectContext',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGPU render-effect context',
        }),
        expect.objectContaining({
          name: 'GlScene3DRuntime',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL scene runtime',
        }),
        expect.objectContaining({
          name: 'WgpuScene3DRuntime',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGPU scene runtime',
        }),
        expect.objectContaining({
          name: 'QuadBatchData',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free quad batch data',
        }),
        expect.objectContaining({
          name: 'CanvasShapeDrawState',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Canvas shape draw state',
        }),
        expect.objectContaining({
          name: 'Scene3DDocument',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Scene3D document',
        }),
        expect.objectContaining({
          name: 'OrbitCameraController',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free orbit camera controller',
        }),
        expect.objectContaining({
          name: 'RiveCoreObject',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Rive core object',
        }),
        expect.objectContaining({
          name: 'AnimationTrack',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free animation track',
        }),
        expect.objectContaining({
          name: 'Tween',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free tween state',
        }),
        expect.objectContaining({
          name: 'AnimationChannel',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free animation channel',
        }),
        expect.objectContaining({
          name: 'AnimationPlayer',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free animation player',
        }),
        expect.objectContaining({
          name: 'Timeline',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free timeline state',
        }),
        expect.objectContaining({
          name: 'RiveArtboardGraph',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Rive artboard graph',
        }),
        expect.objectContaining({
          name: 'RiveProperty',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Rive property',
        }),
        expect.objectContaining({
          name: 'RivePathRecord',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Rive path record',
        }),
        expect.objectContaining({
          name: 'RiveFileAsset',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Rive file asset',
        }),
        expect.objectContaining({
          name: 'RiveDocumentImportResult',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Rive document import result',
        }),
        expect.objectContaining({
          name: 'TextInputState',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free text-input state',
        }),
        expect.objectContaining({
          name: 'KeyboardEventData',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free keyboard event data',
        }),
        expect.objectContaining({
          name: 'InputManager',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free input manager',
        }),
        expect.objectContaining({
          name: 'InputPointerData',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free input pointer data',
        }),
        expect.objectContaining({
          name: 'InputKeyboardData',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free input keyboard data',
        }),
        expect.objectContaining({
          name: 'StandardPbrMaterialProperties',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free standard PBR material properties',
        }),
        expect.objectContaining({
          name: 'ShadedMaterial',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free shaded material',
        }),
        expect.objectContaining({
          name: 'SpecularGlossinessPbrMaterial',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free specular-glossiness PBR material',
        }),
        expect.objectContaining({
          name: 'PhongMaterial',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Phong material',
        }),
        expect.objectContaining({
          name: 'BlinnPhongMaterial',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Blinn-Phong material',
        }),
        expect.objectContaining({
          name: 'RenderStateRuntime',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free render-state runtime',
        }),
        expect.objectContaining({
          name: 'RenderProxy',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free render proxy',
        }),
        expect.objectContaining({
          name: 'DomRenderStateRuntime',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free DOM render-state runtime',
        }),
        expect.objectContaining({
          name: 'ResolvedRenderTargetDescriptor',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free resolved render-target descriptor',
        }),
        expect.objectContaining({
          name: 'Scene3DRenderProxy',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Scene3D render proxy',
        }),
        expect.objectContaining({
          name: 'Velocity2D',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free 2D velocity',
        }),
        expect.objectContaining({
          name: 'CollisionTimeOfImpact',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free collision time of impact',
        }),
        expect.objectContaining({
          name: 'Physics2DMassData',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free physics mass data',
        }),
        expect.objectContaining({
          name: 'CollisionManifold',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free collision manifold',
        }),
        expect.objectContaining({
          name: 'CollisionContactManifold',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free collision contact manifold',
        }),
        expect.objectContaining({
          name: 'Physics2DPrismaticJoint',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free physics prismatic joint',
        }),
        expect.objectContaining({
          name: 'Physics2DPulleyJoint',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free physics pulley joint',
        }),
        expect.objectContaining({
          name: 'Physics2DGearJoint',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free physics gear joint',
        }),
        expect.objectContaining({
          name: 'Physics2DWheelJoint',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free physics wheel joint',
        }),
        expect.objectContaining({
          name: 'Physics2DRevoluteJoint',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free physics revolute joint',
        }),
        expect.objectContaining({
          name: 'Skeleton2D',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free 2D skeleton',
        }),
        expect.objectContaining({
          name: 'Skeleton3D',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free 3D skeleton',
        }),
        expect.objectContaining({
          name: 'MeshSkinBindPose',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free mesh skin bind pose',
        }),
        expect.objectContaining({
          name: 'SkinAttachment2D',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free 2D skin attachment',
        }),
        expect.objectContaining({
          name: 'Skeleton2DPathConstraint',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free 2D skeleton path constraint',
        }),
        expect.objectContaining({
          name: 'AnimationStateMachine',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free animation state machine',
        }),
        expect.objectContaining({
          name: 'AnimationCrossfade',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free animation crossfade',
        }),
        expect.objectContaining({
          name: 'Statechart',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free statechart',
        }),
        expect.objectContaining({
          name: 'StatechartInstance',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free statechart instance',
        }),
        expect.objectContaining({
          name: 'StatechartTransition',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free statechart transition',
        }),
        expect.objectContaining({
          name: 'TextureContainer',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free texture container',
        }),
        expect.objectContaining({
          name: 'TextureContainerLevel',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free texture container level',
        }),
        expect.objectContaining({
          name: 'RenderTexture',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free render texture',
        }),
        expect.objectContaining({
          name: 'GlRenderTextureEntry',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL render-texture entry',
        }),
        expect.objectContaining({
          name: 'WgpuRenderTextureEntry',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGPU render-texture entry',
        }),
        expect.objectContaining({
          name: 'Scene3DHit',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Scene3D hit',
        }),
        expect.objectContaining({
          name: 'CollisionRaycastHit',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free collision raycast hit',
        }),
        expect.objectContaining({
          name: 'Physics2DRayHit',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free physics ray hit',
        }),
        expect.objectContaining({
          name: 'CollisionContactPoint',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free collision contact point',
        }),
        expect.objectContaining({
          name: 'VelocitySample',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free velocity sample',
        }),
        expect.objectContaining({
          name: 'RichTextRuntime',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free rich-text runtime',
        }),
        expect.objectContaining({
          name: 'TextLabelData',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free text-label data',
        }),
        expect.objectContaining({
          name: 'BitmapTextPage',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free bitmap-text page',
        }),
        expect.objectContaining({
          name: 'TextLabel',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free text label',
        }),
        expect.objectContaining({
          name: 'ShapedRun',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free shaped run',
        }),
        expect.objectContaining({
          name: 'Shape',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free shape',
        }),
        expect.objectContaining({
          name: 'Scale9Shape',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free scale-9 shape',
        }),
        expect.objectContaining({
          name: 'ShapeData',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free shape data',
        }),
        expect.objectContaining({
          name: 'MorphShape',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free morph shape',
        }),
        expect.objectContaining({
          name: 'MorphShapeData',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free morph-shape data',
        }),
        expect.objectContaining({
          name: 'GlMeshProgram',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL mesh program',
        }),
        expect.objectContaining({
          name: 'GlClassicProgram',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL classic program',
        }),
        expect.objectContaining({
          name: 'GlMeshUpload',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL mesh upload',
        }),
        expect.objectContaining({
          name: 'GlParticleShader',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL particle shader',
        }),
        expect.objectContaining({
          name: 'GlPbrProgram',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL PBR program',
        }),
        expect.objectContaining({
          name: 'BevelEffect',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free bevel effect',
        }),
        expect.objectContaining({
          name: 'DropShadowEffect',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free drop-shadow effect',
        }),
        expect.objectContaining({
          name: 'GradientBevelEffect',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free gradient-bevel effect',
        }),
        expect.objectContaining({
          name: 'InnerShadowEffect',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free inner-shadow effect',
        }),
        expect.objectContaining({
          name: 'OuterGlowEffect',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free outer-glow effect',
        }),
        expect.objectContaining({
          name: 'GlScissorRect',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL scissor rectangle',
        }),
        expect.objectContaining({
          name: 'WgpuScissorRect',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGPU scissor rectangle',
        }),
        expect.objectContaining({
          name: 'CanvasRenderStateRuntime',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Canvas render-state runtime',
        }),
        expect.objectContaining({
          name: 'GlRenderEffectPipeline',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL render-effect pipeline',
        }),
        expect.objectContaining({
          name: 'WgpuRenderEffectPipeline',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGPU render-effect pipeline',
        }),
        expect.objectContaining({
          name: 'VertexDisplaceModifier',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free vertex-displacement modifier',
        }),
        expect.objectContaining({
          name: 'AnimatedNormalModifier',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free animated-normal modifier',
        }),
        expect.objectContaining({
          name: 'EmissiveModifier',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free emissive modifier',
        }),
        expect.objectContaining({
          name: 'FogModifier',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free fog modifier',
        }),
        expect.objectContaining({
          name: 'DissolveModifier',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free dissolve modifier',
        }),
        expect.objectContaining({
          name: 'AnimatedNormalModifierOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free animated-normal modifier options',
        }),
        expect.objectContaining({
          name: 'DissolveModifierOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free dissolve modifier options',
        }),
        expect.objectContaining({
          name: 'EmissiveModifierOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free emissive modifier options',
        }),
        expect.objectContaining({
          name: 'FogModifierOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free fog modifier options',
        }),
        expect.objectContaining({
          name: 'VertexDisplaceModifierOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free vertex-displacement modifier options',
        }),
        expect.objectContaining({
          name: 'InteractionManager',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free interaction manager',
        }),
        expect.objectContaining({
          name: 'InputState',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free input state',
        }),
        expect.objectContaining({
          name: 'PointerEventData',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free pointer event data',
        }),
        expect.objectContaining({
          name: 'NodeInteractionState',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free node interaction state',
        }),
        expect.objectContaining({
          name: 'InteractionPointerState',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free interaction pointer state',
        }),
        expect.objectContaining({
          name: 'TilemapData',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free tilemap data',
        }),
        expect.objectContaining({
          name: 'TiledObject',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Tiled object',
        }),
        expect.objectContaining({
          name: 'TiledMap',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Tiled map',
        }),
        expect.objectContaining({
          name: 'Tilemap',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free tilemap',
        }),
        expect.objectContaining({
          name: 'TiledTileset',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Tiled tileset',
        }),
        expect.objectContaining({
          name: 'TiledTilesetTile',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Tiled tileset tile',
        }),
        expect.objectContaining({
          name: 'TiledTilesetRef',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Tiled tileset reference',
        }),
        expect.objectContaining({
          name: 'TiledProperty',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Tiled property',
        }),
        expect.objectContaining({
          name: 'TiledTilesetTileFrame',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Tiled tileset tile frame',
        }),
        expect.objectContaining({
          name: 'TiledGid',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Tiled gid',
        }),
        expect.objectContaining({
          name: 'TransmissionVolumePbrExtension',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free transmission-volume PBR extension',
        }),
        expect.objectContaining({
          name: 'ClearcoatPbrExtension',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free clearcoat PBR extension',
        }),
        expect.objectContaining({
          name: 'IridescencePbrExtension',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free iridescence PBR extension',
        }),
        expect.objectContaining({
          name: 'WrappedDiffusePbrExtension',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free wrapped-diffuse PBR extension',
        }),
        expect.objectContaining({
          name: 'SpecularPbrExtension',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free specular PBR extension',
        }),
        expect.objectContaining({
          name: 'FlyCameraController',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free fly camera controller',
        }),
        expect.objectContaining({
          name: 'ParticleEmitter3D',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free 3D particle emitter',
        }),
        expect.objectContaining({
          name: 'SocketRuntime',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free socket runtime',
        }),
        expect.objectContaining({
          name: 'NodeOrderList',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free node order list',
        }),
        expect.objectContaining({
          name: 'PackableRectangle',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free packable rectangle',
        }),
        expect.objectContaining({
          name: 'Clock',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free clock',
        }),
        expect.objectContaining({
          name: 'AreaLight',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free area light',
        }),
        expect.objectContaining({
          name: 'LottieLayer',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Lottie layer',
        }),
        expect.objectContaining({
          name: 'MovieClipData',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free movie-clip data',
        }),
        expect.objectContaining({
          name: 'PathMesh',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free path mesh',
        }),
        expect.objectContaining({
          name: 'StandardPbrMaterial',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free standard PBR material',
        }),
        expect.objectContaining({
          name: 'TextSelectionRectangle',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free text selection rectangle',
        }),
        expect.objectContaining({
          name: 'LayoutNode',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free layout node',
        }),
        expect.objectContaining({
          name: 'Scene3DKindUsage',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Scene3D kind usage',
        }),
        expect.objectContaining({
          name: 'TextureSource',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free texture source',
        }),
        expect.objectContaining({
          name: 'ElectronApi',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Electron API',
        }),
        expect.objectContaining({
          name: 'GlLitProgram',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL lit program',
        }),
        expect.objectContaining({
          name: 'LayoutState',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free layout state',
        }),
        expect.objectContaining({
          name: 'MeshGeometryRuntime',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free mesh geometry runtime',
        }),
        expect.objectContaining({
          name: 'QuadBatch',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free quad batch',
        }),
        expect.objectContaining({
          name: 'TextInputOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free text input options',
        }),
        expect.objectContaining({
          name: 'LottieDocument',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Lottie document',
        }),
        expect.objectContaining({
          name: 'Scene3DLightBlock',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Scene3D light block',
        }),
        expect.objectContaining({
          name: 'GodRaysEffect',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free god-rays effect',
        }),
        expect.objectContaining({
          name: 'NativeTextData',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free native-text data',
        }),
        expect.objectContaining({
          name: 'Scene3DResourceResolverRuntime',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Scene3D resource-resolver runtime',
        }),
        expect.objectContaining({
          name: 'GradientGlowEffect',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free gradient-glow effect',
        }),
        expect.objectContaining({
          name: 'BitmapTextData',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free bitmap-text data',
        }),
        expect.objectContaining({
          name: 'WgpuShapeMeshBuffers',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGPU shape-mesh buffers',
        }),
        expect.objectContaining({
          name: 'Scene3DDocumentNode',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Scene3D document node',
        }),
        expect.objectContaining({
          name: 'DirectionalLight',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free directional light',
        }),
        expect.objectContaining({
          name: 'SurfaceMaterial',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free surface material',
        }),
        expect.objectContaining({
          name: 'MorphShapeGradientEndpoint',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free morph-shape gradient endpoint',
        }),
        expect.objectContaining({
          name: 'SpatialIndexingNotice',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free spatial-indexing notice',
        }),
        expect.objectContaining({
          name: 'Scene3DRenderList',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Scene3D render list',
        }),
        expect.objectContaining({
          name: 'Scene2DKindUsage',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Scene2D kind usage',
        }),
        expect.objectContaining({
          name: 'MotionPath',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free motion path',
        }),
        expect.objectContaining({
          name: 'InnerGlowEffect',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free inner-glow effect',
        }),
        expect.objectContaining({
          name: 'CustomShaderMaterial',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free custom-shader material',
        }),
        expect.objectContaining({
          name: 'CreateRenderTextureOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free render-texture options',
        }),
        expect.objectContaining({
          name: 'AbcInstruction',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free ABC instruction',
        }),
        expect.objectContaining({
          name: 'AbcMultiname',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free ABC multiname',
        }),
        expect.objectContaining({
          name: 'AnimationRootMotionExtractor',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free animation root-motion extractor',
        }),
        expect.objectContaining({
          name: 'CanvasRenderTexturePool',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Canvas render-texture pool',
        }),
        expect.objectContaining({
          name: 'LogEntry',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free log entry',
        }),
        expect.objectContaining({
          name: 'ToonMaterial',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free toon material',
        }),
        expect.objectContaining({
          name: 'UnlitMaterial',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free unlit material',
        }),
        expect.objectContaining({
          name: 'ConvolutionEffect',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free convolution effect',
        }),
        expect.objectContaining({
          name: 'EmissiveMaterial',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free emissive material',
        }),
        expect.objectContaining({
          name: 'TransformInherit2D',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free 2D transform inheritance',
        }),
        expect.objectContaining({
          name: 'ExtendedPbrMaterial',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free extended PBR material',
        }),
        expect.objectContaining({
          name: 'TweenPropertyDetail',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free tween property detail',
        }),
        expect.objectContaining({
          name: 'WgpuScene3DShadow',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGPU Scene3D shadow',
        }),
        expect.objectContaining({
          name: 'AnimationClipEvent',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free animation clip event',
        }),
        expect.objectContaining({
          name: 'BitmapTextRuntime',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free bitmap-text runtime',
        }),
        expect.objectContaining({
          name: 'GlColorScaleBiasInstancedShader',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL color scale-bias instanced shader',
        }),
        expect.objectContaining({
          name: 'LambertMaterial',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Lambert material',
        }),
        expect.objectContaining({
          name: 'OrbitCameraControllerOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free orbit-camera options',
        }),
        expect.objectContaining({
          name: 'WgpuShapeRendererData',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGPU shape-renderer data',
        }),
        expect.objectContaining({
          name: 'AnimationBlendTree',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free animation blend tree',
        }),
        expect.objectContaining({
          name: 'WgpuRenderTexturePool',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGPU render-texture pool',
        }),
        expect.objectContaining({
          name: 'GlRenderTexturePool',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL render-texture pool',
        }),
        expect.objectContaining({
          name: 'GlShadedProgram',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL shaded program',
        }),
        expect.objectContaining({
          name: 'GlShapeRendererData',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL shape-renderer data',
        }),
        expect.objectContaining({
          name: 'WgpuQuadBatchWriterBufferSlot',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGPU quad-batch buffer slot',
        }),
        expect.objectContaining({
          name: 'TextShaperBackend',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free text-shaper backend',
        }),
        expect.objectContaining({
          name: 'TextLayoutParams',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free text-layout parameters',
        }),
        expect.objectContaining({
          name: 'SoftKeyboardInfo',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free soft-keyboard info',
        }),
        expect.objectContaining({
          name: 'LayoutTree',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free layout tree',
        }),
        expect.objectContaining({
          name: 'Sprite',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free sprite',
        }),
        expect.objectContaining({
          name: 'AnimationSampleAccumulator',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free animation sample accumulator',
        }),
        expect.objectContaining({
          name: 'AnimationLayer',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free animation layer',
        }),
        expect.objectContaining({
          name: 'AnimationBlendTreeInput',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free animation blend-tree input',
        }),
        expect.objectContaining({
          name: 'LottieKeyframe',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Lottie keyframe',
        }),
        expect.objectContaining({
          name: 'Skeleton2DTransformConstraint',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Skeleton2D transform constraint',
        }),
        expect.objectContaining({
          name: 'AbcTrait',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free ABC trait',
        }),
        expect.objectContaining({
          name: 'CanvasRenderTextureEntry',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Canvas render-texture entry',
        }),
        expect.objectContaining({
          name: 'NetRequest',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free net request',
        }),
        expect.objectContaining({
          name: 'SheenPbrExtension',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free sheen PBR extension',
        }),
        expect.objectContaining({
          name: 'ThreeDsLight',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free 3DS light',
        }),
        expect.objectContaining({
          name: 'WgpuScene3DIbl',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGPU Scene3D IBL',
        }),
        expect.objectContaining({
          name: 'WgpuColorLutTextureCache',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGPU color-LUT texture cache',
        }),
        expect.objectContaining({
          name: 'WgpuMeshUpload',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGPU mesh upload',
        }),
        expect.objectContaining({
          name: 'Viewport',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free viewport',
        }),
        expect.objectContaining({
          name: 'TauriApi',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Tauri API',
        }),
        expect.objectContaining({
          name: 'StrokeStyle',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free stroke style',
        }),
        expect.objectContaining({
          name: 'Socket',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free socket',
        }),
        expect.objectContaining({
          name: 'Physics2DDebugGeometry',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free physics debug geometry',
        }),
        expect.objectContaining({
          name: 'Modifier',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free modifier',
        }),
        expect.objectContaining({
          name: 'StatechartState',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free statechart state',
        }),
        expect.objectContaining({
          name: 'SpriteData',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free sprite data',
        }),
        expect.objectContaining({
          name: 'Skeleton2DIkConstraint',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free skeleton IK constraint',
        }),
        expect.objectContaining({
          name: 'Physics2DRayResult',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free physics ray result',
        }),
        expect.objectContaining({
          name: 'PbrExtension',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free PBR extension',
        }),
        expect.objectContaining({
          name: 'NativeTextRuntime',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free native text runtime',
        }),
        expect.objectContaining({
          name: 'MatcapMaterial',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free matcap material',
        }),
        expect.objectContaining({
          name: 'LottieShapePath',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Lottie shape path',
        }),
        expect.objectContaining({
          name: 'GlRenderEffectApplicationExplanation',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL render-effect explanation',
        }),
        expect.objectContaining({
          name: 'FlexLayoutItemStyle',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free flex item style',
        }),
        expect.objectContaining({
          name: 'BitmapFingerprint',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free bitmap fingerprint',
        }),
        expect.objectContaining({
          name: 'AccessibilityState',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free accessibility state',
        }),
        expect.objectContaining({
          name: 'WgpuVideoTextureEntry',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGPU video texture entry',
        }),
        expect.objectContaining({
          name: 'WgpuShapeMesh',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGPU shape mesh',
        }),
        expect.objectContaining({
          name: 'WgpuScene3DDrawEntry',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGPU Scene3D draw entry',
        }),
        expect.objectContaining({
          name: 'VignetteEffect',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free vignette effect',
        }),
        expect.objectContaining({
          name: 'CanvasRenderEffectPipeline',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Canvas render-effect pipeline',
        }),
        expect.objectContaining({
          name: 'ColorAdjustmentRuntime',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free color-adjustment runtime',
        }),
        expect.objectContaining({
          name: 'GlScene3DDrawEntry',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL Scene3D draw entry',
        }),
        expect.objectContaining({
          name: 'ShadedMaterialOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free shaded-material options',
        }),
        expect.objectContaining({
          name: 'RenderEffectPadding',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free render-effect padding',
        }),
      ]),
    );
    expect(reviewedTypedStructDirectAdditions).toEqual([
      {
        declarationFingerprint: 'sha256:6de1c57a64f9d839dba96b69bcdd8cae0ca18580cc13f425ae6cb9ec9f68c4b8',
        id: '@flighthq/types:interface#BitmapRegion',
        purpose: 'reviewed escape-free bitmap region',
      },
      {
        declarationFingerprint: 'sha256:a8e896f65206af608a3efc10cf9109d10714c30269d79b02c5077a81879c8d3b',
        id: '@flighthq/types:interface#GlRenderStateRuntime',
        purpose: 'reviewed escape-free WebGL render-state runtime',
      },
      {
        declarationFingerprint: 'sha256:a2bc23bace382a83f246f14c86f03121db15a25a1f479edc706a6b00dfe0475d',
        id: '@flighthq/types:interface#WgpuRenderStateRuntime',
        purpose: 'reviewed escape-free WebGPU render-state runtime',
      },
      {
        declarationFingerprint: 'sha256:77ecafe9197f64a9e574cc139335cb7aff72a45c8b5efecc742d943d53a49e3a',
        id: '@flighthq/types:interface#CanvasRenderTarget',
        purpose: 'reviewed escape-free Canvas render target',
      },
      {
        declarationFingerprint: 'sha256:a70ee9ffbaf0c1d0fd73965076d56028db2ce78f1dda4c9006e35974be0fe408',
        id: '@flighthq/types:interface#GlRenderTarget',
        purpose: 'reviewed escape-free WebGL render target',
      },
      {
        declarationFingerprint: 'sha256:c7a251ae0b80f4ecea3ed0c7bf9d8f702baff476a5465d16cdf5e1d1bc427111',
        id: '@flighthq/types:interface#RenderTarget',
        purpose: 'reviewed escape-free portable render target',
      },
      {
        declarationFingerprint: 'sha256:f976a3e923d48395ab6e3ab23594c3979ad742550499012816e1aa6fada959dc',
        id: '@flighthq/types:interface#RenderTargetDescriptor',
        purpose: 'reviewed escape-free render-target descriptor',
      },
      {
        declarationFingerprint: 'sha256:d5e40ef824804481c0135b2b35a6745fc6d84140f5c43fb4644b3a8af5a12b45',
        id: '@flighthq/types:interface#WgpuRenderTarget',
        purpose: 'reviewed escape-free WebGPU render target',
      },
      {
        declarationFingerprint: 'sha256:25a70f58982f05188d38a15abf985c669e653dddf4bebfad31755210bff86a5b',
        id: '@flighthq/types:interface#TextLayoutGroup',
        purpose: 'reviewed escape-free text-layout group',
      },
      {
        declarationFingerprint: 'sha256:0775b68e5d326626f79c05fb51f2b81d734453706da315289b1c8772c0062d88',
        id: '@flighthq/types:interface#TextLayoutResult',
        purpose: 'reviewed escape-free text-layout result',
      },
      {
        declarationFingerprint: 'sha256:fa82e08e1863fcc75e3ed9619dc8585f19565703bc84971444398c1df93031eb',
        id: '@flighthq/types:interface#RichTextData',
        purpose: 'reviewed escape-free rich-text data',
      },
      {
        declarationFingerprint: 'sha256:ede1beea3240687757ee8455992b246d3497476a47de43d9b8e5d02d8b73abe7',
        id: '@flighthq/types:interface#RichText',
        purpose: 'reviewed escape-free rich text',
      },
      {
        declarationFingerprint: 'sha256:048d186739d8bfe34b14f636cd57fb89116b401bab1347c3742749f04b2838be',
        id: '@flighthq/types:interface#RichTextContent',
        purpose: 'reviewed escape-free rich-text content',
      },
      {
        declarationFingerprint: 'sha256:a28a94c95326e5405d33feda957ea8ee57399e1266dae9f9d7c88218d945a9fe',
        id: '@flighthq/types:interface#Physics2DWorld',
        purpose: 'reviewed escape-free physics world',
      },
      {
        declarationFingerprint: 'sha256:3a89f0bc11ff1e68096dbb0499ae192d3abb1cde4962391c47b614b9bc6d616f',
        id: '@flighthq/types:interface#Physics2DContact',
        purpose: 'reviewed escape-free physics contact',
      },
      {
        declarationFingerprint: 'sha256:29644de2ca268e7003a01a34866533f5279d4bc6da62b2de3f2f702b1a5eaaab',
        id: '@flighthq/types:interface#Physics2DSolverConfig',
        purpose: 'reviewed escape-free physics solver config',
      },
      {
        declarationFingerprint: 'sha256:61a33980287691a1d2e1de55628a62dc799ca4529f6c87a035683162ee3e72ce',
        id: '@flighthq/types:interface#Physics2DCollider',
        purpose: 'reviewed escape-free physics collider',
      },
      {
        declarationFingerprint: 'sha256:f73b90fe6168b429bc413bda84ebe794b96c7345e5da4ab65264c4241d9995b2',
        id: '@flighthq/types:interface#ClipRegion',
        purpose: 'reviewed escape-free clip region',
      },
      {
        declarationFingerprint: 'sha256:56f73a3c7c106c2cfc9affd8f47d517ff6685a4a5bad8083b9d9fe76d3fcf217',
        id: '@flighthq/types:interface#CanvasRenderEffectContext',
        purpose: 'reviewed escape-free Canvas render-effect context',
      },
      {
        declarationFingerprint: 'sha256:fdc15a042a1a80053691e6e5e9fdcec40ccc068adde5e22e51ae98764f1520a6',
        id: '@flighthq/types:interface#GlRenderEffectContext',
        purpose: 'reviewed escape-free WebGL render-effect context',
      },
      {
        declarationFingerprint: 'sha256:fd9b6f3f63bcd3f4391e10fb091fcb7444196085bcefc1d301287787dfe3a3e2',
        id: '@flighthq/types:interface#WgpuRenderEffectContext',
        purpose: 'reviewed escape-free WebGPU render-effect context',
      },
      {
        declarationFingerprint: 'sha256:4699244536c3feef6f3f739f35112b90e8382c1ec3ae5327e196af03c3d85b16',
        id: '@flighthq/types:interface#GlScene3DRuntime',
        purpose: 'reviewed escape-free WebGL scene runtime',
      },
      {
        declarationFingerprint: 'sha256:4dab30bcdbb8075f68a1edc7500087cb2a72c3202eb16b2ffb6f143591215923',
        id: '@flighthq/types:interface#WgpuScene3DRuntime',
        purpose: 'reviewed escape-free WebGPU scene runtime',
      },
      {
        declarationFingerprint: 'sha256:c5ddb66c3aa664642f434b204e28cd767990fb68dccd61d95ddce1217b271f85',
        id: '@flighthq/types:interface#QuadBatchData',
        purpose: 'reviewed escape-free quad batch data',
      },
      {
        declarationFingerprint: 'sha256:02c299290855d11a256afa1f89ac05ea04f2bd5c9cfbd95f9b8f313c8291d5dc',
        id: '@flighthq/types:interface#CanvasShapeDrawState',
        purpose: 'reviewed escape-free Canvas shape draw state',
      },
      {
        declarationFingerprint: 'sha256:8917d122db3e102ae4d684a953b0aace8b57597d4e4b6b10c66a3af8f3b19094',
        id: '@flighthq/types:interface#Scene3DDocument',
        purpose: 'reviewed escape-free Scene3D document',
      },
      {
        declarationFingerprint: 'sha256:b5f317c10fcee34f5c8ab37de7d06314754e9bcc0fb48124146a562f9117cb5f',
        id: '@flighthq/types:interface#OrbitCameraController',
        purpose: 'reviewed escape-free orbit camera controller',
      },
      {
        declarationFingerprint: 'sha256:9252f9146b93933f51443521632f05794eed7f39a6e8059a7ae12d86167e16ac',
        id: '@flighthq/types:interface#RiveCoreObject',
        purpose: 'reviewed escape-free Rive core object',
      },
      {
        declarationFingerprint: 'sha256:a3e8b0a6c23713f4d8e46cae1937cd775b8337ee098c6b36ecb5a906b35a8a44',
        id: '@flighthq/types:interface#AnimationTrack',
        purpose: 'reviewed escape-free animation track',
      },
      {
        declarationFingerprint: 'sha256:6903b4fa8a509237f7ff329abd18f797ff86f22fe5115266aa530240bdad1859',
        id: '@flighthq/types:interface#Tween',
        purpose: 'reviewed escape-free tween state',
      },
      {
        declarationFingerprint: 'sha256:bdb2b9a80b19b26d3da6a39bd5641971941622f788716891ce6a299c97dd325b',
        id: '@flighthq/types:interface#AnimationChannel',
        purpose: 'reviewed escape-free animation channel',
      },
      {
        declarationFingerprint: 'sha256:7737db1e82e8f1bf7d07b4ebd21bd0f18946927b22ba3b0216c93a3d85241c6d',
        id: '@flighthq/types:interface#AnimationPlayer',
        purpose: 'reviewed escape-free animation player',
      },
      {
        declarationFingerprint: 'sha256:aaf49d1e409fd3c60824a648cf8edd8e53ad11411923a0b5ab74c34be4da89a6',
        id: '@flighthq/types:interface#Timeline',
        purpose: 'reviewed escape-free timeline state',
      },
      {
        declarationFingerprint: 'sha256:44aafe6b8ad37be7a692fd5ee540a56e2b48628f12925791a38e546b9f3e5987',
        id: '@flighthq/types:interface#RiveArtboardGraph',
        purpose: 'reviewed escape-free Rive artboard graph',
      },
      {
        declarationFingerprint: 'sha256:33b8ffeb2ffb3539affbe33b3665d4d8946af0486ae79f57a1ac3062d75617c5',
        id: '@flighthq/types:interface#RiveProperty',
        purpose: 'reviewed escape-free Rive property',
      },
      {
        declarationFingerprint: 'sha256:c9e4515a60d200d26308fa2a4d98c62ed83db38350d9545f6ef795ad4dd0edc7',
        id: '@flighthq/types:interface#RivePathRecord',
        purpose: 'reviewed escape-free Rive path record',
      },
      {
        declarationFingerprint: 'sha256:e705df1c2ba082092310edcd7d71a4484273ee3cfd2d09ba1a644921b06566be',
        id: '@flighthq/types:interface#RiveFileAsset',
        purpose: 'reviewed escape-free Rive file asset',
      },
      {
        declarationFingerprint: 'sha256:c4246370c176d4205f5e869630515aeaf9affbf5d1a594c50a0c8d82e0d371d0',
        id: '@flighthq/types:interface#RiveDocumentImportResult',
        purpose: 'reviewed escape-free Rive document import result',
      },
      {
        declarationFingerprint: 'sha256:b8c71131b48fb802bf08fc22ab717a50b460ecb96f29c0d9615fb6319184d31c',
        id: '@flighthq/types:interface#TextInputState',
        purpose: 'reviewed escape-free text-input state',
      },
      {
        declarationFingerprint: 'sha256:31ee934c70dc671de1fcf994c61ced46730f1b001bc666d65bcd71240f0101a3',
        id: '@flighthq/types:interface#KeyboardEventData',
        purpose: 'reviewed escape-free keyboard event data',
      },
      {
        declarationFingerprint: 'sha256:acb1ec5a0825eae2955aba234b8019647bfebc6c07a57b04c1ffb62af7cc98bd',
        id: '@flighthq/types:interface#InputManager',
        purpose: 'reviewed escape-free input manager',
      },
      {
        declarationFingerprint: 'sha256:68dfff739dbd1da432c2948738490cd16465a4b8165214a711165ef6c7f52acc',
        id: '@flighthq/types:interface#InputPointerData',
        purpose: 'reviewed escape-free input pointer data',
      },
      {
        declarationFingerprint: 'sha256:771b0863ccf5de23a04937149a041c06baa00c7f1fdc857df31c9928a0953f0d',
        id: '@flighthq/types:interface#InputKeyboardData',
        purpose: 'reviewed escape-free input keyboard data',
      },
      {
        declarationFingerprint: 'sha256:44fad9b5706a5df98cf0027a1603a725ef02feb70f58928c41700c9d56bd5de4',
        id: '@flighthq/types:interface#StandardPbrMaterialProperties',
        purpose: 'reviewed escape-free standard PBR material properties',
      },
      {
        declarationFingerprint: 'sha256:f012cad97304e5b646c0f93382b021b88256802524f06f31c7c237f4904454f6',
        id: '@flighthq/types:interface#ShadedMaterial',
        purpose: 'reviewed escape-free shaded material',
      },
      {
        declarationFingerprint: 'sha256:0507be5be486444087da384892e2e4cc933f986b96fce65dc8cae8f6304a069f',
        id: '@flighthq/types:interface#SpecularGlossinessPbrMaterial',
        purpose: 'reviewed escape-free specular-glossiness PBR material',
      },
      {
        declarationFingerprint: 'sha256:64e437f2e5a0160d04bbc20e190fa582580cd6407ac92088e8b008e8c8d4aa9b',
        id: '@flighthq/types:interface#PhongMaterial',
        purpose: 'reviewed escape-free Phong material',
      },
      {
        declarationFingerprint: 'sha256:1ad81b90e44e80bd524b045aac2be2bc6a069473749743258d893377441f0194',
        id: '@flighthq/types:interface#BlinnPhongMaterial',
        purpose: 'reviewed escape-free Blinn-Phong material',
      },
      {
        declarationFingerprint: 'sha256:b27249a8cd675e578a7deb9802c0ebbf90928b97b9000fc7b47a1165ad38f419',
        id: '@flighthq/types:interface#RenderStateRuntime',
        purpose: 'reviewed escape-free render-state runtime',
      },
      {
        declarationFingerprint: 'sha256:f0d40c25ffe0591e6ea74f08dd22ec61859b14d72b08dbf54d2b642fd68e5cb9',
        id: '@flighthq/types:interface#RenderProxy',
        purpose: 'reviewed escape-free render proxy',
      },
      {
        declarationFingerprint: 'sha256:2fc485e81e3cee06d54afe96b9e729f984503a325de3c0fa9fb2eb466f01ed3b',
        id: '@flighthq/types:interface#DomRenderStateRuntime',
        purpose: 'reviewed escape-free DOM render-state runtime',
      },
      {
        declarationFingerprint: 'sha256:f1ab7ec236b568f33e9b66eec91b29426d97375591f5060c6a649f9439d5d083',
        id: '@flighthq/types:interface#ResolvedRenderTargetDescriptor',
        purpose: 'reviewed escape-free resolved render-target descriptor',
      },
      {
        declarationFingerprint: 'sha256:79df9e528430e381be2d9b7b98b30e5784f18d6f57932943ae5ef00f34daaed5',
        id: '@flighthq/types:interface#Scene3DRenderProxy',
        purpose: 'reviewed escape-free Scene3D render proxy',
      },
      {
        declarationFingerprint: 'sha256:9857efd596ffe6f3cd132688ed2264e350ad971fb56bbc6ab0c21e04bf59a1f8',
        id: '@flighthq/types:interface#Velocity2D',
        purpose: 'reviewed escape-free 2D velocity',
      },
      {
        declarationFingerprint: 'sha256:daa52fb2451e8e19fe83cb7d0c336ee6443aa4ce7bed4067a08e12c74835c407',
        id: '@flighthq/types:interface#CollisionTimeOfImpact',
        purpose: 'reviewed escape-free collision time of impact',
      },
      {
        declarationFingerprint: 'sha256:4db498c8ac68087d55e1489e845ae6c93c321ef8e63c84e2848d03acd2aca853',
        id: '@flighthq/types:interface#Physics2DMassData',
        purpose: 'reviewed escape-free physics mass data',
      },
      {
        declarationFingerprint: 'sha256:3faf5007f7f5fcf04ee37c934cfbdb99659201a81ab1a767ebe1727536076405',
        id: '@flighthq/types:interface#CollisionManifold',
        purpose: 'reviewed escape-free collision manifold',
      },
      {
        declarationFingerprint: 'sha256:6dfc439ab4ce910b63d1d1a0ad76eaa0bb434fe5a5a17db5b8af67a6ca5332ef',
        id: '@flighthq/types:interface#CollisionContactManifold',
        purpose: 'reviewed escape-free collision contact manifold',
      },
      {
        declarationFingerprint: 'sha256:7047314bcb16b3ebe3626298c25398572a66360e5e872133b33a21415c4e2e88',
        id: '@flighthq/types:interface#Physics2DPrismaticJoint',
        purpose: 'reviewed escape-free physics prismatic joint',
      },
      {
        declarationFingerprint: 'sha256:a169f1f5512b2bf35e7587690e6ef634681878d267026c2ab03a3dafd517ed12',
        id: '@flighthq/types:interface#Physics2DPulleyJoint',
        purpose: 'reviewed escape-free physics pulley joint',
      },
      {
        declarationFingerprint: 'sha256:7a2a5c30028a7ebe59854b90338612f99a484da9d05bd71eaaa7de448bbb2b7c',
        id: '@flighthq/types:interface#Physics2DGearJoint',
        purpose: 'reviewed escape-free physics gear joint',
      },
      {
        declarationFingerprint: 'sha256:70b93b46c79fe10b1370af8bf3c98f46e51df7082eb8bc53ed35ae7680de8fd4',
        id: '@flighthq/types:interface#Physics2DWheelJoint',
        purpose: 'reviewed escape-free physics wheel joint',
      },
      {
        declarationFingerprint: 'sha256:f45bdd8ec8f78d20609e6978dab03cf413f0cd31305168d66313d7eb273099a1',
        id: '@flighthq/types:interface#Physics2DRevoluteJoint',
        purpose: 'reviewed escape-free physics revolute joint',
      },
      {
        declarationFingerprint: 'sha256:4c5c7df2276c0ba36c720adc9c2f10a21508a54448a1f67dcb2587581d3ca5c2',
        id: '@flighthq/types:interface#Skeleton2D',
        purpose: 'reviewed escape-free 2D skeleton',
      },
      {
        declarationFingerprint: 'sha256:31eb650a945dc248ce93c5e25b2cd1fdf0f3ad4576ca1b19dc10acd77f99e5e7',
        id: '@flighthq/types:interface#Skeleton3D',
        purpose: 'reviewed escape-free 3D skeleton',
      },
      {
        declarationFingerprint: 'sha256:736e4bf4ec95bf4937e25e58fcd614373bff9626fbfd4431685b2b025bd9f67c',
        id: '@flighthq/types:interface#MeshSkinBindPose',
        purpose: 'reviewed escape-free mesh skin bind pose',
      },
      {
        declarationFingerprint: 'sha256:5b923770aadf08c459c517186e28a6ca1a7ffcabd35a29d8d97ca742aa95996c',
        id: '@flighthq/types:interface#SkinAttachment2D',
        purpose: 'reviewed escape-free 2D skin attachment',
      },
      {
        declarationFingerprint: 'sha256:3831dc7503c830297819df165667142b18595623fb5320f616539f5dbb48b1bd',
        id: '@flighthq/types:interface#Skeleton2DPathConstraint',
        purpose: 'reviewed escape-free 2D skeleton path constraint',
      },
      {
        declarationFingerprint: 'sha256:fe1c6f9a7092aaf16cd71f41a141a74e9ef235eec04fa6afa7ea048439b63fde',
        id: '@flighthq/types:interface#AnimationStateMachine',
        purpose: 'reviewed escape-free animation state machine',
      },
      {
        declarationFingerprint: 'sha256:592fba8ca0e3d4c3037c94796a1c24af517eaa4337ffd428ae340ca7f8c0bf29',
        id: '@flighthq/types:interface#AnimationCrossfade',
        purpose: 'reviewed escape-free animation crossfade',
      },
      {
        declarationFingerprint: 'sha256:cfe564914537b7c6b1f9b16a293e7a1b8c28d3d743a920f8054b8d1304fa39b7',
        id: '@flighthq/types:interface#Statechart',
        purpose: 'reviewed escape-free statechart',
      },
      {
        declarationFingerprint: 'sha256:99282de81a9db1f080a9e203455b3ae137163ab87e2b608b70d3defc5949fa86',
        id: '@flighthq/types:interface#StatechartInstance',
        purpose: 'reviewed escape-free statechart instance',
      },
      {
        declarationFingerprint: 'sha256:ee1a1c67324b9c8fb812541fc64da6edb13d01144a9bfd7289e47a151cefd755',
        id: '@flighthq/types:interface#StatechartTransition',
        purpose: 'reviewed escape-free statechart transition',
      },
      {
        declarationFingerprint: 'sha256:8ec3670c4d9138ddabd2f31f44282b7a63234e7b28abfeaaa79fb46b60386ac4',
        id: '@flighthq/types:interface#TextureContainer',
        purpose: 'reviewed escape-free texture container',
      },
      {
        declarationFingerprint: 'sha256:22098c0143137cb3701785c749ec0e7c11469f7bd572f09d9e5d884bb1662a2a',
        id: '@flighthq/types:interface#TextureContainerLevel',
        purpose: 'reviewed escape-free texture container level',
      },
      {
        declarationFingerprint: 'sha256:0bd021297d7eda8245da83f5d68c7bc9458594d019d2b8fe0106ff9cc338fcb0',
        id: '@flighthq/types:interface#RenderTexture',
        purpose: 'reviewed escape-free render texture',
      },
      {
        declarationFingerprint: 'sha256:a7fa638af0c9e6325e55fe5a74a9b9a6af64eb5bcba6dd5adbd45c089c1d8836',
        id: '@flighthq/types:interface#GlRenderTextureEntry',
        purpose: 'reviewed escape-free WebGL render-texture entry',
      },
      {
        declarationFingerprint: 'sha256:a5243909363d6d37ff704867c3df7bbceae877b0eac612d58b88af423e746572',
        id: '@flighthq/types:interface#WgpuRenderTextureEntry',
        purpose: 'reviewed escape-free WebGPU render-texture entry',
      },
      {
        declarationFingerprint: 'sha256:1f1a4f489fe6eccd17a7e7fa5d1f588954faea0ba5f647040ad72640141a377c',
        id: '@flighthq/types:interface#Scene3DHit',
        purpose: 'reviewed escape-free Scene3D hit',
      },
      {
        declarationFingerprint: 'sha256:0fc37ebc201db4f24d23947b080f8715be1cf57f2413f81e5ba05b274d3134d4',
        id: '@flighthq/types:interface#CollisionRaycastHit',
        purpose: 'reviewed escape-free collision raycast hit',
      },
      {
        declarationFingerprint: 'sha256:9094ab4baa041a3973eb2471908827999044b59892109431e6ce46c93436a483',
        id: '@flighthq/types:interface#Physics2DRayHit',
        purpose: 'reviewed escape-free physics ray hit',
      },
      {
        declarationFingerprint: 'sha256:0972cae3f54ba0ec4d0e1833767f11ab476578197e212b0dcb988637891ba0fa',
        id: '@flighthq/types:interface#CollisionContactPoint',
        purpose: 'reviewed escape-free collision contact point',
      },
      {
        declarationFingerprint: 'sha256:735f8f6b33ae4a5c730243d8695d7b81baf6bb3777af4dd6effa7492f291b1b1',
        id: '@flighthq/types:interface#VelocitySample',
        purpose: 'reviewed escape-free velocity sample',
      },
      {
        declarationFingerprint: 'sha256:8366b22af6581d9b3d860205d8d5245e7bb40398342313332aa3c7da2e420aa1',
        id: '@flighthq/types:interface#RichTextRuntime',
        purpose: 'reviewed escape-free rich-text runtime',
      },
      {
        declarationFingerprint: 'sha256:d94505d93827743797a2c6724668ebc639ebab71ea755df4bdc4fee0ae7971e5',
        id: '@flighthq/types:interface#TextLabelData',
        purpose: 'reviewed escape-free text-label data',
      },
      {
        declarationFingerprint: 'sha256:d2115dbabb239acfc6288812800f14051a58f3141d2cff821ddea724af316ba8',
        id: '@flighthq/types:interface#BitmapTextPage',
        purpose: 'reviewed escape-free bitmap-text page',
      },
      {
        declarationFingerprint: 'sha256:f0658231700532c1d5a1d52e203c8f41115d1e60669fa2fd9a98bad1aacb4416',
        id: '@flighthq/types:interface#TextLabel',
        purpose: 'reviewed escape-free text label',
      },
      {
        declarationFingerprint: 'sha256:8b0fb4643dfec361ac4d51caaaef5867c9e05efc2ef364fddcf328380fc07ac5',
        id: '@flighthq/types:interface#ShapedRun',
        purpose: 'reviewed escape-free shaped run',
      },
      {
        declarationFingerprint: 'sha256:2b31b5b9c65d277eeeeb327a2e2fcb4452dfbc7cb3117508c5bafbdd7d741f34',
        id: '@flighthq/types:interface#Shape',
        purpose: 'reviewed escape-free shape',
      },
      {
        declarationFingerprint: 'sha256:c4d9690d18b21e3fb00e7e50dfe7d187fcf5b4135c164263b85824d18571e746',
        id: '@flighthq/types:interface#Scale9Shape',
        purpose: 'reviewed escape-free scale-9 shape',
      },
      {
        declarationFingerprint: 'sha256:c3677e835bf0844d2df50b06f28145cdeebf386b4c0f584f8296158a84558aa4',
        id: '@flighthq/types:interface#ShapeData',
        purpose: 'reviewed escape-free shape data',
      },
      {
        declarationFingerprint: 'sha256:4d520958150bb3f2e2c1beebf07d580ca947c836dca809a68b34ea205143529c',
        id: '@flighthq/types:interface#MorphShape',
        purpose: 'reviewed escape-free morph shape',
      },
      {
        declarationFingerprint: 'sha256:3c3ad2fcb2496c19ddf40cd7c5c6c20d5ddde69456be127c40066abd544b30e8',
        id: '@flighthq/types:interface#MorphShapeData',
        purpose: 'reviewed escape-free morph-shape data',
      },
      {
        declarationFingerprint: 'sha256:25ac84d4effc1f1758fbadbe9e06fde068ef3b4b8fc74721bf1940acb3180003',
        id: '@flighthq/types:interface#GlMeshProgram',
        purpose: 'reviewed escape-free WebGL mesh program',
      },
      {
        declarationFingerprint: 'sha256:b20947fd9184317c7f029c89d578561437626fa7ec03965c083784006319e1ec',
        id: '@flighthq/types:interface#GlClassicProgram',
        purpose: 'reviewed escape-free WebGL classic program',
      },
      {
        declarationFingerprint: 'sha256:ea701c770e76279c2c1ed247f4e08cca4953589f33791d7e9964c4acbb38c508',
        id: '@flighthq/types:interface#GlMeshUpload',
        purpose: 'reviewed escape-free WebGL mesh upload',
      },
      {
        declarationFingerprint: 'sha256:92ef9e960d48ccadf9d840f3dc2863ee3f64c2089ea081effa5c2ecaa9d1a079',
        id: '@flighthq/types:interface#GlParticleShader',
        purpose: 'reviewed escape-free WebGL particle shader',
      },
      {
        declarationFingerprint: 'sha256:6abe913b84fc928aa0aa4bbda552125819c350c09026b795363905f3f0410759',
        id: '@flighthq/types:interface#GlPbrProgram',
        purpose: 'reviewed escape-free WebGL PBR program',
      },
      {
        declarationFingerprint: 'sha256:58ebca8ad2f0cc535020211940a5e2321e01db30093d6a5988a44efb977cdd04',
        id: '@flighthq/types:interface#BevelEffect',
        purpose: 'reviewed escape-free bevel effect',
      },
      {
        declarationFingerprint: 'sha256:6848511a980718c7082335e4839bb93de5a772a3a8714f0f1a720796bc2ca393',
        id: '@flighthq/types:interface#DropShadowEffect',
        purpose: 'reviewed escape-free drop-shadow effect',
      },
      {
        declarationFingerprint: 'sha256:76e90209baf6a5c6e39df6d8af199bc57e81f9812b2b9e6407b949000f3c38ab',
        id: '@flighthq/types:interface#GradientBevelEffect',
        purpose: 'reviewed escape-free gradient-bevel effect',
      },
      {
        declarationFingerprint: 'sha256:7183cdb448684c12099a20b237230f777d4b82a482de25e13c022cf188053e0b',
        id: '@flighthq/types:interface#InnerShadowEffect',
        purpose: 'reviewed escape-free inner-shadow effect',
      },
      {
        declarationFingerprint: 'sha256:ec80a0d48ff955f3df6a19bad5643e1e576384f33c4c3ba299bd5e14d2253eff',
        id: '@flighthq/types:interface#OuterGlowEffect',
        purpose: 'reviewed escape-free outer-glow effect',
      },
      {
        declarationFingerprint: 'sha256:c5eed51656152d130c5bd39967bda2fdec09e68c7666b1789992993ec2ac9b57',
        id: '@flighthq/types:interface#GlScissorRect',
        purpose: 'reviewed escape-free WebGL scissor rectangle',
      },
      {
        declarationFingerprint: 'sha256:34dfe22efbf1d2f4e16ac9a93fc703b8a54032d9ea689c75c5e61549dc76a3c9',
        id: '@flighthq/types:interface#WgpuScissorRect',
        purpose: 'reviewed escape-free WebGPU scissor rectangle',
      },
      {
        declarationFingerprint: 'sha256:be617f3f8f9f830df9da893eee28eeb9740c2f15a2e4462f451c6d3191c0ca99',
        id: '@flighthq/types:interface#CanvasRenderStateRuntime',
        purpose: 'reviewed escape-free Canvas render-state runtime',
      },
      {
        declarationFingerprint: 'sha256:ea1b2223d50df5b640545106804895714d12cb99a7838ab014ed2e3816d701a9',
        id: '@flighthq/types:interface#GlRenderEffectPipeline',
        purpose: 'reviewed escape-free WebGL render-effect pipeline',
      },
      {
        declarationFingerprint: 'sha256:a7039648e61c44e19af4213680f60efe61ad6452ffc0b16c420927d0116c0349',
        id: '@flighthq/types:interface#WgpuRenderEffectPipeline',
        purpose: 'reviewed escape-free WebGPU render-effect pipeline',
      },
      {
        declarationFingerprint: 'sha256:6e37b62b50d5b48500aae731c8675045a8e2096273488315f353d68df10c6e8c',
        id: '@flighthq/types:interface#VertexDisplaceModifier',
        purpose: 'reviewed escape-free vertex-displacement modifier',
      },
      {
        declarationFingerprint: 'sha256:ffe9e013055090ced18c33db3dc23624189ee7c37ad89167e5ab4878f51bab9c',
        id: '@flighthq/types:interface#AnimatedNormalModifier',
        purpose: 'reviewed escape-free animated-normal modifier',
      },
      {
        declarationFingerprint: 'sha256:1a8dbcef5fd253b0791b984f6f9941f1d377d618e6cffc3d199824faebde91f9',
        id: '@flighthq/types:interface#EmissiveModifier',
        purpose: 'reviewed escape-free emissive modifier',
      },
      {
        declarationFingerprint: 'sha256:0ddef0017cb9786dae56bccef54787182c9ff0a31489f925f8ac31bcf61731a4',
        id: '@flighthq/types:interface#FogModifier',
        purpose: 'reviewed escape-free fog modifier',
      },
      {
        declarationFingerprint: 'sha256:b4447f68b4d80c5a7fc46ba4dfaedef76ea959785551545cb6cb49842f894138',
        id: '@flighthq/types:interface#DissolveModifier',
        purpose: 'reviewed escape-free dissolve modifier',
      },
      {
        declarationFingerprint: 'sha256:97105d620e4afa392d6e85532e6fc45385b94f13a602cd4b6770281e27eded33',
        id: '@flighthq/types:interface#AnimatedNormalModifierOptions',
        purpose: 'reviewed escape-free animated-normal modifier options',
      },
      {
        declarationFingerprint: 'sha256:877e24a08322880ba5714aa0116f27f119d937d476e1922d21694b5d5bb03c36',
        id: '@flighthq/types:interface#DissolveModifierOptions',
        purpose: 'reviewed escape-free dissolve modifier options',
      },
      {
        declarationFingerprint: 'sha256:3178f9ac65a057f14a0f654c4380a341fe76b57d865832040c2b7e3f3a6bf79c',
        id: '@flighthq/types:interface#EmissiveModifierOptions',
        purpose: 'reviewed escape-free emissive modifier options',
      },
      {
        declarationFingerprint: 'sha256:a140958cfd3e17565cf886b6ec71cf5ad24d26795dee44c1741d2a55287472e4',
        id: '@flighthq/types:interface#FogModifierOptions',
        purpose: 'reviewed escape-free fog modifier options',
      },
      {
        declarationFingerprint: 'sha256:4831daeafb37b213acd119f1b235c36ab8b0c9539d23d2958379792fa2a48f98',
        id: '@flighthq/types:interface#VertexDisplaceModifierOptions',
        purpose: 'reviewed escape-free vertex-displacement modifier options',
      },
      {
        declarationFingerprint: 'sha256:862e11110d27a2fae69cc108968d79f6b75dfb8719760df193c2f036752e10e6',
        id: '@flighthq/types:interface#InteractionManager',
        purpose: 'reviewed escape-free interaction manager',
      },
      {
        declarationFingerprint: 'sha256:216dce6f67c2e578771f19028b5b6df661f640ecf89609634c0f5537d28f30e7',
        id: '@flighthq/types:interface#InputState',
        purpose: 'reviewed escape-free input state',
      },
      {
        declarationFingerprint: 'sha256:a21b27d68119da759ea2e963106f0280744090b06621aba95150c883bc80fb23',
        id: '@flighthq/types:interface#PointerEventData',
        purpose: 'reviewed escape-free pointer event data',
      },
      {
        declarationFingerprint: 'sha256:1a80443ef92b7e9bc7ac2dd87e10ced28db13469f8d2df5f858aa35a5a986944',
        id: '@flighthq/types:interface#NodeInteractionState',
        purpose: 'reviewed escape-free node interaction state',
      },
      {
        declarationFingerprint: 'sha256:6c846f5649ce0d7c3800c0bf309bebafb3e4bc1f67b56d12bc9e2acce5c9d262',
        id: '@flighthq/types:interface#InteractionPointerState',
        purpose: 'reviewed escape-free interaction pointer state',
      },
      {
        declarationFingerprint: 'sha256:24320b83bfd5874be2f12540bc06d3b54f1f6d2611c4c7652b684095843ad56b',
        id: '@flighthq/types:interface#TilemapData',
        purpose: 'reviewed escape-free tilemap data',
      },
      {
        declarationFingerprint: 'sha256:d8b583fd4ac5be7b2e225eb093440e762ac18bd63947531c364b379b941aa409',
        id: '@flighthq/types:interface#TiledObject',
        purpose: 'reviewed escape-free Tiled object',
      },
      {
        declarationFingerprint: 'sha256:06addefb47009dd6ad6194898472603ce2dd11f327687e4795e7ed1fa107eb9f',
        id: '@flighthq/types:interface#TiledMap',
        purpose: 'reviewed escape-free Tiled map',
      },
      {
        declarationFingerprint: 'sha256:baaa0bd15356d53492d909bb22e420d309e45d951731b185dddd284a4bfe42b1',
        id: '@flighthq/types:interface#Tilemap',
        purpose: 'reviewed escape-free tilemap',
      },
      {
        declarationFingerprint: 'sha256:f7f49b1c5693d038732edcc23550418414f1b7bca0501669372a4e0d11f212eb',
        id: '@flighthq/types:interface#TiledTileset',
        purpose: 'reviewed escape-free Tiled tileset',
      },
      {
        declarationFingerprint: 'sha256:f20a5988a4c187a5ab14cafc6d9e22031b7dd254f8a130eb362beafdafe8fe92',
        id: '@flighthq/types:interface#TiledTilesetTile',
        purpose: 'reviewed escape-free Tiled tileset tile',
      },
      {
        declarationFingerprint: 'sha256:240a78b98b30601002a1f3bfa62be8394bd11f25ff22d798f7c1ac216d01ba3b',
        id: '@flighthq/types:interface#TiledTilesetRef',
        purpose: 'reviewed escape-free Tiled tileset reference',
      },
      {
        declarationFingerprint: 'sha256:e8f81c64bbdac1c2bfe70e245844a7449d62dfc1978d2a4d1340dd6f30e16109',
        id: '@flighthq/types:interface#TiledProperty',
        purpose: 'reviewed escape-free Tiled property',
      },
      {
        declarationFingerprint: 'sha256:d03a4ec13a0db461ca7538d2c409c6030e58dc2cc2c5929fe64061d173a5d9a8',
        id: '@flighthq/types:interface#TiledTilesetTileFrame',
        purpose: 'reviewed escape-free Tiled tileset tile frame',
      },
      {
        declarationFingerprint: 'sha256:24fed34412a32b4a4ec7eb62f8605d0827907769a2c1dc6e641efe2b97808e4e',
        id: '@flighthq/types:interface#TiledGid',
        purpose: 'reviewed escape-free Tiled gid',
      },
      {
        declarationFingerprint: 'sha256:d2e5d9acdd16ea800ff99d016bd6da24a62a410c5efa12e734e9e2649f325602',
        id: '@flighthq/types:interface#TransmissionVolumePbrExtension',
        purpose: 'reviewed escape-free transmission-volume PBR extension',
      },
      {
        declarationFingerprint: 'sha256:80ae6c1261768bbe66d4437552c4c7ceee1a7368799bb3190699c0895be3795f',
        id: '@flighthq/types:interface#ClearcoatPbrExtension',
        purpose: 'reviewed escape-free clearcoat PBR extension',
      },
      {
        declarationFingerprint: 'sha256:09159cce23f7c1cbfcbebf1a7c91d65bc7d23a53e199ec7f509d05b93f7bfa9b',
        id: '@flighthq/types:interface#IridescencePbrExtension',
        purpose: 'reviewed escape-free iridescence PBR extension',
      },
      {
        declarationFingerprint: 'sha256:58c73e60264700f5dcd433febea3ead0758d3e062b8cc68c0b35586324582a31',
        id: '@flighthq/types:interface#WrappedDiffusePbrExtension',
        purpose: 'reviewed escape-free wrapped-diffuse PBR extension',
      },
      {
        declarationFingerprint: 'sha256:d028a204fbe4ebdd31bb85d2c26f6c239b3c7a8aff40c22b4f9548c15c012e5f',
        id: '@flighthq/types:interface#SpecularPbrExtension',
        purpose: 'reviewed escape-free specular PBR extension',
      },
      {
        declarationFingerprint: 'sha256:5ec7dbb9000ec57efedee41fc853a74e39bf8f7b229155779007e9579f9407b7',
        id: '@flighthq/types:interface#FlyCameraController',
        purpose: 'reviewed escape-free fly camera controller',
      },
      {
        declarationFingerprint: 'sha256:64e20d991efa3af3e4d7ea369d2494215759ec7b97040fd164291220452e4e3d',
        id: '@flighthq/types:interface#ParticleEmitter3D',
        purpose: 'reviewed escape-free 3D particle emitter',
      },
      {
        declarationFingerprint: 'sha256:84a5032e10a50972215d64097cb31bfcac6f4cb43baf03f7b651b7d72bc25864',
        id: '@flighthq/types:interface#SocketRuntime',
        purpose: 'reviewed escape-free socket runtime',
      },
      {
        declarationFingerprint: 'sha256:ac6d71dd26dbaa9e99b676efee5645d01bc94b02da6199e93c5b674e43b77e92',
        id: '@flighthq/types:interface#NodeOrderList',
        purpose: 'reviewed escape-free node order list',
      },
      {
        declarationFingerprint: 'sha256:0d4dd4a03fe6768f388ff1d15945725582f976354ad7cc1f2df54aa966166763',
        id: '@flighthq/types:interface#PackableRectangle',
        purpose: 'reviewed escape-free packable rectangle',
      },
      {
        declarationFingerprint: 'sha256:e6e95909db1bea0affe3369897e0632ad4f455db8211a678d4d881f01d456a9b',
        id: '@flighthq/types:interface#Clock',
        purpose: 'reviewed escape-free clock',
      },
      {
        declarationFingerprint: 'sha256:9ea86c550f139c78db1e1e5f74465c7b5551ae23b4269fa6f342fabefe27471a',
        id: '@flighthq/types:interface#AreaLight',
        purpose: 'reviewed escape-free area light',
      },
      {
        declarationFingerprint: 'sha256:ed2e39801a2b33fe8f903c119ababfaab77850d0f8749741e2e3a9a1a71ea5c2',
        id: '@flighthq/types:interface#LottieLayer',
        purpose: 'reviewed escape-free Lottie layer',
      },
      {
        declarationFingerprint: 'sha256:5aa6485af78fca2067f0720a27927c1e85e3c6481c8299dbe80ef2b73dd1d259',
        id: '@flighthq/types:interface#MovieClipData',
        purpose: 'reviewed escape-free movie-clip data',
      },
      {
        declarationFingerprint: 'sha256:66cba4b02f27ccf2d392f2ce60c410aaa294ac9c3344dcc6fe3c41e474430059',
        id: '@flighthq/types:interface#PathMesh',
        purpose: 'reviewed escape-free path mesh',
      },
      {
        declarationFingerprint: 'sha256:75623596e21f7fa8bdb96972f77d790d3fa4eaa91a9a238efce37fd2c87cff25',
        id: '@flighthq/types:interface#StandardPbrMaterial',
        purpose: 'reviewed escape-free standard PBR material',
      },
      {
        declarationFingerprint: 'sha256:8b127f9af8b5c5c504869aff4b368a55038b3df041dcc04c392bae8aed708e39',
        id: '@flighthq/types:interface#TextSelectionRectangle',
        purpose: 'reviewed escape-free text selection rectangle',
      },
      {
        declarationFingerprint: 'sha256:dcb64afdbc4634db6a19bccd9b239a2d46272227ea1bcc4547bb450d8e95b91f',
        id: '@flighthq/types:interface#LayoutNode',
        purpose: 'reviewed escape-free layout node',
      },
      {
        declarationFingerprint: 'sha256:6221bdcad721b47767821e41a9d71f9e1d6766b425ec20a430f0ee643b761ab6',
        id: '@flighthq/types:interface#Scene3DKindUsage',
        purpose: 'reviewed escape-free Scene3D kind usage',
      },
      {
        declarationFingerprint: 'sha256:e1aa5f7158dac8804df2b8cb02d88eb0ef695dcb84db0bb0804dc6a2fd8c1b1f',
        id: '@flighthq/types:interface#TextureSource',
        purpose: 'reviewed escape-free texture source',
      },
      {
        declarationFingerprint: 'sha256:f54a1342b6e20a6877114b8a64de522c5dd432abe1db067f1d64cf56da7987a5',
        id: '@flighthq/types:interface#ElectronApi',
        purpose: 'reviewed escape-free Electron API',
      },
      {
        declarationFingerprint: 'sha256:6f76f76885ae46aa509bb7badc6b7ce66f4ef96ca95fa1871bc7f24685c71df1',
        id: '@flighthq/types:interface#GlLitProgram',
        purpose: 'reviewed escape-free WebGL lit program',
      },
      {
        declarationFingerprint: 'sha256:7990b91753d362be27f86906395a45a7c19aae3b4001e7681dc88f6e8ca61d39',
        id: '@flighthq/types:interface#LayoutState',
        purpose: 'reviewed escape-free layout state',
      },
      {
        declarationFingerprint: 'sha256:09771ab81a3d8b9386f482e7a9b0d8e8bb9af7a1576510bd07568070f8cde3bd',
        id: '@flighthq/types:interface#MeshGeometryRuntime',
        purpose: 'reviewed escape-free mesh geometry runtime',
      },
      {
        declarationFingerprint: 'sha256:899537b7d2a81e3752bb2c1fc97d945d22692f778fc4c242542ee226df28fef4',
        id: '@flighthq/types:interface#QuadBatch',
        purpose: 'reviewed escape-free quad batch',
      },
      {
        declarationFingerprint: 'sha256:1b5f5456e620e7bbc76f4a5bb4aaa3a55f80a9ebc786347d9c288be4f77737da',
        id: '@flighthq/types:interface#TextInputOptions',
        purpose: 'reviewed escape-free text input options',
      },
      {
        declarationFingerprint: 'sha256:bc1bd8fee72d0e49ff3cc90a7cac976377ee624b49519bc78226652352e72d31',
        id: '@flighthq/types:interface#LottieDocument',
        purpose: 'reviewed escape-free Lottie document',
      },
      {
        declarationFingerprint: 'sha256:4f02cd2e116d99ce5b2af2c64e24ae32f9498383db2c912a82071baa98a33344',
        id: '@flighthq/types:interface#Scene3DLightBlock',
        purpose: 'reviewed escape-free Scene3D light block',
      },
      {
        declarationFingerprint: 'sha256:200f20a7b556d1c3a1c4880fde41f35aba28c6d41c03cf434ac1c39eb00f2275',
        id: '@flighthq/types:interface#GodRaysEffect',
        purpose: 'reviewed escape-free god-rays effect',
      },
      {
        declarationFingerprint: 'sha256:5e7d4b75130bdda69787b9c27ae02b9270e3c086f66849b6aecb864787210fd6',
        id: '@flighthq/types:interface#NativeTextData',
        purpose: 'reviewed escape-free native-text data',
      },
      {
        declarationFingerprint: 'sha256:1a88b32407ec4e866c81dacc567c24c15122e2fea6540aaa7a45532c65af6067',
        id: '@flighthq/types:interface#Scene3DResourceResolverRuntime',
        purpose: 'reviewed escape-free Scene3D resource-resolver runtime',
      },
      {
        declarationFingerprint: 'sha256:095a13e1c53d9734759a7a788007e08fb2ad1347e36f353e48ba2e6b730c44ae',
        id: '@flighthq/types:interface#GradientGlowEffect',
        purpose: 'reviewed escape-free gradient-glow effect',
      },
      {
        declarationFingerprint: 'sha256:63846610c575904018effbac806a0440c7a5eeadaee51b0834ffb45fbf7fd44b',
        id: '@flighthq/types:interface#BitmapTextData',
        purpose: 'reviewed escape-free bitmap-text data',
      },
      {
        declarationFingerprint: 'sha256:f9514088a8f644f0471aa1aa5a043041544b3296d2aa7a9994fa8dfa8ae9e7b8',
        id: '@flighthq/types:interface#WgpuShapeMeshBuffers',
        purpose: 'reviewed escape-free WebGPU shape-mesh buffers',
      },
      {
        declarationFingerprint: 'sha256:9ed61dc079468b2826972b414de55e5725087be3219b8eea7e4ddf7716ade10c',
        id: '@flighthq/types:interface#Scene3DDocumentNode',
        purpose: 'reviewed escape-free Scene3D document node',
      },
      {
        declarationFingerprint: 'sha256:5aa15d73a4d69dda6f617f278e05d90700a178b45474ec248e36e1a1139373ae',
        id: '@flighthq/types:interface#DirectionalLight',
        purpose: 'reviewed escape-free directional light',
      },
      {
        declarationFingerprint: 'sha256:ad4981fb8d04361edb9e7e958ecc08e26e759a9934fb583584440ff0296f4f4a',
        id: '@flighthq/types:interface#SurfaceMaterial',
        purpose: 'reviewed escape-free surface material',
      },
      {
        declarationFingerprint: 'sha256:f5a125c830ec328239b3260b832a2d808ac31e1e0735b68100978abf63435bde',
        id: '@flighthq/types:interface#MorphShapeGradientEndpoint',
        purpose: 'reviewed escape-free morph-shape gradient endpoint',
      },
      {
        declarationFingerprint: 'sha256:f864004b87b82bcca917b1ed1e00b1b83f330263d4f5c0fce6e3b8e5bc6dafa8',
        id: '@flighthq/types:interface#SpatialIndexingNotice',
        purpose: 'reviewed escape-free spatial-indexing notice',
      },
      {
        declarationFingerprint: 'sha256:7e7d78288f957c8b5498a6e851712cd492da91353a70049a43a65b9d5abf86ed',
        id: '@flighthq/types:interface#Scene3DRenderList',
        purpose: 'reviewed escape-free Scene3D render list',
      },
      {
        declarationFingerprint: 'sha256:496c05d2679fb7bd28f2ea80ce1ab909b2ad53eda73c19b1e1933cddacf8d877',
        id: '@flighthq/types:interface#Scene2DKindUsage',
        purpose: 'reviewed escape-free Scene2D kind usage',
      },
      {
        declarationFingerprint: 'sha256:9ed90b466cc7a1b9394a8de4672a9f73333fe5c5379a26853f9d55533c9c0c5d',
        id: '@flighthq/types:interface#MotionPath',
        purpose: 'reviewed escape-free motion path',
      },
      {
        declarationFingerprint: 'sha256:8301e42403f279dd1544f2cfcd45fc89ac70c49225e2760882b1c6511f02657c',
        id: '@flighthq/types:interface#InnerGlowEffect',
        purpose: 'reviewed escape-free inner-glow effect',
      },
      {
        declarationFingerprint: 'sha256:a8c84d5a06304f2943dc6a1e7a3b630148b0705730330018dafd7e117b112f4c',
        id: '@flighthq/types:interface#CustomShaderMaterial',
        purpose: 'reviewed escape-free custom-shader material',
      },
      {
        declarationFingerprint: 'sha256:53fc44a6b4cbdc1dd54aadc12a3aad4c2a60b93fc5c864af2dade3c3b650f72e',
        id: '@flighthq/types:interface#CreateRenderTextureOptions',
        purpose: 'reviewed escape-free render-texture options',
      },
      {
        declarationFingerprint: 'sha256:f9b45a313f2614d54a52c279b9226bcc9c33ba384453b6dca79b0f5c1338c57d',
        id: '@flighthq/types:interface#AbcInstruction',
        purpose: 'reviewed escape-free ABC instruction',
      },
      {
        declarationFingerprint: 'sha256:a530f1994767f0978b42abb9d0e32a5edfe81713180e2a2a86d594892bcf840c',
        id: '@flighthq/types:interface#AbcMultiname',
        purpose: 'reviewed escape-free ABC multiname',
      },
      {
        declarationFingerprint: 'sha256:7b66783df68ff872ad421ae76f22aa65a493abbe89363e655126bd5366f4c849',
        id: '@flighthq/types:interface#AnimationRootMotionExtractor',
        purpose: 'reviewed escape-free animation root-motion extractor',
      },
      {
        declarationFingerprint: 'sha256:bccbdac026b10fed057b1fa96baa3cd24ad093dbb672ca4714c9f87985872894',
        id: '@flighthq/types:interface#CanvasRenderTexturePool',
        purpose: 'reviewed escape-free Canvas render-texture pool',
      },
      {
        declarationFingerprint: 'sha256:386ab33911ac9d6cfda1c53f076da7a8c79abd8f042508f5e4210185d9eacd08',
        id: '@flighthq/types:interface#LogEntry',
        purpose: 'reviewed escape-free log entry',
      },
      {
        declarationFingerprint: 'sha256:1c993883bad8944cd6da043e55da9b6014270eb750d3a0fbc840c9cd107de2b0',
        id: '@flighthq/types:interface#ToonMaterial',
        purpose: 'reviewed escape-free toon material',
      },
      {
        declarationFingerprint: 'sha256:eb909d67f4277244c321489bb2cd34a8cb5cc3de0bfade3146aa4c09fb4b27f0',
        id: '@flighthq/types:interface#UnlitMaterial',
        purpose: 'reviewed escape-free unlit material',
      },
      {
        declarationFingerprint: 'sha256:bde9a7679c21f48a1a9479c7bfcd6dd049d9255cee1c88feaecc530e7fbfb5fc',
        id: '@flighthq/types:interface#ConvolutionEffect',
        purpose: 'reviewed escape-free convolution effect',
      },
      {
        declarationFingerprint: 'sha256:69801d3535461cd2a982b945b3099efbf3129d5d5152ed829a5e5ab849141c58',
        id: '@flighthq/types:interface#EmissiveMaterial',
        purpose: 'reviewed escape-free emissive material',
      },
      {
        declarationFingerprint: 'sha256:58e62708f57df42b10b3295377b9c994df1e99c342cdf02e0df5ddac41df98f5',
        id: '@flighthq/types:interface#TransformInherit2D',
        purpose: 'reviewed escape-free 2D transform inheritance',
      },
      {
        declarationFingerprint: 'sha256:637bd4055c49e86f20dea391c47c2538d7a327645111fedb7d9904eed914daa0',
        id: '@flighthq/types:interface#ExtendedPbrMaterial',
        purpose: 'reviewed escape-free extended PBR material',
      },
      {
        declarationFingerprint: 'sha256:d8b13478c32c050f10440ebe6dc0b1ef9dc33cabde40a9fddb26ab0bd47a1001',
        id: '@flighthq/types:interface#TweenPropertyDetail',
        purpose: 'reviewed escape-free tween property detail',
      },
      {
        declarationFingerprint: 'sha256:51198c8940045753f24c81e72c79afa768610dc0b4ad580609876711fd13e77f',
        id: '@flighthq/types:interface#WgpuScene3DShadow',
        purpose: 'reviewed escape-free WebGPU Scene3D shadow',
      },
      {
        declarationFingerprint: 'sha256:8d540d5dae11b58c4b1f2a43bfcc742aca87555ad5a5c5249f1800ebbc2a9bed',
        id: '@flighthq/types:interface#AnimationClipEvent',
        purpose: 'reviewed escape-free animation clip event',
      },
      {
        declarationFingerprint: 'sha256:d4322da6611176c711c3b0f309d5c790a93ca34a66a751617060eefc278bf549',
        id: '@flighthq/types:interface#BitmapTextRuntime',
        purpose: 'reviewed escape-free bitmap-text runtime',
      },
      {
        declarationFingerprint: 'sha256:eb2748590ab9d2f4190685a0e0023dcfbc58ae2fcfa924a12b27f0b5867c273c',
        id: '@flighthq/types:interface#GlColorScaleBiasInstancedShader',
        purpose: 'reviewed escape-free WebGL color scale-bias instanced shader',
      },
      {
        declarationFingerprint: 'sha256:2d0f9e3abe6c598f4700dd1dcfca1aa30bc6c7bff1a53bd74e2cbd646349b722',
        id: '@flighthq/types:interface#LambertMaterial',
        purpose: 'reviewed escape-free Lambert material',
      },
      {
        declarationFingerprint: 'sha256:f1dbf387c55015f5b44dbbe97535bcc3591c79fc936b1381180dc3f65b3da869',
        id: '@flighthq/types:interface#OrbitCameraControllerOptions',
        purpose: 'reviewed escape-free orbit-camera options',
      },
      {
        declarationFingerprint: 'sha256:8bf31aa0b755de712e58851fc670470e5a3027dcca83854e402fb31490ea8a01',
        id: '@flighthq/types:interface#WgpuShapeRendererData',
        purpose: 'reviewed escape-free WebGPU shape-renderer data',
      },
      {
        declarationFingerprint: 'sha256:054fcb71f93fcdf8767c5be098eb1a25dc1facb91452f1a2fdc42cb37556318c',
        id: '@flighthq/types:interface#AnimationBlendTree',
        purpose: 'reviewed escape-free animation blend tree',
      },
      {
        declarationFingerprint: 'sha256:8a2e66fa93ab54d34cd36ee7491780879d7f4f726c841200a9a168247ce7152c',
        id: '@flighthq/types:interface#WgpuRenderTexturePool',
        purpose: 'reviewed escape-free WebGPU render-texture pool',
      },
      {
        declarationFingerprint: 'sha256:c9cc45d02ce4d7e948c85172e4a590ef8bacca7dc268920a688dea44c772f41c',
        id: '@flighthq/types:interface#GlRenderTexturePool',
        purpose: 'reviewed escape-free WebGL render-texture pool',
      },
      {
        declarationFingerprint: 'sha256:ea78be613c04f60f3a3dfb6529793a1e50fdf4a6d96d13246cb23de6e92ccdab',
        id: '@flighthq/types:interface#GlShadedProgram',
        purpose: 'reviewed escape-free WebGL shaded program',
      },
      {
        declarationFingerprint: 'sha256:ae1793eea0c5323a3989c3b263cf25e9d862080401783b4209e04677c86e3f65',
        id: '@flighthq/types:interface#GlShapeRendererData',
        purpose: 'reviewed escape-free WebGL shape-renderer data',
      },
      {
        declarationFingerprint: 'sha256:0362fdf0b62095db70100964f8f2d188eae552a2513337d7a145648619fd9486',
        id: '@flighthq/types:interface#WgpuQuadBatchWriterBufferSlot',
        purpose: 'reviewed escape-free WebGPU quad-batch buffer slot',
      },
      {
        declarationFingerprint: 'sha256:a6d76855c342cc710304eff6c3034f16a3853a751ee704d881de32f764d3c047',
        id: '@flighthq/types:interface#TextShaperBackend',
        purpose: 'reviewed escape-free text-shaper backend',
      },
      {
        declarationFingerprint: 'sha256:1f2c95acb12ba7582d7411b09d418cf403f8a1cfd850662b185e4c344cecdd40',
        id: '@flighthq/types:interface#TextLayoutParams',
        purpose: 'reviewed escape-free text-layout parameters',
      },
      {
        declarationFingerprint: 'sha256:0d37ab980102fd6c29da9c33e3ff69749aa8fc3fceed59fed424bf51c17c3ca4',
        id: '@flighthq/types:interface#SoftKeyboardInfo',
        purpose: 'reviewed escape-free soft-keyboard info',
      },
      {
        declarationFingerprint: 'sha256:490d3123a670ddb1d15cd2cfd73da271b75c8e85cc7f1fe029718b2079329e7a',
        id: '@flighthq/types:interface#LayoutTree',
        purpose: 'reviewed escape-free layout tree',
      },
      {
        declarationFingerprint: 'sha256:d7459435d0471453f1a562948d6fa63807ac8d1381c6ea5874b6f8299eb1b9c2',
        id: '@flighthq/types:interface#Sprite',
        purpose: 'reviewed escape-free sprite',
      },
      {
        declarationFingerprint: 'sha256:58f7997452442a5677046c8e565087775f4d75bd6d45ce4f5803c92de3077eb7',
        id: '@flighthq/types:interface#AnimationSampleAccumulator',
        purpose: 'reviewed escape-free animation sample accumulator',
      },
      {
        declarationFingerprint: 'sha256:49e24f8195b6c8f54063c8f1b16b6b8a574fdb6d28380516aa63a0b33289fd55',
        id: '@flighthq/types:interface#AnimationLayer',
        purpose: 'reviewed escape-free animation layer',
      },
      {
        declarationFingerprint: 'sha256:999935ff446a57ea847011240330cc4caeb5afe76fd06fddb5d816cbb15d5dfa',
        id: '@flighthq/types:interface#AnimationBlendTreeInput',
        purpose: 'reviewed escape-free animation blend-tree input',
      },
      {
        declarationFingerprint: 'sha256:62295208edb23fbfba568845028bd4aed2cdbe7599cc9c81a4c03ce484fccc8d',
        id: '@flighthq/types:interface#LottieKeyframe',
        purpose: 'reviewed escape-free Lottie keyframe',
      },
      {
        declarationFingerprint: 'sha256:7ed2b99d05ce368354bb2e67e4a595cb4863a929c6755cfcdab9902470c39959',
        id: '@flighthq/types:interface#Skeleton2DTransformConstraint',
        purpose: 'reviewed escape-free Skeleton2D transform constraint',
      },
      {
        declarationFingerprint: 'sha256:74c21326aec08c9f2f2e16e6d64e3300ccdb3fc5423d6bf9b2c1145b6def2a8a',
        id: '@flighthq/types:interface#AbcTrait',
        purpose: 'reviewed escape-free ABC trait',
      },
      {
        declarationFingerprint: 'sha256:347be02a5d0ddbe8c51171c42f0c6fbb5fd7c9a9ce57332156da8e12fbaf5722',
        id: '@flighthq/types:interface#CanvasRenderTextureEntry',
        purpose: 'reviewed escape-free Canvas render-texture entry',
      },
      {
        declarationFingerprint: 'sha256:be5f077631722591406184fa65398af48876fb3c6e8c82d3a3da4cc352c434e7',
        id: '@flighthq/types:interface#NetRequest',
        purpose: 'reviewed escape-free net request',
      },
      {
        declarationFingerprint: 'sha256:035a1014631528e9aa9210a89a65d69e398026d9db46131285a1c87aeb2fda16',
        id: '@flighthq/types:interface#SheenPbrExtension',
        purpose: 'reviewed escape-free sheen PBR extension',
      },
      {
        declarationFingerprint: 'sha256:1e5fb34fc3ff6df55e616cadbad7a3c2ea2027a5237f3e2d660b7d33d745305e',
        id: '@flighthq/types:interface#ThreeDsLight',
        purpose: 'reviewed escape-free 3DS light',
      },
      {
        declarationFingerprint: 'sha256:2c9de49060c0caec1db063676aaff00b42a147d1453a572eebc9698cad804d96',
        id: '@flighthq/types:interface#WgpuScene3DIbl',
        purpose: 'reviewed escape-free WebGPU Scene3D IBL',
      },
      {
        declarationFingerprint: 'sha256:c598e5b3c7afe9486b6cb5b0debd608414646860ec136cf35c318b86b51ff1b1',
        id: '@flighthq/types:interface#WgpuColorLutTextureCache',
        purpose: 'reviewed escape-free WebGPU color-LUT texture cache',
      },
      {
        declarationFingerprint: 'sha256:5ded44df647ee2b8cd70a1c2fac7b6afdecf21d4ad1b059efa421212360c4c4d',
        id: '@flighthq/types:interface#WgpuMeshUpload',
        purpose: 'reviewed escape-free WebGPU mesh upload',
      },
      {
        declarationFingerprint: 'sha256:4469ff9b065da72e57da440a045907f3e0002cad6c1040d298d4bdd03720003d',
        id: '@flighthq/types:interface#Viewport',
        purpose: 'reviewed escape-free viewport',
      },
      {
        declarationFingerprint: 'sha256:44bcb932c0e88a332e71c3d85aecb67af098ff10aec46f4e8e656678fcc4e7e7',
        id: '@flighthq/types:interface#TauriApi',
        purpose: 'reviewed escape-free Tauri API',
      },
      {
        declarationFingerprint: 'sha256:ec1ee1a0110859d8a51e6fef7add0524114a018e5ce4bb456d8f0d1707c3d278',
        id: '@flighthq/types:interface#StrokeStyle',
        purpose: 'reviewed escape-free stroke style',
      },
      {
        declarationFingerprint: 'sha256:b86755aef7f21cdbdf6fe0f9b1b5da2c48bbf6395e26a4466d9c7d69a153cfe6',
        id: '@flighthq/types:interface#Socket',
        purpose: 'reviewed escape-free socket',
      },
      {
        declarationFingerprint: 'sha256:1f8b276b48280ac169c1a2fd693088116385bea498fd8d80746091ed5a42729a',
        id: '@flighthq/types:interface#Physics2DDebugGeometry',
        purpose: 'reviewed escape-free physics debug geometry',
      },
      {
        declarationFingerprint: 'sha256:796da4037514e9798f33666107ab84b3e7a4d1656e87ad4354d2508e6a10dd38',
        id: '@flighthq/types:interface#Modifier',
        purpose: 'reviewed escape-free modifier',
      },
      {
        declarationFingerprint: 'sha256:decf7fe340c128e6a1f153a139af5a745851388a7c362e4660bb156def070f05',
        id: '@flighthq/types:interface#StatechartState',
        purpose: 'reviewed escape-free statechart state',
      },
      {
        declarationFingerprint: 'sha256:0a192307a03c8542e477cc8b64353c3b5de08c6cde73bec89ca39694c56943b4',
        id: '@flighthq/types:interface#SpriteData',
        purpose: 'reviewed escape-free sprite data',
      },
      {
        declarationFingerprint: 'sha256:3c0fee3ae382d16ba3cd1c9fc452d167718acbfee3812c43c4f7942f1c656469',
        id: '@flighthq/types:interface#Skeleton2DIkConstraint',
        purpose: 'reviewed escape-free skeleton IK constraint',
      },
      {
        declarationFingerprint: 'sha256:dcd5f590b1f242ab29d2afd97181bbc6e1cfeb173ca544ef716f2f321130ebd8',
        id: '@flighthq/types:interface#Physics2DRayResult',
        purpose: 'reviewed escape-free physics ray result',
      },
      {
        declarationFingerprint: 'sha256:fe60b141f962890b1a4304cac98fcfa9c5c81e8831ac27ee0fa728625f276013',
        id: '@flighthq/types:interface#PbrExtension',
        purpose: 'reviewed escape-free PBR extension',
      },
      {
        declarationFingerprint: 'sha256:a31ec0e776fefad7311e898f90401d6895f78c493ec129f623f6512f580a2a18',
        id: '@flighthq/types:interface#NativeTextRuntime',
        purpose: 'reviewed escape-free native text runtime',
      },
      {
        declarationFingerprint: 'sha256:8b4467696325ff69cdbe538077a2259a9bd9f7007df08e3a49a165bf267de4e8',
        id: '@flighthq/types:interface#MatcapMaterial',
        purpose: 'reviewed escape-free matcap material',
      },
      {
        declarationFingerprint: 'sha256:ce922284ec58aebfe1997133806dde22e7754a0ac71bda478870249b6a938926',
        id: '@flighthq/types:interface#LottieShapePath',
        purpose: 'reviewed escape-free Lottie shape path',
      },
      {
        declarationFingerprint: 'sha256:15e53d2503c0496748f20338561a40b594875934b0cd93d9ea5cf712d7b4bbe4',
        id: '@flighthq/types:interface#GlRenderEffectApplicationExplanation',
        purpose: 'reviewed escape-free WebGL render-effect explanation',
      },
      {
        declarationFingerprint: 'sha256:5f78f38895f44208c6b9992633e77f10e15cd707cbd579918a67aa00701daa26',
        id: '@flighthq/types:interface#FlexLayoutItemStyle',
        purpose: 'reviewed escape-free flex item style',
      },
      {
        declarationFingerprint: 'sha256:50b5f1e7cf212f956951395d3caf98ac9fefcaaf982b3bc77b182c1b6ae2ecde',
        id: '@flighthq/types:interface#BitmapFingerprint',
        purpose: 'reviewed escape-free bitmap fingerprint',
      },
      {
        declarationFingerprint: 'sha256:1f209c4f7d90191f56d8beee8987f5e88fd79dde04fdb55d2259a7ed5061c8e7',
        id: '@flighthq/types:interface#AccessibilityState',
        purpose: 'reviewed escape-free accessibility state',
      },
      {
        declarationFingerprint: 'sha256:da0f630196cf440da445e080b9729ba42c3fb30d7645cfdfac1fd789e78c86cd',
        id: '@flighthq/types:interface#WgpuVideoTextureEntry',
        purpose: 'reviewed escape-free WebGPU video texture entry',
      },
      {
        declarationFingerprint: 'sha256:a7bf1ac799a7a857268d1b05541826b1ec19e7b1e3f640d485b2a77dfdf793aa',
        id: '@flighthq/types:interface#WgpuShapeMesh',
        purpose: 'reviewed escape-free WebGPU shape mesh',
      },
      {
        declarationFingerprint: 'sha256:b4d8b046bbaf156d910380ce47f8e5eb9bdcdfac78735a793394fc189153168d',
        id: '@flighthq/types:interface#WgpuScene3DDrawEntry',
        purpose: 'reviewed escape-free WebGPU Scene3D draw entry',
      },
      {
        declarationFingerprint: 'sha256:f41110d11eecb97849c3d3c836b7c17e79b58e5fa50dc2486f4e58366b4f3fbe',
        id: '@flighthq/types:interface#VignetteEffect',
        purpose: 'reviewed escape-free vignette effect',
      },
      {
        declarationFingerprint: 'sha256:f0f92129b058ee5f05cd9b1720f2d60db4a348e6e4db086f74a9ceb8718520af',
        id: '@flighthq/types:interface#CanvasRenderEffectPipeline',
        purpose: 'reviewed escape-free Canvas render-effect pipeline',
      },
      {
        declarationFingerprint: 'sha256:6af421b0c66043312dce3e7248225fbb43b0df05efaec7f3186f4f863b33dd93',
        id: '@flighthq/types:interface#ColorAdjustmentRuntime',
        purpose: 'reviewed escape-free color-adjustment runtime',
      },
      {
        declarationFingerprint: 'sha256:4e3a499b44071f2a83f997c36a83d95dd82c343b59af35480c3a88fa1d605add',
        id: '@flighthq/types:interface#GlScene3DDrawEntry',
        purpose: 'reviewed escape-free WebGL Scene3D draw entry',
      },
      {
        declarationFingerprint: 'sha256:3f073246cc4c3bc480231452c128a1e7887dfcbe84ace00b3cabb63a2b5a4f9b',
        id: '@flighthq/types:interface#ShadedMaterialOptions',
        purpose: 'reviewed escape-free shaded-material options',
      },
      {
        declarationFingerprint: 'sha256:b38af857c9f1ced8a0efa777f84273e301f75abdceb65a7180dd2eef56c4802d',
        id: '@flighthq/types:interface#RenderEffectPadding',
        purpose: 'reviewed escape-free render-effect padding',
      },
    ]);
    expect(byId.get('@flighthq/types:interface#ColorScaleBias')?.migration).toEqual({
      baselineId: '@flighthq/types:interface#ColorTransform',
      status: 'renamed',
    });
    expect(byId.get('@flighthq/types:interface#Bitmap')?.migration).toEqual({
      baselineId: '@flighthq/types:interface#Surface',
      status: 'renamed',
    });
    expect(byId.get('@flighthq/types:type#Texture')?.migration).toEqual({
      baselineId: '@flighthq/types:interface#Texture',
      status: 'kind-changed',
    });
    expect(discovery.migration.removed).toEqual([
      {
        baselineId: '@flighthq/types:interface#ImageResource',
        successorIds: [
          '@flighthq/types:interface#Bitmap',
          '@flighthq/types:interface#CompressedImage',
          '@flighthq/types:interface#Image',
        ],
      },
      {
        baselineId: '@flighthq/types:interface#Tileset',
        successorIds: ['@flighthq/types:interface#TiledTileset', '@flighthq/types:interface#TilemapData'],
      },
      {
        baselineId: '@flighthq/types:interface#VideoTexture',
        successorIds: [
          '@flighthq/types:interface#Image',
          '@flighthq/types:interface#VideoResource',
          '@flighthq/types:type#Texture',
        ],
      },
    ]);
    expect(byId.has('@flighthq/types:interface#ImageResource')).toBe(false);
    expect(byId.has('@flighthq/types:interface#Tileset')).toBe(false);
    expect(byId.has('@flighthq/types:interface#VideoTexture')).toBe(false);
  });
});

describe('typed struct analysis', () => {
  it('emits and constructs an allowlisted struct-init class only on the cpp branch', () => {
    const candidate: TypedStructCandidate = {
      emission: 'direct',
      name: 'Camera2D',
      packageName: '@flighthq/types',
      purpose: 'cpp class pilot fixture',
      source: 'upstream/packages/types/src/Camera2D.ts',
    };
    const result = lowerFixture(
      `
        export interface Camera2D {
          rotation: number;
          viewportHeight: number;
          viewportWidth: number;
          x: number;
          y: number;
          zoom: number;
        }
        export function createCamera2D(): Camera2D {
          return { rotation: 0, viewportHeight: 480, viewportWidth: 640, x: 12, y: 34, zoom: 2 };
        }
      `,
      candidate,
    );
    const declaration = result.lowered.declarations.find(
      (item) => item.kind === 'type' && item.name === candidate.name,
    );
    if (!declaration || declaration.kind !== 'type') throw new Error('Expected Camera2D fixture type');
    declaration.cppStructInitSchemaId = candidateId(candidate);
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      haxePackage: 'flighthq.types',
      imports: [],
      name: 'CameraPilot',
      packageName: '@flighthq/types',
    });

    expect(result.lowered.diagnostics).toEqual([]);
    expect(output).toContain('#if cpp\n@:structInit\nclass Camera2D {');
    expect(output).toContain(
      'public function new(rotation:Float, viewportHeight:Float, viewportWidth:Float, x:Float, y:Float, zoom:Float):Void',
    );
    expect(output).toContain('return { rotation: 0.0, viewportHeight: 480.0, viewportWidth: 640.0, x: 12.0');
    expect(output).not.toContain('return cast { rotation: 0.0');

    const fixtureDirectory = path.resolve('build/haxe-cpp-struct-init-fixture');
    const packageDirectory = path.join(fixtureDirectory, 'flighthq', 'types');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(path.join(packageDirectory, 'CameraPilot.hx'), output.replace('#if cpp', '#if (cpp || eval)'));
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        class Main {
          static function main() {
            final camera = flighthq.types.CameraPilot.createCamera2D();
            if (!Std.isOfType(camera, flighthq.types.CameraPilot.Camera2D)) throw 'not a class';
            if (camera.x != 12 || camera.viewportHeight != 480 || camera.zoom != 2) throw 'bad fields';
          }
        }
      `,
    );
    expect(() =>
      execFileSync('node', ['tools/haxe.mjs', '-cp', fixtureDirectory, '-cp', 'src', '--main', 'Main', '--interp'], {
        cwd: path.resolve('.'),
        stdio: 'pipe',
      }),
    ).not.toThrow();

    writeFileSync(
      path.join(fixtureDirectory, 'JsMain.hx'),
      `
        class JsMain {
          static function main() {
            final camera = flighthq.types.CameraPilot.createCamera2D();
            if (camera.x != 12 || camera.viewportHeight != 480 || camera.zoom != 2) throw 'bad fields';
          }
        }
      `,
    );
    const candidateJavaScript = path.join(fixtureDirectory, 'candidate.cjs');
    const baselineJavaScript = path.join(fixtureDirectory, 'baseline.cjs');
    writeFileSync(path.join(packageDirectory, 'CameraPilot.hx'), output);
    execFileSync(
      'node',
      ['tools/haxe.mjs', '-cp', fixtureDirectory, '-cp', 'src', '--main', 'JsMain', '--js', candidateJavaScript],
      { cwd: path.resolve('.'), stdio: 'pipe' },
    );
    writeFileSync(path.join(packageDirectory, 'CameraPilot.hx'), output.replace('return {', 'return cast {'));
    execFileSync(
      'node',
      ['tools/haxe.mjs', '-cp', fixtureDirectory, '-cp', 'src', '--main', 'JsMain', '--js', baselineJavaScript],
      { cwd: path.resolve('.'), stdio: 'pipe' },
    );
    expect(readFileSync(candidateJavaScript)).toEqual(readFileSync(baselineJavaScript));
  });

  it('censuses class migration flows and observability by canonical schema', () => {
    const audit = classAuditFixture(
      `
        export interface A { x: number; y?: number; }
        export interface B { x: number; y?: number; }
        declare const dynamicValue: any;
        const inferred = { x: 3 };
        const key = 'x' as const;
        const plain: A = { x: 1 };
        const spread: A = { ...plain };
        const computed: A = { [key]: 4 };
        const typedB: B = { x: 2 };
        const cross: A = typedB;
        const dynamicIngress: A = dynamicValue;
        const anonymous: A = inferred;
        const incompatibleUnion: A | { label: string } = { x: 9 };
        export function exercise(value: A): A {
          Object.keys(value);
          JSON.stringify(value);
          const copy = { ...value };
          const { x, ...rest } = value;
          return value;
        }
      `,
      `
        import type { A } from '../src/Vector2';
        declare function expect(value: unknown): { toStrictEqual(expected: unknown): void };
        declare const value: A;
        const fixture: A = { x: 1 };
        Object.keys(value);
        JSON.stringify(value);
        const copy = { ...value };
        const { x, ...rest } = value;
        value.constructor;
        expect(value).toStrictEqual({ x: 1 });
      `,
    );
    const a = audit.schemas.find((schema) => schema.name === 'A');
    const b = audit.schemas.find((schema) => schema.name === 'B');

    expect(a).toMatchObject({
      bridge: { inputSignatures: 1, outputSignatures: 1 },
      construction: {
        computedObjectLiterals: 1,
        objectLiterals: 3,
        objectLiteralsOmittingOptionalFields: 2,
        objectLiteralsWithSpread: 1,
        plainObjectLiterals: 1,
        testObjectLiterals: 1,
      },
      fields: { optional: 1, requiredUndefined: 0, total: 2 },
      migration: {
        mechanicallyCompatible: false,
        normalizationReasons: [
          'anonymous-structural-transfer',
          'cross-schema-transfer',
          'dynamic-ingress',
          'object-literal-computed',
          'object-literal-spread',
        ],
        observabilityReasons: [
          'enumeration',
          'json-serialization',
          'object-rest',
          'object-spread',
          'optional-omission',
          'prototype-observation',
          'strict-equality',
        ],
      },
      oracle: {
        enumerations: 1,
        jsonSerializations: 1,
        objectRests: 1,
        objectSpreads: 1,
        prototypeObservations: 1,
        strictEqualityAssertions: 1,
      },
      production: {
        anonymousStructuralTransfers: 1,
        crossSchemaTransfers: 1,
        dynamicIngresses: 1,
        enumerations: 1,
        jsonSerializations: 1,
        objectRests: 1,
        objectSpreads: 2,
      },
    });
    expect(b).toMatchObject({
      construction: {
        objectLiterals: 1,
        objectLiteralsOmittingOptionalFields: 1,
        plainObjectLiterals: 1,
      },
      migration: { mechanicallyCompatible: true, normalizationReasons: [] },
    });
    expect(a?.sites).toEqual(
      expect.arrayContaining([
        expect.objectContaining({ kind: 'cross-schema-transfer', relatedSchemaIds: [b?.id] }),
        expect.objectContaining({ kind: 'prototype-observation', scope: 'test' }),
      ]),
    );
    expect(audit.summary).toMatchObject({
      anonymousStructuralTransfers: 1,
      bridgeInputSignatures: 1,
      bridgeOutputSignatures: 1,
      crossSchemaTransfers: 1,
      dynamicIngresses: 1,
      mechanicallyCompatibleSchemas: 1,
      normalizationRequiredSchemas: 1,
      objectLiterals: 4,
      objectLiteralsOmittingOptionalFields: 3,
      objectLiteralsWithComputedKeys: 1,
      objectLiteralsWithSpread: 1,
      oracleObservations: 6,
      schemas: 2,
      testObjectLiterals: 1,
    });
    expect(typedStructClassFeasibilitySummary(audit)).toContain('| Eligible canonical schemas | 2 |');
  });

  it('propagates normalization and bridge roots through containment and catches generic construction gaps', () => {
    const audit = provenanceAuditFixture(`
      export interface A { children: B[]; envelope: { child: B }; }
      export interface B { x: number; }
      export interface C { value: number; }
      declare const text: string;
      declare const records: Array<{ x: number }>;
      const parsed = JSON.parse(text) as A;
      const children: B[] = records.map((record) => ({ x: record.x }));
      const safe: C[] = [{ value: 1 }];
      export function consume(value: A): C { return safe[0]!; }
    `);
    const b = audit.schemas.find((schema) => schema.name === 'B');
    const c = audit.schemas.find((schema) => schema.name === 'C');

    expect(audit.summary).toMatchObject({
      blockedSchemas: 1,
      candidateSchemas: 2,
      closedSchemas: 1,
      combinedBlockedSchemas: 1,
      containerOnlyBlockedSchemas: 0,
      normalizationOnlyBlockedSchemas: 0,
    });
    expect(audit.jsonParseRoots).toEqual([
      expect.objectContaining({
        schemaId: expect.stringContaining('#A'),
        sites: [expect.objectContaining({ kind: 'json-parse-root' })],
      }),
    ]);
    expect(audit.containmentEdges).toEqual(
      expect.arrayContaining([
        expect.objectContaining({ childSchemaId: expect.stringContaining('#B'), fieldPath: 'envelope.child' }),
      ]),
    );
    expect(b).toMatchObject({
      bridgeExposure: {
        inputPaths: [expect.objectContaining({ rootSchemaId: expect.stringContaining('#A') })],
      },
      nominalIdentity: {
        blockerReasons: ['container-transfer', 'normalization-provenance'],
        closed: false,
      },
      normalizationProvenance: [
        expect.objectContaining({
          path: [expect.stringContaining('#A'), expect.stringContaining('children[]:')],
          rootSchemaId: expect.stringContaining('#A'),
        }),
      ],
      transfers: [expect.objectContaining({ kind: 'anonymous-container-transfer' })],
    });
    expect(c).toMatchObject({
      nominalIdentity: { blockerReasons: [], closed: true },
      normalizationProvenance: [],
      transfers: [],
    });
    expect(typedStructProvenanceSummary(audit)).toContain('| Clean required-field candidates | 2 |');
  });

  it('re-proves the reviewed cpp controls against the complete checker-derived universe', () => {
    const workspace = path.resolve('.');
    const programAndChecker = upstreamTypeScriptProgram(workspace);
    const registry = typedStructRegistry(workspace, 'fixture', undefined, programAndChecker);
    const report = registry.report;
    const classAudit = auditTypedStructClassFeasibility(workspace, 'fixture', registry, programAndChecker);
    const provenance = auditTypedStructProvenance(workspace, 'fixture', registry, classAudit, programAndChecker);
    const classAuditById = new Map(classAudit.schemas.map((schema) => [schema.id, schema]));
    const provenanceById = new Map(provenance.schemas.map((schema) => [schema.id, schema]));
    const typeErasureReport = JSON.parse(readFileSync('reports/type-erasures.json', 'utf8')) as {
      modules: Array<{ byReason: Record<string, number>; module: string; total: number }>;
      summary: { byReason: Record<string, number>; total: number };
    };
    const rectangle = report.candidates.find((candidate) => candidate.name === 'Rectangle');
    const color = report.candidates.find((candidate) => candidate.name === 'ColorScaleBias');
    const camera2D = report.candidates.find((candidate) => candidate.name === 'Camera2D');
    const particleEmitterData = report.candidates.find((candidate) => candidate.name === 'ParticleEmitterData');
    const particleEmitterState = report.candidates.find((candidate) => candidate.name === 'ParticleEmitterState');
    const codec = report.candidates.find((candidate) => candidate.name === 'ParticleFormatCodec');
    const menuItemTemplate = report.candidates.find((candidate) => candidate.name === 'MenuItemTemplate');
    const bitmap = report.candidates.find((candidate) => candidate.name === 'Bitmap');
    const bitmapRegion = report.candidates.find((candidate) => candidate.name === 'BitmapRegion');
    const glRenderStateRuntime = report.candidates.find((candidate) => candidate.name === 'GlRenderStateRuntime');
    const wgpuRenderStateRuntime = report.candidates.find((candidate) => candidate.name === 'WgpuRenderStateRuntime');
    const renderTargetCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'CanvasRenderTarget',
            'GlRenderTarget',
            'RenderTarget',
            'RenderTargetDescriptor',
            'WgpuRenderTarget',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const textStructCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['RichText', 'RichTextContent', 'RichTextData', 'TextLayoutGroup', 'TextLayoutResult'].includes(
            candidate.name,
          ),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const physicsAndClipCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['ClipRegion', 'Physics2DCollider', 'Physics2DContact', 'Physics2DSolverConfig', 'Physics2DWorld'].includes(
            candidate.name,
          ),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const renderContextRuntimeCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'CanvasRenderEffectContext',
            'GlRenderEffectContext',
            'GlScene3DRuntime',
            'WgpuRenderEffectContext',
            'WgpuScene3DRuntime',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const nextHotCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'CanvasShapeDrawState',
            'OrbitCameraController',
            'QuadBatchData',
            'RiveCoreObject',
            'Scene3DDocument',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const animationTimelineCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['AnimationChannel', 'AnimationPlayer', 'AnimationTrack', 'Timeline', 'Tween'].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const riveDocumentCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['RiveArtboardGraph', 'RiveDocumentImportResult', 'RiveFileAsset', 'RivePathRecord', 'RiveProperty'].includes(
            candidate.name,
          ),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const inputStateCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['InputKeyboardData', 'InputManager', 'InputPointerData', 'KeyboardEventData', 'TextInputState'].includes(
            candidate.name,
          ),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const materialCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'BlinnPhongMaterial',
            'PhongMaterial',
            'ShadedMaterial',
            'SpecularGlossinessPbrMaterial',
            'StandardPbrMaterialProperties',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const renderRuntimeCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'DomRenderStateRuntime',
            'RenderProxy',
            'RenderStateRuntime',
            'ResolvedRenderTargetDescriptor',
            'Scene3DRenderProxy',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const collisionPhysicsCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'CollisionContactManifold',
            'CollisionManifold',
            'CollisionTimeOfImpact',
            'Physics2DMassData',
            'Velocity2D',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const physicsJointCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'Physics2DGearJoint',
            'Physics2DPrismaticJoint',
            'Physics2DPulleyJoint',
            'Physics2DRevoluteJoint',
            'Physics2DWheelJoint',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const skeletonSkinCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['MeshSkinBindPose', 'Skeleton2D', 'Skeleton2DPathConstraint', 'Skeleton3D', 'SkinAttachment2D'].includes(
            candidate.name,
          ),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const stateMachineCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'AnimationCrossfade',
            'AnimationStateMachine',
            'Statechart',
            'StatechartInstance',
            'StatechartTransition',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const textureContainerCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'GlRenderTextureEntry',
            'RenderTexture',
            'TextureContainer',
            'TextureContainerLevel',
            'WgpuRenderTextureEntry',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const hitAndContactCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['CollisionContactPoint', 'CollisionRaycastHit', 'Physics2DRayHit', 'Scene3DHit', 'VelocitySample'].includes(
            candidate.name,
          ),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const textRuntimeCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['BitmapTextPage', 'RichTextRuntime', 'ShapedRun', 'TextLabel', 'TextLabelData'].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const shapeDataCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['MorphShape', 'MorphShapeData', 'Scale9Shape', 'Shape', 'ShapeData'].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const glProgramCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['GlClassicProgram', 'GlMeshProgram', 'GlMeshUpload', 'GlParticleShader', 'GlPbrProgram'].includes(
            candidate.name,
          ),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const directionalEffectCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['BevelEffect', 'DropShadowEffect', 'GradientBevelEffect', 'InnerShadowEffect', 'OuterGlowEffect'].includes(
            candidate.name,
          ),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const backendStatePipelineCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'CanvasRenderStateRuntime',
            'GlRenderEffectPipeline',
            'GlScissorRect',
            'WgpuRenderEffectPipeline',
            'WgpuScissorRect',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const shadingModifierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'AnimatedNormalModifier',
            'DissolveModifier',
            'EmissiveModifier',
            'FogModifier',
            'VertexDisplaceModifier',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const shadingModifierOptionCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'AnimatedNormalModifierOptions',
            'DissolveModifierOptions',
            'EmissiveModifierOptions',
            'FogModifierOptions',
            'VertexDisplaceModifierOptions',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const interactionStateCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'InputState',
            'InteractionManager',
            'InteractionPointerState',
            'NodeInteractionState',
            'PointerEventData',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const tilemapTiledCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'TiledGid',
            'TiledMap',
            'TiledObject',
            'TiledProperty',
            'TiledTileset',
            'TiledTilesetRef',
            'TiledTilesetTile',
            'TiledTilesetTileFrame',
            'Tilemap',
            'TilemapData',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const pbrExtensionCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'ClearcoatPbrExtension',
            'IridescencePbrExtension',
            'SpecularPbrExtension',
            'TransmissionVolumePbrExtension',
            'WrappedDiffusePbrExtension',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const highAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['FlyCameraController', 'NodeOrderList', 'PackableRectangle', 'ParticleEmitter3D', 'SocketRuntime'].includes(
            candidate.name,
          ),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const secondHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['AreaLight', 'Clock', 'LottieLayer', 'MovieClipData', 'PathMesh'].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const thirdHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['LayoutNode', 'Scene3DKindUsage', 'StandardPbrMaterial', 'TextSelectionRectangle', 'TextureSource'].includes(
            candidate.name,
          ),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const fourthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['ElectronApi', 'GlLitProgram', 'LayoutState', 'MeshGeometryRuntime', 'QuadBatch'].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const fifthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['GodRaysEffect', 'LottieDocument', 'NativeTextData', 'Scene3DLightBlock', 'TextInputOptions'].includes(
            candidate.name,
          ),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const sixthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'BitmapTextData',
            'GradientGlowEffect',
            'Scene3DDocumentNode',
            'Scene3DResourceResolverRuntime',
            'WgpuShapeMeshBuffers',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const seventhHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'DirectionalLight',
            'MorphShapeGradientEndpoint',
            'Scene3DRenderList',
            'SpatialIndexingNotice',
            'SurfaceMaterial',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const eighthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'CreateRenderTextureOptions',
            'CustomShaderMaterial',
            'InnerGlowEffect',
            'MotionPath',
            'Scene2DKindUsage',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const ninthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'AbcInstruction',
            'AbcMultiname',
            'AnimationRootMotionExtractor',
            'CanvasRenderTexturePool',
            'LogEntry',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const tenthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['ConvolutionEffect', 'EmissiveMaterial', 'ToonMaterial', 'TransformInherit2D', 'UnlitMaterial'].includes(
            candidate.name,
          ),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const eleventhHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'AnimationClipEvent',
            'BitmapTextRuntime',
            'ExtendedPbrMaterial',
            'TweenPropertyDetail',
            'WgpuScene3DShadow',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const twelfthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'AnimationBlendTree',
            'GlColorScaleBiasInstancedShader',
            'LambertMaterial',
            'OrbitCameraControllerOptions',
            'WgpuShapeRendererData',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const thirteenthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'GlRenderTexturePool',
            'GlShadedProgram',
            'GlShapeRendererData',
            'WgpuQuadBatchWriterBufferSlot',
            'WgpuRenderTexturePool',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const fourteenthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['LayoutTree', 'SoftKeyboardInfo', 'Sprite', 'TextLayoutParams', 'TextShaperBackend'].includes(
            candidate.name,
          ),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const fifteenthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'AnimationBlendTreeInput',
            'AnimationLayer',
            'AnimationSampleAccumulator',
            'LottieKeyframe',
            'Skeleton2DTransformConstraint',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const sixteenthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['AbcTrait', 'CanvasRenderTextureEntry', 'NetRequest', 'SheenPbrExtension', 'ThreeDsLight'].includes(
            candidate.name,
          ),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const seventeenthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['TauriApi', 'Viewport', 'WgpuColorLutTextureCache', 'WgpuMeshUpload', 'WgpuScene3DIbl'].includes(
            candidate.name,
          ),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const eighteenthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['Modifier', 'Physics2DDebugGeometry', 'Socket', 'StatechartState', 'StrokeStyle'].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const nineteenthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['NativeTextRuntime', 'PbrExtension', 'Physics2DRayResult', 'Skeleton2DIkConstraint', 'SpriteData'].includes(
            candidate.name,
          ),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const twentiethHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'BitmapFingerprint',
            'FlexLayoutItemStyle',
            'GlRenderEffectApplicationExplanation',
            'LottieShapePath',
            'MatcapMaterial',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const twentyFirstHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'AccessibilityState',
            'VignetteEffect',
            'WgpuScene3DDrawEntry',
            'WgpuShapeMesh',
            'WgpuVideoTextureEntry',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const twentySecondHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'CanvasRenderEffectPipeline',
            'ColorAdjustmentRuntime',
            'GlScene3DDrawEntry',
            'RenderEffectPadding',
            'ShadedMaterialOptions',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );

    expect(cppStructInitTypedStructIds).toEqual([
      '@flighthq/types:interface#Camera2D',
      '@flighthq/types:interface#ParticleEmitterState',
    ]);
    expect(cppStructInitTypedStructIds.every((id) => provenanceById.get(id)?.nominalIdentity.closed === true)).toBe(
      true,
    );
    const particleEmitterDataId = '@flighthq/types:interface#ParticleEmitterData';
    expect(provenanceById.get(particleEmitterDataId)?.nominalIdentity.closed).toBe(false);
    expect(() => validateCppStructInitProvenance(cppStructInitTypedStructIds, provenance)).not.toThrow();
    expect(() => validateCppStructInitProvenance([particleEmitterDataId], provenance)).toThrow(
      `cpp @:structInit schemas are not provenance-closed: ${particleEmitterDataId}`,
    );
    const rectangleId = '@flighthq/types:interface#Rectangle';
    const rectangleLikeId = '@flighthq/types:type#RectangleLike';
    expect(classAuditById.get(rectangleId)?.migration).toEqual({
      mechanicallyCompatible: false,
      normalizationReasons: ['cross-schema-transfer'],
      observabilityReasons: ['strict-equality'],
    });
    expect(provenanceById.has(rectangleId)).toBe(false);
    expect(provenanceById.get(rectangleLikeId)?.nominalIdentity).toEqual({
      blockerReasons: ['normalization-provenance'],
      closed: false,
    });
    expect(() => validateCppStructInitProvenance([rectangleId, rectangleLikeId], provenance)).toThrow(
      `cpp @:structInit schemas are not provenance-closed: ${rectangleId}, ${rectangleLikeId}`,
    );
    expect(readFileSync('generated/flighthq/types/ParticleEmitter2D.hx', 'utf8')).toContain(
      'typedef ParticleEmitter2D = { var data:ParticleEmitterData;',
    );
    expect(readFileSync('generated/flighthq/types/ParticleEmitter3D.hx', 'utf8')).toContain(
      'typedef ParticleEmitter3D = { var data:ParticleEmitterData;',
    );
    expect(readFileSync('generated/flighthq/types/Node.hx', 'utf8')).toContain(
      'typedef NodeData = flighthq._internal._Object;',
    );

    expect(report.summary).toMatchObject({
      auditOnlySchemas: 1_356,
      bindableAccesses: 30_666,
      candidates: 2_006,
      directAccesses: 23_711,
      directSchemas: 648,
      eligible: 1_536,
      escapes: 10_973,
      fields: 23_912,
      ineligible: 470,
      pendingAccesses: 6_955,
      reflectiveSurvivors: 455,
    });
    expect(report.migration.summary).toEqual({
      baseline: 405,
      kindChanged: 2,
      newAuditOnly: 1_356,
      preserved: 231,
      relocated: 146,
      removed: 3,
      renamed: 23,
    });
    expect(classAudit.summary.schemas).toBe(1_536);
    expect(provenance.summary).toMatchObject({
      candidateSchemas: 741,
      closedSchemas: 551,
      containmentEdges: 2_059,
    });
    expect(typeErasureReport.summary).toMatchObject({
      byReason: expect.objectContaining({
        'source-never': 116,
        'source-unknown': 3_833,
        'standard-toolkit-boundary': 17_935,
      }),
      total: 24_158,
    });
    expect(
      typeErasureReport.modules
        .filter(({ module }) =>
          [
            'flighthq.scene2dCanvas.CanvasCache',
            'flighthq.scene2dCanvas.CanvasRenderState',
            'flighthq.scene2dCanvas.CanvasRenderTarget',
          ].includes(module),
        )
        .map(({ byReason, module, total }) => ({ byReason, module, total })),
    ).toEqual([
      {
        byReason: { 'standard-toolkit-boundary': 20 },
        module: 'flighthq.scene2dCanvas.CanvasCache',
        total: 20,
      },
      {
        byReason: { 'external-toolkit-boundary': 1, 'standard-toolkit-boundary': 17 },
        module: 'flighthq.scene2dCanvas.CanvasRenderState',
        total: 18,
      },
      {
        byReason: { 'external-toolkit-boundary': 1, 'standard-toolkit-boundary': 26 },
        module: 'flighthq.scene2dCanvas.CanvasRenderTarget',
        total: 27,
      },
    ]);
    expect(
      typeErasureReport.modules.find(({ module }) => module === 'flighthq.interaction.NodeInteractionState'),
    ).toEqual({
      byReason: { 'source-never': 12 },
      module: 'flighthq.interaction.NodeInteractionState',
      source: 'upstream/packages/interaction/src/nodeInteractionState.ts',
      total: 12,
    });
    expect(typeErasureReport.modules.find(({ module }) => module === 'flighthq.animation.AnimationClip')).toEqual({
      byReason: { 'source-unknown': 12, 'standard-toolkit-boundary': 10 },
      module: 'flighthq.animation.AnimationClip',
      source: 'upstream/packages/animation/src/animationClip.ts',
      total: 22,
    });
    expect(rectangle?.eligible).toBe(true);
    expect(rectangle?.reasons).not.toContain('presence-sensitive-use');
    expect(rectangle?.escapes).toEqual(
      expect.arrayContaining([
        expect.objectContaining({
          reason: 'presence-sensitive',
          source: 'upstream/packages/interaction/src/hitTests.ts',
        }),
      ]),
    );
    expect(color?.eligible).toBe(true);
    expect(color?.reasons).not.toContain('presence-sensitive-use');
    expect(color?.migration).toEqual({
      baselineId: '@flighthq/types:interface#ColorTransform',
      status: 'renamed',
    });
    expect(report.summary.directAccesses).toBe(23_711);
    expect(rectangle?.emission).toEqual({
      directAccesses: 667,
      mode: 'direct',
      pendingAccesses: 0,
      reflectiveSurvivors: [{ accesses: 2, reason: 'presence-sensitive' }],
    });
    expect(camera2D?.emission).toEqual({
      directAccesses: 17,
      mode: 'direct',
      pendingAccesses: 0,
      reflectiveSurvivors: [],
    });
    expect(particleEmitterData).toMatchObject({
      eligible: true,
      emission: { directAccesses: 461, mode: 'direct', pendingAccesses: 0 },
      escapes: [],
      fields: expect.arrayContaining([
        expect.objectContaining({ name: 'particleCount', optional: false, type: 'number' }),
        expect.objectContaining({ name: 'transforms', optional: false, type: 'Float32Array<ArrayBufferLike>' }),
      ]),
      reasons: [],
    });
    expect(particleEmitterState).toMatchObject({
      eligible: true,
      emission: { directAccesses: 236, mode: 'direct', pendingAccesses: 0 },
      escapes: [],
      fields: expect.arrayContaining([
        expect.objectContaining({ name: 'random', optional: false, type: 'RandomSource' }),
        expect.objectContaining({ name: 'velocities', optional: false, type: 'Float32Array<ArrayBufferLike>' }),
      ]),
      reasons: [],
    });
    expect(menuItemTemplate?.emission.reflectiveSurvivors).toEqual([{ accesses: 1, reason: 'dynamic-enumeration' }]);
    expect(bitmap).toMatchObject({
      emission: { mode: 'direct' },
      migration: { baselineId: '@flighthq/types:interface#Surface', status: 'renamed' },
    });
    expect(bitmapRegion).toMatchObject({
      declarationFingerprint: 'sha256:6de1c57a64f9d839dba96b69bcdd8cae0ca18580cc13f425ae6cb9ec9f68c4b8',
      eligible: true,
      emission: { directAccesses: 674, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
      escapes: [],
      migration: { baselineId: null, status: 'new' },
      purpose: 'reviewed escape-free bitmap region',
      reasons: [],
    });
    expect(glRenderStateRuntime).toMatchObject({
      declarationFingerprint: 'sha256:a8e896f65206af608a3efc10cf9109d10714c30269d79b02c5077a81879c8d3b',
      eligible: true,
      emission: { directAccesses: 544, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
      escapes: [],
      migration: { baselineId: null, status: 'new' },
      purpose: 'reviewed escape-free WebGL render-state runtime',
      reasons: [],
    });
    expect(wgpuRenderStateRuntime).toMatchObject({
      declarationFingerprint: 'sha256:a2bc23bace382a83f246f14c86f03121db15a25a1f479edc706a6b00dfe0475d',
      eligible: true,
      emission: { directAccesses: 730, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
      escapes: [],
      migration: { baselineId: null, status: 'new' },
      purpose: 'reviewed escape-free WebGPU render-state runtime',
      reasons: [],
    });
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'CanvasRenderTarget',
        153,
        'sha256:77ecafe9197f64a9e574cc139335cb7aff72a45c8b5efecc742d943d53a49e3a',
        'reviewed escape-free Canvas render target',
      ],
      [
        'GlRenderTarget',
        303,
        'sha256:a70ee9ffbaf0c1d0fd73965076d56028db2ce78f1dda4c9006e35974be0fe408',
        'reviewed escape-free WebGL render target',
      ],
      [
        'RenderTarget',
        49,
        'sha256:c7a251ae0b80f4ecea3ed0c7bf9d8f702baff476a5465d16cdf5e1d1bc427111',
        'reviewed escape-free portable render target',
      ],
      [
        'RenderTargetDescriptor',
        50,
        'sha256:f976a3e923d48395ab6e3ab23594c3979ad742550499012816e1aa6fada959dc',
        'reviewed escape-free render-target descriptor',
      ],
      [
        'WgpuRenderTarget',
        152,
        'sha256:d5e40ef824804481c0135b2b35a6745fc6d84140f5c43fb4644b3a8af5a12b45',
        'reviewed escape-free WebGPU render target',
      ],
    ] as const) {
      expect(renderTargetCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'AnimatedNormalModifierOptions',
        7,
        'sha256:97105d620e4afa392d6e85532e6fc45385b94f13a602cd4b6770281e27eded33',
        'reviewed escape-free animated-normal modifier options',
      ],
      [
        'DissolveModifierOptions',
        6,
        'sha256:877e24a08322880ba5714aa0116f27f119d937d476e1922d21694b5d5bb03c36',
        'reviewed escape-free dissolve modifier options',
      ],
      [
        'EmissiveModifierOptions',
        6,
        'sha256:3178f9ac65a057f14a0f654c4380a341fe76b57d865832040c2b7e3f3a6bf79c',
        'reviewed escape-free emissive modifier options',
      ],
      [
        'FogModifierOptions',
        5,
        'sha256:a140958cfd3e17565cf886b6ec71cf5ad24d26795dee44c1741d2a55287472e4',
        'reviewed escape-free fog modifier options',
      ],
      [
        'VertexDisplaceModifierOptions',
        9,
        'sha256:4831daeafb37b213acd119f1b235c36ab8b0c9539d23d2958379792fa2a48f98',
        'reviewed escape-free vertex-displacement modifier options',
      ],
    ] as const) {
      expect(shadingModifierOptionCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'InteractionManager',
        49,
        'sha256:862e11110d27a2fae69cc108968d79f6b75dfb8719760df193c2f036752e10e6',
        'reviewed escape-free interaction manager',
      ],
      [
        'InputState',
        37,
        'sha256:216dce6f67c2e578771f19028b5b6df661f640ecf89609634c0f5537d28f30e7',
        'reviewed escape-free input state',
      ],
      [
        'PointerEventData',
        28,
        'sha256:a21b27d68119da759ea2e963106f0280744090b06621aba95150c883bc80fb23',
        'reviewed escape-free pointer event data',
      ],
      [
        'NodeInteractionState',
        19,
        'sha256:1a80443ef92b7e9bc7ac2dd87e10ced28db13469f8d2df5f858aa35a5a986944',
        'reviewed escape-free node interaction state',
      ],
      [
        'InteractionPointerState',
        15,
        'sha256:6c846f5649ce0d7c3800c0bf309bebafb3e4bc1f67b56d12bc9e2acce5c9d262',
        'reviewed escape-free interaction pointer state',
      ],
    ] as const) {
      expect(interactionStateCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'TilemapData',
        70,
        'sha256:24320b83bfd5874be2f12540bc06d3b54f1f6d2611c4c7652b684095843ad56b',
        'reviewed escape-free tilemap data',
      ],
      [
        'TiledObject',
        25,
        'sha256:d8b583fd4ac5be7b2e225eb093440e762ac18bd63947531c364b379b941aa409',
        'reviewed escape-free Tiled object',
      ],
      [
        'TiledMap',
        17,
        'sha256:06addefb47009dd6ad6194898472603ce2dd11f327687e4795e7ed1fa107eb9f',
        'reviewed escape-free Tiled map',
      ],
      [
        'Tilemap',
        17,
        'sha256:baaa0bd15356d53492d909bb22e420d309e45d951731b185dddd284a4bfe42b1',
        'reviewed escape-free tilemap',
      ],
      [
        'TiledTileset',
        15,
        'sha256:f7f49b1c5693d038732edcc23550418414f1b7bca0501669372a4e0d11f212eb',
        'reviewed escape-free Tiled tileset',
      ],
    ] as const) {
      expect(tilemapTiledCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'TransmissionVolumePbrExtension',
        31,
        'sha256:d2e5d9acdd16ea800ff99d016bd6da24a62a410c5efa12e734e9e2649f325602',
        'reviewed escape-free transmission-volume PBR extension',
      ],
      [
        'ClearcoatPbrExtension',
        25,
        'sha256:80ae6c1261768bbe66d4437552c4c7ceee1a7368799bb3190699c0895be3795f',
        'reviewed escape-free clearcoat PBR extension',
      ],
      [
        'IridescencePbrExtension',
        22,
        'sha256:09159cce23f7c1cbfcbebf1a7c91d65bc7d23a53e199ec7f509d05b93f7bfa9b',
        'reviewed escape-free iridescence PBR extension',
      ],
      [
        'WrappedDiffusePbrExtension',
        18,
        'sha256:58c73e60264700f5dcd433febea3ead0758d3e062b8cc68c0b35586324582a31',
        'reviewed escape-free wrapped-diffuse PBR extension',
      ],
      [
        'SpecularPbrExtension',
        15,
        'sha256:d028a204fbe4ebdd31bb85d2c26f6c239b3c7a8aff40c22b4f9548c15c012e5f',
        'reviewed escape-free specular PBR extension',
      ],
    ] as const) {
      expect(pbrExtensionCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'FlyCameraController',
        64,
        'sha256:5ec7dbb9000ec57efedee41fc853a74e39bf8f7b229155779007e9579f9407b7',
        'reviewed escape-free fly camera controller',
      ],
      [
        'ParticleEmitter3D',
        55,
        'sha256:64e20d991efa3af3e4d7ea369d2494215759ec7b97040fd164291220452e4e3d',
        'reviewed escape-free 3D particle emitter',
      ],
      [
        'SocketRuntime',
        43,
        'sha256:84a5032e10a50972215d64097cb31bfcac6f4cb43baf03f7b651b7d72bc25864',
        'reviewed escape-free socket runtime',
      ],
      [
        'NodeOrderList',
        41,
        'sha256:ac6d71dd26dbaa9e99b676efee5645d01bc94b02da6199e93c5b674e43b77e92',
        'reviewed escape-free node order list',
      ],
      [
        'PackableRectangle',
        38,
        'sha256:0d4dd4a03fe6768f388ff1d15945725582f976354ad7cc1f2df54aa966166763',
        'reviewed escape-free packable rectangle',
      ],
    ] as const) {
      expect(highAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'Clock',
        36,
        'sha256:e6e95909db1bea0affe3369897e0632ad4f455db8211a678d4d881f01d456a9b',
        'reviewed escape-free clock',
      ],
      [
        'AreaLight',
        34,
        'sha256:9ea86c550f139c78db1e1e5f74465c7b5551ae23b4269fa6f342fabefe27471a',
        'reviewed escape-free area light',
      ],
      [
        'LottieLayer',
        32,
        'sha256:ed2e39801a2b33fe8f903c119ababfaab77850d0f8749741e2e3a9a1a71ea5c2',
        'reviewed escape-free Lottie layer',
      ],
      [
        'MovieClipData',
        32,
        'sha256:5aa6485af78fca2067f0720a27927c1e85e3c6481c8299dbe80ef2b73dd1d259',
        'reviewed escape-free movie-clip data',
      ],
      [
        'PathMesh',
        31,
        'sha256:66cba4b02f27ccf2d392f2ce60c410aaa294ac9c3344dcc6fe3c41e474430059',
        'reviewed escape-free path mesh',
      ],
    ] as const) {
      expect(secondHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'StandardPbrMaterial',
        30,
        'sha256:75623596e21f7fa8bdb96972f77d790d3fa4eaa91a9a238efce37fd2c87cff25',
        'reviewed escape-free standard PBR material',
      ],
      [
        'TextSelectionRectangle',
        30,
        'sha256:8b127f9af8b5c5c504869aff4b368a55038b3df041dcc04c392bae8aed708e39',
        'reviewed escape-free text selection rectangle',
      ],
      [
        'LayoutNode',
        29,
        'sha256:dcb64afdbc4634db6a19bccd9b239a2d46272227ea1bcc4547bb450d8e95b91f',
        'reviewed escape-free layout node',
      ],
      [
        'Scene3DKindUsage',
        29,
        'sha256:6221bdcad721b47767821e41a9d71f9e1d6766b425ec20a430f0ee643b761ab6',
        'reviewed escape-free Scene3D kind usage',
      ],
      [
        'TextureSource',
        29,
        'sha256:e1aa5f7158dac8804df2b8cb02d88eb0ef695dcb84db0bb0804dc6a2fd8c1b1f',
        'reviewed escape-free texture source',
      ],
    ] as const) {
      expect(thirdHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'ElectronApi',
        'sha256:f54a1342b6e20a6877114b8a64de522c5dd432abe1db067f1d64cf56da7987a5',
        'reviewed escape-free Electron API',
      ],
      [
        'GlLitProgram',
        'sha256:6f76f76885ae46aa509bb7badc6b7ce66f4ef96ca95fa1871bc7f24685c71df1',
        'reviewed escape-free WebGL lit program',
      ],
      [
        'LayoutState',
        'sha256:7990b91753d362be27f86906395a45a7c19aae3b4001e7681dc88f6e8ca61d39',
        'reviewed escape-free layout state',
      ],
      [
        'MeshGeometryRuntime',
        'sha256:09771ab81a3d8b9386f482e7a9b0d8e8bb9af7a1576510bd07568070f8cde3bd',
        'reviewed escape-free mesh geometry runtime',
      ],
      [
        'QuadBatch',
        'sha256:899537b7d2a81e3752bb2c1fc97d945d22692f778fc4c242542ee226df28fef4',
        'reviewed escape-free quad batch',
      ],
    ] as const) {
      expect(fourthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: 28, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'TextInputOptions',
        28,
        'sha256:1b5f5456e620e7bbc76f4a5bb4aaa3a55f80a9ebc786347d9c288be4f77737da',
        'reviewed escape-free text input options',
      ],
      [
        'LottieDocument',
        27,
        'sha256:bc1bd8fee72d0e49ff3cc90a7cac976377ee624b49519bc78226652352e72d31',
        'reviewed escape-free Lottie document',
      ],
      [
        'Scene3DLightBlock',
        27,
        'sha256:4f02cd2e116d99ce5b2af2c64e24ae32f9498383db2c912a82071baa98a33344',
        'reviewed escape-free Scene3D light block',
      ],
      [
        'GodRaysEffect',
        26,
        'sha256:200f20a7b556d1c3a1c4880fde41f35aba28c6d41c03cf434ac1c39eb00f2275',
        'reviewed escape-free god-rays effect',
      ],
      [
        'NativeTextData',
        26,
        'sha256:5e7d4b75130bdda69787b9c27ae02b9270e3c086f66849b6aecb864787210fd6',
        'reviewed escape-free native-text data',
      ],
    ] as const) {
      expect(fifthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'Scene3DResourceResolverRuntime',
        25,
        'sha256:1a88b32407ec4e866c81dacc567c24c15122e2fea6540aaa7a45532c65af6067',
        'reviewed escape-free Scene3D resource-resolver runtime',
      ],
      [
        'GradientGlowEffect',
        25,
        'sha256:095a13e1c53d9734759a7a788007e08fb2ad1347e36f353e48ba2e6b730c44ae',
        'reviewed escape-free gradient-glow effect',
      ],
      [
        'BitmapTextData',
        25,
        'sha256:63846610c575904018effbac806a0440c7a5eeadaee51b0834ffb45fbf7fd44b',
        'reviewed escape-free bitmap-text data',
      ],
      [
        'WgpuShapeMeshBuffers',
        24,
        'sha256:f9514088a8f644f0471aa1aa5a043041544b3296d2aa7a9994fa8dfa8ae9e7b8',
        'reviewed escape-free WebGPU shape-mesh buffers',
      ],
      [
        'Scene3DDocumentNode',
        24,
        'sha256:9ed61dc079468b2826972b414de55e5725087be3219b8eea7e4ddf7716ade10c',
        'reviewed escape-free Scene3D document node',
      ],
    ] as const) {
      expect(sixthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'DirectionalLight',
        24,
        'sha256:5aa15d73a4d69dda6f617f278e05d90700a178b45474ec248e36e1a1139373ae',
        'reviewed escape-free directional light',
      ],
      [
        'SurfaceMaterial',
        23,
        'sha256:ad4981fb8d04361edb9e7e958ecc08e26e759a9934fb583584440ff0296f4f4a',
        'reviewed escape-free surface material',
      ],
      [
        'MorphShapeGradientEndpoint',
        23,
        'sha256:f5a125c830ec328239b3260b832a2d808ac31e1e0735b68100978abf63435bde',
        'reviewed escape-free morph-shape gradient endpoint',
      ],
      [
        'SpatialIndexingNotice',
        22,
        'sha256:f864004b87b82bcca917b1ed1e00b1b83f330263d4f5c0fce6e3b8e5bc6dafa8',
        'reviewed escape-free spatial-indexing notice',
      ],
      [
        'Scene3DRenderList',
        22,
        'sha256:7e7d78288f957c8b5498a6e851712cd492da91353a70049a43a65b9d5abf86ed',
        'reviewed escape-free Scene3D render list',
      ],
    ] as const) {
      expect(seventhHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'Scene2DKindUsage',
        'sha256:496c05d2679fb7bd28f2ea80ce1ab909b2ad53eda73c19b1e1933cddacf8d877',
        'reviewed escape-free Scene2D kind usage',
      ],
      [
        'MotionPath',
        'sha256:9ed90b466cc7a1b9394a8de4672a9f73333fe5c5379a26853f9d55533c9c0c5d',
        'reviewed escape-free motion path',
      ],
      [
        'InnerGlowEffect',
        'sha256:8301e42403f279dd1544f2cfcd45fc89ac70c49225e2760882b1c6511f02657c',
        'reviewed escape-free inner-glow effect',
      ],
      [
        'CustomShaderMaterial',
        'sha256:a8c84d5a06304f2943dc6a1e7a3b630148b0705730330018dafd7e117b112f4c',
        'reviewed escape-free custom-shader material',
      ],
      [
        'CreateRenderTextureOptions',
        'sha256:53fc44a6b4cbdc1dd54aadc12a3aad4c2a60b93fc5c864af2dade3c3b650f72e',
        'reviewed escape-free render-texture options',
      ],
    ] as const) {
      expect(eighthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: 22, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'AbcInstruction',
        22,
        'sha256:f9b45a313f2614d54a52c279b9226bcc9c33ba384453b6dca79b0f5c1338c57d',
        'reviewed escape-free ABC instruction',
      ],
      [
        'AbcMultiname',
        22,
        'sha256:a530f1994767f0978b42abb9d0e32a5edfe81713180e2a2a86d594892bcf840c',
        'reviewed escape-free ABC multiname',
      ],
      [
        'AnimationRootMotionExtractor',
        21,
        'sha256:7b66783df68ff872ad421ae76f22aa65a493abbe89363e655126bd5366f4c849',
        'reviewed escape-free animation root-motion extractor',
      ],
      [
        'CanvasRenderTexturePool',
        21,
        'sha256:bccbdac026b10fed057b1fa96baa3cd24ad093dbb672ca4714c9f87985872894',
        'reviewed escape-free Canvas render-texture pool',
      ],
      [
        'LogEntry',
        21,
        'sha256:386ab33911ac9d6cfda1c53f076da7a8c79abd8f042508f5e4210185d9eacd08',
        'reviewed escape-free log entry',
      ],
    ] as const) {
      expect(ninthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'ToonMaterial',
        21,
        'sha256:1c993883bad8944cd6da043e55da9b6014270eb750d3a0fbc840c9cd107de2b0',
        'reviewed escape-free toon material',
      ],
      [
        'UnlitMaterial',
        21,
        'sha256:eb909d67f4277244c321489bb2cd34a8cb5cc3de0bfade3146aa4c09fb4b27f0',
        'reviewed escape-free unlit material',
      ],
      [
        'ConvolutionEffect',
        20,
        'sha256:bde9a7679c21f48a1a9479c7bfcd6dd049d9255cee1c88feaecc530e7fbfb5fc',
        'reviewed escape-free convolution effect',
      ],
      [
        'EmissiveMaterial',
        20,
        'sha256:69801d3535461cd2a982b945b3099efbf3129d5d5152ed829a5e5ab849141c58',
        'reviewed escape-free emissive material',
      ],
      [
        'TransformInherit2D',
        20,
        'sha256:58e62708f57df42b10b3295377b9c994df1e99c342cdf02e0df5ddac41df98f5',
        'reviewed escape-free 2D transform inheritance',
      ],
    ] as const) {
      expect(tenthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'ExtendedPbrMaterial',
        19,
        'sha256:637bd4055c49e86f20dea391c47c2538d7a327645111fedb7d9904eed914daa0',
        'reviewed escape-free extended PBR material',
      ],
      [
        'TweenPropertyDetail',
        19,
        'sha256:d8b13478c32c050f10440ebe6dc0b1ef9dc33cabde40a9fddb26ab0bd47a1001',
        'reviewed escape-free tween property detail',
      ],
      [
        'WgpuScene3DShadow',
        19,
        'sha256:51198c8940045753f24c81e72c79afa768610dc0b4ad580609876711fd13e77f',
        'reviewed escape-free WebGPU Scene3D shadow',
      ],
      [
        'AnimationClipEvent',
        18,
        'sha256:8d540d5dae11b58c4b1f2a43bfcc742aca87555ad5a5c5249f1800ebbc2a9bed',
        'reviewed escape-free animation clip event',
      ],
      [
        'BitmapTextRuntime',
        18,
        'sha256:d4322da6611176c711c3b0f309d5c790a93ca34a66a751617060eefc278bf549',
        'reviewed escape-free bitmap-text runtime',
      ],
    ] as const) {
      expect(eleventhHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'GlColorScaleBiasInstancedShader',
        18,
        'sha256:eb2748590ab9d2f4190685a0e0023dcfbc58ae2fcfa924a12b27f0b5867c273c',
        'reviewed escape-free WebGL color scale-bias instanced shader',
      ],
      [
        'LambertMaterial',
        18,
        'sha256:2d0f9e3abe6c598f4700dd1dcfca1aa30bc6c7bff1a53bd74e2cbd646349b722',
        'reviewed escape-free Lambert material',
      ],
      [
        'OrbitCameraControllerOptions',
        18,
        'sha256:f1dbf387c55015f5b44dbbe97535bcc3591c79fc936b1381180dc3f65b3da869',
        'reviewed escape-free orbit-camera options',
      ],
      [
        'WgpuShapeRendererData',
        18,
        'sha256:8bf31aa0b755de712e58851fc670470e5a3027dcca83854e402fb31490ea8a01',
        'reviewed escape-free WebGPU shape-renderer data',
      ],
      [
        'AnimationBlendTree',
        17,
        'sha256:054fcb71f93fcdf8767c5be098eb1a25dc1facb91452f1a2fdc42cb37556318c',
        'reviewed escape-free animation blend tree',
      ],
    ] as const) {
      expect(twelfthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'WgpuRenderTexturePool',
        17,
        'sha256:8a2e66fa93ab54d34cd36ee7491780879d7f4f726c841200a9a168247ce7152c',
        'reviewed escape-free WebGPU render-texture pool',
      ],
      [
        'GlRenderTexturePool',
        17,
        'sha256:c9cc45d02ce4d7e948c85172e4a590ef8bacca7dc268920a688dea44c772f41c',
        'reviewed escape-free WebGL render-texture pool',
      ],
      [
        'GlShadedProgram',
        17,
        'sha256:ea78be613c04f60f3a3dfb6529793a1e50fdf4a6d96d13246cb23de6e92ccdab',
        'reviewed escape-free WebGL shaded program',
      ],
      [
        'GlShapeRendererData',
        16,
        'sha256:ae1793eea0c5323a3989c3b263cf25e9d862080401783b4209e04677c86e3f65',
        'reviewed escape-free WebGL shape-renderer data',
      ],
      [
        'WgpuQuadBatchWriterBufferSlot',
        16,
        'sha256:0362fdf0b62095db70100964f8f2d188eae552a2513337d7a145648619fd9486',
        'reviewed escape-free WebGPU quad-batch buffer slot',
      ],
    ] as const) {
      expect(thirteenthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'TextShaperBackend',
        17,
        'sha256:a6d76855c342cc710304eff6c3034f16a3853a751ee704d881de32f764d3c047',
        'reviewed escape-free text-shaper backend',
      ],
      [
        'TextLayoutParams',
        17,
        'sha256:1f2c95acb12ba7582d7411b09d418cf403f8a1cfd850662b185e4c344cecdd40',
        'reviewed escape-free text-layout parameters',
      ],
      [
        'SoftKeyboardInfo',
        17,
        'sha256:0d37ab980102fd6c29da9c33e3ff69749aa8fc3fceed59fed424bf51c17c3ca4',
        'reviewed escape-free soft-keyboard info',
      ],
      [
        'LayoutTree',
        17,
        'sha256:490d3123a670ddb1d15cd2cfd73da271b75c8e85cc7f1fe029718b2079329e7a',
        'reviewed escape-free layout tree',
      ],
      [
        'Sprite',
        16,
        'sha256:d7459435d0471453f1a562948d6fa63807ac8d1381c6ea5874b6f8299eb1b9c2',
        'reviewed escape-free sprite',
      ],
    ] as const) {
      expect(fourteenthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'AnimationSampleAccumulator',
        16,
        'sha256:58f7997452442a5677046c8e565087775f4d75bd6d45ce4f5803c92de3077eb7',
        'reviewed escape-free animation sample accumulator',
      ],
      [
        'AnimationLayer',
        16,
        'sha256:49e24f8195b6c8f54063c8f1b16b6b8a574fdb6d28380516aa63a0b33289fd55',
        'reviewed escape-free animation layer',
      ],
      [
        'AnimationBlendTreeInput',
        15,
        'sha256:999935ff446a57ea847011240330cc4caeb5afe76fd06fddb5d816cbb15d5dfa',
        'reviewed escape-free animation blend-tree input',
      ],
      [
        'LottieKeyframe',
        15,
        'sha256:62295208edb23fbfba568845028bd4aed2cdbe7599cc9c81a4c03ce484fccc8d',
        'reviewed escape-free Lottie keyframe',
      ],
      [
        'Skeleton2DTransformConstraint',
        15,
        'sha256:7ed2b99d05ce368354bb2e67e4a595cb4863a929c6755cfcdab9902470c39959',
        'reviewed escape-free Skeleton2D transform constraint',
      ],
    ] as const) {
      expect(fifteenthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'AbcTrait',
        16,
        'sha256:74c21326aec08c9f2f2e16e6d64e3300ccdb3fc5423d6bf9b2c1145b6def2a8a',
        'reviewed escape-free ABC trait',
      ],
      [
        'CanvasRenderTextureEntry',
        15,
        'sha256:347be02a5d0ddbe8c51171c42f0c6fbb5fd7c9a9ce57332156da8e12fbaf5722',
        'reviewed escape-free Canvas render-texture entry',
      ],
      [
        'NetRequest',
        15,
        'sha256:be5f077631722591406184fa65398af48876fb3c6e8c82d3a3da4cc352c434e7',
        'reviewed escape-free net request',
      ],
      [
        'SheenPbrExtension',
        15,
        'sha256:035a1014631528e9aa9210a89a65d69e398026d9db46131285a1c87aeb2fda16',
        'reviewed escape-free sheen PBR extension',
      ],
      [
        'ThreeDsLight',
        15,
        'sha256:1e5fb34fc3ff6df55e616cadbad7a3c2ea2027a5237f3e2d660b7d33d745305e',
        'reviewed escape-free 3DS light',
      ],
    ] as const) {
      expect(sixteenthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'WgpuScene3DIbl',
        15,
        'sha256:2c9de49060c0caec1db063676aaff00b42a147d1453a572eebc9698cad804d96',
        'reviewed escape-free WebGPU Scene3D IBL',
      ],
      [
        'WgpuColorLutTextureCache',
        15,
        'sha256:c598e5b3c7afe9486b6cb5b0debd608414646860ec136cf35c318b86b51ff1b1',
        'reviewed escape-free WebGPU color-LUT texture cache',
      ],
      [
        'WgpuMeshUpload',
        14,
        'sha256:5ded44df647ee2b8cd70a1c2fac7b6afdecf21d4ad1b059efa421212360c4c4d',
        'reviewed escape-free WebGPU mesh upload',
      ],
      [
        'Viewport',
        14,
        'sha256:4469ff9b065da72e57da440a045907f3e0002cad6c1040d298d4bdd03720003d',
        'reviewed escape-free viewport',
      ],
      [
        'TauriApi',
        14,
        'sha256:44bcb932c0e88a332e71c3d85aecb67af098ff10aec46f4e8e656678fcc4e7e7',
        'reviewed escape-free Tauri API',
      ],
    ] as const) {
      expect(seventeenthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'StrokeStyle',
        14,
        'sha256:ec1ee1a0110859d8a51e6fef7add0524114a018e5ce4bb456d8f0d1707c3d278',
        'reviewed escape-free stroke style',
      ],
      [
        'Socket',
        14,
        'sha256:b86755aef7f21cdbdf6fe0f9b1b5da2c48bbf6395e26a4466d9c7d69a153cfe6',
        'reviewed escape-free socket',
      ],
      [
        'Physics2DDebugGeometry',
        14,
        'sha256:1f8b276b48280ac169c1a2fd693088116385bea498fd8d80746091ed5a42729a',
        'reviewed escape-free physics debug geometry',
      ],
      [
        'Modifier',
        14,
        'sha256:796da4037514e9798f33666107ab84b3e7a4d1656e87ad4354d2508e6a10dd38',
        'reviewed escape-free modifier',
      ],
      [
        'StatechartState',
        13,
        'sha256:decf7fe340c128e6a1f153a139af5a745851388a7c362e4660bb156def070f05',
        'reviewed escape-free statechart state',
      ],
    ] as const) {
      expect(eighteenthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'SpriteData',
        13,
        'sha256:0a192307a03c8542e477cc8b64353c3b5de08c6cde73bec89ca39694c56943b4',
        'reviewed escape-free sprite data',
      ],
      [
        'Skeleton2DIkConstraint',
        13,
        'sha256:3c0fee3ae382d16ba3cd1c9fc452d167718acbfee3812c43c4f7942f1c656469',
        'reviewed escape-free skeleton IK constraint',
      ],
      [
        'Physics2DRayResult',
        13,
        'sha256:dcd5f590b1f242ab29d2afd97181bbc6e1cfeb173ca544ef716f2f321130ebd8',
        'reviewed escape-free physics ray result',
      ],
      [
        'PbrExtension',
        13,
        'sha256:fe60b141f962890b1a4304cac98fcfa9c5c81e8831ac27ee0fa728625f276013',
        'reviewed escape-free PBR extension',
      ],
      [
        'NativeTextRuntime',
        13,
        'sha256:a31ec0e776fefad7311e898f90401d6895f78c493ec129f623f6512f580a2a18',
        'reviewed escape-free native text runtime',
      ],
    ] as const) {
      expect(nineteenthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'MatcapMaterial',
        13,
        'sha256:8b4467696325ff69cdbe538077a2259a9bd9f7007df08e3a49a165bf267de4e8',
        'reviewed escape-free matcap material',
      ],
      [
        'LottieShapePath',
        13,
        'sha256:ce922284ec58aebfe1997133806dde22e7754a0ac71bda478870249b6a938926',
        'reviewed escape-free Lottie shape path',
      ],
      [
        'GlRenderEffectApplicationExplanation',
        13,
        'sha256:15e53d2503c0496748f20338561a40b594875934b0cd93d9ea5cf712d7b4bbe4',
        'reviewed escape-free WebGL render-effect explanation',
      ],
      [
        'FlexLayoutItemStyle',
        13,
        'sha256:5f78f38895f44208c6b9992633e77f10e15cd707cbd579918a67aa00701daa26',
        'reviewed escape-free flex item style',
      ],
      [
        'BitmapFingerprint',
        13,
        'sha256:50b5f1e7cf212f956951395d3caf98ac9fefcaaf982b3bc77b182c1b6ae2ecde',
        'reviewed escape-free bitmap fingerprint',
      ],
    ] as const) {
      expect(twentiethHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'AccessibilityState',
        13,
        'sha256:1f209c4f7d90191f56d8beee8987f5e88fd79dde04fdb55d2259a7ed5061c8e7',
        'reviewed escape-free accessibility state',
      ],
      [
        'WgpuVideoTextureEntry',
        12,
        'sha256:da0f630196cf440da445e080b9729ba42c3fb30d7645cfdfac1fd789e78c86cd',
        'reviewed escape-free WebGPU video texture entry',
      ],
      [
        'WgpuShapeMesh',
        12,
        'sha256:a7bf1ac799a7a857268d1b05541826b1ec19e7b1e3f640d485b2a77dfdf793aa',
        'reviewed escape-free WebGPU shape mesh',
      ],
      [
        'WgpuScene3DDrawEntry',
        12,
        'sha256:b4d8b046bbaf156d910380ce47f8e5eb9bdcdfac78735a793394fc189153168d',
        'reviewed escape-free WebGPU Scene3D draw entry',
      ],
      [
        'VignetteEffect',
        12,
        'sha256:f41110d11eecb97849c3d3c836b7c17e79b58e5fa50dc2486f4e58366b4f3fbe',
        'reviewed escape-free vignette effect',
      ],
    ] as const) {
      expect(twentyFirstHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'CanvasRenderEffectPipeline',
        12,
        'sha256:f0f92129b058ee5f05cd9b1720f2d60db4a348e6e4db086f74a9ceb8718520af',
        'reviewed escape-free Canvas render-effect pipeline',
      ],
      [
        'ColorAdjustmentRuntime',
        12,
        'sha256:6af421b0c66043312dce3e7248225fbb43b0df05efaec7f3186f4f863b33dd93',
        'reviewed escape-free color-adjustment runtime',
      ],
      [
        'GlScene3DDrawEntry',
        12,
        'sha256:4e3a499b44071f2a83f997c36a83d95dd82c343b59af35480c3a88fa1d605add',
        'reviewed escape-free WebGL Scene3D draw entry',
      ],
      [
        'ShadedMaterialOptions',
        12,
        'sha256:3f073246cc4c3bc480231452c128a1e7887dfcbe84ace00b3cabb63a2b5a4f9b',
        'reviewed escape-free shaded-material options',
      ],
      [
        'RenderEffectPadding',
        12,
        'sha256:b38af857c9f1ced8a0efa777f84273e301f75abdceb65a7180dd2eef56c4802d',
        'reviewed escape-free render-effect padding',
      ],
    ] as const) {
      expect(twentySecondHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'TiledTilesetTile',
        14,
        'sha256:f20a5988a4c187a5ab14cafc6d9e22031b7dd254f8a130eb362beafdafe8fe92',
        'reviewed escape-free Tiled tileset tile',
      ],
      [
        'TiledTilesetRef',
        13,
        'sha256:240a78b98b30601002a1f3bfa62be8394bd11f25ff22d798f7c1ac216d01ba3b',
        'reviewed escape-free Tiled tileset reference',
      ],
      [
        'TiledProperty',
        4,
        'sha256:e8f81c64bbdac1c2bfe70e245844a7449d62dfc1978d2a4d1340dd6f30e16109',
        'reviewed escape-free Tiled property',
      ],
      [
        'TiledTilesetTileFrame',
        2,
        'sha256:d03a4ec13a0db461ca7538d2c409c6030e58dc2cc2c5929fe64061d173a5d9a8',
        'reviewed escape-free Tiled tileset tile frame',
      ],
      [
        'TiledGid',
        1,
        'sha256:24fed34412a32b4a4ec7eb62f8605d0827907769a2c1dc6e641efe2b97808e4e',
        'reviewed escape-free Tiled gid',
      ],
    ] as const) {
      expect(tilemapTiledCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'CanvasRenderEffectContext',
        42,
        'sha256:56f73a3c7c106c2cfc9affd8f47d517ff6685a4a5bad8083b9d9fe76d3fcf217',
        'reviewed escape-free Canvas render-effect context',
      ],
      [
        'GlRenderEffectContext',
        155,
        'sha256:fdc15a042a1a80053691e6e5e9fdcec40ccc068adde5e22e51ae98764f1520a6',
        'reviewed escape-free WebGL render-effect context',
      ],
      [
        'WgpuRenderEffectContext',
        147,
        'sha256:fd9b6f3f63bcd3f4391e10fb091fcb7444196085bcefc1d301287787dfe3a3e2',
        'reviewed escape-free WebGPU render-effect context',
      ],
      [
        'GlScene3DRuntime',
        132,
        'sha256:4699244536c3feef6f3f739f35112b90e8382c1ec3ae5327e196af03c3d85b16',
        'reviewed escape-free WebGL scene runtime',
      ],
      [
        'WgpuScene3DRuntime',
        276,
        'sha256:4dab30bcdbb8075f68a1edc7500087cb2a72c3202eb16b2ffb6f143591215923',
        'reviewed escape-free WebGPU scene runtime',
      ],
    ] as const) {
      expect(renderContextRuntimeCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'QuadBatchData',
        130,
        'sha256:c5ddb66c3aa664642f434b204e28cd767990fb68dccd61d95ddce1217b271f85',
        'reviewed escape-free quad batch data',
      ],
      [
        'CanvasShapeDrawState',
        115,
        'sha256:02c299290855d11a256afa1f89ac05ea04f2bd5c9cfbd95f9b8f313c8291d5dc',
        'reviewed escape-free Canvas shape draw state',
      ],
      [
        'Scene3DDocument',
        115,
        'sha256:8917d122db3e102ae4d684a953b0aace8b57597d4e4b6b10c66a3af8f3b19094',
        'reviewed escape-free Scene3D document',
      ],
      [
        'OrbitCameraController',
        104,
        'sha256:b5f317c10fcee34f5c8ab37de7d06314754e9bcc0fb48124146a562f9117cb5f',
        'reviewed escape-free orbit camera controller',
      ],
      [
        'RiveCoreObject',
        104,
        'sha256:9252f9146b93933f51443521632f05794eed7f39a6e8059a7ae12d86167e16ac',
        'reviewed escape-free Rive core object',
      ],
    ] as const) {
      expect(nextHotCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'AnimationTrack',
        99,
        'sha256:a3e8b0a6c23713f4d8e46cae1937cd775b8337ee098c6b36ecb5a906b35a8a44',
        'reviewed escape-free animation track',
      ],
      [
        'Tween',
        91,
        'sha256:6903b4fa8a509237f7ff329abd18f797ff86f22fe5115266aa530240bdad1859',
        'reviewed escape-free tween state',
      ],
      [
        'AnimationChannel',
        89,
        'sha256:bdb2b9a80b19b26d3da6a39bd5641971941622f788716891ce6a299c97dd325b',
        'reviewed escape-free animation channel',
      ],
      [
        'AnimationPlayer',
        61,
        'sha256:7737db1e82e8f1bf7d07b4ebd21bd0f18946927b22ba3b0216c93a3d85241c6d',
        'reviewed escape-free animation player',
      ],
      [
        'Timeline',
        55,
        'sha256:aaf49d1e409fd3c60824a648cf8edd8e53ad11411923a0b5ab74c34be4da89a6',
        'reviewed escape-free timeline state',
      ],
    ] as const) {
      expect(animationTimelineCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'RiveArtboardGraph',
        101,
        'sha256:44aafe6b8ad37be7a692fd5ee540a56e2b48628f12925791a38e546b9f3e5987',
        'reviewed escape-free Rive artboard graph',
      ],
      [
        'RiveProperty',
        77,
        'sha256:33b8ffeb2ffb3539affbe33b3665d4d8946af0486ae79f57a1ac3062d75617c5',
        'reviewed escape-free Rive property',
      ],
      [
        'RivePathRecord',
        15,
        'sha256:c9e4515a60d200d26308fa2a4d98c62ed83db38350d9545f6ef795ad4dd0edc7',
        'reviewed escape-free Rive path record',
      ],
      [
        'RiveFileAsset',
        6,
        'sha256:e705df1c2ba082092310edcd7d71a4484273ee3cfd2d09ba1a644921b06566be',
        'reviewed escape-free Rive file asset',
      ],
      [
        'RiveDocumentImportResult',
        6,
        'sha256:c4246370c176d4205f5e869630515aeaf9affbf5d1a594c50a0c8d82e0d371d0',
        'reviewed escape-free Rive document import result',
      ],
    ] as const) {
      expect(riveDocumentCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'TextInputState',
        100,
        'sha256:b8c71131b48fb802bf08fc22ab717a50b460ecb96f29c0d9615fb6319184d31c',
        'reviewed escape-free text-input state',
      ],
      [
        'KeyboardEventData',
        62,
        'sha256:31ee934c70dc671de1fcf994c61ced46730f1b001bc666d65bcd71240f0101a3',
        'reviewed escape-free keyboard event data',
      ],
      [
        'InputManager',
        48,
        'sha256:acb1ec5a0825eae2955aba234b8019647bfebc6c07a57b04c1ffb62af7cc98bd',
        'reviewed escape-free input manager',
      ],
      [
        'InputPointerData',
        45,
        'sha256:68dfff739dbd1da432c2948738490cd16465a4b8165214a711165ef6c7f52acc',
        'reviewed escape-free input pointer data',
      ],
      [
        'InputKeyboardData',
        33,
        'sha256:771b0863ccf5de23a04937149a041c06baa00c7f1fdc857df31c9928a0953f0d',
        'reviewed escape-free input keyboard data',
      ],
    ] as const) {
      expect(inputStateCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'StandardPbrMaterialProperties',
        92,
        'sha256:44fad9b5706a5df98cf0027a1603a725ef02feb70f58928c41700c9d56bd5de4',
        'reviewed escape-free standard PBR material properties',
      ],
      [
        'ShadedMaterial',
        56,
        'sha256:f012cad97304e5b646c0f93382b021b88256802524f06f31c7c237f4904454f6',
        'reviewed escape-free shaded material',
      ],
      [
        'SpecularGlossinessPbrMaterial',
        52,
        'sha256:0507be5be486444087da384892e2e4cc933f986b96fce65dc8cae8f6304a069f',
        'reviewed escape-free specular-glossiness PBR material',
      ],
      [
        'PhongMaterial',
        43,
        'sha256:64e437f2e5a0160d04bbc20e190fa582580cd6407ac92088e8b008e8c8d4aa9b',
        'reviewed escape-free Phong material',
      ],
      [
        'BlinnPhongMaterial',
        43,
        'sha256:1ad81b90e44e80bd524b045aac2be2bc6a069473749743258d893377441f0194',
        'reviewed escape-free Blinn-Phong material',
      ],
    ] as const) {
      expect(materialCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'RenderStateRuntime',
        82,
        'sha256:b27249a8cd675e578a7deb9802c0ebbf90928b97b9000fc7b47a1165ad38f419',
        'reviewed escape-free render-state runtime',
      ],
      [
        'RenderProxy',
        66,
        'sha256:f0d40c25ffe0591e6ea74f08dd22ec61859b14d72b08dbf54d2b642fd68e5cb9',
        'reviewed escape-free render proxy',
      ],
      [
        'DomRenderStateRuntime',
        52,
        'sha256:2fc485e81e3cee06d54afe96b9e729f984503a325de3c0fa9fb2eb466f01ed3b',
        'reviewed escape-free DOM render-state runtime',
      ],
      [
        'ResolvedRenderTargetDescriptor',
        49,
        'sha256:f1ab7ec236b568f33e9b66eec91b29426d97375591f5060c6a649f9439d5d083',
        'reviewed escape-free resolved render-target descriptor',
      ],
      [
        'Scene3DRenderProxy',
        48,
        'sha256:79df9e528430e381be2d9b7b98b30e5784f18d6f57932943ae5ef00f34daaed5',
        'reviewed escape-free Scene3D render proxy',
      ],
    ] as const) {
      expect(renderRuntimeCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'Velocity2D',
        86,
        'sha256:9857efd596ffe6f3cd132688ed2264e350ad971fb56bbc6ab0c21e04bf59a1f8',
        'reviewed escape-free 2D velocity',
      ],
      [
        'CollisionTimeOfImpact',
        61,
        'sha256:daa52fb2451e8e19fe83cb7d0c336ee6443aa4ce7bed4067a08e12c74835c407',
        'reviewed escape-free collision time of impact',
      ],
      [
        'Physics2DMassData',
        45,
        'sha256:4db498c8ac68087d55e1489e845ae6c93c321ef8e63c84e2848d03acd2aca853',
        'reviewed escape-free physics mass data',
      ],
      [
        'CollisionManifold',
        45,
        'sha256:3faf5007f7f5fcf04ee37c934cfbdb99659201a81ab1a767ebe1727536076405',
        'reviewed escape-free collision manifold',
      ],
      [
        'CollisionContactManifold',
        44,
        'sha256:6dfc439ab4ce910b63d1d1a0ad76eaa0bb434fe5a5a17db5b8af67a6ca5332ef',
        'reviewed escape-free collision contact manifold',
      ],
    ] as const) {
      expect(collisionPhysicsCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'Physics2DPrismaticJoint',
        44,
        'sha256:7047314bcb16b3ebe3626298c25398572a66360e5e872133b33a21415c4e2e88',
        'reviewed escape-free physics prismatic joint',
      ],
      [
        'Physics2DPulleyJoint',
        29,
        'sha256:a169f1f5512b2bf35e7587690e6ef634681878d267026c2ab03a3dafd517ed12',
        'reviewed escape-free physics pulley joint',
      ],
      [
        'Physics2DGearJoint',
        29,
        'sha256:7a2a5c30028a7ebe59854b90338612f99a484da9d05bd71eaaa7de448bbb2b7c',
        'reviewed escape-free physics gear joint',
      ],
      [
        'Physics2DWheelJoint',
        27,
        'sha256:70b93b46c79fe10b1370af8bf3c98f46e51df7082eb8bc53ed35ae7680de8fd4',
        'reviewed escape-free physics wheel joint',
      ],
      [
        'Physics2DRevoluteJoint',
        26,
        'sha256:f45bdd8ec8f78d20609e6978dab03cf413f0cd31305168d66313d7eb273099a1',
        'reviewed escape-free physics revolute joint',
      ],
    ] as const) {
      expect(physicsJointCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'Skeleton2D',
        66,
        'sha256:4c5c7df2276c0ba36c720adc9c2f10a21508a54448a1f67dcb2587581d3ca5c2',
        'reviewed escape-free 2D skeleton',
      ],
      [
        'Skeleton3D',
        41,
        'sha256:31eb650a945dc248ce93c5e25b2cd1fdf0f3ad4576ca1b19dc10acd77f99e5e7',
        'reviewed escape-free 3D skeleton',
      ],
      [
        'MeshSkinBindPose',
        36,
        'sha256:736e4bf4ec95bf4937e25e58fcd614373bff9626fbfd4431685b2b025bd9f67c',
        'reviewed escape-free mesh skin bind pose',
      ],
      [
        'SkinAttachment2D',
        20,
        'sha256:5b923770aadf08c459c517186e28a6ca1a7ffcabd35a29d8d97ca742aa95996c',
        'reviewed escape-free 2D skin attachment',
      ],
      [
        'Skeleton2DPathConstraint',
        16,
        'sha256:3831dc7503c830297819df165667142b18595623fb5320f616539f5dbb48b1bd',
        'reviewed escape-free 2D skeleton path constraint',
      ],
    ] as const) {
      expect(skeletonSkinCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'AnimationStateMachine',
        53,
        'sha256:fe1c6f9a7092aaf16cd71f41a141a74e9ef235eec04fa6afa7ea048439b63fde',
        'reviewed escape-free animation state machine',
      ],
      [
        'StatechartInstance',
        52,
        'sha256:99282de81a9db1f080a9e203455b3ae137163ab87e2b608b70d3defc5949fa86',
        'reviewed escape-free statechart instance',
      ],
      [
        'StatechartTransition',
        23,
        'sha256:ee1a1c67324b9c8fb812541fc64da6edb13d01144a9bfd7289e47a151cefd755',
        'reviewed escape-free statechart transition',
      ],
      [
        'AnimationCrossfade',
        23,
        'sha256:592fba8ca0e3d4c3037c94796a1c24af517eaa4337ffd428ae340ca7f8c0bf29',
        'reviewed escape-free animation crossfade',
      ],
      [
        'Statechart',
        21,
        'sha256:cfe564914537b7c6b1f9b16a293e7a1b8c28d3d743a920f8054b8d1304fa39b7',
        'reviewed escape-free statechart',
      ],
    ] as const) {
      expect(stateMachineCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'TextureContainer',
        62,
        'sha256:8ec3670c4d9138ddabd2f31f44282b7a63234e7b28abfeaaa79fb46b60386ac4',
        'reviewed escape-free texture container',
      ],
      [
        'TextureContainerLevel',
        32,
        'sha256:22098c0143137cb3701785c749ec0e7c11469f7bd572f09d9e5d884bb1662a2a',
        'reviewed escape-free texture container level',
      ],
      [
        'RenderTexture',
        30,
        'sha256:0bd021297d7eda8245da83f5d68c7bc9458594d019d2b8fe0106ff9cc338fcb0',
        'reviewed escape-free render texture',
      ],
      [
        'GlRenderTextureEntry',
        24,
        'sha256:a7fa638af0c9e6325e55fe5a74a9b9a6af64eb5bcba6dd5adbd45c089c1d8836',
        'reviewed escape-free WebGL render-texture entry',
      ],
      [
        'WgpuRenderTextureEntry',
        23,
        'sha256:a5243909363d6d37ff704867c3df7bbceae877b0eac612d58b88af423e746572',
        'reviewed escape-free WebGPU render-texture entry',
      ],
    ] as const) {
      expect(textureContainerCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'Scene3DHit',
        83,
        'sha256:1f1a4f489fe6eccd17a7e7fa5d1f588954faea0ba5f647040ad72640141a377c',
        'reviewed escape-free Scene3D hit',
      ],
      [
        'CollisionRaycastHit',
        32,
        'sha256:0fc37ebc201db4f24d23947b080f8715be1cf57f2413f81e5ba05b274d3134d4',
        'reviewed escape-free collision raycast hit',
      ],
      [
        'Physics2DRayHit',
        31,
        'sha256:9094ab4baa041a3973eb2471908827999044b59892109431e6ce46c93436a483',
        'reviewed escape-free physics ray hit',
      ],
      [
        'VelocitySample',
        29,
        'sha256:735f8f6b33ae4a5c730243d8695d7b81baf6bb3777af4dd6effa7492f291b1b1',
        'reviewed escape-free velocity sample',
      ],
      [
        'CollisionContactPoint',
        25,
        'sha256:0972cae3f54ba0ec4d0e1833767f11ab476578197e212b0dcb988637891ba0fa',
        'reviewed escape-free collision contact point',
      ],
    ] as const) {
      expect(hitAndContactCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'RichTextRuntime',
        60,
        'sha256:8366b22af6581d9b3d860205d8d5245e7bb40398342313332aa3c7da2e420aa1',
        'reviewed escape-free rich-text runtime',
      ],
      [
        'TextLabelData',
        51,
        'sha256:d94505d93827743797a2c6724668ebc639ebab71ea755df4bdc4fee0ae7971e5',
        'reviewed escape-free text-label data',
      ],
      [
        'BitmapTextPage',
        39,
        'sha256:d2115dbabb239acfc6288812800f14051a58f3141d2cff821ddea724af316ba8',
        'reviewed escape-free bitmap-text page',
      ],
      [
        'TextLabel',
        28,
        'sha256:f0658231700532c1d5a1d52e203c8f41115d1e60669fa2fd9a98bad1aacb4416',
        'reviewed escape-free text label',
      ],
      [
        'ShapedRun',
        26,
        'sha256:8b0fb4643dfec361ac4d51caaaef5867c9e05efc2ef364fddcf328380fc07ac5',
        'reviewed escape-free shaped run',
      ],
    ] as const) {
      expect(textRuntimeCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'Shape',
        41,
        'sha256:2b31b5b9c65d277eeeeb327a2e2fcb4452dfbc7cb3117508c5bafbdd7d741f34',
        'reviewed escape-free shape',
      ],
      [
        'Scale9Shape',
        39,
        'sha256:c4d9690d18b21e3fb00e7e50dfe7d187fcf5b4135c164263b85824d18571e746',
        'reviewed escape-free scale-9 shape',
      ],
      [
        'ShapeData',
        38,
        'sha256:c3677e835bf0844d2df50b06f28145cdeebf386b4c0f584f8296158a84558aa4',
        'reviewed escape-free shape data',
      ],
      [
        'MorphShape',
        36,
        'sha256:4d520958150bb3f2e2c1beebf07d580ca947c836dca809a68b34ea205143529c',
        'reviewed escape-free morph shape',
      ],
      [
        'MorphShapeData',
        30,
        'sha256:3c3ad2fcb2496c19ddf40cd7c5c6c20d5ddde69456be127c40066abd544b30e8',
        'reviewed escape-free morph-shape data',
      ],
    ] as const) {
      expect(shapeDataCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'GlMeshProgram',
        43,
        'sha256:25ac84d4effc1f1758fbadbe9e06fde068ef3b4b8fc74721bf1940acb3180003',
        'reviewed escape-free WebGL mesh program',
      ],
      [
        'GlClassicProgram',
        37,
        'sha256:b20947fd9184317c7f029c89d578561437626fa7ec03965c083784006319e1ec',
        'reviewed escape-free WebGL classic program',
      ],
      [
        'GlMeshUpload',
        35,
        'sha256:ea701c770e76279c2c1ed247f4e08cca4953589f33791d7e9964c4acbb38c508',
        'reviewed escape-free WebGL mesh upload',
      ],
      [
        'GlParticleShader',
        34,
        'sha256:92ef9e960d48ccadf9d840f3dc2863ee3f64c2089ea081effa5c2ecaa9d1a079',
        'reviewed escape-free WebGL particle shader',
      ],
      [
        'GlPbrProgram',
        30,
        'sha256:6abe913b84fc928aa0aa4bbda552125819c350c09026b795363905f3f0410759',
        'reviewed escape-free WebGL PBR program',
      ],
    ] as const) {
      expect(glProgramCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'BevelEffect',
        39,
        'sha256:58ebca8ad2f0cc535020211940a5e2321e01db30093d6a5988a44efb977cdd04',
        'reviewed escape-free bevel effect',
      ],
      [
        'DropShadowEffect',
        37,
        'sha256:6848511a980718c7082335e4839bb93de5a772a3a8714f0f1a720796bc2ca393',
        'reviewed escape-free drop-shadow effect',
      ],
      [
        'GradientBevelEffect',
        34,
        'sha256:76e90209baf6a5c6e39df6d8af199bc57e81f9812b2b9e6407b949000f3c38ab',
        'reviewed escape-free gradient-bevel effect',
      ],
      [
        'InnerShadowEffect',
        30,
        'sha256:7183cdb448684c12099a20b237230f777d4b82a482de25e13c022cf188053e0b',
        'reviewed escape-free inner-shadow effect',
      ],
      [
        'OuterGlowEffect',
        27,
        'sha256:ec80a0d48ff955f3df6a19bad5643e1e576384f33c4c3ba299bd5e14d2253eff',
        'reviewed escape-free outer-glow effect',
      ],
    ] as const) {
      expect(directionalEffectCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'GlScissorRect',
        38,
        'sha256:c5eed51656152d130c5bd39967bda2fdec09e68c7666b1789992993ec2ac9b57',
        'reviewed escape-free WebGL scissor rectangle',
      ],
      [
        'WgpuScissorRect',
        36,
        'sha256:34dfe22efbf1d2f4e16ac9a93fc703b8a54032d9ea689c75c5e61549dc76a3c9',
        'reviewed escape-free WebGPU scissor rectangle',
      ],
      [
        'CanvasRenderStateRuntime',
        34,
        'sha256:be617f3f8f9f830df9da893eee28eeb9740c2f15a2e4462f451c6d3191c0ca99',
        'reviewed escape-free Canvas render-state runtime',
      ],
      [
        'GlRenderEffectPipeline',
        27,
        'sha256:ea1b2223d50df5b640545106804895714d12cb99a7838ab014ed2e3816d701a9',
        'reviewed escape-free WebGL render-effect pipeline',
      ],
      [
        'WgpuRenderEffectPipeline',
        27,
        'sha256:a7039648e61c44e19af4213680f60efe61ad6452ffc0b16c420927d0116c0349',
        'reviewed escape-free WebGPU render-effect pipeline',
      ],
    ] as const) {
      expect(backendStatePipelineCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'VertexDisplaceModifier',
        38,
        'sha256:6e37b62b50d5b48500aae731c8675045a8e2096273488315f353d68df10c6e8c',
        'reviewed escape-free vertex-displacement modifier',
      ],
      [
        'AnimatedNormalModifier',
        30,
        'sha256:ffe9e013055090ced18c33db3dc23624189ee7c37ad89167e5ab4878f51bab9c',
        'reviewed escape-free animated-normal modifier',
      ],
      [
        'EmissiveModifier',
        26,
        'sha256:1a8dbcef5fd253b0791b984f6f9941f1d377d618e6cffc3d199824faebde91f9',
        'reviewed escape-free emissive modifier',
      ],
      [
        'FogModifier',
        19,
        'sha256:0ddef0017cb9786dae56bccef54787182c9ff0a31489f925f8ac31bcf61731a4',
        'reviewed escape-free fog modifier',
      ],
      [
        'DissolveModifier',
        17,
        'sha256:b4447f68b4d80c5a7fc46ba4dfaedef76ea959785551545cb6cb49842f894138',
        'reviewed escape-free dissolve modifier',
      ],
    ] as const) {
      expect(shadingModifierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'Physics2DWorld',
        217,
        'sha256:a28a94c95326e5405d33feda957ea8ee57399e1266dae9f9d7c88218d945a9fe',
        'reviewed escape-free physics world',
      ],
      [
        'Physics2DContact',
        157,
        'sha256:3a89f0bc11ff1e68096dbb0499ae192d3abb1cde4962391c47b614b9bc6d616f',
        'reviewed escape-free physics contact',
      ],
      [
        'Physics2DSolverConfig',
        55,
        'sha256:29644de2ca268e7003a01a34866533f5279d4bc6da62b2de3f2f702b1a5eaaab',
        'reviewed escape-free physics solver config',
      ],
      [
        'Physics2DCollider',
        47,
        'sha256:61a33980287691a1d2e1de55628a62dc799ca4529f6c87a035683162ee3e72ce',
        'reviewed escape-free physics collider',
      ],
      [
        'ClipRegion',
        151,
        'sha256:f73b90fe6168b429bc413bda84ebe794b96c7345e5da4ab65264c4241d9995b2',
        'reviewed escape-free clip region',
      ],
    ] as const) {
      expect(physicsAndClipCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, directAccesses, declarationFingerprint, purpose] of [
      [
        'RichText',
        166,
        'sha256:ede1beea3240687757ee8455992b246d3497476a47de43d9b8e5d02d8b73abe7',
        'reviewed escape-free rich text',
      ],
      [
        'RichTextContent',
        48,
        'sha256:048d186739d8bfe34b14f636cd57fb89116b401bab1347c3742749f04b2838be',
        'reviewed escape-free rich-text content',
      ],
      [
        'RichTextData',
        249,
        'sha256:fa82e08e1863fcc75e3ed9619dc8585f19565703bc84971444398c1df93031eb',
        'reviewed escape-free rich-text data',
      ],
      [
        'TextLayoutGroup',
        300,
        'sha256:25a70f58982f05188d38a15abf985c669e653dddf4bebfad31755210bff86a5b',
        'reviewed escape-free text-layout group',
      ],
      [
        'TextLayoutResult',
        128,
        'sha256:0775b68e5d326626f79c05fb51f2b81d734453706da315289b1c8772c0062d88',
        'reviewed escape-free text-layout result',
      ],
    ] as const) {
      expect(textStructCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses, mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    expect(classAuditById.get('@flighthq/types:interface#BitmapRegion')?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: [],
    });
    expect(provenanceById.get('@flighthq/types:interface#BitmapRegion')?.nominalIdentity).toEqual({
      blockerReasons: [],
      closed: true,
    });
    for (const renderStateRuntimeId of [
      '@flighthq/types:interface#GlRenderStateRuntime',
      '@flighthq/types:interface#WgpuRenderStateRuntime',
    ]) {
      expect(classAuditById.get(renderStateRuntimeId)?.migration).toEqual({
        mechanicallyCompatible: false,
        normalizationReasons: ['cross-schema-transfer'],
        observabilityReasons: [],
      });
      expect(provenanceById.has(renderStateRuntimeId)).toBe(false);
    }
    for (const [renderTargetId, normalizationReasons, observabilityReasons] of [
      ['@flighthq/types:interface#CanvasRenderTarget', ['anonymous-structural-transfer'], []],
      ['@flighthq/types:interface#GlRenderTarget', ['anonymous-structural-transfer'], []],
      ['@flighthq/types:interface#RenderTarget', ['cross-schema-transfer'], []],
      [
        '@flighthq/types:interface#RenderTargetDescriptor',
        ['anonymous-structural-transfer', 'cross-schema-transfer', 'object-literal-spread'],
        ['optional-omission'],
      ],
      ['@flighthq/types:interface#WgpuRenderTarget', ['anonymous-structural-transfer'], []],
    ] as const) {
      expect(classAuditById.get(renderTargetId)?.migration).toEqual({
        mechanicallyCompatible: false,
        normalizationReasons,
        observabilityReasons,
      });
      expect(provenanceById.has(renderTargetId)).toBe(false);
    }
    for (const richTextId of ['@flighthq/types:interface#RichText', '@flighthq/types:interface#RichTextData']) {
      expect(classAuditById.get(richTextId)?.migration).toEqual({
        mechanicallyCompatible: false,
        normalizationReasons: ['cross-schema-transfer'],
        observabilityReasons: [],
      });
      expect(provenanceById.has(richTextId)).toBe(false);
    }
    for (const textStructId of [
      '@flighthq/types:interface#RichTextContent',
      '@flighthq/types:interface#TextLayoutGroup',
      '@flighthq/types:interface#TextLayoutResult',
    ]) {
      expect(classAuditById.get(textStructId)?.migration).toEqual({
        mechanicallyCompatible: true,
        normalizationReasons: [],
        observabilityReasons: [],
      });
      expect(provenanceById.get(textStructId)?.nominalIdentity).toEqual({
        blockerReasons: ['normalization-provenance'],
        closed: false,
      });
    }
    for (const physicsStructId of [
      '@flighthq/types:interface#Physics2DCollider',
      '@flighthq/types:interface#Physics2DContact',
      '@flighthq/types:interface#Physics2DSolverConfig',
      '@flighthq/types:interface#Physics2DWorld',
    ]) {
      expect(classAuditById.get(physicsStructId)?.migration).toEqual({
        mechanicallyCompatible: true,
        normalizationReasons: [],
        observabilityReasons: [],
      });
      expect(provenanceById.get(physicsStructId)?.nominalIdentity).toEqual({
        blockerReasons: [],
        closed: true,
      });
    }
    const clipRegionId = '@flighthq/types:interface#ClipRegion';
    expect(classAuditById.get(clipRegionId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: [],
    });
    expect(provenanceById.get(clipRegionId)?.nominalIdentity).toEqual({
      blockerReasons: ['normalization-provenance'],
      closed: false,
    });
    for (const effectContextId of [
      '@flighthq/types:interface#CanvasRenderEffectContext',
      '@flighthq/types:interface#GlRenderEffectContext',
      '@flighthq/types:interface#WgpuRenderEffectContext',
    ]) {
      expect(classAuditById.get(effectContextId)?.migration).toEqual({
        mechanicallyCompatible: true,
        normalizationReasons: [],
        observabilityReasons: [],
      });
      expect(provenanceById.get(effectContextId)?.nominalIdentity).toEqual({
        blockerReasons: [],
        closed: true,
      });
    }
    const glScene3DRuntimeId = '@flighthq/types:interface#GlScene3DRuntime';
    expect(classAuditById.get(glScene3DRuntimeId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: ['optional-omission'],
    });
    expect(provenanceById.has(glScene3DRuntimeId)).toBe(false);
    const wgpuScene3DRuntimeId = '@flighthq/types:interface#WgpuScene3DRuntime';
    expect(classAuditById.get(wgpuScene3DRuntimeId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: [],
    });
    expect(provenanceById.has(wgpuScene3DRuntimeId)).toBe(false);
    const canvasShapeDrawStateId = '@flighthq/types:interface#CanvasShapeDrawState';
    expect(classAuditById.get(canvasShapeDrawStateId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: [],
    });
    expect(provenanceById.get(canvasShapeDrawStateId)?.nominalIdentity).toEqual({
      blockerReasons: [],
      closed: true,
    });
    for (const [id, blockerReason] of [
      ['@flighthq/types:interface#QuadBatchData', 'normalization-provenance'],
      ['@flighthq/types:interface#RiveCoreObject', 'container-transfer'],
      ['@flighthq/types:interface#Scene3DDocument', 'container-transfer'],
    ] as const) {
      expect(classAuditById.get(id)?.migration).toEqual({
        mechanicallyCompatible: true,
        normalizationReasons: [],
        observabilityReasons: [],
      });
      expect(provenanceById.get(id)?.nominalIdentity).toEqual({
        blockerReasons: [blockerReason],
        closed: false,
      });
    }
    const orbitCameraControllerId = '@flighthq/types:interface#OrbitCameraController';
    expect(classAuditById.get(orbitCameraControllerId)?.migration).toEqual({
      mechanicallyCompatible: false,
      normalizationReasons: ['cross-schema-transfer'],
      observabilityReasons: [],
    });
    expect(provenanceById.has(orbitCameraControllerId)).toBe(false);
    for (const animationEntityId of [
      '@flighthq/types:interface#AnimationChannel',
      '@flighthq/types:interface#AnimationPlayer',
      '@flighthq/types:interface#AnimationTrack',
    ]) {
      expect(classAuditById.get(animationEntityId)?.migration).toEqual({
        mechanicallyCompatible: false,
        normalizationReasons: ['cross-schema-transfer'],
        observabilityReasons: [],
      });
      expect(provenanceById.has(animationEntityId)).toBe(false);
    }
    const timelineId = '@flighthq/types:interface#Timeline';
    expect(classAuditById.get(timelineId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: ['strict-equality'],
    });
    expect(provenanceById.has(timelineId)).toBe(false);
    const tweenId = '@flighthq/types:interface#Tween';
    expect(classAuditById.get(tweenId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: [],
    });
    expect(provenanceById.get(tweenId)?.nominalIdentity).toEqual({
      blockerReasons: ['container-transfer'],
      closed: false,
    });
    for (const riveDocumentId of [
      '@flighthq/types:interface#RiveArtboardGraph',
      '@flighthq/types:interface#RiveDocumentImportResult',
      '@flighthq/types:interface#RiveFileAsset',
      '@flighthq/types:interface#RivePathRecord',
      '@flighthq/types:interface#RiveProperty',
    ]) {
      expect(classAuditById.get(riveDocumentId)?.migration).toEqual({
        mechanicallyCompatible: true,
        normalizationReasons: [],
        observabilityReasons: [],
      });
      expect(provenanceById.get(riveDocumentId)?.nominalIdentity).toEqual({
        blockerReasons: [],
        closed: true,
      });
    }
    const textInputStateId = '@flighthq/types:interface#TextInputState';
    expect(classAuditById.get(textInputStateId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: [],
    });
    expect(provenanceById.get(textInputStateId)?.nominalIdentity).toEqual({
      blockerReasons: ['normalization-provenance'],
      closed: false,
    });
    const inputKeyboardDataId = '@flighthq/types:interface#InputKeyboardData';
    expect(classAuditById.get(inputKeyboardDataId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: [],
    });
    expect(provenanceById.get(inputKeyboardDataId)?.nominalIdentity).toEqual({
      blockerReasons: [],
      closed: true,
    });
    expect(classAuditById.get('@flighthq/types:interface#KeyboardEventData')?.migration).toEqual({
      mechanicallyCompatible: false,
      normalizationReasons: ['cross-schema-transfer'],
      observabilityReasons: [],
    });
    expect(classAuditById.get('@flighthq/types:interface#InputManager')?.migration).toEqual({
      mechanicallyCompatible: false,
      normalizationReasons: ['object-literal-spread'],
      observabilityReasons: [],
    });
    expect(classAuditById.get('@flighthq/types:interface#InputPointerData')?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: ['object-spread'],
    });
    for (const structuralInputId of [
      '@flighthq/types:interface#KeyboardEventData',
      '@flighthq/types:interface#InputManager',
      '@flighthq/types:interface#InputPointerData',
    ]) {
      expect(provenanceById.has(structuralInputId)).toBe(false);
    }
    for (const materialId of [
      '@flighthq/types:interface#ShadedMaterial',
      '@flighthq/types:interface#StandardPbrMaterialProperties',
    ]) {
      expect(classAuditById.get(materialId)?.migration).toEqual({
        mechanicallyCompatible: false,
        normalizationReasons: ['cross-schema-transfer'],
        observabilityReasons: [],
      });
      expect(provenanceById.has(materialId)).toBe(false);
    }
    for (const materialId of [
      '@flighthq/types:interface#BlinnPhongMaterial',
      '@flighthq/types:interface#PhongMaterial',
      '@flighthq/types:interface#SpecularGlossinessPbrMaterial',
    ]) {
      expect(classAuditById.get(materialId)?.migration).toEqual({
        mechanicallyCompatible: false,
        normalizationReasons: ['cross-schema-transfer'],
        observabilityReasons: ['optional-omission'],
      });
      expect(provenanceById.has(materialId)).toBe(false);
    }
    for (const [renderRuntimeId, mechanicallyCompatible, normalizationReasons, observabilityReasons] of [
      ['@flighthq/types:interface#RenderStateRuntime', false, ['cross-schema-transfer'], []],
      ['@flighthq/types:interface#RenderProxy', false, ['anonymous-structural-transfer', 'cross-schema-transfer'], []],
      ['@flighthq/types:interface#DomRenderStateRuntime', false, ['cross-schema-transfer'], []],
      ['@flighthq/types:interface#ResolvedRenderTargetDescriptor', true, [], ['object-spread']],
      ['@flighthq/types:interface#Scene3DRenderProxy', true, [], ['optional-omission']],
    ] as const) {
      expect(classAuditById.get(renderRuntimeId)?.migration).toEqual({
        mechanicallyCompatible,
        normalizationReasons,
        observabilityReasons,
      });
      expect(provenanceById.has(renderRuntimeId)).toBe(false);
    }
    for (const collisionPhysicsId of [
      '@flighthq/types:interface#CollisionContactManifold',
      '@flighthq/types:interface#CollisionManifold',
      '@flighthq/types:interface#CollisionTimeOfImpact',
      '@flighthq/types:interface#Physics2DMassData',
      '@flighthq/types:interface#Velocity2D',
    ]) {
      expect(classAuditById.get(collisionPhysicsId)?.migration).toEqual({
        mechanicallyCompatible: true,
        normalizationReasons: [],
        observabilityReasons: [],
      });
      expect(provenanceById.get(collisionPhysicsId)?.nominalIdentity).toEqual({
        blockerReasons: [],
        closed: true,
      });
    }
    for (const physicsJointId of [
      '@flighthq/types:interface#Physics2DGearJoint',
      '@flighthq/types:interface#Physics2DPrismaticJoint',
      '@flighthq/types:interface#Physics2DPulleyJoint',
      '@flighthq/types:interface#Physics2DRevoluteJoint',
      '@flighthq/types:interface#Physics2DWheelJoint',
    ]) {
      expect(classAuditById.get(physicsJointId)?.migration).toEqual({
        mechanicallyCompatible: false,
        normalizationReasons: ['cross-schema-transfer', 'object-literal-spread'],
        observabilityReasons: [],
      });
      expect(provenanceById.has(physicsJointId)).toBe(false);
    }
    for (const skeletonId of [
      '@flighthq/types:interface#Skeleton2D',
      '@flighthq/types:interface#Skeleton2DPathConstraint',
      '@flighthq/types:interface#Skeleton3D',
    ]) {
      expect(classAuditById.get(skeletonId)?.migration).toEqual({
        mechanicallyCompatible: false,
        normalizationReasons: ['cross-schema-transfer'],
        observabilityReasons: [],
      });
      expect(provenanceById.has(skeletonId)).toBe(false);
    }
    for (const skinLeafId of [
      '@flighthq/types:interface#MeshSkinBindPose',
      '@flighthq/types:interface#SkinAttachment2D',
    ]) {
      expect(classAuditById.get(skinLeafId)?.migration).toEqual({
        mechanicallyCompatible: true,
        normalizationReasons: [],
        observabilityReasons: [],
      });
      expect(provenanceById.get(skinLeafId)?.nominalIdentity).toEqual({
        blockerReasons: ['normalization-provenance'],
        closed: false,
      });
    }
    for (const animationStateId of [
      '@flighthq/types:interface#AnimationCrossfade',
      '@flighthq/types:interface#AnimationStateMachine',
    ]) {
      expect(classAuditById.get(animationStateId)?.migration).toEqual({
        mechanicallyCompatible: false,
        normalizationReasons: ['cross-schema-transfer'],
        observabilityReasons: [],
      });
      expect(provenanceById.has(animationStateId)).toBe(false);
    }
    const statechartId = '@flighthq/types:interface#Statechart';
    expect(classAuditById.get(statechartId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: ['json-serialization'],
    });
    expect(provenanceById.has(statechartId)).toBe(false);
    for (const statechartRuntimeId of [
      '@flighthq/types:interface#StatechartInstance',
      '@flighthq/types:interface#StatechartTransition',
    ]) {
      expect(classAuditById.get(statechartRuntimeId)?.migration).toEqual({
        mechanicallyCompatible: true,
        normalizationReasons: [],
        observabilityReasons: [],
      });
      expect(provenanceById.get(statechartRuntimeId)?.nominalIdentity).toEqual({
        blockerReasons: [],
        closed: true,
      });
    }
    const renderTextureId = '@flighthq/types:interface#RenderTexture';
    expect(classAuditById.get(renderTextureId)?.migration).toEqual({
      mechanicallyCompatible: false,
      normalizationReasons: ['cross-schema-transfer'],
      observabilityReasons: [],
    });
    expect(provenanceById.has(renderTextureId)).toBe(false);
    const textureContainerId = '@flighthq/types:interface#TextureContainer';
    expect(classAuditById.get(textureContainerId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: ['object-spread'],
    });
    expect(provenanceById.has(textureContainerId)).toBe(false);
    for (const textureLeafId of [
      '@flighthq/types:interface#GlRenderTextureEntry',
      '@flighthq/types:interface#TextureContainerLevel',
      '@flighthq/types:interface#WgpuRenderTextureEntry',
    ]) {
      expect(classAuditById.get(textureLeafId)?.migration).toEqual({
        mechanicallyCompatible: true,
        normalizationReasons: [],
        observabilityReasons: [],
      });
      expect(provenanceById.get(textureLeafId)?.nominalIdentity).toEqual({
        blockerReasons: ['normalization-provenance'],
        closed: false,
      });
    }
    const scene3DHitId = '@flighthq/types:interface#Scene3DHit';
    expect(classAuditById.get(scene3DHitId)?.migration).toEqual({
      mechanicallyCompatible: false,
      normalizationReasons: ['cross-schema-transfer'],
      observabilityReasons: [],
    });
    expect(provenanceById.has(scene3DHitId)).toBe(false);
    for (const hitLeafId of [
      '@flighthq/types:interface#CollisionContactPoint',
      '@flighthq/types:interface#CollisionRaycastHit',
      '@flighthq/types:interface#Physics2DRayHit',
      '@flighthq/types:interface#VelocitySample',
    ]) {
      expect(classAuditById.get(hitLeafId)?.migration).toEqual({
        mechanicallyCompatible: true,
        normalizationReasons: [],
        observabilityReasons: [],
      });
      expect(provenanceById.get(hitLeafId)?.nominalIdentity).toEqual({
        blockerReasons: [],
        closed: true,
      });
    }
    for (const textCrossSchemaId of [
      '@flighthq/types:interface#RichTextRuntime',
      '@flighthq/types:interface#TextLabel',
    ]) {
      expect(classAuditById.get(textCrossSchemaId)?.migration).toEqual({
        mechanicallyCompatible: false,
        normalizationReasons: ['cross-schema-transfer'],
        observabilityReasons: [],
      });
      expect(provenanceById.has(textCrossSchemaId)).toBe(false);
    }
    const shapedRunId = '@flighthq/types:interface#ShapedRun';
    expect(classAuditById.get(shapedRunId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: ['object-spread'],
    });
    expect(provenanceById.has(shapedRunId)).toBe(false);
    const bitmapTextPageId = '@flighthq/types:interface#BitmapTextPage';
    expect(classAuditById.get(bitmapTextPageId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: [],
    });
    expect(provenanceById.get(bitmapTextPageId)?.nominalIdentity).toEqual({
      blockerReasons: ['normalization-provenance'],
      closed: false,
    });
    const textLabelDataId = '@flighthq/types:interface#TextLabelData';
    expect(classAuditById.get(textLabelDataId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: [],
    });
    expect(provenanceById.get(textLabelDataId)?.nominalIdentity).toEqual({
      blockerReasons: ['container-transfer', 'normalization-provenance'],
      closed: false,
    });
    for (const shapeCrossSchemaId of [
      '@flighthq/types:interface#MorphShape',
      '@flighthq/types:interface#Scale9Shape',
    ]) {
      expect(classAuditById.get(shapeCrossSchemaId)?.migration).toEqual({
        mechanicallyCompatible: false,
        normalizationReasons: ['cross-schema-transfer'],
        observabilityReasons: [],
      });
      expect(provenanceById.has(shapeCrossSchemaId)).toBe(false);
    }
    const shapeId = '@flighthq/types:interface#Shape';
    expect(classAuditById.get(shapeId)?.migration).toEqual({
      mechanicallyCompatible: false,
      normalizationReasons: ['cross-schema-transfer', 'dynamic-ingress'],
      observabilityReasons: [],
    });
    expect(provenanceById.has(shapeId)).toBe(false);
    const shapeDataId = '@flighthq/types:interface#ShapeData';
    expect(classAuditById.get(shapeDataId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: [],
    });
    expect(provenanceById.get(shapeDataId)?.nominalIdentity).toEqual({
      blockerReasons: ['normalization-provenance'],
      closed: false,
    });
    const morphShapeDataId = '@flighthq/types:interface#MorphShapeData';
    expect(classAuditById.get(morphShapeDataId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: [],
    });
    expect(provenanceById.get(morphShapeDataId)?.nominalIdentity).toEqual({
      blockerReasons: ['container-transfer', 'normalization-provenance'],
      closed: false,
    });
    for (const spreadProgramId of [
      '@flighthq/types:interface#GlClassicProgram',
      '@flighthq/types:interface#GlPbrProgram',
    ]) {
      expect(classAuditById.get(spreadProgramId)?.migration).toEqual({
        mechanicallyCompatible: false,
        normalizationReasons: ['object-literal-spread'],
        observabilityReasons: [],
      });
      expect(provenanceById.has(spreadProgramId)).toBe(false);
    }
    const glMeshProgramId = '@flighthq/types:interface#GlMeshProgram';
    expect(classAuditById.get(glMeshProgramId)?.migration).toEqual({
      mechanicallyCompatible: false,
      normalizationReasons: ['anonymous-structural-transfer', 'cross-schema-transfer'],
      observabilityReasons: ['optional-omission'],
    });
    expect(provenanceById.has(glMeshProgramId)).toBe(false);
    const glMeshUploadId = '@flighthq/types:interface#GlMeshUpload';
    expect(classAuditById.get(glMeshUploadId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: ['optional-omission'],
    });
    expect(provenanceById.has(glMeshUploadId)).toBe(false);
    const glParticleShaderId = '@flighthq/types:interface#GlParticleShader';
    expect(classAuditById.get(glParticleShaderId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: [],
    });
    expect(provenanceById.get(glParticleShaderId)?.nominalIdentity).toEqual({
      blockerReasons: ['normalization-provenance'],
      closed: false,
    });
    for (const directionalEffectId of [
      '@flighthq/types:interface#BevelEffect',
      '@flighthq/types:interface#DropShadowEffect',
      '@flighthq/types:interface#GradientBevelEffect',
      '@flighthq/types:interface#InnerShadowEffect',
      '@flighthq/types:interface#OuterGlowEffect',
    ]) {
      expect(classAuditById.get(directionalEffectId)?.migration).toEqual({
        mechanicallyCompatible: false,
        normalizationReasons: ['cross-schema-transfer', 'object-literal-spread'],
        observabilityReasons: [],
      });
      expect(provenanceById.has(directionalEffectId)).toBe(false);
    }
    const canvasRenderStateRuntimeId = '@flighthq/types:interface#CanvasRenderStateRuntime';
    expect(classAuditById.get(canvasRenderStateRuntimeId)?.migration).toEqual({
      mechanicallyCompatible: false,
      normalizationReasons: ['cross-schema-transfer'],
      observabilityReasons: [],
    });
    expect(provenanceById.has(canvasRenderStateRuntimeId)).toBe(false);
    for (const closedPipelineId of [
      '@flighthq/types:interface#GlRenderEffectPipeline',
      '@flighthq/types:interface#WgpuRenderEffectPipeline',
    ]) {
      expect(classAuditById.get(closedPipelineId)?.migration).toEqual({
        mechanicallyCompatible: true,
        normalizationReasons: [],
        observabilityReasons: [],
      });
      expect(provenanceById.get(closedPipelineId)?.nominalIdentity).toEqual({ blockerReasons: [], closed: true });
    }
    const wgpuScissorRectId = '@flighthq/types:interface#WgpuScissorRect';
    expect(classAuditById.get(wgpuScissorRectId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: [],
    });
    expect(provenanceById.get(wgpuScissorRectId)?.nominalIdentity).toEqual({
      blockerReasons: ['normalization-provenance'],
      closed: false,
    });
    const glScissorRectId = '@flighthq/types:interface#GlScissorRect';
    expect(classAuditById.get(glScissorRectId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: [],
    });
    expect(provenanceById.get(glScissorRectId)?.nominalIdentity).toEqual({
      blockerReasons: ['container-transfer', 'normalization-provenance'],
      closed: false,
    });
    for (const shadingModifierId of [
      '@flighthq/types:interface#AnimatedNormalModifier',
      '@flighthq/types:interface#DissolveModifier',
      '@flighthq/types:interface#EmissiveModifier',
      '@flighthq/types:interface#VertexDisplaceModifier',
    ]) {
      expect(classAuditById.get(shadingModifierId)?.migration).toEqual({
        mechanicallyCompatible: false,
        normalizationReasons: ['cross-schema-transfer'],
        observabilityReasons: ['optional-omission'],
      });
      expect(provenanceById.has(shadingModifierId)).toBe(false);
    }
    const fogModifierId = '@flighthq/types:interface#FogModifier';
    expect(classAuditById.get(fogModifierId)?.migration).toEqual({
      mechanicallyCompatible: false,
      normalizationReasons: ['cross-schema-transfer'],
      observabilityReasons: [],
    });
    expect(provenanceById.has(fogModifierId)).toBe(false);
    for (const shadingModifierOptionsId of [
      '@flighthq/types:interface#AnimatedNormalModifierOptions',
      '@flighthq/types:interface#DissolveModifierOptions',
      '@flighthq/types:interface#EmissiveModifierOptions',
      '@flighthq/types:interface#FogModifierOptions',
      '@flighthq/types:interface#VertexDisplaceModifierOptions',
    ]) {
      expect(classAuditById.get(shadingModifierOptionsId)?.migration).toEqual({
        mechanicallyCompatible: true,
        normalizationReasons: [],
        observabilityReasons: [],
      });
      expect(provenanceById.has(shadingModifierOptionsId)).toBe(false);
    }
    for (const closedInteractionId of [
      '@flighthq/types:interface#InputState',
      '@flighthq/types:interface#InteractionManager',
    ]) {
      expect(classAuditById.get(closedInteractionId)?.migration).toEqual({
        mechanicallyCompatible: true,
        normalizationReasons: [],
        observabilityReasons: [],
      });
      expect(provenanceById.get(closedInteractionId)?.nominalIdentity).toEqual({ blockerReasons: [], closed: true });
    }
    const pointerEventDataId = '@flighthq/types:interface#PointerEventData';
    expect(classAuditById.get(pointerEventDataId)?.migration).toEqual({
      mechanicallyCompatible: false,
      normalizationReasons: ['cross-schema-transfer'],
      observabilityReasons: [],
    });
    expect(provenanceById.has(pointerEventDataId)).toBe(false);
    const nodeInteractionStateId = '@flighthq/types:interface#NodeInteractionState';
    expect(classAuditById.get(nodeInteractionStateId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: [],
    });
    expect(provenanceById.get(nodeInteractionStateId)?.nominalIdentity).toEqual({
      blockerReasons: ['normalization-provenance'],
      closed: false,
    });
    const interactionPointerStateId = '@flighthq/types:interface#InteractionPointerState';
    expect(classAuditById.get(interactionPointerStateId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: [],
    });
    expect(provenanceById.get(interactionPointerStateId)?.nominalIdentity).toEqual({
      blockerReasons: ['container-transfer'],
      closed: false,
    });
    const tilemapDataId = '@flighthq/types:interface#TilemapData';
    expect(classAuditById.get(tilemapDataId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: [],
    });
    expect(provenanceById.get(tilemapDataId)?.nominalIdentity).toEqual({
      blockerReasons: ['container-transfer', 'normalization-provenance'],
      closed: false,
    });
    for (const closedTiledId of [
      '@flighthq/types:interface#TiledGid',
      '@flighthq/types:interface#TiledMap',
      '@flighthq/types:interface#TiledObject',
      '@flighthq/types:interface#TiledTileset',
      '@flighthq/types:interface#TiledTilesetRef',
      '@flighthq/types:interface#TiledTilesetTile',
    ]) {
      expect(classAuditById.get(closedTiledId)?.migration).toEqual({
        mechanicallyCompatible: true,
        normalizationReasons: [],
        observabilityReasons: [],
      });
      expect(provenanceById.get(closedTiledId)?.nominalIdentity).toEqual({ blockerReasons: [], closed: true });
    }
    for (const containerTiledId of [
      '@flighthq/types:interface#TiledProperty',
      '@flighthq/types:interface#TiledTilesetTileFrame',
    ]) {
      expect(classAuditById.get(containerTiledId)?.migration).toEqual({
        mechanicallyCompatible: true,
        normalizationReasons: [],
        observabilityReasons: [],
      });
      expect(provenanceById.get(containerTiledId)?.nominalIdentity).toEqual({
        blockerReasons: ['container-transfer'],
        closed: false,
      });
    }
    const tilemapId = '@flighthq/types:interface#Tilemap';
    expect(classAuditById.get(tilemapId)?.migration).toEqual({
      mechanicallyCompatible: false,
      normalizationReasons: ['cross-schema-transfer'],
      observabilityReasons: [],
    });
    expect(provenanceById.has(tilemapId)).toBe(false);
    for (const pbrExtensionId of [
      '@flighthq/types:interface#ClearcoatPbrExtension',
      '@flighthq/types:interface#IridescencePbrExtension',
      '@flighthq/types:interface#SpecularPbrExtension',
      '@flighthq/types:interface#TransmissionVolumePbrExtension',
      '@flighthq/types:interface#WrappedDiffusePbrExtension',
    ]) {
      expect(classAuditById.get(pbrExtensionId)?.migration).toEqual({
        mechanicallyCompatible: false,
        normalizationReasons: ['cross-schema-transfer'],
        observabilityReasons: [],
      });
      expect(provenanceById.has(pbrExtensionId)).toBe(false);
    }
    for (const [frontierId, normalizationReasons, nominalIdentity] of [
      ['@flighthq/types:interface#FlyCameraController', ['cross-schema-transfer'], null],
      ['@flighthq/types:interface#ParticleEmitter3D', ['dynamic-ingress'], null],
      ['@flighthq/types:interface#NodeOrderList', [], { blockerReasons: ['normalization-provenance'], closed: false }],
      ['@flighthq/types:interface#PackableRectangle', [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#SocketRuntime', [], { blockerReasons: [], closed: true }],
    ] as const) {
      expect(classAuditById.get(frontierId)?.migration).toEqual({
        mechanicallyCompatible: normalizationReasons.length === 0,
        normalizationReasons,
        observabilityReasons: [],
      });
      if (nominalIdentity === null) {
        expect(provenanceById.has(frontierId)).toBe(false);
      } else {
        expect(provenanceById.get(frontierId)?.nominalIdentity).toEqual(nominalIdentity);
      }
    }
    for (const [frontierId, mechanicallyCompatible, normalizationReasons, nominalIdentity] of [
      ['@flighthq/types:interface#AreaLight', false, ['cross-schema-transfer'], null],
      ['@flighthq/types:interface#Clock', true, [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#LottieLayer', true, [], null],
      [
        '@flighthq/types:interface#MovieClipData',
        true,
        [],
        { blockerReasons: ['normalization-provenance'], closed: false },
      ],
      ['@flighthq/types:interface#PathMesh', true, [], { blockerReasons: [], closed: true }],
    ] as const) {
      expect(classAuditById.get(frontierId)?.migration).toEqual({
        mechanicallyCompatible,
        normalizationReasons,
        observabilityReasons: [],
      });
      if (nominalIdentity === null) {
        expect(provenanceById.has(frontierId)).toBe(false);
      } else {
        expect(provenanceById.get(frontierId)?.nominalIdentity).toEqual(nominalIdentity);
      }
    }
    for (const [frontierId, mechanicallyCompatible, normalizationReasons, nominalIdentity] of [
      ['@flighthq/types:interface#WgpuRenderTexturePool', true, [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#GlRenderTexturePool', true, [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#GlShadedProgram', false, ['object-literal-spread'], null],
      ['@flighthq/types:interface#GlShapeRendererData', false, ['dynamic-ingress'], null],
      [
        '@flighthq/types:interface#WgpuQuadBatchWriterBufferSlot',
        true,
        [],
        { blockerReasons: ['normalization-provenance'], closed: false },
      ],
    ] as const) {
      expect(classAuditById.get(frontierId)?.migration).toEqual({
        mechanicallyCompatible,
        normalizationReasons,
        observabilityReasons: [],
      });
      if (nominalIdentity === null) {
        expect(provenanceById.has(frontierId)).toBe(false);
      } else {
        expect(provenanceById.get(frontierId)?.nominalIdentity).toEqual(nominalIdentity);
      }
    }
    for (const [frontierId, mechanicallyCompatible, normalizationReasons, observabilityReasons, nominalIdentity] of [
      ['@flighthq/types:interface#TextShaperBackend', true, [], [], null],
      ['@flighthq/types:interface#TextLayoutParams', true, [], ['object-spread', 'optional-omission'], null],
      ['@flighthq/types:interface#SoftKeyboardInfo', true, [], [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#LayoutTree', true, [], [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#Sprite', false, ['cross-schema-transfer'], [], null],
    ] as const) {
      expect(classAuditById.get(frontierId)?.migration).toEqual({
        mechanicallyCompatible,
        normalizationReasons,
        observabilityReasons,
      });
      if (nominalIdentity === null) {
        expect(provenanceById.has(frontierId)).toBe(false);
      } else {
        expect(provenanceById.get(frontierId)?.nominalIdentity).toEqual(nominalIdentity);
      }
    }
    for (const [frontierId, mechanicallyCompatible, normalizationReasons] of [
      ['@flighthq/types:interface#AnimationSampleAccumulator', false, ['cross-schema-transfer']],
      ['@flighthq/types:interface#AnimationLayer', false, ['cross-schema-transfer']],
      ['@flighthq/types:interface#AnimationBlendTreeInput', false, ['cross-schema-transfer']],
      ['@flighthq/types:interface#LottieKeyframe', true, []],
      ['@flighthq/types:interface#Skeleton2DTransformConstraint', false, ['cross-schema-transfer']],
    ] as const) {
      expect(classAuditById.get(frontierId)?.migration).toEqual({
        mechanicallyCompatible,
        normalizationReasons,
        observabilityReasons: [],
      });
      expect(provenanceById.has(frontierId)).toBe(false);
    }
    for (const [frontierId, mechanicallyCompatible, normalizationReasons, observabilityReasons, nominalIdentity] of [
      [
        '@flighthq/types:interface#AbcTrait',
        true,
        [],
        [],
        { blockerReasons: ['container-transfer', 'normalization-provenance'], closed: false },
      ],
      ['@flighthq/types:interface#CanvasRenderTextureEntry', true, [], [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#NetRequest', true, [], ['optional-omission'], null],
      ['@flighthq/types:interface#SheenPbrExtension', false, ['cross-schema-transfer'], [], null],
      ['@flighthq/types:interface#ThreeDsLight', true, [], [], { blockerReasons: [], closed: true }],
    ] as const) {
      expect(classAuditById.get(frontierId)?.migration).toEqual({
        mechanicallyCompatible,
        normalizationReasons,
        observabilityReasons,
      });
      if (nominalIdentity === null) {
        expect(provenanceById.has(frontierId)).toBe(false);
      } else {
        expect(provenanceById.get(frontierId)?.nominalIdentity).toEqual(nominalIdentity);
      }
    }
    for (const [frontierId, mechanicallyCompatible, normalizationReasons, nominalIdentity] of [
      ['@flighthq/types:interface#WgpuScene3DIbl', true, [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#WgpuColorLutTextureCache', true, [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#WgpuMeshUpload', true, [], null],
      ['@flighthq/types:interface#Viewport', false, ['cross-schema-transfer'], null],
      ['@flighthq/types:interface#TauriApi', true, [], { blockerReasons: [], closed: true }],
    ] as const) {
      expect(classAuditById.get(frontierId)?.migration).toEqual({
        mechanicallyCompatible,
        normalizationReasons,
        observabilityReasons: [],
      });
      if (nominalIdentity === null) {
        expect(provenanceById.has(frontierId)).toBe(false);
      } else {
        expect(provenanceById.get(frontierId)?.nominalIdentity).toEqual(nominalIdentity);
      }
    }
    for (const [frontierId, observabilityReasons, nominalIdentity] of [
      ['@flighthq/types:interface#StrokeStyle', ['optional-omission'], null],
      ['@flighthq/types:interface#Socket', [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#Physics2DDebugGeometry', [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#Modifier', [], { blockerReasons: ['normalization-provenance'], closed: false }],
      ['@flighthq/types:interface#StatechartState', [], null],
    ] as const) {
      expect(classAuditById.get(frontierId)?.migration).toEqual({
        mechanicallyCompatible: true,
        normalizationReasons: [],
        observabilityReasons,
      });
      if (nominalIdentity === null) {
        expect(provenanceById.has(frontierId)).toBe(false);
      } else {
        expect(provenanceById.get(frontierId)?.nominalIdentity).toEqual(nominalIdentity);
      }
    }
    for (const [frontierId, mechanicallyCompatible, normalizationReasons, nominalIdentity] of [
      [
        '@flighthq/types:interface#SpriteData',
        true,
        [],
        { blockerReasons: ['normalization-provenance'], closed: false },
      ],
      ['@flighthq/types:interface#Skeleton2DIkConstraint', false, ['cross-schema-transfer'], null],
      ['@flighthq/types:interface#Physics2DRayResult', true, [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#PbrExtension', false, ['cross-schema-transfer'], null],
      ['@flighthq/types:interface#NativeTextRuntime', false, ['cross-schema-transfer'], null],
    ] as const) {
      expect(classAuditById.get(frontierId)?.migration).toEqual({
        mechanicallyCompatible,
        normalizationReasons,
        observabilityReasons: [],
      });
      if (nominalIdentity === null) {
        expect(provenanceById.has(frontierId)).toBe(false);
      } else {
        expect(provenanceById.get(frontierId)?.nominalIdentity).toEqual(nominalIdentity);
      }
    }
    for (const [frontierId, mechanicallyCompatible, normalizationReasons, observabilityReasons, nominalIdentity] of [
      ['@flighthq/types:interface#MatcapMaterial', false, ['cross-schema-transfer'], ['optional-omission'], null],
      ['@flighthq/types:interface#LottieShapePath', false, ['dynamic-ingress'], [], null],
      [
        '@flighthq/types:interface#GlRenderEffectApplicationExplanation',
        true,
        [],
        [],
        { blockerReasons: [], closed: true },
      ],
      [
        '@flighthq/types:interface#FlexLayoutItemStyle',
        false,
        ['anonymous-structural-transfer'],
        ['optional-omission'],
        null,
      ],
      ['@flighthq/types:interface#BitmapFingerprint', true, [], [], { blockerReasons: [], closed: true }],
    ] as const) {
      expect(classAuditById.get(frontierId)?.migration).toEqual({
        mechanicallyCompatible,
        normalizationReasons,
        observabilityReasons,
      });
      if (nominalIdentity === null) {
        expect(provenanceById.has(frontierId)).toBe(false);
      } else {
        expect(provenanceById.get(frontierId)?.nominalIdentity).toEqual(nominalIdentity);
      }
    }
    for (const [frontierId, mechanicallyCompatible, normalizationReasons, observabilityReasons, nominalIdentity] of [
      ['@flighthq/types:interface#AccessibilityState', true, [], ['optional-omission'], null],
      ['@flighthq/types:interface#WgpuVideoTextureEntry', true, [], ['optional-omission'], null],
      ['@flighthq/types:interface#WgpuShapeMesh', true, [], ['object-spread'], null],
      ['@flighthq/types:interface#WgpuScene3DDrawEntry', true, [], [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#VignetteEffect', false, ['cross-schema-transfer', 'object-literal-spread'], [], null],
    ] as const) {
      expect(classAuditById.get(frontierId)?.migration).toEqual({
        mechanicallyCompatible,
        normalizationReasons,
        observabilityReasons,
      });
      if (nominalIdentity === null) {
        expect(provenanceById.has(frontierId)).toBe(false);
      } else {
        expect(provenanceById.get(frontierId)?.nominalIdentity).toEqual(nominalIdentity);
      }
    }
    for (const [frontierId, mechanicallyCompatible, normalizationReasons, observabilityReasons, nominalIdentity] of [
      ['@flighthq/types:interface#CanvasRenderEffectPipeline', true, [], [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#ColorAdjustmentRuntime', false, ['cross-schema-transfer'], [], null],
      ['@flighthq/types:interface#GlScene3DDrawEntry', true, [], [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#ShadedMaterialOptions', true, [], ['optional-omission'], null],
      ['@flighthq/types:interface#RenderEffectPadding', true, [], [], { blockerReasons: [], closed: true }],
    ] as const) {
      expect(classAuditById.get(frontierId)?.migration).toEqual({
        mechanicallyCompatible,
        normalizationReasons,
        observabilityReasons,
      });
      if (nominalIdentity === null) {
        expect(provenanceById.has(frontierId)).toBe(false);
      } else {
        expect(provenanceById.get(frontierId)?.nominalIdentity).toEqual(nominalIdentity);
      }
    }
    for (const [frontierId, mechanicallyCompatible, normalizationReasons, observabilityReasons, nominalIdentity] of [
      [
        '@flighthq/types:interface#GlColorScaleBiasInstancedShader',
        true,
        [],
        [],
        { blockerReasons: ['normalization-provenance'], closed: false },
      ],
      ['@flighthq/types:interface#LambertMaterial', false, ['cross-schema-transfer'], ['optional-omission'], null],
      ['@flighthq/types:interface#OrbitCameraControllerOptions', true, [], [], null],
      ['@flighthq/types:interface#WgpuShapeRendererData', true, [], [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#AnimationBlendTree', false, ['cross-schema-transfer'], [], null],
    ] as const) {
      expect(classAuditById.get(frontierId)?.migration).toEqual({
        mechanicallyCompatible,
        normalizationReasons,
        observabilityReasons,
      });
      if (nominalIdentity === null) {
        expect(provenanceById.has(frontierId)).toBe(false);
      } else {
        expect(provenanceById.get(frontierId)?.nominalIdentity).toEqual(nominalIdentity);
      }
    }
    for (const [frontierId, mechanicallyCompatible, normalizationReasons, observabilityReasons, nominalIdentity] of [
      [
        '@flighthq/types:interface#StandardPbrMaterial',
        false,
        ['cross-schema-transfer', 'dynamic-ingress'],
        ['optional-omission'],
        null,
      ],
      ['@flighthq/types:interface#TextSelectionRectangle', false, ['anonymous-structural-transfer'], [], null],
      ['@flighthq/types:interface#LayoutNode', true, [], ['object-spread'], null],
      ['@flighthq/types:interface#Scene3DKindUsage', true, [], [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#TextureSource', false, ['cross-schema-transfer'], [], null],
    ] as const) {
      expect(classAuditById.get(frontierId)?.migration).toEqual({
        mechanicallyCompatible,
        normalizationReasons,
        observabilityReasons,
      });
      if (nominalIdentity === null) {
        expect(provenanceById.has(frontierId)).toBe(false);
      } else {
        expect(provenanceById.get(frontierId)?.nominalIdentity).toEqual(nominalIdentity);
      }
    }
    for (const [frontierId, normalizationReasons, observabilityReasons] of [
      ['@flighthq/types:interface#ToonMaterial', ['cross-schema-transfer'], ['optional-omission']],
      ['@flighthq/types:interface#UnlitMaterial', ['cross-schema-transfer'], ['optional-omission']],
      ['@flighthq/types:interface#ConvolutionEffect', ['cross-schema-transfer', 'object-literal-spread'], []],
      ['@flighthq/types:interface#EmissiveMaterial', ['cross-schema-transfer'], ['optional-omission']],
      ['@flighthq/types:interface#TransformInherit2D', ['anonymous-structural-transfer'], []],
    ] as const) {
      expect(classAuditById.get(frontierId)?.migration).toEqual({
        mechanicallyCompatible: false,
        normalizationReasons,
        observabilityReasons,
      });
      expect(provenanceById.has(frontierId)).toBe(false);
    }
    for (const [frontierId, mechanicallyCompatible, normalizationReasons, nominalIdentity] of [
      ['@flighthq/types:interface#ExtendedPbrMaterial', false, ['cross-schema-transfer', 'dynamic-ingress'], null],
      [
        '@flighthq/types:interface#TweenPropertyDetail',
        true,
        [],
        { blockerReasons: ['container-transfer'], closed: false },
      ],
      ['@flighthq/types:interface#WgpuScene3DShadow', true, [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#AnimationClipEvent', false, ['cross-schema-transfer'], null],
      ['@flighthq/types:interface#BitmapTextRuntime', false, ['cross-schema-transfer'], null],
    ] as const) {
      expect(classAuditById.get(frontierId)?.migration).toEqual({
        mechanicallyCompatible,
        normalizationReasons,
        observabilityReasons: [],
      });
      if (nominalIdentity === null) {
        expect(provenanceById.has(frontierId)).toBe(false);
      } else {
        expect(provenanceById.get(frontierId)?.nominalIdentity).toEqual(nominalIdentity);
      }
    }
    for (const [frontierId, mechanicallyCompatible, normalizationReasons, nominalIdentity] of [
      ['@flighthq/types:interface#ElectronApi', true, [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#GlLitProgram', false, ['cross-schema-transfer'], null],
      ['@flighthq/types:interface#LayoutState', true, [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#MeshGeometryRuntime', false, ['cross-schema-transfer'], null],
      ['@flighthq/types:interface#QuadBatch', false, ['cross-schema-transfer', 'dynamic-ingress'], null],
    ] as const) {
      expect(classAuditById.get(frontierId)?.migration).toEqual({
        mechanicallyCompatible,
        normalizationReasons,
        observabilityReasons: [],
      });
      if (nominalIdentity === null) {
        expect(provenanceById.has(frontierId)).toBe(false);
      } else {
        expect(provenanceById.get(frontierId)?.nominalIdentity).toEqual(nominalIdentity);
      }
    }
    for (const [frontierId, mechanicallyCompatible, normalizationReasons, observabilityReasons, nominalIdentity] of [
      ['@flighthq/types:interface#TextInputOptions', true, [], [], null],
      ['@flighthq/types:interface#LottieDocument', false, ['dynamic-ingress'], ['json-serialization'], null],
      ['@flighthq/types:interface#Scene3DLightBlock', false, ['anonymous-structural-transfer'], [], null],
      ['@flighthq/types:interface#GodRaysEffect', false, ['cross-schema-transfer', 'object-literal-spread'], [], null],
      [
        '@flighthq/types:interface#NativeTextData',
        true,
        [],
        [],
        { blockerReasons: ['normalization-provenance'], closed: false },
      ],
    ] as const) {
      expect(classAuditById.get(frontierId)?.migration).toEqual({
        mechanicallyCompatible,
        normalizationReasons,
        observabilityReasons,
      });
      if (nominalIdentity === null) {
        expect(provenanceById.has(frontierId)).toBe(false);
      } else {
        expect(provenanceById.get(frontierId)?.nominalIdentity).toEqual(nominalIdentity);
      }
    }
    for (const [frontierId, mechanicallyCompatible, normalizationReasons, observabilityReasons, nominalIdentity] of [
      ['@flighthq/types:interface#Scene3DResourceResolverRuntime', true, [], [], { blockerReasons: [], closed: true }],
      [
        '@flighthq/types:interface#GradientGlowEffect',
        false,
        ['cross-schema-transfer', 'object-literal-spread'],
        [],
        null,
      ],
      [
        '@flighthq/types:interface#BitmapTextData',
        true,
        [],
        [],
        { blockerReasons: ['normalization-provenance'], closed: false },
      ],
      ['@flighthq/types:interface#WgpuShapeMeshBuffers', true, [], [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#Scene3DDocumentNode', true, [], ['optional-omission'], null],
    ] as const) {
      expect(classAuditById.get(frontierId)?.migration).toEqual({
        mechanicallyCompatible,
        normalizationReasons,
        observabilityReasons,
      });
      if (nominalIdentity === null) {
        expect(provenanceById.has(frontierId)).toBe(false);
      } else {
        expect(provenanceById.get(frontierId)?.nominalIdentity).toEqual(nominalIdentity);
      }
    }
    for (const [frontierId, mechanicallyCompatible, normalizationReasons, observabilityReasons, nominalIdentity] of [
      ['@flighthq/types:interface#DirectionalLight', false, ['cross-schema-transfer'], [], null],
      ['@flighthq/types:interface#SurfaceMaterial', false, ['cross-schema-transfer', 'dynamic-ingress'], [], null],
      ['@flighthq/types:interface#MorphShapeGradientEndpoint', true, [], [], null],
      ['@flighthq/types:interface#SpatialIndexingNotice', true, [], ['object-spread'], null],
      ['@flighthq/types:interface#Scene3DRenderList', true, [], [], { blockerReasons: [], closed: true }],
    ] as const) {
      expect(classAuditById.get(frontierId)?.migration).toEqual({
        mechanicallyCompatible,
        normalizationReasons,
        observabilityReasons,
      });
      if (nominalIdentity === null) {
        expect(provenanceById.has(frontierId)).toBe(false);
      } else {
        expect(provenanceById.get(frontierId)?.nominalIdentity).toEqual(nominalIdentity);
      }
    }
    for (const [frontierId, mechanicallyCompatible, normalizationReasons, nominalIdentity] of [
      ['@flighthq/types:interface#Scene2DKindUsage', true, [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#MotionPath', true, [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#InnerGlowEffect', false, ['cross-schema-transfer', 'object-literal-spread'], null],
      ['@flighthq/types:interface#CustomShaderMaterial', false, ['cross-schema-transfer'], null],
      ['@flighthq/types:interface#CreateRenderTextureOptions', false, ['cross-schema-transfer'], null],
    ] as const) {
      expect(classAuditById.get(frontierId)?.migration).toEqual({
        mechanicallyCompatible,
        normalizationReasons,
        observabilityReasons: [],
      });
      if (nominalIdentity === null) {
        expect(provenanceById.has(frontierId)).toBe(false);
      } else {
        expect(provenanceById.get(frontierId)?.nominalIdentity).toEqual(nominalIdentity);
      }
    }
    for (const [frontierId, mechanicallyCompatible, normalizationReasons, observabilityReasons, nominalIdentity] of [
      [
        '@flighthq/types:interface#AbcInstruction',
        true,
        [],
        [],
        { blockerReasons: ['container-transfer'], closed: false },
      ],
      [
        '@flighthq/types:interface#AbcMultiname',
        true,
        [],
        [],
        { blockerReasons: ['normalization-provenance'], closed: false },
      ],
      ['@flighthq/types:interface#AnimationRootMotionExtractor', false, ['cross-schema-transfer'], [], null],
      ['@flighthq/types:interface#CanvasRenderTexturePool', true, [], [], { blockerReasons: [], closed: true }],
      ['@flighthq/types:interface#LogEntry', true, [], ['object-spread'], null],
    ] as const) {
      expect(classAuditById.get(frontierId)?.migration).toEqual({
        mechanicallyCompatible,
        normalizationReasons,
        observabilityReasons,
      });
      if (nominalIdentity === null) {
        expect(provenanceById.has(frontierId)).toBe(false);
      } else {
        expect(provenanceById.get(frontierId)?.nominalIdentity).toEqual(nominalIdentity);
      }
    }
    const bitmapTransform = readFileSync('generated/flighthq/bitmap/BitmapTransform.hx', 'utf8');
    expect(bitmapTransform).not.toMatch(/_Runtime\.field\((?:dest|source),/u);
    const glRenderState = readFileSync('generated/flighthq/renderGl/GlRenderState.hx', 'utf8');
    expect(glRenderState).toContain(
      '(runtime.currentProgram = cast (null : Null<flighthq._internal.dom.WebGLProgram>));',
    );
    expect(glRenderState).not.toMatch(/\(cast (?:runtime|sourceRuntime|targetRuntime) : GlRenderStateRuntime\)\./u);
    expect(glRenderState).not.toMatch(/_Runtime\.field\((?:runtime|sourceRuntime|targetRuntime),/u);
    const wgpuRenderState = readFileSync('generated/flighthq/renderWgpu/WgpuRenderState.hx', 'utf8');
    expect(wgpuRenderState).toContain(
      '(runtime.uniformBuffer = cast (uniformBuffer : flighthq._internal.dom.GPUBuffer));',
    );
    expect(wgpuRenderState).not.toMatch(/\(cast (?:runtime|sourceRuntime|targetRuntime) : WgpuRenderStateRuntime\)\./u);
    expect(wgpuRenderState).not.toMatch(/_Runtime\.field\((?:runtime|sourceRuntime|targetRuntime),/u);
    const renderTarget = readFileSync('generated/flighthq/render/RenderTarget.hx', 'utf8');
    expect(renderTarget).toContain('width = HxMath.max(1.0, HxMath.ceil(descriptor.width));');
    expect(renderTarget).not.toMatch(/_Runtime\.field\(descriptor,/u);
    for (const [path, typeName] of [
      ['generated/flighthq/scene2dCanvas/CanvasRenderTarget.hx', 'CanvasRenderTarget'],
      ['generated/flighthq/renderGl/GlRenderTarget.hx', 'GlRenderTarget'],
      ['generated/flighthq/renderWgpu/WgpuRenderTarget.hx', 'WgpuRenderTarget'],
    ] as const) {
      const generatedRenderTarget = readFileSync(path, 'utf8');
      expect(generatedRenderTarget).not.toMatch(/_Runtime\.field\(target,/u);
      expect(generatedRenderTarget).not.toContain(`(cast target : flighthq.types.${typeName}).`);
    }
    const richText = readFileSync('generated/flighthq/text/RichText.hx', 'utf8');
    expect(richText).not.toMatch(/_Runtime\.field\((?:content|richText),/u);
    expect(richText).not.toMatch(/\(cast richText : flighthq\.types\.RichText\)\./u);
    const richTextContent = readFileSync('generated/flighthq/textlayout/RichTextContent.hx', 'utf8');
    expect(richTextContent).not.toMatch(/_Runtime\.field\(data,/u);
    const richTextMetrics = readFileSync('generated/flighthq/textlayout/RichTextMetrics.hx', 'utf8');
    expect(richTextMetrics).not.toMatch(/_Runtime\.field\(layout,/u);
    const richTextQuery = readFileSync('generated/flighthq/textlayout/RichTextQuery.hx', 'utf8');
    expect(richTextQuery).not.toMatch(/_Runtime\.field\((?:group|layout),/u);
    const physicsStepValidation = readFileSync('generated/flighthq/physics2d/StepValidation.hx', 'utf8');
    expect(physicsStepValidation).not.toMatch(/_Runtime\.field\((?:collider|config|contact|world),/u);
    expect(physicsStepValidation).not.toMatch(
      /\(cast (?:collider|config|contact|world) : Physics2D(?:Collider|Contact|SolverConfig|World)\)\./u,
    );
    const physicsWorld = readFileSync('generated/flighthq/physics2d/World.hx', 'utf8');
    expect(physicsWorld).not.toMatch(/_Runtime\.field\(world,/u);
    const generatedClipRegion = readFileSync('generated/flighthq/clip/ClipRegion.hx', 'utf8');
    expect(generatedClipRegion).not.toMatch(/_Runtime\.field\(clip,/u);
    expect(generatedClipRegion).not.toMatch(/\(cast clip : ClipRegion\)\./u);
    for (const [path, typeName] of [
      ['generated/flighthq/effectsCanvas/CanvasBevelEffect.hx', 'CanvasRenderEffectContext'],
      ['generated/flighthq/effectsGl/GlBloomEffect.hx', 'GlRenderEffectContext'],
      ['generated/flighthq/effectsWgpu/WgpuBloomEffect.hx', 'WgpuRenderEffectContext'],
    ] as const) {
      const generatedEffect = readFileSync(path, 'utf8');
      expect(generatedEffect).not.toContain(`(cast ctx : ${typeName}).`);
      expect(generatedEffect).not.toMatch(/_Runtime\.field\(ctx,/u);
    }
    const glSceneRuntime = readFileSync('generated/flighthq/scene3dGl/GlEnvironmentIblBake.hx', 'utf8');
    expect(glSceneRuntime).not.toContain('(cast runtime : GlScene3DRuntime).');
    const wgpuSceneRuntime = readFileSync('generated/flighthq/scene3dWgpu/WgpuShadowMap.hx', 'utf8');
    expect(wgpuSceneRuntime).not.toContain('(cast scene : WgpuScene3DRuntime).');
    const quadBatch = readFileSync('generated/flighthq/quadbatch/QuadBatch.hx', 'utf8');
    expect(quadBatch).not.toMatch(/\(cast (?:data|src) : QuadBatchData\)\./u);
    expect(quadBatch).not.toMatch(/_Runtime\.field\(__destructure/u);
    for (const path of [
      'generated/flighthq/scene2dCanvas/CanvasShape.hx',
      'generated/flighthq/scene2dCanvas/CanvasShapeCommands.hx',
    ]) {
      const canvasShape = readFileSync(path, 'utf8');
      expect(canvasShape).not.toMatch(/\(cast (?:drawState|state) : CanvasShapeDrawState\)\./u);
      expect(canvasShape).not.toMatch(/_Runtime\.field\((?:drawState|state),/u);
    }
    for (const path of [
      'generated/flighthq/scene3d/SceneDocument.hx',
      'generated/flighthq/scene3d/SceneDocumentLights.hx',
    ]) {
      const sceneDocument = readFileSync(path, 'utf8');
      expect(sceneDocument).not.toContain('(cast document : Scene3DDocument).');
      expect(sceneDocument).not.toMatch(/_Runtime\.field\(document,/u);
    }
    const orbitController = readFileSync('generated/flighthq/cameraControls/OrbitCameraController.hx', 'utf8');
    expect(orbitController).not.toMatch(
      /\(cast (?:controller|out|source) : (?:flighthq\.types\.)?OrbitCameraController\)\./u,
    );
    expect(orbitController).not.toMatch(/_Runtime\.field\((?:controller|out|source),/u);
    for (const path of [
      'generated/flighthq/scene2dFormats/RiveAnimation.hx',
      'generated/flighthq/scene2dFormats/RiveObjectGraph.hx',
      'generated/flighthq/scene2dFormats/RiveShapePaint.hx',
    ]) {
      const riveCore = readFileSync(path, 'utf8');
      expect(riveCore).not.toMatch(/\(cast (?:keyframe|object|source) : RiveCoreObject\)\./u);
      expect(riveCore).not.toMatch(/_Runtime\.field\((?:keyframe|object|source),/u);
    }
    const animationTrack = readFileSync('generated/flighthq/animation/AnimationTrack.hx', 'utf8');
    expect(animationTrack).not.toMatch(/\(cast (?:source|track) : AnimationTrack\)\./u);
    expect(animationTrack).not.toMatch(/_Runtime\.field\((?:source|track),/u);
    for (const path of [
      'generated/flighthq/animation/AnimationBlendTree.hx',
      'generated/flighthq/animation/AnimationClip.hx',
    ]) {
      const animationChannel = readFileSync(path, 'utf8');
      expect(animationChannel).not.toMatch(/\(cast (?:channel|existing) : AnimationChannel\)\./u);
      expect(animationChannel).not.toMatch(/_Runtime\.field\((?:channel|existing),/u);
    }
    const animationPlayer = readFileSync('generated/flighthq/animation/AnimationPlayer.hx', 'utf8');
    expect(animationPlayer).not.toMatch(/\(cast player : (?:flighthq\.types\.)?AnimationPlayer\)\./u);
    expect(animationPlayer).not.toMatch(/_Runtime\.field\(player,/u);
    for (const path of ['generated/flighthq/tween/Tween.hx', 'generated/flighthq/tween/UpdateTweens.hx']) {
      const tween = readFileSync(path, 'utf8');
      expect(tween).not.toMatch(/\(cast (?:source|target|tween) : (?:flighthq\.types\.)?Tween[^)]*\)\./u);
      expect(tween).not.toMatch(/_Runtime\.field\((?:source|target|tween),/u);
    }
    const timeline = readFileSync('generated/flighthq/timeline/Timeline.hx', 'utf8');
    expect(timeline).not.toMatch(/\(cast timeline : (?:flighthq\.types\.)?Timeline\)\./u);
    expect(timeline).not.toMatch(/_Runtime\.field\(timeline,/u);
    const riveObjectGraph = readFileSync('generated/flighthq/scene2dFormats/RiveObjectGraph.hx', 'utf8');
    expect(riveObjectGraph).not.toMatch(/\(cast artboard : RiveArtboardGraph\)\./u);
    expect(riveObjectGraph).not.toMatch(/_Runtime\.field\(artboard,/u);
    expect(riveObjectGraph).not.toMatch(/\(cast candidate : RiveProperty\)\./u);
    const riveAssets = readFileSync('generated/flighthq/scene2dFormats/RiveAssets.hx', 'utf8');
    expect(riveAssets).not.toMatch(/\(cast candidate : RiveProperty\)\./u);
    expect(riveAssets).not.toMatch(/: RiveFileAsset\)\.(?:bytes|cdnBaseUrl|height|kind|name|width)/u);
    const riveShapePaint = readFileSync('generated/flighthq/scene2dFormats/RiveShapePaint.hx', 'utf8');
    expect(riveShapePaint).not.toMatch(/\(cast record : RivePathRecord\)\./u);
    expect(riveShapePaint).not.toMatch(/_Runtime\.field\(record,/u);
    const riveScene2DDocument = readFileSync('generated/flighthq/scene2dFormats/RiveScene2DDocument.hx', 'utf8');
    expect(riveScene2DDocument).not.toMatch(/\(cast imported : RiveDocumentImportResult\)\./u);
    expect(riveScene2DDocument).not.toMatch(/_Runtime\.field\(imported,/u);
    expect(riveScene2DDocument).not.toMatch(/\(cast asset : RiveFileAsset\)\./u);
    const generatedInputManager = readFileSync('generated/flighthq/input/InputManager.hx', 'utf8');
    expect(generatedInputManager).not.toMatch(/\(cast manager : flighthq\.types\.InputManager\)\./u);
    expect(generatedInputManager).not.toMatch(/_Runtime\.field\(manager,/u);
    expect(generatedInputManager).not.toMatch(/\(cast (?:data|out) : Input(?:Keyboard|Pointer)Data\)\./u);
    expect(generatedInputManager).not.toMatch(/_Runtime\.field\(data,/u);
    const generatedTextInputManager = readFileSync('generated/flighthq/textinput/TextInputManager.hx', 'utf8');
    expect(generatedTextInputManager).not.toMatch(/\(cast data : KeyboardEventData\)\./u);
    expect(generatedTextInputManager).not.toMatch(/_Runtime\.field\(data,/u);
    for (const path of [
      'generated/flighthq/textinput/SelectableRichTextManager.hx',
      'generated/flighthq/textinput/TextInput.hx',
      'generated/flighthq/textinput/TextInputEditing.hx',
      'generated/flighthq/textinput/TextInputManager.hx',
    ]) {
      const generatedTextInput = readFileSync(path, 'utf8');
      expect(generatedTextInput).not.toMatch(/\(cast state : TextInputState\)\./u);
      expect(generatedTextInput).not.toMatch(/_Runtime\.field\(state,/u);
    }
    const generatedPbrMaterials = readFileSync('generated/flighthq/materials/PbrMaterials.hx', 'utf8');
    expect(generatedPbrMaterials).not.toMatch(
      /\(cast (?:material|out|source|target) : (?:SpecularGlossinessPbrMaterial|StandardPbrMaterialProperties)\)\./u,
    );
    expect(generatedPbrMaterials).not.toMatch(/_Runtime\.field\((?:material|out|source|target),/u);
    const generatedClassicMaterials = readFileSync('generated/flighthq/materials/ClassicMaterials.hx', 'utf8');
    expect(generatedClassicMaterials).not.toMatch(/\(cast material : (?:BlinnPhongMaterial|PhongMaterial)\)\./u);
    expect(generatedClassicMaterials).not.toMatch(/_Runtime\.field\(material,/u);
    const generatedShadedMaterialRenderer = readFileSync(
      'generated/flighthq/scene3dGl/ShadedGlMeshMaterialRenderer.hx',
      'utf8',
    );
    expect(generatedShadedMaterialRenderer).not.toMatch(/\(cast material : ShadedMaterial\)\./u);
    expect(generatedShadedMaterialRenderer).not.toMatch(/_Runtime\.field\(material,/u);
    const generatedRenderState = readFileSync('generated/flighthq/render/RenderState.hx', 'utf8');
    expect(generatedRenderState).not.toMatch(/\(cast runtime : RenderStateRuntime\)\./u);
    expect(generatedRenderState).not.toMatch(/_Runtime\.field\(runtime,/u);
    const generatedRenderProxy = readFileSync('generated/flighthq/render/RenderProxy.hx', 'utf8');
    expect(generatedRenderProxy).not.toMatch(
      /\(cast (?:data|parentData|proxy|source) : (?:flighthq\.types\.)?RenderProxy\)\./u,
    );
    expect(generatedRenderProxy).not.toMatch(/_Runtime\.field\((?:data|parentData|proxy),/u);
    const generatedDomRenderState = readFileSync('generated/flighthq/scene2dDom/DomRenderState.hx', 'utf8');
    expect(generatedDomRenderState).not.toMatch(/\(cast runtime : DomRenderStateRuntime\)\./u);
    expect(generatedDomRenderState).not.toMatch(/_Runtime\.field\(runtime,/u);
    const generatedGlRenderTarget = readFileSync('generated/flighthq/renderGl/GlRenderTarget.hx', 'utf8');
    expect(generatedGlRenderTarget).not.toMatch(
      /\(cast (?:descriptor|requested) : ResolvedRenderTargetDescriptor\)\./u,
    );
    expect(generatedGlRenderTarget).not.toMatch(/_Runtime\.field\((?:descriptor|requested),/u);
    const generatedWgpuMeshPipeline = readFileSync('generated/flighthq/scene3dWgpu/WgpuMeshPipeline.hx', 'utf8');
    expect(generatedWgpuMeshPipeline).not.toMatch(/\(cast proxy : Scene3DRenderProxy\)\./u);
    expect(generatedWgpuMeshPipeline).not.toMatch(/_Runtime\.field\(proxy,/u);
    const generatedVelocity = readFileSync('generated/flighthq/velocity/TransformVelocity.hx', 'utf8');
    expect(generatedVelocity).not.toMatch(/\(cast (?:a|b|current|out|previous|source|velocity) : Velocity2D\)\./u);
    expect(generatedVelocity).not.toMatch(/_Runtime\.field\((?:a|b|current|out|previous|source|velocity),/u);
    const generatedMassProperties = readFileSync('generated/flighthq/physics2d/MassProperties.hx', 'utf8');
    expect(generatedMassProperties).not.toMatch(/\(cast out : Physics2DMassData\)\./u);
    expect(generatedMassProperties).not.toMatch(/_Runtime\.field\(out,/u);
    const generatedCollisionManifold = readFileSync('generated/flighthq/collision/Manifold.hx', 'utf8');
    expect(generatedCollisionManifold).not.toMatch(/\(cast out : CollisionManifold\)\./u);
    expect(generatedCollisionManifold).not.toMatch(/_Runtime\.field\(out,/u);
    const generatedContactManifold = readFileSync('generated/flighthq/collision/ContactManifold.hx', 'utf8');
    expect(generatedContactManifold).not.toMatch(/\(cast out : CollisionContactManifold\)\./u);
    expect(generatedContactManifold).not.toMatch(/_Runtime\.field\(out,/u);
    const generatedSweepCollision = readFileSync('generated/flighthq/collision/SweepCollisionShape.hx', 'utf8');
    expect(generatedSweepCollision).not.toMatch(/\(cast out : CollisionTimeOfImpact\)\./u);
    expect(generatedSweepCollision).not.toMatch(/_Runtime\.field\(out,/u);
    const generatedPhysicsJoints = readFileSync('generated/flighthq/physics2d/Joints.hx', 'utf8');
    expect(generatedPhysicsJoints).not.toMatch(
      /\(cast (?:gear|prismatic|pulley|revolute|wheel) : Physics2D(?:Gear|Prismatic|Pulley|Revolute|Wheel)Joint\)\./u,
    );
    expect(generatedPhysicsJoints).not.toMatch(/_Runtime\.field\((?:gear|prismatic|pulley|revolute|wheel),/u);
    const generatedPhysicsDebugGeometry = readFileSync('generated/flighthq/physics2d/DebugGeometry.hx', 'utf8');
    expect(generatedPhysicsDebugGeometry).not.toMatch(/\(cast pulley : Physics2DPulleyJoint\)\./u);
    expect(generatedPhysicsDebugGeometry).not.toMatch(/_Runtime\.field\(pulley,/u);
    const generatedSkeleton2D = readFileSync('generated/flighthq/skeleton2d/Skeleton2d.hx', 'utf8');
    expect(generatedSkeleton2D).not.toMatch(/\(cast (?:skeleton|entry) : (?:Skeleton2D|SkinAttachment2D)\)\./u);
    expect(generatedSkeleton2D).not.toMatch(/_Runtime\.field\((?:skeleton|entry),/u);
    const generatedPathConstraint2D = readFileSync('generated/flighthq/skeleton2d/PathConstraint2D.hx', 'utf8');
    expect(generatedPathConstraint2D).not.toMatch(
      /\(cast (?:constraint|pathConstraint|skeleton) : (?:Skeleton2DPathConstraint|Skeleton2D)\)\./u,
    );
    expect(generatedPathConstraint2D).not.toMatch(/_Runtime\.field\((?:constraint|pathConstraint|skeleton),/u);
    const generatedSkeleton3D = readFileSync('generated/flighthq/skeleton3d/Skeleton3d.hx', 'utf8');
    expect(generatedSkeleton3D).not.toMatch(/\(cast skeleton : Skeleton3D\)\./u);
    expect(generatedSkeleton3D).not.toMatch(/_Runtime\.field\(skeleton,/u);
    const generatedSkinMesh = readFileSync('generated/flighthq/skeleton3d/SkinMeshGeometry.hx', 'utf8');
    expect(generatedSkinMesh).not.toMatch(/\(cast bindPose : MeshSkinBindPose\)\./u);
    expect(generatedSkinMesh).not.toMatch(/_Runtime\.field\(bindPose,/u);
    const generatedAnimationCrossfade = readFileSync('generated/flighthq/animation/AnimationCrossfade.hx', 'utf8');
    expect(generatedAnimationCrossfade).not.toMatch(/\(cast state : flighthq\.types\.AnimationCrossfade\)\./u);
    expect(generatedAnimationCrossfade).not.toMatch(/_Runtime\.field\(state,/u);
    const generatedAnimationStateMachine = readFileSync(
      'generated/flighthq/animation/AnimationStateMachine.hx',
      'utf8',
    );
    expect(generatedAnimationStateMachine).not.toMatch(/\(cast machine : flighthq\.types\.AnimationStateMachine\)\./u);
    expect(generatedAnimationStateMachine).not.toMatch(/_Runtime\.field\(machine,/u);
    const generatedStatechart = readFileSync('generated/flighthq/statechart/Statechart.hx', 'utf8');
    expect(generatedStatechart).not.toMatch(
      /\(cast (?:chart|instance|transition) : (?:Statechart|StatechartInstance|StatechartTransition)\)\./u,
    );
    expect(generatedStatechart).not.toMatch(/_Runtime\.field\((?:chart|instance|transition),/u);
    for (const path of [
      'generated/flighthq/renderGl/GlCompressedTexture.hx',
      'generated/flighthq/renderWgpu/WgpuCompressedTexture.hx',
    ]) {
      const generatedCompressedTexture = readFileSync(path, 'utf8');
      expect(generatedCompressedTexture).not.toMatch(
        /\(cast (?:container|entry) : (?:TextureContainer|TextureContainerLevel)\)\./u,
      );
      expect(generatedCompressedTexture).not.toMatch(/_Runtime\.field\((?:container|entry),/u);
    }
    const generatedGlRenderTexture = readFileSync('generated/flighthq/renderGl/GlRenderTexture.hx', 'utf8');
    expect(generatedGlRenderTexture).not.toMatch(
      /\(cast (?:entry|renderTexture) : (?:GlRenderTextureEntry|RenderTexture)\)\./u,
    );
    expect(generatedGlRenderTexture).not.toMatch(/_Runtime\.field\(renderTexture,/u);
    const generatedWgpuRenderTexture = readFileSync('generated/flighthq/renderWgpu/WgpuRenderTexture.hx', 'utf8');
    expect(generatedWgpuRenderTexture).not.toMatch(
      /\(cast (?:entry|renderTexture) : (?:WgpuRenderTextureEntry|RenderTexture)\)\./u,
    );
    expect(generatedWgpuRenderTexture).not.toMatch(/_Runtime\.field\(renderTexture,/u);
    const generatedRaycastCollision = readFileSync('generated/flighthq/collision/RaycastCollisionShape.hx', 'utf8');
    expect(generatedRaycastCollision).not.toMatch(
      /\(cast (?:out|RaycastCollisionShape\.localHitScratch__raycastCollisionShape) : CollisionRaycastHit\)\./u,
    );
    expect(generatedRaycastCollision).not.toMatch(
      /_Runtime\.field\((?:out|RaycastCollisionShape\.localHitScratch__raycastCollisionShape),/u,
    );
    const generatedShapeContact = readFileSync('generated/flighthq/collision/ShapeContact.hx', 'utf8');
    expect(generatedShapeContact).not.toMatch(/\(cast point : CollisionContactPoint\)\./u);
    expect(generatedShapeContact).not.toMatch(/_Runtime\.field\(point,/u);
    const generatedWorldQueries = readFileSync('generated/flighthq/physics2d/WorldQueries.hx', 'utf8');
    expect(generatedWorldQueries).not.toMatch(/\(cast (?:current|hit) : Physics2DRayHit\)\./u);
    expect(generatedWorldQueries).not.toMatch(/_Runtime\.field\((?:a|b|current|hit|source),/u);
    const generatedPickScene3D = readFileSync('generated/flighthq/picking/PickScene3D.hx', 'utf8');
    expect(generatedPickScene3D).not.toMatch(/\(cast (?:hit|out|src|PickScene3D\._hit__pickScene3D) : Scene3DHit\)\./u);
    expect(generatedPickScene3D).not.toMatch(/_Runtime\.field\((?:hit|out|src|PickScene3D\._hit__pickScene3D),/u);
    const generatedVelocitySample = readFileSync('generated/flighthq/velocity/VelocitySample.hx', 'utf8');
    expect(generatedVelocitySample).not.toMatch(/\(cast sample : flighthq\.types\.VelocitySample\)\./u);
    expect(generatedVelocitySample).not.toMatch(/_Runtime\.field\(sample,/u);
    const generatedBitmapText = readFileSync('generated/flighthq/bitmaptext/BitmapText.hx', 'utf8');
    expect(generatedBitmapText).not.toMatch(/\(cast page : BitmapTextPage\)\./u);
    expect(generatedBitmapText).not.toMatch(/_Runtime\.field\(page,/u);
    const generatedRichTextRuntime = readFileSync('generated/flighthq/text/RichText.hx', 'utf8');
    expect(generatedRichTextRuntime).not.toMatch(/\(cast out : RichTextRuntime\)\./u);
    expect(generatedRichTextRuntime).not.toMatch(/_Runtime\.field\(out,/u);
    const generatedTextLabel = readFileSync('generated/flighthq/text/TextLabel.hx', 'utf8');
    expect(generatedTextLabel).not.toMatch(
      /\(cast (?:data|label|source) : (?:TextLabelData|flighthq\.types\.TextLabel)\)\./u,
    );
    expect(generatedTextLabel).not.toMatch(/_Runtime\.field\((?:data|label|source),/u);
    const generatedCanvasTextLabel = readFileSync('generated/flighthq/scene2dCanvas/CanvasTextLabel.hx', 'utf8');
    expect(generatedCanvasTextLabel).not.toMatch(/_Runtime\.field\(__destructure0,/u);
    const generatedTextShaperRun = readFileSync('generated/flighthq/textshaper/TextShaperRun.hx', 'utf8');
    expect(generatedTextShaperRun).not.toMatch(/\(cast (?:out|result|run) : ShapedRun\)\./u);
    expect(generatedTextShaperRun).not.toMatch(/_Runtime\.field\((?:out|run),/u);
    const generatedShape = readFileSync('generated/flighthq/shape/Shape.hx', 'utf8');
    expect(generatedShape).not.toMatch(/\(cast (?:out|shape|source) : flighthq\.types\.Shape\)\./u);
    expect(generatedShape).not.toMatch(/_Runtime\.field\((?:out|shape|source), '(?:data|kind)'\)/u);
    const generatedMorphShape = readFileSync('generated/flighthq/shape/MorphShape.hx', 'utf8');
    expect(generatedMorphShape).not.toMatch(/\(cast shape : flighthq\.types\.MorphShape\)\./u);
    expect(generatedMorphShape).not.toMatch(/_Runtime\.field\(shape,/u);
    const generatedMorphShapePaint = readFileSync('generated/flighthq/shape/MorphShapePaint.hx', 'utf8');
    expect(generatedMorphShapePaint).not.toMatch(/\(cast (?:data|shape) : (?:MorphShapeData|MorphShape)\)\./u);
    expect(generatedMorphShapePaint).not.toMatch(/_Runtime\.field\(data, 'commands'\)/u);
    const generatedCanvasScale9 = readFileSync('generated/flighthq/scene2dCanvas/CanvasScale9Shape.hx', 'utf8');
    expect(generatedCanvasScale9).not.toMatch(/_Runtime\.field\(__destructure1, '(?:scaleX|scaleY)'\)/u);
    const generatedShapeJson = readFileSync('generated/flighthq/shapeFormats/ShapeJson.hx', 'utf8');
    expect(generatedShapeJson).not.toMatch(/_Runtime\.field\(shape, 'data'\)/u);
    const generatedGlMeshProgram = readFileSync('generated/flighthq/scene3dGl/GlMeshProgram.hx', 'utf8');
    expect(generatedGlMeshProgram).not.toMatch(/_Runtime\.field\(program,/u);
    expect(generatedGlMeshProgram).not.toMatch(/\(cast upload : GlMeshUpload\)\./u);
    const generatedGlMeshUpload = readFileSync('generated/flighthq/scene3dGl/GlMeshUpload.hx', 'utf8');
    expect(generatedGlMeshUpload).not.toMatch(/_Runtime\.field\(upload,/u);
    expect(generatedGlMeshUpload).not.toMatch(/\(cast upload : flighthq\.types\.GlScene3DRuntime\.GlMeshUpload\)\./u);
    const generatedGlParticles = readFileSync('generated/flighthq/scene2dGl/GlParticleEmitter2D.hx', 'utf8');
    expect(generatedGlParticles).not.toMatch(/\(cast shader : GlParticleShader\)\./u);
    expect(generatedGlParticles).not.toMatch(/_Runtime\.field\(shader,/u);
    for (const path of [
      'generated/flighthq/scene3dGl/BlinnPhongGlMeshMaterialRenderer.hx',
      'generated/flighthq/scene3dGl/PhongGlMeshMaterialRenderer.hx',
      'generated/flighthq/scene3dGl/StandardPbrGlMeshMaterialRenderer.hx',
    ]) {
      const generatedGlMaterial = readFileSync(path, 'utf8');
      expect(generatedGlMaterial).not.toMatch(/\(cast program : (?:GlClassicProgram|GlPbrProgram)\)\./u);
      expect(generatedGlMaterial).not.toMatch(/_Runtime\.field\(program,/u);
    }
    for (const path of [
      'generated/flighthq/effects/BevelEffect.hx',
      'generated/flighthq/effects/DropShadowEffect.hx',
      'generated/flighthq/effects/GradientBevelEffect.hx',
      'generated/flighthq/effects/InnerShadowEffect.hx',
      'generated/flighthq/effects/OuterGlowEffect.hx',
      'generated/flighthq/effectsCanvas/CanvasBevelEffect.hx',
      'generated/flighthq/effectsCanvas/CanvasDropShadowEffect.hx',
      'generated/flighthq/effectsCanvas/CanvasEffectDropShadowCss.hx',
      'generated/flighthq/effectsCanvas/CanvasGradientBevelEffect.hx',
      'generated/flighthq/effectsCanvas/CanvasInnerShadowEffect.hx',
      'generated/flighthq/effectsCanvas/CanvasOuterGlowEffect.hx',
      'generated/flighthq/effectsGl/GlBevelEffect.hx',
      'generated/flighthq/effectsGl/GlDropShadowEffect.hx',
      'generated/flighthq/effectsGl/GlGradientBevelEffect.hx',
      'generated/flighthq/effectsGl/GlInnerShadowEffect.hx',
      'generated/flighthq/effectsGl/GlOuterGlowEffect.hx',
      'generated/flighthq/effectsWgpu/WgpuBevelEffect.hx',
      'generated/flighthq/effectsWgpu/WgpuDropShadowEffect.hx',
      'generated/flighthq/effectsWgpu/WgpuGradientBevelEffect.hx',
      'generated/flighthq/effectsWgpu/WgpuInnerShadowEffect.hx',
      'generated/flighthq/effectsWgpu/WgpuOuterGlowEffect.hx',
    ]) {
      const generatedEffect = readFileSync(path, 'utf8');
      expect(generatedEffect).not.toMatch(/_Runtime\.field\(effect,/u);
      expect(generatedEffect).not.toMatch(
        /\(cast effect : (?:BevelEffect|DropShadowEffect|GradientBevelEffect|InnerShadowEffect|OuterGlowEffect)\)\./u,
      );
    }
    for (const path of [
      'generated/flighthq/shading/CreateAnimatedNormalModifier.hx',
      'generated/flighthq/shading/CreateDissolveModifier.hx',
      'generated/flighthq/shading/CreateEmissiveModifier.hx',
      'generated/flighthq/shading/CreateFogModifier.hx',
      'generated/flighthq/shading/CreateVertexDisplaceModifier.hx',
    ]) {
      const generatedModifierOptions = readFileSync(path, 'utf8');
      expect(generatedModifierOptions).not.toMatch(/_Runtime\.field\(options,/u);
      expect(generatedModifierOptions).not.toMatch(
        /\(cast options : (?:AnimatedNormalModifierOptions|DissolveModifierOptions|EmissiveModifierOptions|FogModifierOptions|VertexDisplaceModifierOptions)\)\./u,
      );
    }
    const generatedTypedInputManager = readFileSync('generated/flighthq/input/InputManager.hx', 'utf8');
    expect(generatedTypedInputManager).not.toMatch(/_Runtime\.field\(state,/u);
    expect(generatedTypedInputManager).not.toMatch(/\(cast state : InputState\)\./u);
    const generatedInteractionManager = readFileSync('generated/flighthq/interaction/InteractionManager.hx', 'utf8');
    expect(generatedInteractionManager).not.toMatch(/_Runtime\.field\((?:data|manager|state),/u);
    expect(generatedInteractionManager).not.toMatch(
      /\(cast (?:data|manager|state) : (?:flighthq\.types\.)?(?:InteractionManager|InteractionPointerState|PointerEventData)(?:<[^>]+>)?\)\./u,
    );
    const generatedInteractionSpatialIndex = readFileSync(
      'generated/flighthq/interaction/InteractionSpatialIndex.hx',
      'utf8',
    );
    expect(generatedInteractionSpatialIndex).not.toMatch(/\(cast manager : InteractionManager<[^>]+>\)\./u);
    for (const path of [
      'generated/flighthq/interaction/HitTests.hx',
      'generated/flighthq/interaction/InteractionSpatialIndex.hx',
      'generated/flighthq/interaction/NodeInteractionState.hx',
    ]) {
      const generatedOptionalInteractionState = readFileSync(path, 'utf8');
      expect(generatedOptionalInteractionState).toContain('__typedStruct');
      expect(generatedOptionalInteractionState).not.toContain('__structural');
    }
    for (const path of [
      'generated/flighthq/scene2dCanvas/CanvasTilemap.hx',
      'generated/flighthq/scene2dGl/GlTilemap.hx',
      'generated/flighthq/scene2dWgpu/WgpuTilemap.hx',
      'generated/flighthq/tilemap/Tilemap.hx',
      'generated/flighthq/tilemapFormats/TiledGid.hx',
      'generated/flighthq/tilemapFormats/TiledProject.hx',
      'generated/flighthq/tilemapFormats/TiledTmxFormat.hx',
    ]) {
      const generatedTilemap = readFileSync(path, 'utf8');
      expect(generatedTilemap).not.toMatch(
        /_Runtime\.field\((?:data|frame|map|object|property|ref|source|tile|tilemap|tileset),/u,
      );
      expect(generatedTilemap).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:TiledGid|TiledMap|TiledObject|TiledProperty|TiledTileset|TiledTilesetRef|TiledTilesetTile|TiledTilesetTileFrame|Tilemap|TilemapData)\)\./u,
      );
    }
    expect(readFileSync('generated/flighthq/tilemap/Tilemap.hx', 'utf8')).toMatch(
      /var __destructure[0-9]+:TilemapData/u,
    );
    expect(readFileSync('generated/flighthq/tilemapFormats/TiledProject.hx', 'utf8')).toMatch(
      /var __destructure[0-9]+:TiledGid/u,
    );
    for (const path of [
      'generated/flighthq/materials/ClearcoatPbrExtension.hx',
      'generated/flighthq/materials/IridescencePbrExtension.hx',
      'generated/flighthq/materials/SpecularPbrExtension.hx',
      'generated/flighthq/materials/TransmissionVolumePbrExtension.hx',
      'generated/flighthq/materials/WrappedDiffusePbrExtension.hx',
      'generated/flighthq/scene3dFormats/GltfTransmissionVolume.hx',
      'generated/flighthq/scene3dGl/ClearcoatPbrGlExtension.hx',
      'generated/flighthq/scene3dGl/IridescencePbrGlExtension.hx',
      'generated/flighthq/scene3dGl/SpecularPbrGlExtension.hx',
      'generated/flighthq/scene3dGl/TransmissionVolumePbrGlExtension.hx',
      'generated/flighthq/scene3dGl/WrappedDiffusePbrGlExtension.hx',
      'generated/flighthq/scene3dResources/ClearcoatPbrScene3DMaterialTextures.hx',
      'generated/flighthq/scene3dResources/IridescencePbrScene3DMaterialTextures.hx',
      'generated/flighthq/scene3dResources/SpecularPbrScene3DMaterialTextures.hx',
      'generated/flighthq/scene3dResources/TransmissionVolumePbrScene3DMaterialTextures.hx',
      'generated/flighthq/scene3dResources/WrappedDiffusePbrScene3DMaterialTextures.hx',
    ]) {
      const generatedPbrExtension = readFileSync(path, 'utf8');
      expect(generatedPbrExtension).not.toMatch(
        /_Runtime\.field\((?:clearcoat|extension|iridescence|specular|target|transmission|value|wrappedDiffuse),/u,
      );
      expect(generatedPbrExtension).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:ClearcoatPbrExtension|IridescencePbrExtension|SpecularPbrExtension|TransmissionVolumePbrExtension|WrappedDiffusePbrExtension)\)\./u,
      );
    }
    for (const path of [
      'generated/flighthq/binpack/ExplainUnpackedRectangles.hx',
      'generated/flighthq/binpack/PackRectangles.hx',
      'generated/flighthq/cameraControls/FlyCameraController.hx',
      'generated/flighthq/node/NodeOrderList.hx',
      'generated/flighthq/particleemitter/EmitParticleBurst3D.hx',
      'generated/flighthq/particleemitter/ParticleEmitter3D.hx',
      'generated/flighthq/particleemitter/UpdateParticleEmitter3D.hx',
      'generated/flighthq/scene3dGl/GlParticleEmitter3D.hx',
      'generated/flighthq/scene3dWgpu/WgpuParticleEmitter3D.hx',
      'generated/flighthq/socket/ExplainSocketSendFailure.hx',
      'generated/flighthq/socket/Socket.hx',
    ]) {
      const generatedFrontier = readFileSync(path, 'utf8');
      expect(generatedFrontier).not.toMatch(
        /_Runtime\.field\((?:a|b|emitter|list|out|rect|rectangle|runtime|source),/u,
      );
      expect(generatedFrontier).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:FlyCameraController|NodeOrderList(?:<[^>]+>)?|PackableRectangle|ParticleEmitter3D|SocketRuntime)\)\./u,
      );
    }
    for (const path of [
      'generated/flighthq/clock/Clock.hx',
      'generated/flighthq/clock/ClockSignals.hx',
      'generated/flighthq/lighting/AreaLight.hx',
      'generated/flighthq/movieclip/MovieClip.hx',
      'generated/flighthq/path/PathMeshPool.hx',
      'generated/flighthq/path/TessellatePathTyped.hx',
      'generated/flighthq/path/TessellateStrokePath.hx',
      'generated/flighthq/scene2dFormats/LottieDocument.hx',
      'generated/flighthq/scene2dGl/GlMeshShapeRenderer.hx',
      'generated/flighthq/scene2dWgpu/WgpuMeshShapeRenderer.hx',
    ]) {
      const generatedSecondFrontier = readFileSync(path, 'utf8');
      expect(generatedSecondFrontier).not.toMatch(/_Runtime\.field\((?:clock|fresh|layer|mesh),/u);
      expect(generatedSecondFrontier).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:AreaLight|Clock|LottieLayer|MovieClipData|PathMesh)\)\./u,
      );
    }
    expect(readFileSync('generated/flighthq/clock/Clock.hx', 'utf8')).not.toMatch(/_Runtime\.field\(current,/u);
    expect(readFileSync('generated/flighthq/lighting/AreaLight.hx', 'utf8')).not.toMatch(/_Runtime\.field\(source,/u);
    for (const path of [
      'generated/flighthq/bitmapfontFormats/BitmapFontFnt.hx',
      'generated/flighthq/interaction/RegisterSpriteHitTest.hx',
      'generated/flighthq/layout/AnchorLayout.hx',
      'generated/flighthq/layout/FlexLayout.hx',
      'generated/flighthq/layout/GridLayout.hx',
      'generated/flighthq/layout/ResolveLayoutTree.hx',
      'generated/flighthq/renderGl/GlDraw.hx',
      'generated/flighthq/renderGl/GlExternalTexture.hx',
      'generated/flighthq/renderWgpu/WgpuDraw.hx',
      'generated/flighthq/renderWgpu/WgpuExternalTexture.hx',
      'generated/flighthq/scene2dCanvas/CanvasRichText.hx',
      'generated/flighthq/scene2dCanvas/CanvasTextInput.hx',
      'generated/flighthq/scene2dCanvas/CanvasTextureWindowSource.hx',
      'generated/flighthq/scene2dDom/DomTextInput.hx',
      'generated/flighthq/scene2dGl/GlTextInput.hx',
      'generated/flighthq/scene2dWgpu/WgpuTextInput.hx',
      'generated/flighthq/scene3d/SceneKindUsage.hx',
      'generated/flighthq/scene3dFormats/GltfEmissiveStrength.hx',
      'generated/flighthq/scene3dFormats/GltfMaterialExtension.hx',
      'generated/flighthq/scene3dFormats/GltfParse.hx',
      'generated/flighthq/scene3dFormats/GltfSpecularGlossiness.hx',
      'generated/flighthq/scene3dFormats/GltfUnlit.hx',
      'generated/flighthq/scene3dFormats/ObjParse.hx',
      'generated/flighthq/scene3dGl/ExplainGlScene3DCoverage.hx',
      'generated/flighthq/scene3dGl/GlEnvironmentCube.hx',
      'generated/flighthq/scene3dGl/StandardPbrGlMeshMaterialRenderer.hx',
      'generated/flighthq/scene3dResources/ExplainScene3DResourceCoverage.hx',
      'generated/flighthq/scene3dResources/ResolveScene3DResources.hx',
      'generated/flighthq/scene3dWgpu/ExplainWgpuScene3DCoverage.hx',
      'generated/flighthq/scene3dWgpu/StandardPbrWgpuMeshMaterialRenderer.hx',
      'generated/flighthq/scene3dWgpu/WgpuEnvironmentCube.hx',
      'generated/flighthq/textinput/TextInputEditing.hx',
      'generated/flighthq/texture/CubeTexture.hx',
      'generated/flighthq/texture/Texture.hx',
      'generated/flighthq/textureatlas/TextureAtlas.hx',
    ]) {
      const generatedThirdFrontier = readFileSync(path, 'utf8');
      expect(generatedThirdFrontier).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:LayoutNode(?:<[^>]+>)?|Scene3DKindUsage|StandardPbrMaterial|TextSelectionRectangle|TextureSource)\)\./u,
      );
    }
    expect(readFileSync('generated/flighthq/scene3d/SceneKindUsage.hx', 'utf8')).not.toMatch(
      /_Runtime\.field\(usage,/u,
    );
    for (const path of [
      'generated/flighthq/hostElectron/ElectronApp.hx',
      'generated/flighthq/hostElectron/ElectronClipboard.hx',
      'generated/flighthq/hostElectron/ElectronDialog.hx',
      'generated/flighthq/hostElectron/ElectronIpc.hx',
      'generated/flighthq/hostElectron/ElectronMenu.hx',
      'generated/flighthq/hostElectron/ElectronNotification.hx',
      'generated/flighthq/hostElectron/ElectronPlatform.hx',
      'generated/flighthq/hostElectron/ElectronPower.hx',
      'generated/flighthq/hostElectron/ElectronProtocol.hx',
      'generated/flighthq/hostElectron/ElectronScreen.hx',
      'generated/flighthq/hostElectron/ElectronShell.hx',
      'generated/flighthq/hostElectron/ElectronShortcut.hx',
      'generated/flighthq/hostElectron/ElectronStorage.hx',
      'generated/flighthq/hostElectron/ElectronTray.hx',
      'generated/flighthq/hostElectron/ElectronUpdater.hx',
      'generated/flighthq/hostElectron/ElectronWindow.hx',
      'generated/flighthq/layout/EnableLayoutGuards.hx',
      'generated/flighthq/layout/LayoutState.hx',
      'generated/flighthq/layout/ResolveLayoutTree.hx',
      'generated/flighthq/mesh/MeshGeometry.hx',
      'generated/flighthq/mesh/MeshGeometryCompute.hx',
      'generated/flighthq/mesh/MeshGeometryLayout.hx',
      'generated/flighthq/mesh/UpdateMeshMorph.hx',
      'generated/flighthq/quadbatch/QuadBatch.hx',
      'generated/flighthq/scene2dCanvas/CanvasQuadBatch.hx',
      'generated/flighthq/scene2dGl/GlQuadBatch.hx',
      'generated/flighthq/scene2dGl/GlVelocity.hx',
      'generated/flighthq/scene2dWgpu/WgpuQuadBatch.hx',
      'generated/flighthq/scene2dWgpu/WgpuVelocity.hx',
      'generated/flighthq/scene3dGl/GlLitProgram.hx',
      'generated/flighthq/scene3dWgpu/WgpuMeshUpload.hx',
      'generated/flighthq/scene3dWgpu/WgpuSkinPalette.hx',
    ]) {
      const generatedFourthFrontier = readFileSync(path, 'utf8');
      expect(generatedFourthFrontier).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:ElectronApi|GlLitProgram|LayoutState|MeshGeometryRuntime|QuadBatch)\)\./u,
      );
    }
    expect(readFileSync('generated/flighthq/hostElectron/ElectronApp.hx', 'utf8')).not.toMatch(
      /_Runtime\.field\(electron,/u,
    );
    expect(readFileSync('generated/flighthq/layout/ResolveLayoutTree.hx', 'utf8')).not.toMatch(
      /_Runtime\.field\(state,/u,
    );
    expect(readFileSync('generated/flighthq/scene3dGl/GlLitProgram.hx', 'utf8')).not.toMatch(
      /_Runtime\.field\(program,/u,
    );
    expect(readFileSync('generated/flighthq/quadbatch/QuadBatch.hx', 'utf8')).not.toMatch(/_Runtime\.field\(batch,/u);
    for (const path of [
      'generated/flighthq/effects/GodRaysMath.hx',
      'generated/flighthq/effectsGl/GlGodRaysEffect.hx',
      'generated/flighthq/effectsWgpu/WgpuGodRaysEffect.hx',
      'generated/flighthq/render/SceneRender.hx',
      'generated/flighthq/scene2dDom/DomNativeText.hx',
      'generated/flighthq/scene2dFormats/LottieDocument.hx',
      'generated/flighthq/scene3dGl/GlLitProgram.hx',
      'generated/flighthq/scene3dWgpu/WgpuMeshPipeline.hx',
      'generated/flighthq/text/NativeText.hx',
      'generated/flighthq/textinput/TextInput.hx',
    ]) {
      expect(readFileSync(path, 'utf8')).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:GodRaysEffect|LottieDocument|NativeTextData|Scene3DLightBlock|TextInputOptions)\)\./u,
      );
    }
    expect(readFileSync('generated/flighthq/effects/GodRaysMath.hx', 'utf8')).not.toMatch(/_Runtime\.field\(effect,/u);
    expect(readFileSync('generated/flighthq/textinput/TextInput.hx', 'utf8')).not.toMatch(/_Runtime\.field\(options,/u);
    for (const path of [
      'generated/flighthq/bitmaptext/BitmapText.hx',
      'generated/flighthq/bitmaptext/UpdateBitmapText.hx',
      'generated/flighthq/effects/GradientGlowEffect.hx',
      'generated/flighthq/effectsCanvas/CanvasGradientGlowEffect.hx',
      'generated/flighthq/effectsGl/GlGradientGlowEffect.hx',
      'generated/flighthq/effectsWgpu/WgpuGradientGlowEffect.hx',
      'generated/flighthq/scene2dWgpu/WgpuColorAdjustmentMaterialFeature.hx',
      'generated/flighthq/scene2dWgpu/WgpuShapeData.hx',
      'generated/flighthq/scene2dWgpu/WgpuShapeMesh.hx',
      'generated/flighthq/scene3d/SceneDocument.hx',
      'generated/flighthq/scene3dFormats/Awd2Parse.hx',
      'generated/flighthq/scene3dFormats/GltfParse.hx',
      'generated/flighthq/scene3dFormats/Md5Parse.hx',
      'generated/flighthq/scene3dFormats/ObjParse.hx',
      'generated/flighthq/scene3dFormats/ThreeDsParse.hx',
      'generated/flighthq/scene3dResources/LoadScene3DResources.hx',
      'generated/flighthq/scene3dResources/ResolveScene3DResources.hx',
      'generated/flighthq/scene3dResources/SceneResourceResolver.hx',
      'generated/flighthq/scene3dResources/SceneResourceSignals.hx',
    ]) {
      expect(readFileSync(path, 'utf8')).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:BitmapTextData|GradientGlowEffect|Scene3DDocumentNode|Scene3DResourceResolverRuntime|WgpuShapeMeshBuffers)\)\./u,
      );
    }
    for (const path of [
      'generated/flighthq/effects/GradientGlowEffect.hx',
      'generated/flighthq/effectsCanvas/CanvasGradientGlowEffect.hx',
      'generated/flighthq/effectsGl/GlGradientGlowEffect.hx',
      'generated/flighthq/effectsWgpu/WgpuGradientGlowEffect.hx',
    ]) {
      expect(readFileSync(path, 'utf8')).not.toMatch(/_Runtime\.field\(effect,/u);
    }
    for (const path of [
      'generated/flighthq/lighting/DirectionalLight.hx',
      'generated/flighthq/materials/SurfaceMaterial.hx',
      'generated/flighthq/render/SceneRender.hx',
      'generated/flighthq/scene3d/SceneDocumentLights.hx',
      'generated/flighthq/scene3dFormats/Awd2Parse.hx',
      'generated/flighthq/scene3dGl/DrawGlScene3D.hx',
      'generated/flighthq/scene3dGl/GlMeshProgram.hx',
      'generated/flighthq/scene3dGl/GlParticleEmitter3D.hx',
      'generated/flighthq/scene3dGl/GlPbrStandardBlock.hx',
      'generated/flighthq/scene3dGl/GlShadowMap.hx',
      'generated/flighthq/scene3dGl/PrepareGlScene3DForwardLights.hx',
      'generated/flighthq/scene3dWgpu/DrawWgpuScene3D.hx',
      'generated/flighthq/scene3dWgpu/PrepareWgpuScene3DForwardLights.hx',
      'generated/flighthq/scene3dWgpu/StandardPbrWgpuMeshMaterialRenderer.hx',
      'generated/flighthq/scene3dWgpu/WgpuMeshPipeline.hx',
      'generated/flighthq/scene3dWgpu/WgpuParticleEmitter3D.hx',
      'generated/flighthq/scene3dWgpu/WgpuShadowMap.hx',
      'generated/flighthq/shape/ExplainMorphShapeGradientEndpoints.hx',
      'generated/flighthq/shape/MorphShapePaint.hx',
      'generated/flighthq/spatial/FormatSpatialIndexingNotice.hx',
    ]) {
      expect(readFileSync(path, 'utf8')).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:DirectionalLight|MorphShapeGradientEndpoint|Scene3DRenderList|SpatialIndexingNotice|SurfaceMaterial)\)\./u,
      );
    }
    expect(readFileSync('generated/flighthq/lighting/DirectionalLight.hx', 'utf8')).not.toMatch(
      /_Runtime\.field\(light,/u,
    );
    expect(readFileSync('generated/flighthq/materials/SurfaceMaterial.hx', 'utf8')).not.toMatch(
      /_Runtime\.field\(material,/u,
    );
    for (const path of [
      'generated/flighthq/effects/InnerGlowEffect.hx',
      'generated/flighthq/effectsCanvas/CanvasInnerGlowEffect.hx',
      'generated/flighthq/effectsGl/GlInnerGlowEffect.hx',
      'generated/flighthq/effectsWgpu/WgpuInnerGlowEffect.hx',
      'generated/flighthq/materials/CustomShaderMaterial.hx',
      'generated/flighthq/motionpath/MotionPath.hx',
      'generated/flighthq/render/ExplainScene2DCoverage.hx',
      'generated/flighthq/scene2d/SceneKindUsage.hx',
      'generated/flighthq/scene2dCanvas/ExplainCanvasScene2DCoverage.hx',
      'generated/flighthq/scene2dGl/ExplainGlScene2DCoverage.hx',
      'generated/flighthq/scene3dGl/CustomShaderGlMeshMaterialRenderer.hx',
      'generated/flighthq/scene3dWgpu/CustomShaderWgpuMeshMaterialRenderer.hx',
      'generated/flighthq/scene3dWgpu/EnableWgpuScene3DCustomShaderGuards.hx',
      'generated/flighthq/texture/RenderTexture.hx',
    ]) {
      expect(readFileSync(path, 'utf8')).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:CreateRenderTextureOptions|CustomShaderMaterial|InnerGlowEffect|MotionPath|Scene2DKindUsage)\)\./u,
      );
    }
    expect(readFileSync('generated/flighthq/effects/InnerGlowEffect.hx', 'utf8')).not.toMatch(
      /_Runtime\.field\(effect,/u,
    );
    expect(readFileSync('generated/flighthq/motionpath/MotionPath.hx', 'utf8')).not.toMatch(
      /_Runtime\.field\(motionPath,/u,
    );
    for (const path of [
      'generated/flighthq/abc/AbcFile.hx',
      'generated/flighthq/animation/AnimationRootMotion.hx',
      'generated/flighthq/effectsCanvas/CanvasRenderTextureEffect.hx',
      'generated/flighthq/log/Log.hx',
      'generated/flighthq/scene2dCanvas/CanvasRenderTexturePool.hx',
      'generated/flighthq/swf/SwfFrameAction.hx',
    ]) {
      expect(readFileSync(path, 'utf8')).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:AbcInstruction|AbcMultiname|AnimationRootMotionExtractor|CanvasRenderTexturePool|LogEntry)\)\./u,
      );
    }
    expect(readFileSync('generated/flighthq/abc/AbcFile.hx', 'utf8')).not.toMatch(
      /_Runtime\.field\((?:instruction|multiname),/u,
    );
    expect(readFileSync('generated/flighthq/log/Log.hx', 'utf8')).not.toMatch(/_Runtime\.field\(entry,/u);
    for (const path of [
      'generated/flighthq/effects/ConvolutionEffect.hx',
      'generated/flighthq/effectsGl/GlConvolutionEffect.hx',
      'generated/flighthq/effectsWgpu/WgpuConvolutionEffect.hx',
      'generated/flighthq/materials/UnlitMaterials.hx',
      'generated/flighthq/scene3dFormats/GltfUnlit.hx',
      'generated/flighthq/scene3dGl/EmissiveGlMeshMaterialRenderer.hx',
      'generated/flighthq/scene3dGl/ToonGlMeshMaterialRenderer.hx',
      'generated/flighthq/scene3dGl/UnlitGlMeshMaterialRenderer.hx',
      'generated/flighthq/scene3dResources/SceneMaterialTextureRegistry.hx',
      'generated/flighthq/scene3dWgpu/EmissiveWgpuMeshMaterialRenderer.hx',
      'generated/flighthq/scene3dWgpu/ToonWgpuMeshMaterialRenderer.hx',
      'generated/flighthq/scene3dWgpu/UnlitWgpuMeshMaterialRenderer.hx',
      'generated/flighthq/skeleton2d/Skeleton2d.hx',
    ]) {
      expect(readFileSync(path, 'utf8')).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:ConvolutionEffect|EmissiveMaterial|ToonMaterial|TransformInherit2D|UnlitMaterial)\)\./u,
      );
    }
    expect(readFileSync('generated/flighthq/effects/ConvolutionEffect.hx', 'utf8')).not.toMatch(
      /_Runtime\.field\(effect,/u,
    );
    for (const path of [
      'generated/flighthq/animation/AnimationClip.hx',
      'generated/flighthq/animation/AnimationPlayer.hx',
      'generated/flighthq/bitmaptext/BitmapText.hx',
      'generated/flighthq/bitmaptext/UpdateBitmapText.hx',
      'generated/flighthq/materials/ExtendedPbrMaterial.hx',
      'generated/flighthq/scene2dCanvas/CanvasBitmapText.hx',
      'generated/flighthq/scene2dGl/GlBitmapText.hx',
      'generated/flighthq/scene2dWgpu/WgpuBitmapText.hx',
      'generated/flighthq/scene3dFormats/GltfEmissiveStrength.hx',
      'generated/flighthq/scene3dFormats/GltfMaterialExtension.hx',
      'generated/flighthq/scene3dGl/ExtendedPbrGlMeshMaterialRenderer.hx',
      'generated/flighthq/scene3dResources/SceneMaterialTextureRegistry.hx',
      'generated/flighthq/scene3dWgpu/WgpuMeshPipeline.hx',
      'generated/flighthq/scene3dWgpu/WgpuShadowMap.hx',
      'generated/flighthq/tween/Tween.hx',
      'generated/flighthq/tween/TweenProgress.hx',
      'generated/flighthq/tween/UpdateTweens.hx',
      'generated/flighthq/tween/_internal/_Internal.hx',
    ]) {
      expect(readFileSync(path, 'utf8')).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:AnimationClipEvent|BitmapTextRuntime|ExtendedPbrMaterial|TweenPropertyDetail|WgpuScene3DShadow)\)\./u,
      );
    }
    expect(readFileSync('generated/flighthq/animation/AnimationClip.hx', 'utf8')).not.toMatch(
      /_Runtime\.field\(event,/u,
    );
    for (const path of [
      'generated/flighthq/animation/AnimationBlendTree.hx',
      'generated/flighthq/animation/AnimationLayerStack.hx',
      'generated/flighthq/animation/AnimationStateMachine.hx',
      'generated/flighthq/animation/AnimationStateMachineAdvance.hx',
      'generated/flighthq/cameraControls/OrbitCameraController.hx',
      'generated/flighthq/materials/ClassicMaterials.hx',
      'generated/flighthq/renderGl/GlRenderState.hx',
      'generated/flighthq/scene2dGl/GlColorAdjustmentMaterialFeature.hx',
      'generated/flighthq/scene2dWgpu/WgpuMeshShapeRenderer.hx',
      'generated/flighthq/scene2dWgpu/WgpuRasterShapeRenderer.hx',
      'generated/flighthq/scene2dWgpu/WgpuShapeData.hx',
      'generated/flighthq/scene3dGl/LambertGlMeshMaterialRenderer.hx',
      'generated/flighthq/scene3dWgpu/LambertWgpuMeshMaterialRenderer.hx',
    ]) {
      expect(readFileSync(path, 'utf8')).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:AnimationBlendTree|GlColorScaleBiasInstancedShader|LambertMaterial|OrbitCameraControllerOptions|WgpuShapeRendererData)\)\./u,
      );
    }
    for (const path of [
      'generated/flighthq/effectsGl/GlRenderTextureEffect.hx',
      'generated/flighthq/effectsWgpu/WgpuRenderTextureEffect.hx',
      'generated/flighthq/renderGl/GlRenderTexturePool.hx',
      'generated/flighthq/renderWgpu/WgpuRenderState.hx',
      'generated/flighthq/renderWgpu/WgpuRenderTexturePool.hx',
      'generated/flighthq/scene2dGl/GlMeshShapeRenderer.hx',
      'generated/flighthq/scene2dGl/GlRasterShapeRenderer.hx',
      'generated/flighthq/scene2dGl/GlShapeData.hx',
      'generated/flighthq/scene2dWgpu/WgpuQuadBatchWriter.hx',
      'generated/flighthq/scene3dGl/ShadedGlMeshMaterialRenderer.hx',
    ]) {
      expect(readFileSync(path, 'utf8')).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:GlRenderTexturePool|GlShadedProgram|GlShapeRendererData|WgpuQuadBatchWriterBufferSlot|WgpuRenderTexturePool)\)\./u,
      );
    }
    for (const path of [
      'generated/flighthq/hostCapacitor/CapacitorKeyboard.hx',
      'generated/flighthq/interaction/RegisterSpriteHitTest.hx',
      'generated/flighthq/keyboard/Keyboard.hx',
      'generated/flighthq/layout/AnchorLayout.hx',
      'generated/flighthq/layout/FlexLayout.hx',
      'generated/flighthq/layout/GridLayout.hx',
      'generated/flighthq/layout/ResolveLayoutTree.hx',
      'generated/flighthq/movieclip/SpritesheetTimelineSource.hx',
      'generated/flighthq/scene2d/Sprite.hx',
      'generated/flighthq/scene2dCanvas/CanvasSprite.hx',
      'generated/flighthq/scene2dDom/DomSprite.hx',
      'generated/flighthq/scene2dGl/GlSprite.hx',
      'generated/flighthq/scene2dWgpu/WgpuSprite.hx',
      'generated/flighthq/swf/SwfDocument.hx',
      'generated/flighthq/textlayout/TextLayout.hx',
      'generated/flighthq/textshaper/TextShaper.hx',
      'generated/flighthq/textshaper/TextShaperRun.hx',
    ]) {
      expect(readFileSync(path, 'utf8')).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:LayoutTree|SoftKeyboardInfo|Sprite|TextLayoutParams|TextShaperBackend)\)\./u,
      );
    }
    for (const path of [
      'generated/flighthq/animation/AnimationBlend.hx',
      'generated/flighthq/animation/AnimationBlendTree.hx',
      'generated/flighthq/animation/AnimationLayerStack.hx',
      'generated/flighthq/scene2dFormats/LottieDocument.hx',
      'generated/flighthq/skeleton2d/TransformConstraint2D.hx',
    ]) {
      expect(readFileSync(path, 'utf8')).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:AnimationBlendTreeInput|AnimationLayer|AnimationSampleAccumulator|LottieKeyframe|Skeleton2DTransformConstraint)\)\./u,
      );
    }
    for (const path of [
      'generated/flighthq/abc/AbcFile.hx',
      'generated/flighthq/materials/SheenPbrExtension.hx',
      'generated/flighthq/net/Net.hx',
      'generated/flighthq/scene2dCanvas/CanvasRenderTexture.hx',
      'generated/flighthq/scene3dFormats/ThreeDsParse.hx',
      'generated/flighthq/scene3dGl/SheenPbrGlExtension.hx',
      'generated/flighthq/scene3dResources/SheenPbrScene3DMaterialTextures.hx',
      'generated/flighthq/swf/SwfFrameAction.hx',
    ]) {
      expect(readFileSync(path, 'utf8')).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:AbcTrait|CanvasRenderTextureEntry|NetRequest|SheenPbrExtension|ThreeDsLight)\)\./u,
      );
    }
    for (const [path, receiver] of [
      ['generated/flighthq/abc/AbcFile.hx', 'trait'],
      ['generated/flighthq/net/Net.hx', 'request'],
      ['generated/flighthq/scene3dFormats/ThreeDsParse.hx', 'light'],
      ['generated/flighthq/scene3dGl/SheenPbrGlExtension.hx', 'extension'],
      ['generated/flighthq/scene3dResources/SheenPbrScene3DMaterialTextures.hx', 'sheen'],
    ] as const) {
      expect(readFileSync(path, 'utf8')).not.toContain(`_Runtime.field(${receiver},`);
    }
    for (const path of [
      'generated/flighthq/application/ApplicationRenderView.hx',
      'generated/flighthq/effectsWgpu/WgpuColorLutPass.hx',
      'generated/flighthq/effectsWgpu/WgpuRenderEffectPipeline.hx',
      'generated/flighthq/hostTauri/TauriApp.hx',
      'generated/flighthq/hostTauri/TauriClipboard.hx',
      'generated/flighthq/hostTauri/TauriDialog.hx',
      'generated/flighthq/hostTauri/TauriMenu.hx',
      'generated/flighthq/hostTauri/TauriNotification.hx',
      'generated/flighthq/hostTauri/TauriPlatform.hx',
      'generated/flighthq/hostTauri/TauriShell.hx',
      'generated/flighthq/hostTauri/TauriShortcut.hx',
      'generated/flighthq/hostTauri/TauriTray.hx',
      'generated/flighthq/hostTauri/TauriWindow.hx',
      'generated/flighthq/node/Viewport.hx',
      'generated/flighthq/renderGl/GlRenderPass.hx',
      'generated/flighthq/scene3dWgpu/WgpuEnvironmentIblBake.hx',
      'generated/flighthq/scene3dWgpu/WgpuMeshPipeline.hx',
      'generated/flighthq/scene3dWgpu/WgpuMeshUpload.hx',
      'generated/flighthq/scene3dWgpu/WgpuShadowMap.hx',
      'generated/flighthq/scene3dWgpu/WgpuWireframeUpload.hx',
    ]) {
      expect(readFileSync(path, 'utf8')).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:TauriApi|Viewport|WgpuColorLutTextureCache|WgpuMeshUpload|WgpuScene3DIbl)\)\./u,
      );
    }
    for (const [path, receiver] of [
      ['generated/flighthq/effectsWgpu/WgpuColorLutPass.hx', 'cache'],
      ['generated/flighthq/hostTauri/TauriApp.hx', 'tauri'],
      ['generated/flighthq/node/Viewport.hx', 'viewport'],
      ['generated/flighthq/scene3dWgpu/WgpuMeshPipeline.hx', 'ibl'],
      ['generated/flighthq/scene3dWgpu/WgpuMeshUpload.hx', 'upload'],
    ] as const) {
      expect(readFileSync(path, 'utf8')).not.toContain(`_Runtime.field(${receiver},`);
    }
    for (const path of [
      'generated/flighthq/path/StrokePathGeometry.hx',
      'generated/flighthq/physics2d/DebugGeometry.hx',
      'generated/flighthq/scene3d/SceneKindUsage.hx',
      'generated/flighthq/scene3dGl/GlShadedPrelude.hx',
      'generated/flighthq/scene3dGl/ShadedGlMeshMaterialRenderer.hx',
      'generated/flighthq/scene3dWgpu/WgpuShadedPrelude.hx',
      'generated/flighthq/shading/GetModifierDefineKey.hx',
      'generated/flighthq/shading/GetUnregisteredModifierKinds.hx',
      'generated/flighthq/shading/OrderModifierStack.hx',
      'generated/flighthq/shape/CompactStrokePath.hx',
      'generated/flighthq/socket/EnableSocketGuards.hx',
      'generated/flighthq/socket/ExplainSocketSendFailure.hx',
      'generated/flighthq/socket/Socket.hx',
      'generated/flighthq/statechart/EnableStatechartGuards.hx',
      'generated/flighthq/statechart/Statechart.hx',
    ]) {
      expect(readFileSync(path, 'utf8')).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:Modifier|Physics2DDebugGeometry|Socket|StatechartState|StrokeStyle)\)\./u,
      );
    }
    for (const [path, receiver] of [
      ['generated/flighthq/path/StrokePathGeometry.hx', 'style'],
      ['generated/flighthq/physics2d/DebugGeometry.hx', 'out'],
      ['generated/flighthq/shading/GetModifierDefineKey.hx', 'modifier'],
      ['generated/flighthq/socket/Socket.hx', 'socket'],
      ['generated/flighthq/statechart/Statechart.hx', 'state'],
    ] as const) {
      expect(readFileSync(path, 'utf8')).not.toContain(`_Runtime.field(${receiver},`);
    }
    for (const path of [
      'generated/flighthq/interaction/RegisterSpriteHitTest.hx',
      'generated/flighthq/movieclip/SpritesheetTimelineSource.hx',
      'generated/flighthq/physics2d/WorldQueries.hx',
      'generated/flighthq/scene2d/Sprite.hx',
      'generated/flighthq/scene2dCanvas/CanvasSprite.hx',
      'generated/flighthq/scene2dDom/DomNativeText.hx',
      'generated/flighthq/scene2dDom/DomSprite.hx',
      'generated/flighthq/scene2dGl/GlSprite.hx',
      'generated/flighthq/scene2dWgpu/WgpuSprite.hx',
      'generated/flighthq/scene3dFormats/GltfMaterialExtension.hx',
      'generated/flighthq/scene3dGl/GlPbrExtensionRegistry.hx',
      'generated/flighthq/scene3dResources/SceneMaterialTextureRegistry.hx',
      'generated/flighthq/skeleton2d/IkConstraint2D.hx',
      'generated/flighthq/swf/SwfDocument.hx',
      'generated/flighthq/text/NativeText.hx',
    ]) {
      expect(readFileSync(path, 'utf8')).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:NativeTextRuntime|PbrExtension|Physics2DRayResult|Skeleton2DIkConstraint|SpriteData)\)\./u,
      );
    }
    for (const [path, receiver] of [
      ['generated/flighthq/physics2d/WorldQueries.hx', 'out'],
      ['generated/flighthq/skeleton2d/IkConstraint2D.hx', 'ik'],
      ['generated/flighthq/text/NativeText.hx', 'runtime'],
    ] as const) {
      expect(readFileSync(path, 'utf8')).not.toContain(`_Runtime.field(${receiver},`);
    }
    for (const path of [
      'generated/flighthq/bitmap/BitmapFingerprint.hx',
      'generated/flighthq/capture/CaptureComparison.hx',
      'generated/flighthq/effectsGl/EnableGlRenderEffectGuards.hx',
      'generated/flighthq/effectsGl/GlRenderTextureEffect.hx',
      'generated/flighthq/layout/FlexLayout.hx',
      'generated/flighthq/materials/UnlitMaterials.hx',
      'generated/flighthq/scene2dFormats/LottieDocument.hx',
      'generated/flighthq/scene2dFormats/RiveLayout.hx',
      'generated/flighthq/scene3dGl/MatcapGlMeshMaterialRenderer.hx',
      'generated/flighthq/scene3dWgpu/MatcapWgpuMeshMaterialRenderer.hx',
    ]) {
      expect(readFileSync(path, 'utf8')).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:BitmapFingerprint|FlexLayoutItemStyle|GlRenderEffectApplicationExplanation|LottieShapePath|MatcapMaterial)\)\./u,
      );
    }
    for (const [path, receiver] of [
      ['generated/flighthq/bitmap/BitmapFingerprint.hx', 'a'],
      ['generated/flighthq/effectsGl/EnableGlRenderEffectGuards.hx', 'explanation'],
      ['generated/flighthq/layout/FlexLayout.hx', 'item'],
      ['generated/flighthq/scene3dGl/MatcapGlMeshMaterialRenderer.hx', 'matcap'],
    ] as const) {
      expect(readFileSync(path, 'utf8')).not.toContain(`_Runtime.field(${receiver},`);
    }
    expect(readFileSync('generated/flighthq/scene2dFormats/LottieDocument.hx', 'utf8')).not.toContain(
      "_Runtime.field(value, 'v')",
    );
    for (const path of [
      'generated/flighthq/accessibility/Accessibility.hx',
      'generated/flighthq/effectsCanvas/CanvasVignetteEffect.hx',
      'generated/flighthq/effectsGl/GlVignetteEffect.hx',
      'generated/flighthq/effectsWgpu/WgpuVignetteEffect.hx',
      'generated/flighthq/renderWgpu/WgpuDraw.hx',
      'generated/flighthq/scene2dWgpu/WgpuShapeMesh.hx',
      'generated/flighthq/scene3dWgpu/DrawWgpuScene3D.hx',
    ]) {
      expect(readFileSync(path, 'utf8')).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:AccessibilityState|VignetteEffect|WgpuScene3DDrawEntry|WgpuShapeMesh|WgpuVideoTextureEntry)\)\./u,
      );
    }
    expect(readFileSync('generated/flighthq/accessibility/Accessibility.hx', 'utf8')).not.toContain(
      "_Runtime.field(state, 'disabled')",
    );
    for (const path of [
      'generated/flighthq/effectsCanvas/CanvasVignetteEffect.hx',
      'generated/flighthq/effectsGl/GlVignetteEffect.hx',
      'generated/flighthq/effectsWgpu/WgpuVignetteEffect.hx',
    ]) {
      expect(readFileSync(path, 'utf8')).not.toContain('_Runtime.field(effect,');
    }
    for (const path of [
      'generated/flighthq/effects/RenderEffectPadding.hx',
      'generated/flighthq/effectsCanvas/CanvasRenderEffectPipeline.hx',
      'generated/flighthq/node/NodeColorAdjustment.hx',
      'generated/flighthq/render/RenderTarget.hx',
      'generated/flighthq/scene3dGl/DrawGlScene3D.hx',
      'generated/flighthq/shading/CreateShadedMaterial.hx',
    ]) {
      expect(readFileSync(path, 'utf8')).not.toMatch(
        /\(cast [A-Za-z_][A-Za-z0-9_]* : (?:flighthq\.types\.)?(?:CanvasRenderEffectPipeline|ColorAdjustmentRuntime|GlScene3DDrawEntry|RenderEffectPadding|ShadedMaterialOptions)\)\./u,
      );
    }
    expect(readFileSync('generated/flighthq/effects/RenderEffectPadding.hx', 'utf8')).not.toContain(
      '_Runtime.field(padding,',
    );
    expect(readFileSync('generated/flighthq/render/RenderTarget.hx', 'utf8')).not.toContain('_Runtime.field(padding,');
    expect(readFileSync('generated/flighthq/shading/CreateShadedMaterial.hx', 'utf8')).not.toContain(
      'final __structural',
    );
    const generatedCanvasRenderState = readFileSync('generated/flighthq/scene2dCanvas/CanvasRenderState.hx', 'utf8');
    expect(generatedCanvasRenderState).not.toMatch(
      /\(cast (?:runtime|sourceRuntime|targetRuntime) : CanvasRenderStateRuntime\)\./u,
    );
    for (const [path, typeName] of [
      ['generated/flighthq/effectsGl/GlRenderEffectPipeline.hx', 'GlRenderEffectPipeline'],
      ['generated/flighthq/effectsWgpu/WgpuRenderEffectPipeline.hx', 'WgpuRenderEffectPipeline'],
    ] as const) {
      expect(readFileSync(path, 'utf8')).not.toContain(`(cast pipeline : flighthq.types.${typeName}).`);
    }
    for (const [path, typeName] of [
      ['generated/flighthq/renderGl/GlRenderPass.hx', 'GlScissorRect'],
      ['generated/flighthq/renderGl/GlRenderTarget.hx', 'GlScissorRect'],
      ['generated/flighthq/scene2dGl/GlClipRectangle.hx', 'GlScissorRect'],
      ['generated/flighthq/renderWgpu/WgpuScissor.hx', 'WgpuScissorRect'],
      ['generated/flighthq/scene2dWgpu/WgpuClipRectangle.hx', 'WgpuScissorRect'],
    ] as const) {
      expect(readFileSync(path, 'utf8')).not.toContain(`: ${typeName}).`);
    }
    for (const path of [
      'generated/flighthq/scene3dGl/GlShadedBuiltInModifiers.hx',
      'generated/flighthq/scene3dWgpu/WgpuShadedPrelude.hx',
      'generated/flighthq/shading/CreateAnimatedNormalModifier.hx',
      'generated/flighthq/shading/CreateDissolveModifier.hx',
      'generated/flighthq/shading/CreateEmissiveModifier.hx',
      'generated/flighthq/shading/CreateVertexDisplaceModifier.hx',
      'generated/flighthq/shading/RegisterBuiltInModifiers.hx',
    ]) {
      const generatedModifier = readFileSync(path, 'utf8');
      expect(generatedModifier).not.toMatch(/_Runtime\.field\(modifier,/u);
      expect(generatedModifier).not.toMatch(
        /\(cast modifier : (?:AnimatedNormalModifier|DissolveModifier|EmissiveModifier|FogModifier|VertexDisplaceModifier)\)\./u,
      );
    }
    expect(codec?.memberEscapes).toEqual(
      expect.arrayContaining([
        expect.objectContaining({
          member: 'parseToDocument',
          reason: 'receiver-sensitive-method',
          source: 'upstream/packages/types/src/ParticleFormatCodec.ts:12',
        }),
      ]),
    );
    expect(typedStructSummary(report)).toContain(
      '| `@flighthq/types:interface#ParticleFormatCodec` | `parseToDocument` | `receiver-sensitive-method` | `upstream/packages/types/src/ParticleFormatCodec.ts:12` |',
    );
  }, 180_000);

  it('preserves source typing for audit-only schemas without enabling registry bindings', () => {
    const result = lowerFixture(
      `
        export interface Vector2 { x: number; y: number; }
        export function read(value: Vector2): number { return value.x; }
      `,
      { ...fixtureCandidate, emission: 'audit-only' },
    );
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      imports: [],
      name: 'Vector2',
      packageName: '@flighthq/types',
    });
    const candidate = result.registry.report.candidates[0]!;

    expect(result.lowered.diagnostics).toEqual([]);
    expect(candidate.eligible).toBe(true);
    expect(candidate.emission).toEqual({
      directAccesses: 0,
      mode: 'audit-only',
      pendingAccesses: 1,
      reflectiveSurvivors: [],
    });
    expect(collectTypedStructBindings(result.lowered.declarations)).toEqual([]);
    expect(output).toContain('(cast value : Vector2).x');
  });

  it('preserves a partial options literal while reading its omitted field directly', () => {
    const result = lowerFixture(`
      export interface Vector2 {
        maxDeltaTime?: number;
        targetFrameRate?: number;
      }
      export function readMaxDelta(options: Vector2): number | undefined {
        return options.maxDeltaTime;
      }
      export function readPartial(): number | undefined {
        return readMaxDelta({ targetFrameRate: 60 });
      }
    `);
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      imports: [],
      name: 'Vector2',
      packageName: '@flighthq/types',
    });

    expect(result.lowered.diagnostics).toEqual([]);
    expect(collectTypedStructBindings(result.lowered.declarations).map((binding) => binding.field.name)).toEqual([
      'maxDeltaTime',
    ]);
    expect(output).toContain('return cast options.maxDeltaTime;');
    expect(output).toContain('targetFrameRate: 60.0');
    expect(output).not.toContain("_Runtime.field(options, 'maxDeltaTime')");
    expect(output).not.toContain('maxDeltaTime: _Runtime.UNDEFINED');
  });

  it('adapts direct function-field writes when TypeScript ignores trailing callback parameters', () => {
    const result = lowerFixture(
      `
        export interface Hooks {
          callback?: ((value: number, label: string) => void) | null;
        }
        function warn(): void {}
        export function install(hooks: Hooks): void {
          hooks.callback = warn;
        }
      `,
      {
        emission: 'direct',
        name: 'Hooks',
        packageName: '@flighthq/types',
        purpose: 'fixture callback assignment',
        source: 'upstream/packages/types/src/Hooks.ts',
      },
    );
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      imports: [],
      name: 'Hooks',
      packageName: '@flighthq/types',
    });

    expect(result.lowered.diagnostics).toEqual([]);
    expect(output).toContain(
      'hooks.callback = cast (function(__unused0:Float, __unused1:String):Void { warn(); } : Null<Float->String->Void>)',
    );
  });

  it('lowers defensive nullish assignment on required primitive fields portably', () => {
    const result = lowerFixture(`
      export interface Vector2 { x: number; y: number; }
      export function initialize(value: Vector2): number {
        return value.x ??= 0;
      }
    `);
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      imports: [],
      name: 'Vector2',
      packageName: '@flighthq/types',
    });

    expect(result.lowered.diagnostics).toEqual([]);
    expect(output).toContain('final __nullishValue1:Null<Float>');
    expect(output).toContain(
      '__nullishValue1 == null ? (__nullishOwner0.x = (cast 0.0 : Float)) : (cast __nullishValue1 : Float)',
    );
    expect(output).not.toContain('value.x ??=');
    expect(output).not.toContain('Dynamic = cast __nullishOwner0.x');
  });

  it('writes result records directly inside a plain anonymous backend', () => {
    const result = lowerFixture(`
      export interface Vector2 {
        hasKeyboard: boolean;
        hasMouse: boolean;
      }
      export interface Backend {
        getCapabilities(out: Vector2): Vector2;
      }
      export function createBackend(): Backend {
        return {
          getCapabilities(out) {
            out.hasKeyboard = false;
            out.hasMouse = false;
            return out;
          },
        };
      }
    `);
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      imports: [],
      name: 'Vector2',
      packageName: '@flighthq/types',
    });

    expect(result.lowered.diagnostics).toEqual([]);
    expect(collectTypedStructBindings(result.lowered.declarations).map((binding) => binding.field.name)).toEqual([
      'hasKeyboard',
      'hasMouse',
    ]);
    expect(output).toContain('(out.hasKeyboard = cast (false : Bool))');
    expect(output).toContain('(out.hasMouse = cast (false : Bool))');
    expect(output).not.toContain("_Runtime.setField(out, 'has");
  });

  it('emits bound fields directly while preserving optional and receiver-sensitive semantics', () => {
    const result = lowerFixture(`
      export interface Vector2 {
        readonly x: number;
        y: number;
        optional?: number;
        requiredUndefined: number | undefined;
        callback: (value: number) => void;
        method(this: Vector2): void;
      }
      export function update(value: Vector2): number {
        value.y = value.x;
        value.y += 1;
        value.y++;
        value.callback(value.y);
        value.method();
        return value.optional ?? value.requiredUndefined ?? 0;
      }
      export function readOptional(factory: () => Vector2 | undefined): number | undefined {
        return factory()?.optional;
      }
    `);
    const bindings = collectTypedStructBindings(result.lowered.declarations);
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      imports: [],
      name: 'Vector2',
      packageName: '@flighthq/types',
    });

    expect(result.lowered.diagnostics).toEqual([]);
    expect(bindings.map((binding) => binding.field.name)).toEqual([
      'y',
      'x',
      'y',
      'y',
      'y',
      'callback',
      'optional',
      'requiredUndefined',
      'optional',
    ]);
    expect(bindings.find((binding) => binding.field.name === 'optional')?.field).toMatchObject({
      optional: true,
      requiredUndefined: false,
    });
    expect(bindings.find((binding) => binding.field.name === 'requiredUndefined')?.field).toMatchObject({
      optional: false,
      requiredUndefined: true,
    });
    expect(bindings.some((binding) => binding.field.name === 'method')).toBe(false);
    expect(output).toContain('(value.y = cast (value.x : Float))');
    expect(output).toContain('(value.y += 1.0)');
    expect(output).toContain('value.y++');
    expect(output).toContain('(value.callback)((cast value.y : Float))');
    expect(output).toContain('(cast value : Vector2).method()');
    expect(output).toContain('final __typedStruct0 = (cast factory() : Null<Vector2>)');
    expect(output).toContain(
      '__typedStruct0 == null ? _Runtime.UNDEFINED : (cast __typedStruct0 : { @:optional var optional:Null<Float>; }).optional',
    );
    expect(output).not.toContain("_Runtime.field(value, '");
    expect(output).not.toContain("_Runtime.setField(value, '");
    expect(output).not.toContain("_Runtime.incrementField(value, '");
  });

  it('resolves aliases and Readonly wrappers to the canonical schema identity', () => {
    const result = lowerFixture(`
      export interface Vector2 { x: number; y: number; }
      export type Vector2Like = Readonly<Vector2>;
      export function read(value: Vector2Like): number { return value.x + value.y; }
    `);
    const bindings = collectTypedStructBindings(result.lowered.declarations);

    expect(result.lowered.diagnostics).toEqual([]);
    expect(bindings.map((binding) => binding.field.name)).toEqual(['x', 'y']);
    expect(new Set(bindings.map((binding) => binding.schemaId))).toEqual(
      new Set(['@flighthq/types:interface#Vector2']),
    );
  });

  it('narrows indexed-access storage before reading a bound field directly', () => {
    const result = lowerFixture(`
      export interface Vector2 { x: number; y: number; }
      interface Container { values: readonly Vector2[]; optional?: Vector2; }
      export function readArray(value: Readonly<Container['values'][number]>): number { return value.x; }
      export function readOptional(value: NonNullable<Container['optional']>): number { return value.y; }
      export function readDirect(value: Vector2): number { return value.x; }
    `);
    const bindings = collectTypedStructBindings(result.lowered.declarations);
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      imports: [],
      name: 'Vector2',
      packageName: '@flighthq/types',
    });

    expect(result.lowered.diagnostics).toEqual([]);
    expect(bindings.map((binding) => binding.field.name)).toEqual(['x', 'y', 'x']);
    expect(output).toContain('(cast value : { var x:Float; }).x');
    expect(output).toContain('(cast value : { var y:Float; }).y');
    expect(output).toContain('return cast value.x;');
    expect(output).not.toContain('(cast value : Vector2).x');
  });

  it('casts a type-guard-narrowed receiver to its canonical struct before direct access', () => {
    const result = lowerFixture(`
      export interface SceneNode { enabled: boolean; }
      export interface Vector2 extends SceneNode { x: number; y: number; }
      export function isVector2(value: SceneNode): value is Vector2 { return 'x' in value; }
      export function read(value: SceneNode): number {
        return isVector2(value) ? value.x : 0;
      }
    `);
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      imports: [],
      name: 'Vector2',
      packageName: '@flighthq/types',
    });

    expect(result.lowered.diagnostics).toEqual([]);
    expect(collectTypedStructBindings(result.lowered.declarations)).toEqual([
      expect.objectContaining({
        receiverCast: expect.objectContaining({
          fields: [expect.objectContaining({ name: 'x', type: { kind: 'primitive', name: 'Float' } })],
          kind: 'anonymous',
        }),
      }),
    ]);
    expect(output).toContain('(cast value : { var x:Float; }).x');
    expect(output).not.toContain("_Runtime.field(value, 'x')");
  });

  it('binds intersection fields by declaration identity rather than matching their spelling', () => {
    const result = lowerFixture(`
      export interface Vector2 {
        own: number;
        collision: number;
      }
      interface Sibling {
        sibling: number;
        collision: number;
      }
      export function read(value: Vector2 & Sibling): number {
        return value.own + value.sibling + value.collision;
      }
    `);
    const candidate = result.registry.report.candidates[0]!;
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      imports: [],
      name: 'Vector2',
      packageName: '@flighthq/types',
    });

    expect(result.lowered.diagnostics).toEqual([]);
    expect(collectTypedStructBindings(result.lowered.declarations).map((binding) => binding.field.name)).toEqual([
      'own',
    ]);
    expect(candidate.accesses).toEqual({ calls: 0, reads: 1, writes: 0 });
    expect(candidate.escapes).toEqual([
      expect.objectContaining({ member: 'sibling', reason: 'unknown-member' }),
      expect.objectContaining({ member: 'collision', reason: 'unknown-member' }),
    ]);
    expect(output).toContain('value.own');
    expect(output).toContain('(cast value : { var sibling:Float; }).sibling');
    expect(output).toContain('(cast value : { var collision:Float; }).collision');
  });

  it('rejects unknown and readonly named writes before an emitter can trust them', () => {
    const unknown = lowerFixture(`
      export interface Vector2 { readonly x: number; y: number; }
      export function invalid(value: Vector2): number { return value.missing; }
    `);
    const readonly = lowerFixture(`
      export interface Vector2 { readonly x: number; y: number; }
      export function invalid(value: Vector2): void { value.x = 1; }
    `);

    expect(unknown.lowered.diagnostics).toEqual([
      expect.objectContaining({ message: 'Unsupported TypeScript unknown typed-struct field Vector2.missing' }),
    ]);
    expect(readonly.lowered.diagnostics).toEqual([
      expect.objectContaining({
        message: 'Unsupported TypeScript assignment to readonly typed-struct field Vector2.x',
      }),
    ]);
    expect(unknown.lowered.declarations.some((declaration) => declaration.name === 'invalid')).toBe(false);
    expect(readonly.lowered.declarations.some((declaration) => declaration.name === 'invalid')).toBe(false);
  });

  it('keeps computed and presence-sensitive accesses dynamic while typing a common union field', () => {
    const result = lowerFixture(`
      export interface Vector2 { x: number; y: number; }
      export interface Other { x: number; label: string; }
      export function direct(value: Vector2): number { return value.y; }
      export function computed(value: Vector2, key: 'x' | 'y'): number { return value[key]; }
      export function union(value: Vector2 | Other): number { return value.x; }
      export function present(value: Vector2): boolean { return 'x' in value; }
    `);
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      imports: [],
      name: 'Vector2',
      packageName: '@flighthq/types',
    });
    const candidate = result.registry.report.candidates[0]!;

    expect(result.lowered.diagnostics).toEqual([]);
    expect(collectTypedStructBindings(result.lowered.declarations)).toEqual([
      expect.objectContaining({ schemaName: 'Vector2', field: expect.objectContaining({ name: 'y' }) }),
    ]);
    expect(candidate.eligible).toBe(true);
    expect(candidate.reasons).not.toContain('presence-sensitive-use');
    expect(candidate.escapes.map((escape) => escape.reason)).toEqual(
      expect.arrayContaining(['computed-key', 'incompatible-union', 'presence-sensitive']),
    );
    expect(output).toContain('return cast value.y;');
    expect(output).toContain('_Runtime.getIndex(value, key)');
    expect(output).toContain('(cast value : { var x:Float; }).x');
    expect(output).toContain("_Runtime.hasField(value, 'x')");
  });

  it('flattens a concrete EntityWithoutRuntime alias into a strict structural typedef', () => {
    const result = lowerFixture(
      `
        export declare const EntityRuntimeKey: unique symbol;
        export interface Entity { [EntityRuntimeKey]: { binding: object | null } | undefined; }
        export type EntityWithoutRuntime<Type extends Entity> = Omit<Type, typeof EntityRuntimeKey>;
        export interface Rectangle extends Entity {
          height: number;
          width: number;
          x: number;
          y: number;
        }
        export type RectangleLike = EntityWithoutRuntime<Rectangle>;
        export function left(rect: RectangleLike): number { return rect.x; }
        export function area(rect: Readonly<RectangleLike>): number {
          const { width, height } = rect;
          return width * height;
        }
      `,
      {
        emission: 'direct',
        name: 'Rectangle',
        packageName: '@flighthq/types',
        purpose: 'concrete transparent-wrapper fixture',
        source: 'upstream/packages/types/src/Vector2.ts',
      },
    );
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      haxePackage: 'flighthq.types',
      imports: [],
      name: 'Rectangle',
      packageName: '@flighthq/types',
    });

    expect(result.lowered.diagnostics).toEqual([]);
    expect(output).toContain(
      'typedef RectangleLike = { var height:Float; var width:Float; var x:Float; var y:Float; };',
    );
    expect(output).not.toContain('typedef RectangleLike = EntityWithoutRuntime<Rectangle>;');
    expect(output).toContain('public static function left(rect:RectangleLike):Float');
    expect(output).toContain('return cast rect.x;');
    expect(output).toContain('var __destructure0:RectangleLike = cast _Runtime.UNDEFINED;');
    expect(output).toContain('__destructure0 = rect;');
    expect(output).toContain('width = __destructure0.width;');
    expect(output).toContain('height = __destructure0.height;');
    expect(output).not.toContain("_Runtime.field(__destructure0, 'width')");
    expect(output).not.toContain("_Runtime.field(__destructure0, 'height')");
  });

  it('materializes closed standard mapped aliases and retains generic or open utilities', () => {
    const result = lowerFixture(
      `
        export type Mode = 'fast' | 'safe';
        export interface Options {
          alpha: number;
          beta?: string;
          gamma: boolean;
          mode: Mode;
        }
        export type OptionalOptions = Partial<Options>;
        export type SelectedOptions = Pick<Options, 'alpha' | 'gamma'>;
        export type RemainingOptions = Omit<Options, 'beta'>;
        export type GenericOptions<Type> = Partial<Type>;
        export type OpenOptions = Partial<Record<string, number>>;
        export type StandardOptions = Partial<Date>;
      `,
      {
        ...fixtureCandidate,
        name: 'Options',
      },
    );
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      haxePackage: 'flighthq.types',
      imports: [],
      name: 'Options',
      packageName: '@flighthq/types',
    });

    expect(result.lowered.diagnostics).toEqual([]);
    expect(output).toContain(
      'typedef OptionalOptions = { @:optional var alpha:Null<Float>; @:optional var beta:Null<String>; @:optional var gamma:Null<Bool>; @:optional var mode:Null<Mode>; };',
    );
    expect(output).toContain('typedef SelectedOptions = { var alpha:Float; var gamma:Bool; };');
    expect(output).toContain('typedef RemainingOptions = { var alpha:Float; var gamma:Bool; var mode:Mode; };');
    expect(output).toContain('typedef GenericOptions<Type> = flighthq._internal._Partial<Type>;');
    expect(output).toContain(
      'typedef OpenOptions = flighthq._internal._Partial<flighthq._internal._Record<String, Float>>;',
    );
    expect(output).toContain('typedef StandardOptions = flighthq._internal._Partial<Date>;');
  });

  it('does not materialize a source-defined utility that shadows Partial', () => {
    const result = lowerFixture(
      `
        type Partial<Type> = { value: Type };
        export interface Options { alpha: number; }
        export type ShadowedOptions = Partial<Options>;
      `,
      {
        ...fixtureCandidate,
        name: 'Options',
      },
    );
    const output = emitHaxeModule({
      declarations: result.lowered.declarations,
      haxePackage: 'flighthq.types',
      imports: [],
      name: 'Options',
      packageName: '@flighthq/types',
    });

    expect(result.lowered.diagnostics).toEqual([]);
    expect(output).toContain('typedef ShadowedOptions = Partial<Options>;');
    expect(output).not.toContain('typedef ShadowedOptions = {');
  });

  it('materializes the reviewed production mapped aliases without erasing named field types', () => {
    expect(readFileSync('generated/flighthq/types/Viewport.hx', 'utf8')).toContain(
      'typedef ViewportLike = { @:optional var devicePixelRatio:Null<Float>; @:optional var height:Null<Float>; @:optional var width:Null<Float>; @:optional var x:Null<Float>; @:optional var y:Null<Float>; @:optional var __EntityRuntimeKey:Null<EntityRuntime>; };',
    );
    expect(readFileSync('generated/flighthq/types/ApplicationRenderView.hx', 'utf8')).toContain(
      'typedef ApplicationRenderViewTargetOptions = { @:optional var format:Null<RenderTargetFormat>; @:optional var colorAttachments:Null<Float>; @:optional var colorFormats:Null<Array<RenderTargetFormat>>;',
    );
    expect(readFileSync('generated/flighthq/types/FocusManager.hx', 'utf8')).toContain(
      'typedef FocusNavigationInput = { var onKeyDown:Signal<InputKeyboardData->Void>; };',
    );
    expect(readFileSync('generated/flighthq/types/InteractionManager.hx', 'utf8')).toContain(
      'typedef InteractionInputSource = { var onKeyDown:Signal<InputKeyboardData->Void>; var onKeyUp:Signal<InputKeyboardData->Void>;',
    );
    expect(readFileSync('generated/flighthq/physics2d/JointFactories.hx', 'utf8')).toContain(
      'typedef Physics2DJointBase__jointFactories = { var bodyA:Float; var bodyB:Float;',
    );
    expect(readFileSync('generated/flighthq/types/Entity.hx', 'utf8')).toContain(
      'typedef EntityWithoutRuntime<Type> = flighthq._internal._Omit<Type, Dynamic>;',
    );
    expect(readFileSync('generated/flighthq/types/Texture.hx', 'utf8')).toContain(
      'typedef TextureLike = TextureLikeFrom__Texture<flighthq.types.Texture>;',
    );
  });

  it('audits structurally wider intersections as width-sensitive', () => {
    const fixture = typedStructFixture(`
      export interface A { x: number; }
      export interface B { y: number; }
      export function read(value: A & B): number { return value.x + value.y; }
    `);
    const registry = createTypedStructRegistry(
      fixture.workspace,
      'fixture',
      [
        {
          emission: 'direct',
          name: 'A',
          packageName: '@flighthq/types',
          purpose: 'fixture width rule',
          source: fixture.source,
        },
        {
          emission: 'direct',
          name: 'B',
          packageName: '@flighthq/types',
          purpose: 'fixture width rule',
          source: fixture.source,
        },
      ],
      fixture.program,
      fixture.checker,
    );

    expect(registry.report.candidates).toHaveLength(2);
    expect(
      registry.report.candidates.every((candidate) =>
        candidate.escapes.every((escape) => escape.reason === 'width-sensitive'),
      ),
    ).toBe(true);
    expect(registry.report.candidates.map((candidate) => candidate.escapes.length)).toEqual([2, 2]);
  });
});

function lowerFixture(text: string, candidate: TypedStructCandidate = fixtureCandidate) {
  const workspace = '/workspace';
  const fileName = `${workspace}/${candidate.source}`;
  const options: ts.CompilerOptions = {
    lib: ['lib.es2022.d.ts'],
    skipLibCheck: true,
    strict: true,
    target: ts.ScriptTarget.ESNext,
  };
  const fixture = ts.createSourceFile(fileName, text, ts.ScriptTarget.Latest, true, ts.ScriptKind.TS);
  const host = ts.createCompilerHost(options);
  const getSourceFile = host.getSourceFile.bind(host);
  host.getSourceFile = (requested, languageVersion, onError, shouldCreateNewSourceFile) =>
    requested === fileName ? fixture : getSourceFile(requested, languageVersion, onError, shouldCreateNewSourceFile);
  const program = ts.createProgram([fileName], options, host);
  const source = program.getSourceFile(fileName);
  if (!source) throw new Error(`Fixture program is missing ${fileName}`);
  const checker = program.getTypeChecker();
  const registry = createTypedStructRegistry(workspace, 'fixture', [candidate], program, checker);
  return {
    lowered: lowerTypeScriptSource(source, '@flighthq/types', workspace, checker, registry),
    registry,
  };
}

function typedStructFixture(text: string) {
  const workspace = '/workspace';
  const source = 'upstream/packages/types/src/Vector2.ts';
  const fileName = `${workspace}/${source}`;
  const options: ts.CompilerOptions = {
    lib: ['lib.es2022.d.ts'],
    skipLibCheck: true,
    strict: true,
    target: ts.ScriptTarget.ESNext,
  };
  const fixture = ts.createSourceFile(fileName, text, ts.ScriptTarget.Latest, true, ts.ScriptKind.TS);
  const host = ts.createCompilerHost(options);
  const directoryExists = host.directoryExists?.bind(host);
  const fileExists = host.fileExists.bind(host);
  const getSourceFile = host.getSourceFile.bind(host);
  const readFile = host.readFile.bind(host);
  host.fileExists = (requested) => requested === fileName || fileExists(requested);
  host.directoryExists = (requested) => requested.startsWith(`${workspace}/`) || directoryExists?.(requested) === true;
  host.readFile = (requested) => (requested === fileName ? fixture.text : readFile(requested));
  host.getSourceFile = (requested, languageVersion, onError, shouldCreateNewSourceFile) =>
    requested === fileName ? fixture : getSourceFile(requested, languageVersion, onError, shouldCreateNewSourceFile);
  const program = ts.createProgram([fileName], options, host);
  const diagnostics = program.getSemanticDiagnostics();
  if (diagnostics.length > 0) {
    throw new Error(
      diagnostics.map((diagnostic) => ts.flattenDiagnosticMessageText(diagnostic.messageText, '\n')).join('\n'),
    );
  }
  return { checker: program.getTypeChecker(), program, source, workspace };
}

function classAuditFixture(productionText: string, testText: string) {
  const workspace = '/workspace';
  const source = 'upstream/packages/types/src/Vector2.ts';
  const productionFile = `${workspace}/${source}`;
  const testFile = `${workspace}/upstream/packages/types/test/Vector2.test.ts`;
  const options: ts.CompilerOptions = {
    lib: ['lib.es2022.d.ts'],
    module: ts.ModuleKind.ESNext,
    moduleResolution: ts.ModuleResolutionKind.Bundler,
    skipLibCheck: true,
    strict: true,
    target: ts.ScriptTarget.ESNext,
  };
  const fixtures = new Map([
    [
      productionFile,
      ts.createSourceFile(productionFile, productionText, ts.ScriptTarget.Latest, true, ts.ScriptKind.TS),
    ],
    [testFile, ts.createSourceFile(testFile, testText, ts.ScriptTarget.Latest, true, ts.ScriptKind.TS)],
  ]);
  const host = ts.createCompilerHost(options);
  const directoryExists = host.directoryExists?.bind(host);
  const fileExists = host.fileExists.bind(host);
  const getSourceFile = host.getSourceFile.bind(host);
  const readFile = host.readFile.bind(host);
  host.fileExists = (requested) => fixtures.has(requested) || fileExists(requested);
  host.directoryExists = (requested) => requested.startsWith(`${workspace}/`) || directoryExists?.(requested) === true;
  host.readFile = (requested) => fixtures.get(requested)?.text ?? readFile(requested);
  host.getSourceFile = (requested, languageVersion, onError, shouldCreateNewSourceFile) =>
    fixtures.get(requested) ?? getSourceFile(requested, languageVersion, onError, shouldCreateNewSourceFile);
  const program = ts.createProgram([...fixtures.keys()], options, host);
  const diagnostics = program.getSemanticDiagnostics();
  if (diagnostics.length > 0) {
    throw new Error(
      diagnostics.map((diagnostic) => ts.flattenDiagnosticMessageText(diagnostic.messageText, '\n')).join('\n'),
    );
  }
  const checker = program.getTypeChecker();
  const candidates: TypedStructCandidate[] = ['A', 'B'].map((name) => ({
    emission: 'direct',
    name,
    packageName: '@flighthq/types',
    purpose: 'class audit fixture',
    source,
  }));
  const registry = createTypedStructRegistry(workspace, 'fixture', candidates, program, checker);
  return auditTypedStructClassFeasibility(workspace, 'fixture', registry, { checker, program });
}

function provenanceAuditFixture(productionText: string) {
  const workspace = '/workspace';
  const source = 'upstream/packages/types/src/Vector2.ts';
  const productionFile = `${workspace}/${source}`;
  const options: ts.CompilerOptions = {
    lib: ['lib.es2022.d.ts'],
    module: ts.ModuleKind.ESNext,
    moduleResolution: ts.ModuleResolutionKind.Bundler,
    skipLibCheck: true,
    strict: true,
    target: ts.ScriptTarget.ESNext,
  };
  const fixture = ts.createSourceFile(productionFile, productionText, ts.ScriptTarget.Latest, true, ts.ScriptKind.TS);
  const host = ts.createCompilerHost(options);
  const directoryExists = host.directoryExists?.bind(host);
  const fileExists = host.fileExists.bind(host);
  const getSourceFile = host.getSourceFile.bind(host);
  const readFile = host.readFile.bind(host);
  host.fileExists = (requested) => requested === productionFile || fileExists(requested);
  host.directoryExists = (requested) => requested.startsWith(`${workspace}/`) || directoryExists?.(requested) === true;
  host.readFile = (requested) => (requested === productionFile ? fixture.text : readFile(requested));
  host.getSourceFile = (requested, languageVersion, onError, shouldCreateNewSourceFile) =>
    requested === productionFile
      ? fixture
      : getSourceFile(requested, languageVersion, onError, shouldCreateNewSourceFile);
  const program = ts.createProgram([productionFile], options, host);
  const diagnostics = program.getSemanticDiagnostics();
  if (diagnostics.length > 0) {
    throw new Error(
      diagnostics.map((diagnostic) => ts.flattenDiagnosticMessageText(diagnostic.messageText, '\n')).join('\n'),
    );
  }
  const checker = program.getTypeChecker();
  const candidates: TypedStructCandidate[] = ['A', 'B', 'C'].map((name) => ({
    emission: 'direct',
    name,
    packageName: '@flighthq/types',
    purpose: 'provenance audit fixture',
    source,
  }));
  const programAndChecker = { checker, program };
  const registry = createTypedStructRegistry(workspace, 'fixture', candidates, program, checker);
  const classAudit = auditTypedStructClassFeasibility(workspace, 'fixture', registry, programAndChecker);
  return auditTypedStructProvenance(workspace, 'fixture', registry, classAudit, programAndChecker);
}

function candidateId(candidate: TypedStructCandidate): string {
  return typedStructStableId(candidate.packageName, 'interface', candidate.name);
}

function collectTypedStructBindings(value: unknown): IrTypedStructBinding[] {
  const bindings: IrTypedStructBinding[] = [];
  const visit = (current: unknown): void => {
    if (!current || typeof current !== 'object') return;
    if (Array.isArray(current)) {
      current.forEach(visit);
      return;
    }
    const record = current as Record<string, unknown>;
    if (record.kind === 'property' && record.typedStructBinding) {
      bindings.push(record.typedStructBinding as IrTypedStructBinding);
    }
    for (const [key, child] of Object.entries(record)) {
      if (key !== 'typedStructBinding') visit(child);
    }
  };
  visit(value as IrExpression);
  return bindings;
}
