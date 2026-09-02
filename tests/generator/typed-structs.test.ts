import { execFileSync } from 'node:child_process';
import { mkdirSync, readFileSync, rmSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import ts from 'typescript';

import { auditEntityFactoryClosure } from '../../tools/generator/src/analyze/entity-factory-closure.ts';
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
import { sealCppStructInitConstructors, validateCppStructInitProvenance } from '../../tools/generator/src/emit/core.ts';
import { emitHaxeModule } from '../../tools/generator/src/emit/haxe.ts';
import {
  entityFactoryClosureSummary,
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
    const unreviewedAdditions = discovery.candidates.filter(
      (candidate) => candidate.migration.status === 'new' && candidate.emission === 'audit-only',
    );

    expect(discovery.migration.summary).toMatchObject({
      baseline: 404,
      kindChanged: 3,
      preserved: 214,
      relocated: 135,
      removed: 26,
      renamed: 26,
    });
    expect(discovery.migration.summary.newAuditOnly).toBe(unreviewedAdditions.length);
    expect(discovery.migration).toMatchObject({
      baselineUpstreamCommit: '5d24729f7360475e28a105ae0caeeaa2e1328260',
      sourceReportSha256: '01780f464ad52d5b386fc4d707fbd00a7d1ccc1e1f15426fbc514c7c59f410a3',
    });
    expect(discovery.candidates).toHaveLength(
      discovery.migration.summary.baseline -
        discovery.migration.summary.removed +
        discovery.candidates.filter((candidate) => candidate.migration.status === 'new').length,
    );
    const relocated = discovery.candidates.filter((candidate) => candidate.migration.status === 'relocated');
    expect(relocated).toHaveLength(135);
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
    const newAuditOnly = newlyDiscovered.filter((candidate) => candidate.emission === 'audit-only');
    const newDirect = newlyDiscovered.filter((candidate) => candidate.emission === 'direct');
    expect(newlyDiscovered).toHaveLength(newAuditOnly.length + newDirect.length);
    expect(newAuditOnly).toHaveLength(discovery.migration.summary.newAuditOnly);
    expect(
      newDirect
        .map((candidate) => typedStructStableId(candidate.packageName, candidate.declarationKind, candidate.name))
        .sort(),
    ).toEqual(reviewedTypedStructDirectAdditions.map((addition) => addition.id).sort());
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
          name: 'CollisionTimeOfImpact2D',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free 2D collision time of impact after dimension-explicit upstream rename',
        }),
        expect.objectContaining({
          name: 'Physics2DMassData',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free physics mass data',
        }),
        expect.objectContaining({
          name: 'CollisionManifold2D',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free 2D collision manifold after dimension-explicit upstream rename',
        }),
        expect.objectContaining({
          name: 'CollisionContactManifold2D',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free 2D collision contact manifold after dimension-explicit upstream rename',
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
          name: 'CollisionRaycastHit2D',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free 2D collision raycast hit after dimension-explicit upstream rename',
        }),
        expect.objectContaining({
          name: 'Physics2DRayHit',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free physics ray hit',
        }),
        expect.objectContaining({
          name: 'CollisionContactPoint2D',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free 2D collision contact point after dimension-explicit upstream rename',
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
        expect.objectContaining({
          name: 'DisplayObject',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free display object',
        }),
        expect.objectContaining({
          name: 'GridLayoutItemStyle',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free grid item style',
        }),
        expect.objectContaining({
          name: 'NativeText',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free native text',
        }),
        expect.objectContaining({
          name: 'TextLabelRuntime',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free text-label runtime',
        }),
        expect.objectContaining({
          name: 'AccessibilityNode',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free accessibility node',
        }),
        expect.objectContaining({
          name: 'CapacitorApi',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Capacitor API',
        }),
        expect.objectContaining({
          name: 'CapacitorDeviceInfo',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Capacitor device info',
        }),
        expect.objectContaining({
          name: 'ElectronDisplay',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Electron display',
        }),
        expect.objectContaining({
          name: 'ElectronRectangle',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Electron rectangle',
        }),
        expect.objectContaining({
          name: 'SoftKeyboard',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free soft keyboard',
        }),
        expect.objectContaining({
          name: 'AnimationLayerStack',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free animation layer stack',
        }),
        expect.objectContaining({
          name: 'StatechartTransitionExplanation',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free statechart transition explanation',
        }),
        expect.objectContaining({
          name: 'StatechartCondition',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free statechart condition',
        }),
        expect.objectContaining({
          name: 'StatechartRegion',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free statechart region',
        }),
        expect.objectContaining({
          name: 'StatechartInput',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free statechart input',
        }),
        expect.objectContaining({
          name: 'FlyCameraControllerOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free fly-camera controller options',
        }),
        expect.objectContaining({
          name: 'MeshMorph',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free mesh morph',
        }),
        expect.objectContaining({
          name: 'Scene3DDocumentMesh',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Scene3D document mesh',
        }),
        expect.objectContaining({
          name: 'MeshMorphBindPose',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free mesh morph bind pose',
        }),
        expect.objectContaining({
          name: 'Scene3DForwardLightSelection',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Scene3D forward-light selection',
        }),
        expect.objectContaining({
          name: 'CanvasRenderTargetPool',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Canvas render-target pool',
        }),
        expect.objectContaining({
          name: 'ColorLutCache',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free color LUT cache',
        }),
        expect.objectContaining({
          name: 'GlShapeMeshBinding',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL shape-mesh binding',
        }),
        expect.objectContaining({
          name: 'GlVelocityContext',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL velocity context',
        }),
        expect.objectContaining({
          name: 'WgpuVelocityContext',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGPU velocity context',
        }),
        expect.objectContaining({
          name: 'AbcFile',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free ABC file',
        }),
        expect.objectContaining({
          name: 'AbcConstantPool',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free ABC constant pool',
        }),
        expect.objectContaining({
          name: 'LottieTransform',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Lottie transform',
        }),
        expect.objectContaining({
          name: 'LottieDashEntry',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Lottie dash entry',
        }),
        expect.objectContaining({
          name: 'LottieTextDocument',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Lottie text document',
        }),
        expect.objectContaining({
          name: 'AreaLightOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free area-light options',
        }),
        expect.objectContaining({
          name: 'SpotLightOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free spot-light options',
        }),
        expect.objectContaining({
          name: 'PointLightOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free point-light options',
        }),
        expect.objectContaining({
          name: 'DirectionalLightOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free directional-light options',
        }),
        expect.objectContaining({
          name: 'WgpuTextureSourceTextureEntry',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGPU texture-source entry',
        }),
        expect.objectContaining({
          name: 'WgpuEffectPipeline',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGPU effect pipeline',
        }),
        expect.objectContaining({
          name: 'WgpuMeshPipeline',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGPU mesh pipeline',
        }),
        expect.objectContaining({
          name: 'WgpuSavedPassState',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGPU saved pass state',
        }),
        expect.objectContaining({
          name: 'GltfPunctualLight',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free glTF punctual light',
        }),
        expect.objectContaining({
          name: 'GltfCamera',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free glTF camera',
        }),
        expect.objectContaining({
          name: 'ThreeDsCamera',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free 3DS camera',
        }),
        expect.objectContaining({
          name: 'Scene3DDocumentScene',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Scene3D document scene',
        }),
        expect.objectContaining({
          name: 'Skin',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free skin',
        }),
        expect.objectContaining({
          name: 'TextSegment',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free text segment',
        }),
        expect.objectContaining({
          name: 'TextInputHistoryEntry',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free text-input history entry',
        }),
        expect.objectContaining({
          name: 'FocusManager',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free focus manager',
        }),
        expect.objectContaining({
          name: 'SelectableRichTextManager',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free selectable rich-text manager',
        }),
        expect.objectContaining({
          name: 'TextInputManager',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free text-input manager',
        }),
        expect.objectContaining({
          name: 'AnimationBlendTreeChannel',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free animation blend-tree channel',
        }),
        expect.objectContaining({
          name: 'AnimationCrossfadeChannel',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free animation crossfade channel',
        }),
        expect.objectContaining({
          name: 'AnimationLayerStackChannel',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free animation layer-stack channel',
        }),
        expect.objectContaining({
          name: 'AnimationStateMachineChannel',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free animation state-machine channel',
        }),
        expect.objectContaining({
          name: 'AnimationStateMachineState',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free animation state-machine state',
        }),
        expect.objectContaining({
          name: 'BlendEffect',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free blend effect',
        }),
        expect.objectContaining({
          name: 'BlurEffect',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free blur effect',
        }),
        expect.objectContaining({
          name: 'FilmGrainEffect',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free film-grain effect',
        }),
        expect.objectContaining({
          name: 'GlitchEffect',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free glitch effect',
        }),
        expect.objectContaining({
          name: 'OutlineEffect',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free outline effect',
        }),
        expect.objectContaining({
          name: 'Physics2DDebugGeometryOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free physics debug-geometry options',
        }),
        expect.objectContaining({
          name: 'Physics2DGearJointOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free physics gear-joint options',
        }),
        expect.objectContaining({
          name: 'Physics2DMouseJointOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free physics mouse-joint options',
        }),
        expect.objectContaining({
          name: 'Physics2DPrismaticJointOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free physics prismatic-joint options',
        }),
        expect.objectContaining({
          name: 'Physics2DWheelJointOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free physics wheel-joint options',
        }),
        expect.objectContaining({
          name: 'GlColorLutTextureCache',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL color-LUT texture cache',
        }),
        expect.objectContaining({
          name: 'GlScene3DIbl',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL Scene3D IBL',
        }),
        expect.objectContaining({
          name: 'GlShapeMeshColorScaleBiasShader',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL shape-mesh color-scale-bias shader',
        }),
        expect.objectContaining({
          name: 'GlToonProgram',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL toon program',
        }),
        expect.objectContaining({
          name: 'GlWireframeUpload',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WebGL wireframe upload',
        }),
        expect.objectContaining({
          name: 'CrtEffect',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free CRT effect',
        }),
        expect.objectContaining({
          name: 'DirectionalBlurEffect',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free directional-blur effect',
        }),
        expect.objectContaining({
          name: 'LensFlareEffect',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free lens-flare effect',
        }),
        expect.objectContaining({
          name: 'RadialBlurEffect',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free radial-blur effect',
        }),
        expect.objectContaining({
          name: 'TiltShiftEffect',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free tilt-shift effect',
        }),
        expect.objectContaining({
          name: 'AnisotropyPbrExtension',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free anisotropy PBR extension',
        }),
        expect.objectContaining({
          name: 'DepthMaterial',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free depth material',
        }),
        expect.objectContaining({
          name: 'NormalMaterial',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free normal material',
        }),
        expect.objectContaining({
          name: 'VertexColorMaterial',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free vertex-color material',
        }),
        expect.objectContaining({
          name: 'WireframeMaterial',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free wireframe material',
        }),
        expect.objectContaining({
          name: 'FlowStack',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free flow stack',
        }),
        expect.objectContaining({
          name: 'FlowState',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free flow state',
        }),
        expect.objectContaining({
          name: 'TimelineAudioCue',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free timeline audio cue',
        }),
        expect.objectContaining({
          name: 'TimelineLabel',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free timeline label',
        }),
        expect.objectContaining({
          name: 'TimelineSignals',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free timeline signals',
        }),
        expect.objectContaining({
          name: 'VelocityField',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free velocity field',
        }),
        expect.objectContaining({
          name: 'CreateExternalTextureOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free external-texture options',
        }),
        expect.objectContaining({
          name: 'RenderQueue',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free render queue',
        }),
        expect.objectContaining({
          name: 'QuadBatchRuntime',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free quad-batch runtime',
        }),
        expect.objectContaining({
          name: 'Raster2DSurface',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free backend-neutral raster surface',
        }),
        expect.objectContaining({
          name: 'BitmapBevelOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free bitmap bevel options',
        }),
        expect.objectContaining({
          name: 'BitmapDisplacementMapOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free bitmap displacement-map options',
        }),
        expect.objectContaining({
          name: 'BitmapConvolutionOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free bitmap convolution options',
        }),
        expect.objectContaining({
          name: 'BitmapGradientBevelOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free bitmap gradient-bevel options',
        }),
        expect.objectContaining({
          name: 'BitmapGradientGlowOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free bitmap gradient-glow options',
        }),
        expect.objectContaining({
          name: 'AttachmentSkin2D',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free attachment skin',
        }),
        expect.objectContaining({
          name: 'RegionAttachment2D',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free region attachment',
        }),
        expect.objectContaining({
          name: 'PathAttachment2D',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free path attachment',
        }),
        expect.objectContaining({
          name: 'PointAttachment2D',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free point attachment',
        }),
        expect.objectContaining({
          name: 'ClippingAttachment2D',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free clipping attachment',
        }),
        expect.objectContaining({
          name: 'MorphShapeLineEndpoint',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free morph-shape line endpoint',
        }),
        expect.objectContaining({
          name: 'MorphShapeColorEndpoint',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free morph-shape color endpoint',
        }),
        expect.objectContaining({
          name: 'MorphShapePathBinding',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free morph-shape path binding',
        }),
        expect.objectContaining({
          name: 'MorphShapeAnimationTarget',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free morph-shape animation target',
        }),
        expect.objectContaining({
          name: 'SwfMorphShapePaths',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free SWF morph-shape paths',
        }),
        expect.objectContaining({
          name: 'Physics3DWorld',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Physics3D world',
        }),
        expect.objectContaining({
          name: 'Physics3DMassData',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Physics3D mass data',
        }),
        expect.objectContaining({
          name: 'Physics3DHingeJoint',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Physics3D hinge joint',
        }),
        expect.objectContaining({
          name: 'Physics3DSliderJoint',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Physics3D slider joint',
        }),
        expect.objectContaining({
          name: 'Physics3DContactConstraint',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Physics3D contact constraint',
        }),
        expect.objectContaining({
          name: 'Physics3DContactConstraintPoint',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Physics3D contact-constraint point',
        }),
        expect.objectContaining({
          name: 'Physics3DConeTwistJoint',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Physics3D cone-twist joint',
        }),
        expect.objectContaining({
          name: 'Physics3DGeneric6DofJoint',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Physics3D generic six-DOF joint',
        }),
        expect.objectContaining({
          name: 'DomRenderRegistries',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free DOM render registries',
        }),
        expect.objectContaining({
          name: 'RenderRegistries',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free render registries',
        }),
        expect.objectContaining({
          name: 'CffIndex',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free CFF index',
        }),
        expect.objectContaining({
          name: 'SfntTableDirectory',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free SFNT table directory',
        }),
        expect.objectContaining({
          name: 'SfntTableRange',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free SFNT table range',
        }),
        expect.objectContaining({
          name: 'Woff2GlyfStreams',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WOFF2 glyf streams',
        }),
        expect.objectContaining({
          name: 'Woff2TableEntry',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free WOFF2 table entry',
        }),
        expect.objectContaining({
          name: 'CatalogEntry',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free scene coverage catalog entry',
        }),
        expect.objectContaining({
          name: 'CatalogRegistration',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free scene coverage catalog registration',
        }),
        expect.objectContaining({
          name: 'RegistryCatalog',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free registry catalog',
        }),
        expect.objectContaining({
          name: 'RegistryCatalogEntry',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free registry catalog entry',
        }),
        expect.objectContaining({
          name: 'Requirement',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free registry requirement',
        }),
        expect.objectContaining({
          name: 'Physics3DGeneric6DofJointOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Physics3D generic six-DOF joint options',
        }),
        expect.objectContaining({
          name: 'Physics3DJointFrameOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Physics3D joint-frame options',
        }),
        expect.objectContaining({
          name: 'Physics3DJointOptions',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Physics3D joint options',
        }),
        expect.objectContaining({
          name: 'Physics3DSequentialImpulseConfig',
          packageName: '@flighthq/types',
          purpose: 'reviewed escape-free Physics3D sequential-impulse config',
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
        declarationFingerprint: 'sha256:7b13d22a6501300f888dfc1d174bb0d7a4eb02db97f0112d52adcd1f0d4156ba',
        id: '@flighthq/types:interface#GlRenderStateRuntime',
        purpose: 'reviewed escape-free WebGL render-state runtime',
      },
      {
        declarationFingerprint: 'sha256:aebdf41761931dac048956317e71e4924db4e1d756cdb71350a0c3395cbc6e8b',
        id: '@flighthq/types:interface#CanvasRenderTarget',
        purpose: 'reviewed escape-free Canvas render target',
      },
      {
        declarationFingerprint: 'sha256:e4935b11659066d8df77aaa20b30893233c77e02a633645dc163e6a9aa544f59',
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
        declarationFingerprint: 'sha256:e8e718c9a2fc110b9f33f3d8af52a03c9cd022c91939c2ac4a89d8bbec43bf81',
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
        declarationFingerprint: 'sha256:55ee81118f0e45a43a3c48b30232417b99732ab1105927547fb55f44cdfe6c00',
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
        declarationFingerprint: 'sha256:c4157b990247a1cf3e358e8ddae5bef9ee4b2d0acebc1f3630e6e3594369951c',
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
        declarationFingerprint: 'sha256:22fd14cbeff906498e6edbd2d1b4bacab27556b1e3e49e1216933d2785fec45d',
        id: '@flighthq/types:interface#GlScene3DRuntime',
        purpose: 'reviewed escape-free WebGL scene runtime',
      },
      {
        declarationFingerprint: 'sha256:d73b5ce1b57506125a02a6af3df57a93e786f126e2f9cc4a43a4ca12cc6647fe',
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
        declarationFingerprint: 'sha256:0cc5d013eb9ecafdeb4d08c1a88a6db2734c337e645bf5418e9d7f11c3d797ea',
        id: '@flighthq/types:interface#ShadedMaterial',
        purpose: 'reviewed escape-free shaded material',
      },
      {
        declarationFingerprint: 'sha256:a4bf57d5ee691bc8b9bbd14d7522a743ffab830d31566f22e4deef7b6d723d58',
        id: '@flighthq/types:interface#SpecularGlossinessPbrMaterial',
        purpose: 'reviewed escape-free specular-glossiness PBR material',
      },
      {
        declarationFingerprint: 'sha256:0510aa935e4804e99b66c1a10f6e1279ab32589493498ca1dbebaf24176c331f',
        id: '@flighthq/types:interface#PhongMaterial',
        purpose: 'reviewed escape-free Phong material',
      },
      {
        declarationFingerprint: 'sha256:fc92192bbae7a57eeb08054226aa4afeb15de7cf2c60739109a4b5803a61bb20',
        id: '@flighthq/types:interface#BlinnPhongMaterial',
        purpose: 'reviewed escape-free Blinn-Phong material',
      },
      {
        declarationFingerprint: 'sha256:1c285541caead8d5b1b57d898fffaf5eb240a01f1ca74a91bb910133f58947eb',
        id: '@flighthq/types:interface#RenderStateRuntime',
        purpose: 'reviewed escape-free render-state runtime',
      },
      {
        declarationFingerprint: 'sha256:f0d40c25ffe0591e6ea74f08dd22ec61859b14d72b08dbf54d2b642fd68e5cb9',
        id: '@flighthq/types:interface#RenderProxy',
        purpose: 'reviewed escape-free render proxy',
      },
      {
        declarationFingerprint: 'sha256:0a8d83da2d0248649e6b7200c1cef7462b9438b5ae01577f4efa27d8fb957109',
        id: '@flighthq/types:interface#DomRenderStateRuntime',
        purpose: 'reviewed escape-free DOM render-state runtime',
      },
      {
        declarationFingerprint: 'sha256:f1ab7ec236b568f33e9b66eec91b29426d97375591f5060c6a649f9439d5d083',
        id: '@flighthq/types:interface#ResolvedRenderTargetDescriptor',
        purpose: 'reviewed escape-free resolved render-target descriptor',
      },
      {
        declarationFingerprint: 'sha256:23b508e780cb7961f22f26d996610340b3542df2d5804c493ad65292e48a3e68',
        id: '@flighthq/types:interface#Scene3DRenderProxy',
        purpose: 'reviewed escape-free Scene3D render proxy',
      },
      {
        declarationFingerprint: 'sha256:9857efd596ffe6f3cd132688ed2264e350ad971fb56bbc6ab0c21e04bf59a1f8',
        id: '@flighthq/types:interface#Velocity2D',
        purpose: 'reviewed escape-free 2D velocity',
      },
      {
        declarationFingerprint: 'sha256:c0ed0a556d84d92379c5ceea6f10db4b92255b6633ea4e34a9d102483f40da61',
        id: '@flighthq/types:interface#CollisionTimeOfImpact2D',
        purpose: 'reviewed escape-free 2D collision time of impact after dimension-explicit upstream rename',
      },
      {
        declarationFingerprint: 'sha256:4db498c8ac68087d55e1489e845ae6c93c321ef8e63c84e2848d03acd2aca853',
        id: '@flighthq/types:interface#Physics2DMassData',
        purpose: 'reviewed escape-free physics mass data',
      },
      {
        declarationFingerprint: 'sha256:d6aeed28d689880b86690274be5bf1bbae4e6925518f467b381c0a3fb848ba57',
        id: '@flighthq/types:interface#CollisionManifold2D',
        purpose: 'reviewed escape-free 2D collision manifold after dimension-explicit upstream rename',
      },
      {
        declarationFingerprint: 'sha256:70433e9e6573de517e1e3ff1ea8550a8fbcd0d69578f822f81a548ac128a2cc3',
        id: '@flighthq/types:interface#CollisionContactManifold2D',
        purpose: 'reviewed escape-free 2D collision contact manifold after dimension-explicit upstream rename',
      },
      {
        declarationFingerprint: 'sha256:2bb0058f4ee30df35910f715952ba564655e18a8f91d5e981212a644478e74e5',
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
        declarationFingerprint: 'sha256:2e891860961c40694e0204cbd987d650d4f8762a6d3d6ef3bd340e98b44c1af2',
        id: '@flighthq/types:interface#Physics2DRevoluteJoint',
        purpose: 'reviewed escape-free physics revolute joint',
      },
      {
        declarationFingerprint: 'sha256:4c5c7df2276c0ba36c720adc9c2f10a21508a54448a1f67dcb2587581d3ca5c2',
        id: '@flighthq/types:interface#Skeleton2D',
        purpose: 'reviewed escape-free 2D skeleton',
      },
      {
        declarationFingerprint: 'sha256:f3df109087ade0de26157b3ee09b2f37ab1e92d4685ace63c1b088c3809b829c',
        id: '@flighthq/types:interface#Skeleton3D',
        purpose: 'reviewed escape-free 3D skeleton',
      },
      {
        declarationFingerprint: 'sha256:77bf0f172a896ccce04fb27b31e7fdedec6d24293ad0864f737721597d4d0aa7',
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
        declarationFingerprint: 'sha256:7e697ecfffc8e5104e3e0bc9d2257c08f1f4b162258e53df6c4201f24ee96223',
        id: '@flighthq/types:interface#CollisionRaycastHit2D',
        purpose: 'reviewed escape-free 2D collision raycast hit after dimension-explicit upstream rename',
      },
      {
        declarationFingerprint: 'sha256:9094ab4baa041a3973eb2471908827999044b59892109431e6ce46c93436a483',
        id: '@flighthq/types:interface#Physics2DRayHit',
        purpose: 'reviewed escape-free physics ray hit',
      },
      {
        declarationFingerprint: 'sha256:49d86e4cbb8bd06a2c29ad03a6c6f45088a9596d1f200bb9bb55f07c6842ee10',
        id: '@flighthq/types:interface#CollisionContactPoint2D',
        purpose: 'reviewed escape-free 2D collision contact point after dimension-explicit upstream rename',
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
        declarationFingerprint: 'sha256:a10acf0108d1714db25e5cd6fb3fd0b81964716afd987ef044dd1fcd2333e459',
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
        declarationFingerprint: 'sha256:49829034e818c85135b2db072891f05b640940dd5d6514596579035b22109f96',
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
        declarationFingerprint: 'sha256:a54f58b205d53b959529e62ab802c89eab67ac85849468b97f99d2f06f71e5aa',
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
        declarationFingerprint: 'sha256:c1566a9ef3f76a0a5845445ebb0ad24f240f195794ca401aff5832dc9ead917b',
        id: '@flighthq/types:interface#NodeInteractionState',
        purpose: 'reviewed escape-free node interaction state',
      },
      {
        declarationFingerprint: 'sha256:2c60e479926c797a20ea429b5a01bfba2c2b8d18bb72b90d1cad2d33d7bf9d60',
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
        declarationFingerprint: 'sha256:536acfeb8adf5990afe92ebb61f68034b3e9b20bf0c9ea500f398f8d74b0f718',
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
        declarationFingerprint: 'sha256:eb3c5963e698ab1eed121c92ac6e155716fa5e4290d28387409fcdbc96ba6647',
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
        declarationFingerprint: 'sha256:2bdbe3ada235694e4763bdd4790a27ed58622ac27fe80ef8d7378eebd44f0e9f',
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
        declarationFingerprint: 'sha256:cca48392cc0563408359655051fa56fa10bc7f87bc7ff62ad06dc65a87430355',
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
        declarationFingerprint: 'sha256:18941a2c71192e6c26ca772bcfe4339627f7d9de02702c8ca85e91f143e56b31',
        id: '@flighthq/types:interface#ToonMaterial',
        purpose: 'reviewed escape-free toon material',
      },
      {
        declarationFingerprint: 'sha256:417acaac58c0e2858150ca2c9b932592fac6c505e7cf14fcc530a0751bbb7d65',
        id: '@flighthq/types:interface#UnlitMaterial',
        purpose: 'reviewed escape-free unlit material',
      },
      {
        declarationFingerprint: 'sha256:bde9a7679c21f48a1a9479c7bfcd6dd049d9255cee1c88feaecc530e7fbfb5fc',
        id: '@flighthq/types:interface#ConvolutionEffect',
        purpose: 'reviewed escape-free convolution effect',
      },
      {
        declarationFingerprint: 'sha256:f6ce7b48e8cfcf10e0d23b4d42b6c4889c92638bfc8343e6505fae82bbb7b586',
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
        declarationFingerprint: 'sha256:51fd90371ed793b2a0ea3f8784b335ed1ff2a7a7749be968805fd04754d0f5d4',
        id: '@flighthq/types:interface#BitmapTextRuntime',
        purpose: 'reviewed escape-free bitmap-text runtime',
      },
      {
        declarationFingerprint: 'sha256:eb2748590ab9d2f4190685a0e0023dcfbc58ae2fcfa924a12b27f0b5867c273c',
        id: '@flighthq/types:interface#GlColorScaleBiasInstancedShader',
        purpose: 'reviewed escape-free WebGL color scale-bias instanced shader',
      },
      {
        declarationFingerprint: 'sha256:7989056728641ab50c58e89af6020dcefd9fe796a4b99bba6047a58af20c103c',
        id: '@flighthq/types:interface#LambertMaterial',
        purpose: 'reviewed escape-free Lambert material',
      },
      {
        declarationFingerprint: 'sha256:f1dbf387c55015f5b44dbbe97535bcc3591c79fc936b1381180dc3f65b3da869',
        id: '@flighthq/types:interface#OrbitCameraControllerOptions',
        purpose: 'reviewed escape-free orbit-camera options',
      },
      {
        declarationFingerprint: 'sha256:92fef010744eaee91acad5aea117b6edee38f2f89e6546173d8728ac627f103a',
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
        declarationFingerprint: 'sha256:31cadf0a506da69f7c8df86f6b91bb4f048c2669d118cde2ce59c15187c99e12',
        id: '@flighthq/types:interface#GlRenderTexturePool',
        purpose: 'reviewed escape-free WebGL render-texture pool',
      },
      {
        declarationFingerprint: 'sha256:ea78be613c04f60f3a3dfb6529793a1e50fdf4a6d96d13246cb23de6e92ccdab',
        id: '@flighthq/types:interface#GlShadedProgram',
        purpose: 'reviewed escape-free WebGL shaded program',
      },
      {
        declarationFingerprint: 'sha256:1bdd157fa0fc26ff269d89b93a87f8fdec95c934d02cdafdfd30875efb8edf63',
        id: '@flighthq/types:interface#GlShapeRendererData',
        purpose: 'reviewed escape-free WebGL shape-renderer data',
      },
      {
        declarationFingerprint: 'sha256:0362fdf0b62095db70100964f8f2d188eae552a2513337d7a145648619fd9486',
        id: '@flighthq/types:interface#WgpuQuadBatchWriterBufferSlot',
        purpose: 'reviewed escape-free WebGPU quad-batch buffer slot',
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
        declarationFingerprint: 'sha256:31d73dbaa19b2ef6cf67f3fadd4a1b5319ee6881fb53b0fa1213c11a3b34115d',
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
        declarationFingerprint: 'sha256:9120c1f4326056903cb3c9f42bd0a00ecc74b9e9b0656c18fdcf8047e92f363c',
        id: '@flighthq/types:interface#MatcapMaterial',
        purpose: 'reviewed escape-free matcap material',
      },
      {
        declarationFingerprint: 'sha256:ce922284ec58aebfe1997133806dde22e7754a0ac71bda478870249b6a938926',
        id: '@flighthq/types:interface#LottieShapePath',
        purpose: 'reviewed escape-free Lottie shape path',
      },
      {
        declarationFingerprint: 'sha256:9b76f1af7c0c56fb8e63f46501e7fbd383c1ca70e99a8c2150f52e1ecd678a6d',
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
        declarationFingerprint: 'sha256:19afb18fb092b624bbd1cde411781b148a4786e8dc14bc25d8305755907b3f0c',
        id: '@flighthq/types:interface#GlScene3DDrawEntry',
        purpose: 'reviewed escape-free WebGL Scene3D draw entry',
      },
      {
        declarationFingerprint: 'sha256:3f073246cc4c3bc480231452c128a1e7887dfcbe84ace00b3cabb63a2b5a4f9b',
        id: '@flighthq/types:interface#ShadedMaterialOptions',
        purpose: 'reviewed escape-free shaded-material options',
      },
      {
        declarationFingerprint: 'sha256:d113313a017369bd2254f2d17a856a87160bc56d6a23b1099d81bb802192ff51',
        id: '@flighthq/types:interface#RenderEffectPadding',
        purpose: 'reviewed escape-free render-effect padding',
      },
      {
        declarationFingerprint: 'sha256:d4aa2c07ba8d4abaf82786b5682b8b5a49af14d917e142ef18f4618dcdcd6769',
        id: '@flighthq/types:interface#DisplayObject',
        purpose: 'reviewed escape-free display object',
      },
      {
        declarationFingerprint: 'sha256:2a53a77d506c3e24d49ddec40f9177f91887dcb95e9ec7f71474223753bca498',
        id: '@flighthq/types:interface#GridLayoutItemStyle',
        purpose: 'reviewed escape-free grid item style',
      },
      {
        declarationFingerprint: 'sha256:88013e44c2b9873292c3001ef0df176f90cb4974f368d0820db78530ca328431',
        id: '@flighthq/types:interface#NativeText',
        purpose: 'reviewed escape-free native text',
      },
      {
        declarationFingerprint: 'sha256:668abe75927fb5e032cce2bf278377fd1515b63ef688c280c1aa75fc7c8b8a99',
        id: '@flighthq/types:interface#TextLabelRuntime',
        purpose: 'reviewed escape-free text-label runtime',
      },
      {
        declarationFingerprint: 'sha256:0d54531616bd2ab0cae1a50a1978b2e6307e45e6937724a91c4f5dee64f19703',
        id: '@flighthq/types:interface#AccessibilityNode',
        purpose: 'reviewed escape-free accessibility node',
      },
      {
        declarationFingerprint: 'sha256:b0dc0c96ded1a17737bca7c5890baa1686ceb20716717440a7c6d69ac0b5e6fc',
        id: '@flighthq/types:interface#CapacitorApi',
        purpose: 'reviewed escape-free Capacitor API',
      },
      {
        declarationFingerprint: 'sha256:0d43596323d2b6bae32b2a18e48f1b8b9d4e1b111f4befd669e75060b5a088be',
        id: '@flighthq/types:interface#CapacitorDeviceInfo',
        purpose: 'reviewed escape-free Capacitor device info',
      },
      {
        declarationFingerprint: 'sha256:021cb40f60ced0ae90a2bcc5ab9547ce29c493b006f71521ee347cd68bfc34fa',
        id: '@flighthq/types:interface#ElectronDisplay',
        purpose: 'reviewed escape-free Electron display',
      },
      {
        declarationFingerprint: 'sha256:b6d1c737450f66fa221301095025d2d5cc6e89f73afe45f736ec72dc3c1b39eb',
        id: '@flighthq/types:interface#ElectronRectangle',
        purpose: 'reviewed escape-free Electron rectangle',
      },
      {
        declarationFingerprint: 'sha256:2570847ccc83abcfda2129d907c117c104272439a99cf9c890947af88f800a44',
        id: '@flighthq/types:interface#SoftKeyboard',
        purpose: 'reviewed escape-free soft keyboard',
      },
      {
        declarationFingerprint: 'sha256:8dcda29032e3645a19eb6084d397110b860b0be81538c518508e62fe6102e21c',
        id: '@flighthq/types:interface#AnimationLayerStack',
        purpose: 'reviewed escape-free animation layer stack',
      },
      {
        declarationFingerprint: 'sha256:f7c1c8098f7f7c82fe01a7ddf2d805715c481cb04fccaf02da88b46b1d167363',
        id: '@flighthq/types:interface#StatechartTransitionExplanation',
        purpose: 'reviewed escape-free statechart transition explanation',
      },
      {
        declarationFingerprint: 'sha256:3215c135be242191155c72f14deb9e2ac8380b6ca45320c66f824972a1d9f629',
        id: '@flighthq/types:interface#StatechartCondition',
        purpose: 'reviewed escape-free statechart condition',
      },
      {
        declarationFingerprint: 'sha256:882e0d77b136ee617b5ba9c0a7d578d413d16fd2a91d872175aa5135d01bfe4f',
        id: '@flighthq/types:interface#StatechartRegion',
        purpose: 'reviewed escape-free statechart region',
      },
      {
        declarationFingerprint: 'sha256:33eaa2d8e27482f0dd168784805292b3f4ea43bb6b6dc4828ec20cf05dc6ec46',
        id: '@flighthq/types:interface#StatechartInput',
        purpose: 'reviewed escape-free statechart input',
      },
      {
        declarationFingerprint: 'sha256:bd85b1817bcc1e551af340721e5efe989bc68b5d35234abedbb53e229cf8d9d4',
        id: '@flighthq/types:interface#FlyCameraControllerOptions',
        purpose: 'reviewed escape-free fly-camera controller options',
      },
      {
        declarationFingerprint: 'sha256:71b4483bdbf0b4a6fc8b0b13a251315a59fc167b5ba49f7629fa1662b1cd429d',
        id: '@flighthq/types:interface#MeshMorph',
        purpose: 'reviewed escape-free mesh morph',
      },
      {
        declarationFingerprint: 'sha256:c49c9ca13d552a40f3f674729c178d641b948943835cef7d9f5125e8bada05dd',
        id: '@flighthq/types:interface#Scene3DDocumentMesh',
        purpose: 'reviewed escape-free Scene3D document mesh',
      },
      {
        declarationFingerprint: 'sha256:46ae94ec0d2f4ecb8234eaf136c57802dfddfe945afee70775a2cd3b7ed391ec',
        id: '@flighthq/types:interface#MeshMorphBindPose',
        purpose: 'reviewed escape-free mesh morph bind pose',
      },
      {
        declarationFingerprint: 'sha256:8a8917d87d1e9f3bc9fe8e873e99c17984e9b9d84dc790c0049b851acb32e92c',
        id: '@flighthq/types:interface#Scene3DForwardLightSelection',
        purpose: 'reviewed escape-free Scene3D forward-light selection',
      },
      {
        declarationFingerprint: 'sha256:7236ded9f6ca6035d9481d6c2aca631ca977acd544e75373b5665c2db7fd3722',
        id: '@flighthq/types:interface#CanvasRenderTargetPool',
        purpose: 'reviewed escape-free Canvas render-target pool',
      },
      {
        declarationFingerprint: 'sha256:0d473d81ac14313acf8701b87b9845ba0b6598bffce370c9661c9a3a0d756df9',
        id: '@flighthq/types:interface#ColorLutCache',
        purpose: 'reviewed escape-free color LUT cache',
      },
      {
        declarationFingerprint: 'sha256:7b8ccd20857576a7d0ede53323b5a86d6d23b8b307faeba0bc2f406ec71547b2',
        id: '@flighthq/types:interface#GlShapeMeshBinding',
        purpose: 'reviewed escape-free WebGL shape-mesh binding',
      },
      {
        declarationFingerprint: 'sha256:4bb0b95c7721e34f551efe228cd44c568f2c48c8992d41604f80e0f3dc582058',
        id: '@flighthq/types:interface#GlVelocityContext',
        purpose: 'reviewed escape-free WebGL velocity context',
      },
      {
        declarationFingerprint: 'sha256:669927618ba45f10b871136f1943ea25c1a7d4367b9becd2dd02df1d475c5715',
        id: '@flighthq/types:interface#WgpuVelocityContext',
        purpose: 'reviewed escape-free WebGPU velocity context',
      },
      {
        declarationFingerprint: 'sha256:37795ca287195af002dc2ffce67b2c13f8bd2180ce31d09dbb3de78a3a0740ca',
        id: '@flighthq/types:interface#AbcFile',
        purpose: 'reviewed escape-free ABC file',
      },
      {
        declarationFingerprint: 'sha256:32ae95dcc7d22d69461d4060c53eb50cdd377aa71bb215906736ec0c036da37f',
        id: '@flighthq/types:interface#AbcConstantPool',
        purpose: 'reviewed escape-free ABC constant pool',
      },
      {
        declarationFingerprint: 'sha256:d21894626b9d2757d1bec65c881dbd34f84463a37d4eb1cebc327db28cbed122',
        id: '@flighthq/types:interface#LottieTransform',
        purpose: 'reviewed escape-free Lottie transform',
      },
      {
        declarationFingerprint: 'sha256:60ab6bdec3878f30bcaf79ab485dad342270d5c455ff2eb29b1d706a89b0638a',
        id: '@flighthq/types:interface#LottieDashEntry',
        purpose: 'reviewed escape-free Lottie dash entry',
      },
      {
        declarationFingerprint: 'sha256:6fdb87c8296e70368f5ddd5a6699e7b6e050cb5e2d794d4382bd58fc5e83d4e2',
        id: '@flighthq/types:interface#LottieTextDocument',
        purpose: 'reviewed escape-free Lottie text document',
      },
      {
        declarationFingerprint: 'sha256:2692ed3168285d890bf7abb2054c889a2ddeeaf73b7ed333349c732c3705c662',
        id: '@flighthq/types:interface#AreaLightOptions',
        purpose: 'reviewed escape-free area-light options',
      },
      {
        declarationFingerprint: 'sha256:d0bf1578d5df68cbb0e862e25e3ac2b9d7a0141cb8461c4a9226d61baecee179',
        id: '@flighthq/types:interface#SpotLightOptions',
        purpose: 'reviewed escape-free spot-light options',
      },
      {
        declarationFingerprint: 'sha256:35ec8d4b09d8b5e4ec4a3bb1b4cc4df6cae2b1df2ee5ff01c43296dc64029d2c',
        id: '@flighthq/types:interface#PointLightOptions',
        purpose: 'reviewed escape-free point-light options',
      },
      {
        declarationFingerprint: 'sha256:ae22f5138e53cd2df7b843f130bdd9febf39d2cad6f130edf563bb11fc9f4431',
        id: '@flighthq/types:interface#DirectionalLightOptions',
        purpose: 'reviewed escape-free directional-light options',
      },
      {
        declarationFingerprint: 'sha256:89b8cf222fe23605091e257b356350a8d4bf1de8cd89062a08a65cc99128f75a',
        id: '@flighthq/types:interface#WgpuTextureSourceTextureEntry',
        purpose: 'reviewed escape-free WebGPU texture-source entry',
      },
      {
        declarationFingerprint: 'sha256:0def27f503d792f5c38b473b5e9fbcfc235b9945fc28b8b0a2b972ab472f6d4c',
        id: '@flighthq/types:type#WgpuEffectPipeline',
        purpose: 'reviewed escape-free WebGPU effect pipeline',
      },
      {
        declarationFingerprint: 'sha256:5457497ed09b0fa23e64aa05dce5b60933f498139db0fc6470ba4f0e29804d8d',
        id: '@flighthq/types:interface#WgpuMeshPipeline',
        purpose: 'reviewed escape-free WebGPU mesh pipeline',
      },
      {
        declarationFingerprint: 'sha256:22df7e6d3385e1e076ae9715044784097c49ec0109050e4f7f8424f0fb7c93a1',
        id: '@flighthq/types:interface#WgpuSavedPassState',
        purpose: 'reviewed escape-free WebGPU saved pass state',
      },
      {
        declarationFingerprint: 'sha256:9a4b9d5d9174473533ebcc2cf171e61b59acfc5603eaae96e16d5c9e284a6034',
        id: '@flighthq/types:interface#GltfPunctualLight',
        purpose: 'reviewed escape-free glTF punctual light',
      },
      {
        declarationFingerprint: 'sha256:6bade5e485caee34db3848337c19201905ce4f65982b14d78750efbf48afa1ef',
        id: '@flighthq/types:interface#GltfCamera',
        purpose: 'reviewed escape-free glTF camera',
      },
      {
        declarationFingerprint: 'sha256:09f6242a4cf2fa26b7599d4f94ce760d6bf91fe693341ad46b9691cd24728253',
        id: '@flighthq/types:interface#ThreeDsCamera',
        purpose: 'reviewed escape-free 3DS camera',
      },
      {
        declarationFingerprint: 'sha256:6ce66003f1c3681606bdd962b865f63465e80ac078292ae9dba05deeb7ce1be5',
        id: '@flighthq/types:interface#Scene3DDocumentScene',
        purpose: 'reviewed escape-free Scene3D document scene',
      },
      {
        declarationFingerprint: 'sha256:b7e8ad399e4c8c4380cafd3c1a2f3e74211782882d88f21901a89e54cd5628e8',
        id: '@flighthq/types:interface#Skin',
        purpose: 'reviewed escape-free skin',
      },
      {
        declarationFingerprint: 'sha256:9b243f874c904eab543ac8b4bf5d2d573d276fd43d61844e87ac58bb55bfba3c',
        id: '@flighthq/types:interface#TextSegment',
        purpose: 'reviewed escape-free text segment',
      },
      {
        declarationFingerprint: 'sha256:a9ce5aa975796bb35e867912a36b63da2afa409d140e37ef526468868d688827',
        id: '@flighthq/types:interface#TextInputHistoryEntry',
        purpose: 'reviewed escape-free text-input history entry',
      },
      {
        declarationFingerprint: 'sha256:9243635aa70272176f5cfbfa387824f2d148defb705b2d56775c35a40101d7bd',
        id: '@flighthq/types:interface#FocusManager',
        purpose: 'reviewed escape-free focus manager',
      },
      {
        declarationFingerprint: 'sha256:6d058addff5ee1865dc3b94841d6a732b6c5a31f6b9474f0cb5900253ceebf44',
        id: '@flighthq/types:interface#SelectableRichTextManager',
        purpose: 'reviewed escape-free selectable rich-text manager',
      },
      {
        declarationFingerprint: 'sha256:8cc504b6ffd314ebe6b2ee4b1fbaffd18de06d27d0633a503699869b5d8a3656',
        id: '@flighthq/types:interface#TextInputManager',
        purpose: 'reviewed escape-free text-input manager',
      },
      {
        declarationFingerprint: 'sha256:d73fbec5a2c4773d9e8eb53ed511928234ed9ff9989a54401b85df4ed2c1ad56',
        id: '@flighthq/types:interface#AnimationBlendTreeChannel',
        purpose: 'reviewed escape-free animation blend-tree channel',
      },
      {
        declarationFingerprint: 'sha256:fe06435797da8cf9bf102b8854a6814b5c53dc2c5bb25df2f0dbadd34d731f39',
        id: '@flighthq/types:interface#AnimationCrossfadeChannel',
        purpose: 'reviewed escape-free animation crossfade channel',
      },
      {
        declarationFingerprint: 'sha256:9d46d35ab194d129b0c60a82cc260ec545d9c9be36d37d06a76b937ef307f883',
        id: '@flighthq/types:interface#AnimationLayerStackChannel',
        purpose: 'reviewed escape-free animation layer-stack channel',
      },
      {
        declarationFingerprint: 'sha256:454c30877bccdda403fac1dd002f9773048d6cb022fd88f025b11f2a6f45b950',
        id: '@flighthq/types:interface#AnimationStateMachineChannel',
        purpose: 'reviewed escape-free animation state-machine channel',
      },
      {
        declarationFingerprint: 'sha256:61309ced3413df8041d6b2ae9688589d56cd8c53406af08e2d975a4c7dc40cbc',
        id: '@flighthq/types:interface#AnimationStateMachineState',
        purpose: 'reviewed escape-free animation state-machine state',
      },
      {
        declarationFingerprint: 'sha256:d63118c410116509a903cf1414b9561e31bee6107c718e648d79b5c96fb3fd3b',
        id: '@flighthq/types:interface#BlendEffect',
        purpose: 'reviewed escape-free blend effect',
      },
      {
        declarationFingerprint: 'sha256:057f7b6cb433bf1bd71e9973328f74a479ab0395a4b8cf9166fc61fc32917bdf',
        id: '@flighthq/types:interface#BlurEffect',
        purpose: 'reviewed escape-free blur effect',
      },
      {
        declarationFingerprint: 'sha256:9a00b56b3964f4300679fc03b08efc716144f91285ef67e7f80fc772a723c568',
        id: '@flighthq/types:interface#FilmGrainEffect',
        purpose: 'reviewed escape-free film-grain effect',
      },
      {
        declarationFingerprint: 'sha256:2ca3b14ea2ba238108237a31c7a3a2764abd2981b1ab0e441f8977b7fc5e5df2',
        id: '@flighthq/types:interface#GlitchEffect',
        purpose: 'reviewed escape-free glitch effect',
      },
      {
        declarationFingerprint: 'sha256:e972992e03ced9fb69d2b4ba2fce5bf11410e5c020156d747ef06554c1c3cb36',
        id: '@flighthq/types:interface#OutlineEffect',
        purpose: 'reviewed escape-free outline effect',
      },
      {
        declarationFingerprint: 'sha256:47def074a0904f9f25514d36c9de48c415a0d0363de3612860855ad5f0f9f073',
        id: '@flighthq/types:interface#Physics2DDebugGeometryOptions',
        purpose: 'reviewed escape-free physics debug-geometry options',
      },
      {
        declarationFingerprint: 'sha256:78dcb4caa67b151f54c1f2a426c1264d79135c2d29ddbf220e1f930bbd6fdda1',
        id: '@flighthq/types:interface#Physics2DGearJointOptions',
        purpose: 'reviewed escape-free physics gear-joint options',
      },
      {
        declarationFingerprint: 'sha256:97b067d24a365ba0250d47d2c37194f205a4c5afd97cf32682b63175e05064b7',
        id: '@flighthq/types:interface#Physics2DMouseJointOptions',
        purpose: 'reviewed escape-free physics mouse-joint options',
      },
      {
        declarationFingerprint: 'sha256:ccf2479b5ae0df31a4a6efc5d386748dc1293079d540a6fc6914cbe8ee777b27',
        id: '@flighthq/types:interface#Physics2DPrismaticJointOptions',
        purpose: 'reviewed escape-free physics prismatic-joint options',
      },
      {
        declarationFingerprint: 'sha256:9775462cd5ce4402fcc41ff2f91c58cc0fefc7a6b29602a4f44f568e829a5334',
        id: '@flighthq/types:interface#Physics2DWheelJointOptions',
        purpose: 'reviewed escape-free physics wheel-joint options',
      },
      {
        declarationFingerprint: 'sha256:28022486054f5704cc934e961f951937b26459388fd4d73a20763de668fb2500',
        id: '@flighthq/types:interface#GlColorLutTextureCache',
        purpose: 'reviewed escape-free WebGL color-LUT texture cache',
      },
      {
        declarationFingerprint: 'sha256:60a7d244805c8bf2b3b72e2fcf4777fe83b902d5676a58e0975baa9b8cf7d52c',
        id: '@flighthq/types:interface#GlScene3DIbl',
        purpose: 'reviewed escape-free WebGL Scene3D IBL',
      },
      {
        declarationFingerprint: 'sha256:df1e98bd12a8d711c970bbc0453b9fbccdcb484b40c72fbb3f426e18442333ed',
        id: '@flighthq/types:interface#GlShapeMeshColorScaleBiasShader',
        purpose: 'reviewed escape-free WebGL shape-mesh color-scale-bias shader',
      },
      {
        declarationFingerprint: 'sha256:246dc6c529144431c519bf28ad1b7b38a1b7d40a7d85e35ea777ffeaebb1748c',
        id: '@flighthq/types:interface#GlToonProgram',
        purpose: 'reviewed escape-free WebGL toon program',
      },
      {
        declarationFingerprint: 'sha256:6aaa4136bcd431697355c53644dbe3b6636296775ee6f35ff740addf61f844ce',
        id: '@flighthq/types:interface#GlWireframeUpload',
        purpose: 'reviewed escape-free WebGL wireframe upload',
      },
      {
        declarationFingerprint: 'sha256:5e68df6723770b9c423c2bfb2e8b4b0535c8c16e64ebadb99798468ce7acadff',
        id: '@flighthq/types:interface#CrtEffect',
        purpose: 'reviewed escape-free CRT effect',
      },
      {
        declarationFingerprint: 'sha256:3826059319d02a6dce524539dfa04c76d510f7c5a7cdd738f758f7d5caac4b4d',
        id: '@flighthq/types:interface#DirectionalBlurEffect',
        purpose: 'reviewed escape-free directional-blur effect',
      },
      {
        declarationFingerprint: 'sha256:fd7a053e9ad1fb2da43a056833df82c8be9d0574e7f6abf1be97c220b5f28e87',
        id: '@flighthq/types:interface#LensFlareEffect',
        purpose: 'reviewed escape-free lens-flare effect',
      },
      {
        declarationFingerprint: 'sha256:22f272013c3655070dc964707dbebbc4b5eb6699cfe0e632dba09392544d5981',
        id: '@flighthq/types:interface#RadialBlurEffect',
        purpose: 'reviewed escape-free radial-blur effect',
      },
      {
        declarationFingerprint: 'sha256:fbcbf389afcd6233e11df0aa41d734c8fa5b4c26a8c9ed22d9e3e46a707e24a6',
        id: '@flighthq/types:interface#TiltShiftEffect',
        purpose: 'reviewed escape-free tilt-shift effect',
      },
      {
        declarationFingerprint: 'sha256:37096ced174312eb2922c58215277db0bb82a6aaef5a6151e566048a172e830e',
        id: '@flighthq/types:interface#AnisotropyPbrExtension',
        purpose: 'reviewed escape-free anisotropy PBR extension',
      },
      {
        declarationFingerprint: 'sha256:68e7295714b2fbaa9741f254f5f12995e21e9b4a8db40c02677f0694edaf83f9',
        id: '@flighthq/types:interface#DepthMaterial',
        purpose: 'reviewed escape-free depth material',
      },
      {
        declarationFingerprint: 'sha256:f5890f2123b567fa23eb37ae03f8a1a034edb3401d767ecf0ebe2b21c4150aeb',
        id: '@flighthq/types:interface#NormalMaterial',
        purpose: 'reviewed escape-free normal material',
      },
      {
        declarationFingerprint: 'sha256:4bf6ae337857c46e758e1e6d3c41b4e825691cb9c928807201900208e1193f81',
        id: '@flighthq/types:interface#VertexColorMaterial',
        purpose: 'reviewed escape-free vertex-color material',
      },
      {
        declarationFingerprint: 'sha256:ab30087b99039af61030abaaff2f6f9edad3bd9efe3df354900c8d3b8cfc158a',
        id: '@flighthq/types:interface#WireframeMaterial',
        purpose: 'reviewed escape-free wireframe material',
      },
      {
        declarationFingerprint: 'sha256:3e145f4a7645c5e37bb6f4d5be12c006ea332396a6f233562d12006faa6dd9e0',
        id: '@flighthq/types:interface#FlowStack',
        purpose: 'reviewed escape-free flow stack',
      },
      {
        declarationFingerprint: 'sha256:1dcf59ee7b59c493adf889564e539b8495ed2a5e9f0b6145954c455cb28fe588',
        id: '@flighthq/types:interface#FlowState',
        purpose: 'reviewed escape-free flow state',
      },
      {
        declarationFingerprint: 'sha256:377abc726388df0405759cb105b7d9a4595770d0c3b4ce711608981605770862',
        id: '@flighthq/types:interface#TimelineAudioCue',
        purpose: 'reviewed escape-free timeline audio cue',
      },
      {
        declarationFingerprint: 'sha256:f1bcd87631389ed349560d3d4adc78ee8835215d5e36b96236cc9169f128a773',
        id: '@flighthq/types:interface#TimelineLabel',
        purpose: 'reviewed escape-free timeline label',
      },
      {
        declarationFingerprint: 'sha256:c87cb1c6c826c9d4a5ac66245abd3b19328174cc315ae7f9153271c2700ce41c',
        id: '@flighthq/types:interface#TimelineSignals',
        purpose: 'reviewed escape-free timeline signals',
      },
      {
        declarationFingerprint: 'sha256:705d00847da60afc2542ab08050acc46b9574d8b5be35d87aab6a6f3d9bfd8cb',
        id: '@flighthq/types:interface#VelocityField',
        purpose: 'reviewed escape-free velocity field',
      },
      {
        declarationFingerprint: 'sha256:0c6e30c09f9b1aa220dd099bab1745b568ae3029b443ad4d3c91a0af35b21d56',
        id: '@flighthq/types:interface#CreateExternalTextureOptions',
        purpose: 'reviewed escape-free external-texture options',
      },
      {
        declarationFingerprint: 'sha256:3ff8f98c70e258e788235d2d468ab190af55513ae4c7692f0bbf58b1b1de6803',
        id: '@flighthq/types:interface#RenderQueue',
        purpose: 'reviewed escape-free render queue',
      },
      {
        declarationFingerprint: 'sha256:e420cd628a1440e52a58f0ec478200b7597ac27f4757124600f5951f22965216',
        id: '@flighthq/types:interface#QuadBatchRuntime',
        purpose: 'reviewed escape-free quad-batch runtime',
      },
      {
        declarationFingerprint: 'sha256:8f5956e935f6aa84c5eb19bef04c2b1e4be1d2b138d4fc7bc1ba46e6b5b95e20',
        id: '@flighthq/types:interface#Raster2DSurface',
        purpose: 'reviewed escape-free backend-neutral raster surface',
      },
      {
        declarationFingerprint: 'sha256:0a011bdbca5a41569ee8a81d5ebca8c94dc47e164f8c24aef36dbdab9b78f282',
        id: '@flighthq/types:interface#BitmapBevelOptions',
        purpose: 'reviewed escape-free bitmap bevel options',
      },
      {
        declarationFingerprint: 'sha256:c2fd0040fbc7b51bf0203d08bdd9632541b02207997542283e86c19175cd69c8',
        id: '@flighthq/types:interface#BitmapDisplacementMapOptions',
        purpose: 'reviewed escape-free bitmap displacement-map options',
      },
      {
        declarationFingerprint: 'sha256:36622be26b0d6d74ad2b9612c9d5c08e151474680298a719a6cb4f5e3099003e',
        id: '@flighthq/types:interface#BitmapConvolutionOptions',
        purpose: 'reviewed escape-free bitmap convolution options',
      },
      {
        declarationFingerprint: 'sha256:307bfb2ceb94a4971dc35171139a7328552f9ffa06a0d76954467b57d86f1f46',
        id: '@flighthq/types:interface#BitmapGradientBevelOptions',
        purpose: 'reviewed escape-free bitmap gradient-bevel options',
      },
      {
        declarationFingerprint: 'sha256:5934bc8bbdd8f85c1b5ec613312ae1ec3003b2e0ea21b365a6e52226aee60329',
        id: '@flighthq/types:interface#BitmapGradientGlowOptions',
        purpose: 'reviewed escape-free bitmap gradient-glow options',
      },
      {
        declarationFingerprint: 'sha256:ee92865a82180e0ce674675c8bac3e1b141b827e87a26ad52b628cff1b27174c',
        id: '@flighthq/types:interface#AttachmentSkin2D',
        purpose: 'reviewed escape-free attachment skin',
      },
      {
        declarationFingerprint: 'sha256:40a66fe8322fa267e67064792d5723c3deb89468073fc92abe8cb4df5603bcbf',
        id: '@flighthq/types:interface#RegionAttachment2D',
        purpose: 'reviewed escape-free region attachment',
      },
      {
        declarationFingerprint: 'sha256:e9b6dcb1216bfc2e91a753d24eb0a7320ccca947cd062903bc3d24707bc4d426',
        id: '@flighthq/types:interface#PathAttachment2D',
        purpose: 'reviewed escape-free path attachment',
      },
      {
        declarationFingerprint: 'sha256:8b6a11c7ae1419ecec6e1cc58e9b3fe2f0501773aef0e74d574670c48299165a',
        id: '@flighthq/types:interface#PointAttachment2D',
        purpose: 'reviewed escape-free point attachment',
      },
      {
        declarationFingerprint: 'sha256:069b4df44a3486606cce30493977aebffc60f2fba30fa4e33ea784fbd06ba962',
        id: '@flighthq/types:interface#ClippingAttachment2D',
        purpose: 'reviewed escape-free clipping attachment',
      },
      {
        declarationFingerprint: 'sha256:9f08ed93b7149ba994f4cc6c6ddd65acb4d6899ce85afdd0cc31c16d82ebd125',
        id: '@flighthq/types:interface#MorphShapeLineEndpoint',
        purpose: 'reviewed escape-free morph-shape line endpoint',
      },
      {
        declarationFingerprint: 'sha256:7b64793cbbbbba919e192888fc21a8521ab2e265520986d959157929a2d9b0a3',
        id: '@flighthq/types:interface#MorphShapeColorEndpoint',
        purpose: 'reviewed escape-free morph-shape color endpoint',
      },
      {
        declarationFingerprint: 'sha256:0f9f71ff1557793611652434f7be0c4c1277647dc9314a7ebeb461cb0b163816',
        id: '@flighthq/types:interface#MorphShapePathBinding',
        purpose: 'reviewed escape-free morph-shape path binding',
      },
      {
        declarationFingerprint: 'sha256:fe1394427e35042ec6cc108bd2924960765e205372f08ad78f79be2edf26d287',
        id: '@flighthq/types:interface#MorphShapeAnimationTarget',
        purpose: 'reviewed escape-free morph-shape animation target',
      },
      {
        declarationFingerprint: 'sha256:7eb385b918d55147dd586f7df3f0131e718f5dbed8ec4151fa4d72c8d6270c70',
        id: '@flighthq/types:interface#SwfMorphShapePaths',
        purpose: 'reviewed escape-free SWF morph-shape paths',
      },
      {
        declarationFingerprint: 'sha256:e5725966d9ef05f5946cb352fed09496a74c30c0931384dfe860330c0b994b4f',
        id: '@flighthq/types:interface#Physics3DWorld',
        purpose: 'reviewed escape-free Physics3D world',
      },
      {
        declarationFingerprint: 'sha256:280e588114daf5dcd9e2597b4995772ffbf8cb4fecc34588b8f09d93669e2ca3',
        id: '@flighthq/types:interface#Physics3DMassData',
        purpose: 'reviewed escape-free Physics3D mass data',
      },
      {
        declarationFingerprint: 'sha256:7cdcbd182487a3c0fea4385828ea058a2622c2848a1e377996500b7d691bb753',
        id: '@flighthq/types:interface#Physics3DHingeJoint',
        purpose: 'reviewed escape-free Physics3D hinge joint',
      },
      {
        declarationFingerprint: 'sha256:050a531fd480fabcd1aea7602a27f733b1e2c3ef774e92d8c8679c5810e9c6c9',
        id: '@flighthq/types:interface#Physics3DSliderJoint',
        purpose: 'reviewed escape-free Physics3D slider joint',
      },
      {
        declarationFingerprint: 'sha256:6d07842a2d670fb1682fd93b1839bfaa4fe0a59f9deb40eaf02e28f44c143c85',
        id: '@flighthq/types:interface#Physics3DContactConstraint',
        purpose: 'reviewed escape-free Physics3D contact constraint',
      },
      {
        declarationFingerprint: 'sha256:262ba078e6dc17f030e8b05484f7767f17eec8b6912054f110ba8e1c96ebc41a',
        id: '@flighthq/types:interface#Physics3DContactConstraintPoint',
        purpose: 'reviewed escape-free Physics3D contact-constraint point',
      },
      {
        declarationFingerprint: 'sha256:799f1e572fee32caea94d4bd140ed192e65896eee0d7ea6eaa43a7cc93803755',
        id: '@flighthq/types:interface#Physics3DConeTwistJoint',
        purpose: 'reviewed escape-free Physics3D cone-twist joint',
      },
      {
        declarationFingerprint: 'sha256:5e4c27794d880512671571711e950187f564950a5e70b027e9a1917bc8c16f99',
        id: '@flighthq/types:interface#Physics3DGeneric6DofJoint',
        purpose: 'reviewed escape-free Physics3D generic six-DOF joint',
      },
      {
        declarationFingerprint: 'sha256:3b8ef9dbbfa02ffa5cbfa60a7794d052d50f559167276292a2a620425bedb3e0',
        id: '@flighthq/types:interface#DomRenderRegistries',
        purpose: 'reviewed escape-free DOM render registries',
      },
      {
        declarationFingerprint: 'sha256:588c462592a24ac1b9e061518dccbccc047d97b96b263401df8da4d7e08e710f',
        id: '@flighthq/types:interface#RenderRegistries',
        purpose: 'reviewed escape-free render registries',
      },
      {
        declarationFingerprint: 'sha256:5ce6595f77e48ec51736d037cd6c477e81146a82bc72dfb055963b7abde227bd',
        id: '@flighthq/types:interface#CffIndex',
        purpose: 'reviewed escape-free CFF index',
      },
      {
        declarationFingerprint: 'sha256:9c0a9c97e23fa85d9ef93e4bb92eafc52268728257918105ad7b2bef22c8528c',
        id: '@flighthq/types:interface#SfntTableDirectory',
        purpose: 'reviewed escape-free SFNT table directory',
      },
      {
        declarationFingerprint: 'sha256:1bdecf5ebe419641dbe4f01ba3a31d542cbefad13bccc3e91e726fc63246e2af',
        id: '@flighthq/types:interface#SfntTableRange',
        purpose: 'reviewed escape-free SFNT table range',
      },
      {
        declarationFingerprint: 'sha256:a464d3b4df6257129e226fa1fadfafb5d4a0c32b02aac84a101f84c5fc5ab615',
        id: '@flighthq/types:interface#Woff2GlyfStreams',
        purpose: 'reviewed escape-free WOFF2 glyf streams',
      },
      {
        declarationFingerprint: 'sha256:24ae797b8608d8871a3ebd378c3101ddb9f4b4bc1859b2b282e50ae9f4b8c1f8',
        id: '@flighthq/types:interface#Woff2TableEntry',
        purpose: 'reviewed escape-free WOFF2 table entry',
      },
      {
        declarationFingerprint: 'sha256:61e5a2afeb5fc4305782f3ec26802e743184324e02741a4f319c17f6fa1a4f71',
        id: '@flighthq/types:interface#CatalogEntry',
        purpose: 'reviewed escape-free scene coverage catalog entry',
      },
      {
        declarationFingerprint: 'sha256:359fc1ad0b03454fe4b30b9b03e6c0d3168dc09661565639c4b852f15805603b',
        id: '@flighthq/types:interface#CatalogRegistration',
        purpose: 'reviewed escape-free scene coverage catalog registration',
      },
      {
        declarationFingerprint: 'sha256:892e19dcdb6b8738da74754dfde8302f697b0f2a80e50e7ae89f82ca40b46abf',
        id: '@flighthq/types:interface#RegistryCatalog',
        purpose: 'reviewed escape-free registry catalog',
      },
      {
        declarationFingerprint: 'sha256:c07292691d0d6993f70b9fa7dc7d3a6492cf5cd5c205c2aaff99343d7d1aec05',
        id: '@flighthq/types:interface#RegistryCatalogEntry',
        purpose: 'reviewed escape-free registry catalog entry',
      },
      {
        declarationFingerprint: 'sha256:6c0abbca38fb4e58ed608773c6e6d182b4d2c2b128b40c7466834f2cf5adcb74',
        id: '@flighthq/types:interface#Requirement',
        purpose: 'reviewed escape-free registry requirement',
      },
      {
        declarationFingerprint: 'sha256:1a3a86ea0b1f69e258717f4914660a834f0c7be7d67f4f95d5258fb93a7f3344',
        id: '@flighthq/types:interface#Physics3DGeneric6DofJointOptions',
        purpose: 'reviewed escape-free Physics3D generic six-DOF joint options',
      },
      {
        declarationFingerprint: 'sha256:edac07364f90df64b39c2d1ac50a306e9877d7e8c4ab1c4d6c02dc7e80cb0395',
        id: '@flighthq/types:interface#Physics3DJointFrameOptions',
        purpose: 'reviewed escape-free Physics3D joint-frame options',
      },
      {
        declarationFingerprint: 'sha256:46ad4888a7ca52b21b8591d90409b267d6433313e236c5bf988ae892dd07b4ff',
        id: '@flighthq/types:interface#Physics3DJointOptions',
        purpose: 'reviewed escape-free Physics3D joint options',
      },
      {
        declarationFingerprint: 'sha256:0de6797dfe9c8f540e889ae0af3a97e5cd7aff54d43a7d4cc885954bac19f8df',
        id: '@flighthq/types:interface#Physics3DSequentialImpulseConfig',
        purpose: 'reviewed escape-free Physics3D sequential-impulse config',
      },
      {
        declarationFingerprint: 'sha256:12a0644da563b2ee03d54d165a4f82450dc0c2c3f0b91efcf202796d89a86966',
        id: '@flighthq/types:interface#Physics3DAbiBodyBuffer',
        purpose: 'reviewed escape-free Physics3D ABI body buffer',
      },
      {
        declarationFingerprint: 'sha256:344bf545e06f4e1231e04047048a038aa36ce6c322e2dcb7a7952c66f10b1476',
        id: '@flighthq/types:interface#Physics3DAbiCommandBuffer',
        purpose: 'reviewed escape-free Physics3D ABI command buffer',
      },
      {
        declarationFingerprint: 'sha256:8c8cfb7227ae63c538fd07f3e9812decc564d7e6a15be244c2e15578ebd43c4e',
        id: '@flighthq/types:interface#Physics3DAbiContactBuffer',
        purpose: 'reviewed escape-free Physics3D ABI contact buffer',
      },
      {
        declarationFingerprint: 'sha256:39fa096a0116e610a50835a085a2034e132dca54573c19203348e8b450e5cdaa',
        id: '@flighthq/types:interface#Physics3DAbiContactHooks',
        purpose: 'reviewed escape-free Physics3D ABI contact hooks',
      },
      {
        declarationFingerprint: 'sha256:e232874df593acd78d53e3976d1775517dc020564d8ee4cb42d2c27e4b4c4c36',
        id: '@flighthq/types:interface#Physics3DAbiExecutionResult',
        purpose: 'reviewed escape-free Physics3D ABI execution result',
      },
      {
        declarationFingerprint: 'sha256:fd9990b1ea1d2d95da9a48ffe73617a18a78364b58f571f88d9e86bbaa225d61',
        id: '@flighthq/types:interface#Physics3DAbiJointBuffer',
        purpose: 'reviewed escape-free Physics3D ABI joint buffer',
      },
      {
        declarationFingerprint: 'sha256:821df23149ae8b3765a926b09e971b64583f169a123723d6d18539453b27ec00',
        id: '@flighthq/types:interface#Physics3DAbiQueryBuffer',
        purpose: 'reviewed escape-free Physics3D ABI query buffer',
      },
      {
        declarationFingerprint: 'sha256:187b301955811c3de7115138e2c44a0d076c84a92749130d9bb5050b498bb95d',
        id: '@flighthq/types:interface#Physics3DRotationalCcdEnvelope',
        purpose: 'reviewed escape-free Physics3D rotational CCD envelope',
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
    expect(discovery.migration.removed).toHaveLength(26);
    expect(discovery.migration.removed).toEqual(
      expect.arrayContaining([
        {
          baselineId: '@flighthq/types:interface#AppUpdater',
          successorIds: [
            '@flighthq/types:interface#AppUpdateInstallOutcome',
            '@flighthq/types:interface#DownloadedUpdate',
            '@flighthq/types:interface#UpdaterCommandBackend',
            '@flighthq/types:type#AppUpdateCheckOutcome',
          ],
        },
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
        {
          baselineId: '@flighthq/types:interface#WebcamStream',
          successorIds: [
            '@flighthq/types:interface#MediaFileCaptureBackend',
            '@flighthq/types:interface#MediaFileCapturePhoto',
            '@flighthq/types:interface#MediaFileCaptureVideo',
          ],
        },
      ]),
    );
    expect(byId.has('@flighthq/types:interface#ImageResource')).toBe(false);
    expect(byId.has('@flighthq/types:interface#Tileset')).toBe(false);
    expect(byId.has('@flighthq/types:interface#VideoTexture')).toBe(false);
  });
});

describe('typed struct analysis', () => {
  it('emits a default struct-init class with a global typedef oracle branch', () => {
    const candidate: TypedStructCandidate = {
      emission: 'direct',
      name: 'Camera2D',
      packageName: '@flighthq/types',
      purpose: 'cpp class pilot fixture',
      source: 'upstream/packages/types/src/CameraPilot.ts',
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
    if (declaration.type.kind !== 'anonymous') throw new Error('Expected Camera2D fixture record');
    declaration.type.fields.push({
      name: '__EntityRuntimeKey',
      optional: true,
      type: { inner: { kind: 'dynamic' }, kind: 'nullable' },
    });
    declaration.cppStructInitSchemaId = candidateId(candidate);
    const fixtureModule = {
      declarations: result.lowered.declarations,
      haxePackage: 'flight.types',
      imports: [],
      name: 'CameraPilot',
      packageName: '@flighthq/types',
    };
    sealCppStructInitConstructors([fixtureModule]);
    const output = emitHaxeModule(fixtureModule);

    expect(result.lowered.diagnostics).toEqual([]);
    expect(output).toContain(
      '#if !flight_struct_typedef\n@:allow(flight.types.CameraPilot)\n@:structInit\nclass Camera2D {',
    );
    expect(output).toContain(
      'private function new(rotation:Float, viewportHeight:Float, viewportWidth:Float, x:Float, y:Float, zoom:Float):Void',
    );
    expect(output).toContain('public var __symbol__EntityRuntime:Null<Dynamic>;');
    expect(output).toContain('this.__symbol__EntityRuntime = null;');
    expect(output).toContain(
      'return ({ rotation: 0.0, viewportHeight: 480.0, viewportWidth: 640.0, x: 12.0, y: 34.0, zoom: 2.0 } : Camera2D);',
    );
    expect(output).not.toContain('return cast { rotation: 0.0');
    const compilableOutput = output;

    const fixtureDirectory = path.resolve('build/haxe-cpp-struct-init-fixture');
    const packageDirectory = path.join(fixtureDirectory, 'flight', 'types');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(path.join(packageDirectory, 'CameraPilot.hx'), compilableOutput);
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        class Main {
          static function main() {
            final camera = flight.types.CameraPilot.createCamera2D();
            final entity:{?__symbol__EntityRuntime:Null<Dynamic>} = camera;
            if (!Std.isOfType(camera, flight.types.CameraPilot.Camera2D)) throw 'not a class';
            if (camera.x != 12 || camera.viewportHeight != 480 || camera.zoom != 2) throw 'bad fields';
            Reflect.setField(camera, '__symbol__EntityRuntime', { binding: null });
            if (!Reflect.hasField(camera, '__symbol__EntityRuntime')) throw 'missing runtime slot';
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
      path.join(fixtureDirectory, 'ExternalNewMain.hx'),
      `
        class ExternalNewMain {
          static function main() {
            new flight.types.CameraPilot.Camera2D(0, 480, 640, 12, 34, 2);
          }
        }
      `,
    );
    let privateConstructorDiagnostic = '';
    try {
      execFileSync(
        'node',
        ['tools/haxe.mjs', '-cp', fixtureDirectory, '-cp', 'src', '--main', 'ExternalNewMain', '--interp'],
        { cwd: path.resolve('.'), stdio: 'pipe' },
      );
    } catch (error) {
      privateConstructorDiagnostic = String((error as { stderr?: Buffer }).stderr ?? error);
    }
    expect(privateConstructorDiagnostic).toContain('Cannot access private constructor');

    writeFileSync(
      path.join(fixtureDirectory, 'BaselineMain.hx'),
      `
        class BaselineMain {
          static function main() {
            final camera = flight.types.CameraPilot.createCamera2D();
            if (camera.x != 12 || camera.viewportHeight != 480 || camera.zoom != 2) throw 'bad fields';
          }
        }
      `,
    );
    expect(() =>
      execFileSync(
        'node',
        [
          'tools/haxe.mjs',
          '-cp',
          fixtureDirectory,
          '-cp',
          'src',
          '-D',
          'flight_struct_typedef',
          '--main',
          'BaselineMain',
          '--interp',
        ],
        { cwd: path.resolve('.'), stdio: 'pipe' },
      ),
    ).not.toThrow();

    writeFileSync(
      path.join(fixtureDirectory, 'JsMain.hx'),
      `
        class JsMain {
          static function main() {
            final camera = flight.types.CameraPilot.createCamera2D();
            if (camera.x != 12 || camera.viewportHeight != 480 || camera.zoom != 2) throw 'bad fields';
          }
        }
      `,
    );
    const classJavaScript = path.join(fixtureDirectory, 'class.cjs');
    const candidateJavaScript = path.join(fixtureDirectory, 'candidate.cjs');
    const baselineJavaScript = path.join(fixtureDirectory, 'baseline.cjs');
    writeFileSync(path.join(packageDirectory, 'CameraPilot.hx'), compilableOutput);
    execFileSync(
      'node',
      ['tools/haxe.mjs', '-cp', fixtureDirectory, '-cp', 'src', '--main', 'JsMain', '--js', classJavaScript],
      { cwd: path.resolve('.'), stdio: 'pipe' },
    );
    execFileSync('node', [classJavaScript], { cwd: path.resolve('.'), stdio: 'pipe' });
    execFileSync(
      'node',
      [
        'tools/haxe.mjs',
        '-cp',
        fixtureDirectory,
        '-cp',
        'src',
        '-D',
        'flight_struct_typedef',
        '--main',
        'JsMain',
        '--js',
        candidateJavaScript,
      ],
      { cwd: path.resolve('.'), stdio: 'pipe' },
    );
    writeFileSync(
      path.join(packageDirectory, 'CameraPilot.hx'),
      compilableOutput.replace(
        'return ({ rotation: 0.0, viewportHeight: 480.0, viewportWidth: 640.0, x: 12.0, y: 34.0, zoom: 2.0 } : Camera2D);',
        'return cast { rotation: 0.0, viewportHeight: 480.0, viewportWidth: 640.0, x: 12.0, y: 34.0, zoom: 2.0 };',
      ),
    );
    execFileSync(
      'node',
      [
        'tools/haxe.mjs',
        '-cp',
        fixtureDirectory,
        '-cp',
        'src',
        '-D',
        'flight_struct_typedef',
        '--main',
        'JsMain',
        '--js',
        baselineJavaScript,
      ],
      { cwd: path.resolve('.'), stdio: 'pipe' },
    );
    expect(readFileSync(candidateJavaScript)).toEqual(readFileSync(baselineJavaScript));
  });

  it('canonicalizes struct-init field order after preserving initializer evaluation order', () => {
    const candidate: TypedStructCandidate = {
      emission: 'direct',
      name: 'Camera2D',
      packageName: '@flighthq/types',
      purpose: 'struct-init order fixture',
      source: 'upstream/packages/types/src/CameraPilot.ts',
    };
    const result = lowerFixture(
      `
        export interface Camera2D { x: number; y: number; }
        export function createCamera2D(): Camera2D { return { y: 2, x: 1 }; }
      `,
      candidate,
    );
    const declaration = result.lowered.declarations.find(
      (item) => item.kind === 'type' && item.name === candidate.name,
    );
    if (!declaration || declaration.kind !== 'type') throw new Error('Expected Camera2D order fixture type');
    declaration.cppStructInitSchemaId = candidateId(candidate);
    const fixtureModule = {
      declarations: result.lowered.declarations,
      haxePackage: 'flight.types',
      imports: [],
      name: 'CameraPilot',
      packageName: '@flighthq/types',
    };
    sealCppStructInitConstructors([fixtureModule]);
    const output = emitHaxeModule(fixtureModule);

    expect(result.lowered.diagnostics).toEqual([]);
    expect(output).toContain('final __structInitField0:Dynamic = 2.0;');
    expect(output).toContain('final __structInitField1:Dynamic = 1.0;');
    expect(output).toContain('({ x: __structInitField1, y: __structInitField0 } : Camera2D)');
    expect(output.indexOf('__structInitField0:Dynamic = 2.0')).toBeLessThan(
      output.indexOf('__structInitField1:Dynamic = 1.0'),
    );
  });

  it('projects a spread result into the nominal struct-init identity', () => {
    const candidate: TypedStructCandidate = {
      emission: 'direct',
      name: 'Camera2D',
      packageName: '@flighthq/types',
      purpose: 'struct-init spread fixture',
      source: 'upstream/packages/types/src/CameraPilot.ts',
    };
    const result = lowerFixture(
      `
        export interface Camera2D { x: number; y: number; }
        export function createCamera2D(): Camera2D {
          const base = { x: 1 };
          return { ...base, y: 2 };
        }
      `,
      candidate,
    );
    const declaration = result.lowered.declarations.find(
      (item) => item.kind === 'type' && item.name === candidate.name,
    );
    if (!declaration || declaration.kind !== 'type') throw new Error('Expected Camera2D spread fixture type');
    declaration.cppStructInitSchemaId = candidateId(candidate);
    const fixtureModule = {
      declarations: result.lowered.declarations,
      haxePackage: 'flight.types',
      imports: [],
      name: 'CameraPilot',
      packageName: '@flighthq/types',
    };
    sealCppStructInitConstructors([fixtureModule]);
    const output = emitHaxeModule(fixtureModule);

    expect(result.lowered.diagnostics).toEqual([]);
    expect(output).toContain('final __structInitSource:Dynamic = _Runtime.mergeObjects([base, { y: 2.0 }]);');
    expect(output).toContain(
      "({ x: _Runtime.field(__structInitSource, 'x'), y: _Runtime.field(__structInitSource, 'y') } : Camera2D)",
    );

    const fixtureDirectory = path.resolve('build/haxe-struct-init-spread-fixture');
    const packageDirectory = path.join(fixtureDirectory, 'flight', 'types');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(path.join(packageDirectory, 'CameraPilot.hx'), output);
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        class Main {
          static function main() {
            final camera = flight.types.CameraPilot.createCamera2D();
            if (!Std.isOfType(camera, flight.types.CameraPilot.Camera2D)) throw 'not a class';
            if (camera.x != 1 || camera.y != 2) throw 'bad projected fields';
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
  });

  it('keeps sparse typedef construction while initializing the nominal layout', () => {
    const candidate: TypedStructCandidate = {
      emission: 'direct',
      name: 'Camera2D',
      packageName: '@flighthq/types',
      purpose: 'struct-init missing-field fixture',
      source: 'upstream/packages/types/src/CameraPilot.ts',
    };
    const result = lowerFixture(
      `
        export interface Camera2D { x: number; y?: number; }
        export function createCamera2D(): Camera2D { return { x: 1 }; }
      `,
      candidate,
    );
    const declaration = result.lowered.declarations.find(
      (item) => item.kind === 'type' && item.name === candidate.name,
    );
    if (!declaration || declaration.kind !== 'type') throw new Error('Expected Camera2D sparse fixture type');
    const factory = result.lowered.declarations.find(
      (item) => item.kind === 'function' && item.name === 'createCamera2D',
    );
    const returned =
      factory?.kind === 'function' ? factory.body.find((statement) => statement.kind === 'return') : undefined;
    if (returned?.kind !== 'return' || returned.expression?.kind !== 'object' || !returned.expression.cppStructInit) {
      throw new Error('Expected Camera2D sparse construction');
    }
    returned.expression.cppStructInit.missingFieldNames = ['y'];
    declaration.cppStructInitSchemaId = candidateId(candidate);
    const fixtureModule = {
      declarations: result.lowered.declarations,
      haxePackage: 'flight.types',
      imports: [],
      name: 'CameraPilot',
      packageName: '@flighthq/types',
    };
    sealCppStructInitConstructors([fixtureModule]);
    const output = emitHaxeModule(fixtureModule);

    expect(result.lowered.diagnostics).toEqual([]);
    expect(output).toContain('#if flight_struct_typedef { x: 1.0 } #else');
    expect(output).toContain('({ x: __structInitField0, y: cast _Runtime.UNDEFINED } : Camera2D)');

    const fixtureDirectory = path.resolve('build/haxe-struct-init-missing-field-fixture');
    const packageDirectory = path.join(fixtureDirectory, 'flight', 'types');
    rmSync(fixtureDirectory, { force: true, recursive: true });
    mkdirSync(packageDirectory, { recursive: true });
    writeFileSync(path.join(packageDirectory, 'CameraPilot.hx'), output);
    writeFileSync(
      path.join(fixtureDirectory, 'Main.hx'),
      `
        class Main {
          static function main() {
            final camera = flight.types.CameraPilot.createCamera2D();
            if (!Std.isOfType(camera, flight.types.CameraPilot.Camera2D)) throw 'not a class';
            if (camera.x != 1 || camera.y != null) throw 'bad initialized fields';
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
      path.join(fixtureDirectory, 'BaselineMain.hx'),
      `
        class BaselineMain {
          static function main() {
            final camera = flight.types.CameraPilot.createCamera2D();
            if (camera.x != 1 || camera.y != null) throw 'bad sparse fields';
          }
        }
      `,
    );
    expect(() =>
      execFileSync(
        'node',
        [
          'tools/haxe.mjs',
          '-cp',
          fixtureDirectory,
          '-cp',
          'src',
          '-D',
          'flight_struct_typedef',
          '--main',
          'BaselineMain',
          '--interp',
        ],
        { cwd: path.resolve('.'), stdio: 'pipe' },
      ),
    ).not.toThrow();
  });

  it('emits a sealed private class for a closed structural entity allocation', () => {
    const candidate: TypedStructCandidate = {
      emission: 'audit-only',
      name: 'Entity',
      packageName: '@flighthq/types',
      purpose: 'synthetic entity fixture',
      source: 'upstream/packages/entity/src/entity.ts',
    };
    const result = lowerFixture(
      `
        export interface Entity { __EntityRuntimeKey?: unknown; }
        export function createEntity<Type extends object>(obj: Type): Type & Entity {
          return obj as Type & Entity;
        }
        export function createProvider(): { run(): number } & Entity {
          return createEntity({ run() { return 1; } });
        }
      `,
      candidate,
    );
    const synthetic = result.lowered.declarations.find(
      (declaration) => declaration.kind === 'type' && declaration.name.startsWith('EntityShapeL'),
    );
    if (!synthetic || synthetic.kind !== 'type') throw new Error('Expected synthetic Entity class');
    const fixtureModule = {
      declarations: result.lowered.declarations,
      haxePackage: 'flight',
      imports: [],
      name: 'EntityFixture',
      packageName: '@flighthq/entity',
    };
    sealCppStructInitConstructors([fixtureModule]);
    const output = emitHaxeModule(fixtureModule);

    expect(result.lowered.diagnostics).toEqual([]);
    expect(synthetic.packagePrivate).toBe(true);
    expect(output).toContain('@:allow(flight.EntityFixture)\n@:structInit\nprivate class EntityShapeL');
    expect(output).toContain('private function new(run:Void->Float):Void');
    expect(output).toMatch(/\(\{ run: function\(\):Float \{[\s\S]*\} \} : EntityShapeL\d+C\d+\)/u);
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
    const entityFactories = auditEntityFactoryClosure(workspace, 'fixture', registry, programAndChecker);
    const classAuditById = new Map(classAudit.schemas.map((schema) => [schema.id, schema]));
    const provenanceById = new Map(provenance.schemas.map((schema) => [schema.id, schema]));
    const renderTextureSource = programAndChecker.program.getSourceFile(
      path.resolve('upstream/packages/texture/src/renderTexture.ts'),
    );
    const createRenderTexture = renderTextureSource?.statements.find(
      (statement): statement is ts.FunctionDeclaration =>
        ts.isFunctionDeclaration(statement) && statement.name?.text === 'createRenderTexture',
    );
    const createRenderTextureSignature = createRenderTexture
      ? programAndChecker.checker.getSignatureFromDeclaration(createRenderTexture)
      : undefined;
    if (!createRenderTextureSignature) throw new Error('Expected createRenderTexture signature');
    const renderTextureReturn = programAndChecker.checker.getReturnTypeOfSignature(createRenderTextureSignature);
    expect(registry.resolve(renderTextureReturn).schemas.map((schema) => schema.name)).toEqual(['RenderTexture']);
    expect(registry.resolveIdentity(renderTextureReturn)?.name).toBe('RenderTexture');
    expect(entityFactories.summary).toEqual({
      bareEntityCalls: 0,
      blockedEntityCalls: 13,
      calls: 368,
      exactEntityCalls: 181,
      exactEntitySchemas: 146,
      exactNonEntityCalls: 17,
      genericEntityCalls: 3,
      localEntityCalls: 162,
      normalizedFieldOrderCalls: 24,
      normalizedMissingFieldCalls: 9,
      normalizedSpreadProjectionCalls: 17,
      readyEntityCalls: 338,
      structuralEntityCalls: 4,
      unresolvedCalls: 1,
    });
    expect(entityFactories.sites.find((site) => site.factory.name === 'createMatrix4')).toMatchObject({
      blockers: [],
      destination: { kind: 'exact-entity', schemaName: 'Matrix4' },
      status: 'ready',
    });
    expect(entityFactories.sites.find((site) => site.factory.name === 'createRectangle')).toMatchObject({
      blockers: [],
      destination: { kind: 'exact-entity', schemaName: 'Rectangle' },
      normalizations: ['field-order'],
      status: 'ready',
    });
    expect(entityFactories.sites.find((site) => site.factory.name === 'cloneEntity')).toMatchObject({
      blockers: ['generic-entity-destination', 'non-object-construction'],
      destination: { kind: 'generic-entity' },
      status: 'blocked',
    });
    expect(entityFactories.sites.find((site) => site.factory.name === 'createHost')).toMatchObject({
      blockers: [],
      destination: { kind: 'local-entity', schemaName: 'EntityShapeL8C10' },
      normalizations: ['synthetic-class', 'spread-projection'],
      status: 'ready',
    });
    expect(entityFactories.sites.find((site) => site.factory.name === 'createApplicationRenderView')).toMatchObject({
      blockers: ['parameterized-destination'],
      destination: { kind: 'exact-entity', schemaName: 'ApplicationRenderView' },
      status: 'blocked',
    });
    expect(entityFactories.sites.find((site) => site.factory.name === 'createCanvasTextLabelData')).toMatchObject({
      blockers: [],
      destination: { kind: 'local-entity', schemaName: 'EntityShapeL25C10' },
      normalizations: ['synthetic-class'],
      status: 'ready',
    });
    expect(
      entityFactories.sites.find((site) => site.factory.name === 'createElectronShortcutTriggerBackend'),
    ).toMatchObject({
      blockers: [],
      destination: { kind: 'exact-entity', route: 'returned-variable', schemaName: 'ShortcutTriggerBackend' },
      status: 'ready',
    });
    expect(
      entityFactories.sites.find(
        (site) =>
          site.source.endsWith('/host-tauri/src/tauriPlatform.ts') &&
          site.factory.name === 'createTauriPlatformBackend',
      ),
    ).toMatchObject({ destination: { kind: 'exact-non-entity', schemaName: 'PlatformBackend' }, status: 'not-entity' });
    expect(
      entityFactories.sites.find(
        (site) =>
          site.source.endsWith('/host-electron/src/electronPower.ts') &&
          site.destination.schemaName === 'PowerStatusBackend',
      ),
    ).toMatchObject({
      destination: { kind: 'exact-non-entity', route: 'type-argument', schemaName: 'PowerStatusBackend' },
      status: 'not-entity',
    });
    expect(entityFactoryClosureSummary(entityFactories)).toContain('| Production createEntity calls | 368 |');
    const typeErasureReport = JSON.parse(readFileSync('reports/type-erasures.json', 'utf8')) as {
      modules: Array<{ byReason: Record<string, number>; module: string; source: string; total: number }>;
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
            'CollisionContactManifold2D',
            'CollisionManifold2D',
            'CollisionTimeOfImpact2D',
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
          [
            'CollisionContactPoint2D',
            'CollisionRaycastHit2D',
            'Physics2DRayHit',
            'Scene3DHit',
            'VelocitySample',
          ].includes(candidate.name),
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
    const twentyThirdHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['AccessibilityNode', 'DisplayObject', 'GridLayoutItemStyle', 'NativeText', 'TextLabelRuntime'].includes(
            candidate.name,
          ),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const twentyFourthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['CapacitorApi', 'CapacitorDeviceInfo', 'ElectronDisplay', 'ElectronRectangle', 'SoftKeyboard'].includes(
            candidate.name,
          ),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const twentyFifthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'AnimationLayerStack',
            'StatechartCondition',
            'StatechartInput',
            'StatechartRegion',
            'StatechartTransitionExplanation',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const twentySixthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'FlyCameraControllerOptions',
            'MeshMorph',
            'MeshMorphBindPose',
            'Scene3DDocumentMesh',
            'Scene3DForwardLightSelection',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const twentySeventhHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'CanvasRenderTargetPool',
            'ColorLutCache',
            'GlShapeMeshBinding',
            'GlVelocityContext',
            'WgpuVelocityContext',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const twentyEighthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['AbcConstantPool', 'AbcFile', 'LottieDashEntry', 'LottieTextDocument', 'LottieTransform'].includes(
            candidate.name,
          ),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const twentyNinthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['AreaLightOptions', 'DirectionalLightOptions', 'Light', 'PointLightOptions', 'SpotLightOptions'].includes(
            candidate.name,
          ),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const thirtiethHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'WgpuEffectPipeline',
            'WgpuMeshPipeline',
            'WgpuRenderOptions',
            'WgpuSavedPassState',
            'WgpuTextureSourceTextureEntry',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const thirtyFirstHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['GltfCamera', 'GltfPunctualLight', 'Scene3DDocumentScene', 'Skin', 'ThreeDsCamera'].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const thirtySecondHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'FocusManager',
            'SelectableRichTextManager',
            'TextInputHistoryEntry',
            'TextInputManager',
            'TextSegment',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const thirtyThirdHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'AnimationBlendTreeChannel',
            'AnimationCrossfadeChannel',
            'AnimationLayerStackChannel',
            'AnimationStateMachineChannel',
            'AnimationStateMachineState',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const thirtyFourthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['BlendEffect', 'BlurEffect', 'FilmGrainEffect', 'GlitchEffect', 'OutlineEffect'].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const thirtyFifthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'Physics2DDebugGeometryOptions',
            'Physics2DGearJointOptions',
            'Physics2DMouseJointOptions',
            'Physics2DPrismaticJointOptions',
            'Physics2DWheelJointOptions',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const thirtySixthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'GlColorLutTextureCache',
            'GlScene3DIbl',
            'GlShapeMeshColorScaleBiasShader',
            'GlToonProgram',
            'GlWireframeUpload',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const thirtySeventhHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['CrtEffect', 'DirectionalBlurEffect', 'LensFlareEffect', 'RadialBlurEffect', 'TiltShiftEffect'].includes(
            candidate.name,
          ),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const thirtyEighthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'AnisotropyPbrExtension',
            'DepthMaterial',
            'NormalMaterial',
            'VertexColorMaterial',
            'WireframeMaterial',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const thirtyNinthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['FlowStack', 'FlowState', 'TimelineAudioCue', 'TimelineLabel', 'TimelineSignals'].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const fortiethHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'VelocityField',
            'CreateExternalTextureOptions',
            'RenderQueue',
            'QuadBatchRuntime',
            'Raster2DSurface',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const fortyFirstHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'BitmapBevelOptions',
            'BitmapDisplacementMapOptions',
            'BitmapConvolutionOptions',
            'BitmapGradientBevelOptions',
            'BitmapGradientGlowOptions',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const fortySecondHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'AttachmentSkin2D',
            'RegionAttachment2D',
            'PathAttachment2D',
            'PointAttachment2D',
            'ClippingAttachment2D',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const fortyThirdHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'MorphShapeLineEndpoint',
            'MorphShapeColorEndpoint',
            'MorphShapePathBinding',
            'MorphShapeAnimationTarget',
            'SwfMorphShapePaths',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const fortyFourthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'Physics3DWorld',
            'Physics3DContact',
            'Physics3DMassData',
            'Physics3DHingeJoint',
            'Physics3DSliderJoint',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const fortyFifthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'Physics3DContactConstraint',
            'Physics3DContactConstraintPoint',
            'Physics3DConeTwistJoint',
            'Physics3DGeneric6DofJoint',
            'Physics3DSolverConfig',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const fortySixthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'CanvasRenderRegistries',
            'DomRenderRegistries',
            'GlRenderRegistries',
            'RenderRegistries',
            'WgpuRenderRegistries',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const fortySeventhHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['CffIndex', 'SfntTableDirectory', 'SfntTableRange', 'Woff2GlyfStreams', 'Woff2TableEntry'].includes(
            candidate.name,
          ),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const fortyEighthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          ['CatalogEntry', 'CatalogRegistration', 'RegistryCatalog', 'RegistryCatalogEntry', 'Requirement'].includes(
            candidate.name,
          ),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const fortyNinthHighAccessFrontierCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'Physics3DGeneric6DofJointOptions',
            'Physics3DJointFrameOptions',
            'Physics3DJointOptions',
            'Physics3DSequentialImpulseConfig',
            'Physics3DSequentialImpulseState',
          ].includes(candidate.name),
        )
        .map((candidate) => [candidate.name, candidate]),
    );
    const physics3DAbiDirectCandidates = new Map(
      report.candidates
        .filter((candidate) =>
          [
            'Physics3DAbiBodyBuffer',
            'Physics3DAbiCommandBuffer',
            'Physics3DAbiContactBuffer',
            'Physics3DAbiContactHooks',
            'Physics3DAbiExecutionResult',
            'Physics3DAbiJointBuffer',
            'Physics3DAbiQueryBuffer',
            'Physics3DRotationalCcdEnvelope',
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
    const camera3DId = '@flighthq/types:interface#Camera3D';
    expect(classAuditById.get(camera3DId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: [],
    });
    expect(classAuditById.get(camera3DId)?.construction).toMatchObject({
      objectLiterals: 1,
      plainObjectLiterals: 1,
    });
    expect(provenanceById.get(camera3DId)?.nominalIdentity).toEqual({ blockerReasons: [], closed: true });
    const matrix4Id = '@flighthq/types:interface#Matrix4';
    expect(classAuditById.get(matrix4Id)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: [],
    });
    expect(classAuditById.get(matrix4Id)?.construction).toMatchObject({
      objectLiterals: 1,
      plainObjectLiterals: 1,
    });
    expect(provenanceById.get(matrix4Id)?.nominalIdentity).toEqual({ blockerReasons: [], closed: true });
    expect(provenanceById.get(particleEmitterDataId)?.nominalIdentity.closed).toBe(false);
    expect(() => validateCppStructInitProvenance(cppStructInitTypedStructIds, provenance)).not.toThrow();
    expect(() => validateCppStructInitProvenance([particleEmitterDataId], provenance)).toThrow(
      `cpp @:structInit schemas are not provenance-closed: ${particleEmitterDataId}`,
    );
    const rectangleId = '@flighthq/types:interface#Rectangle';
    const rectangleLikeId = '@flighthq/types:type#RectangleLike';
    expect(classAuditById.get(rectangleId)?.migration).toEqual({
      mechanicallyCompatible: true,
      normalizationReasons: [],
      observabilityReasons: ['strict-equality'],
    });
    expect(provenanceById.has(rectangleId)).toBe(false);
    expect(provenanceById.has(rectangleLikeId)).toBe(false);
    expect(() => validateCppStructInitProvenance([rectangleId, rectangleLikeId], provenance)).toThrow(
      `cpp @:structInit schemas are not provenance-closed: ${rectangleId}, ${rectangleLikeId}`,
    );
    expect(readFileSync('generated/flight/types/ParticleEmitter2D.hx', 'utf8')).toContain(
      'typedef ParticleEmitter2D = { var data:ParticleEmitterData;',
    );
    expect(readFileSync('generated/flight/types/ParticleEmitter3D.hx', 'utf8')).toContain(
      'typedef ParticleEmitter3D = { var data:ParticleEmitterData;',
    );
    expect(readFileSync('generated/flight/types/NodeData.hx', 'utf8')).toContain(
      'typedef NodeData = flight._internal._Object;',
    );

    expect(report.summary).toEqual({
      auditOnlySchemas: report.candidates.filter((candidate) => candidate.emission.mode === 'audit-only').length,
      bindableAccesses: report.candidates.reduce(
        (total, candidate) => total + candidate.emission.directAccesses + candidate.emission.pendingAccesses,
        0,
      ),
      candidates: report.candidates.length,
      directAccesses: report.candidates.reduce((total, candidate) => total + candidate.emission.directAccesses, 0),
      directSchemas: report.candidates.filter(
        (candidate) => candidate.emission.mode === 'direct' && candidate.migration.status !== 'kind-changed',
      ).length,
      eligible: report.candidates.filter((candidate) => candidate.eligible).length,
      escapes: report.candidates.reduce((total, candidate) => total + candidate.escapes.length, 0),
      fields: report.candidates.reduce((total, candidate) => total + candidate.fields.length, 0),
      ineligible: report.candidates.filter((candidate) => !candidate.eligible).length,
      pendingAccesses: report.candidates.reduce((total, candidate) => total + candidate.emission.pendingAccesses, 0),
      reflectiveSurvivors: report.candidates.reduce(
        (total, candidate) =>
          total +
          candidate.emission.reflectiveSurvivors.reduce((subtotal, survivor) => subtotal + survivor.accesses, 0),
        0,
      ),
    });
    expect(report.migration.summary).toMatchObject({
      baseline: 404,
      kindChanged: 3,
      preserved: 214,
      relocated: 135,
      removed: 26,
      renamed: 26,
    });
    expect(report.migration.summary.newAuditOnly).toBe(
      report.candidates.filter(
        (candidate) => candidate.migration.status === 'new' && candidate.emission.mode === 'audit-only',
      ).length,
    );
    expect(classAudit.summary.schemas).toBe(classAudit.schemas.length);
    expect(provenance.summary).toMatchObject({
      candidateSchemas: provenance.schemas.length,
      closedSchemas: provenance.schemas.filter((schema) => schema.nominalIdentity.closed).length,
      containmentEdges: provenance.containmentEdges.length,
    });
    const typeErasuresByReason = typeErasureReport.modules.reduce<Record<string, number>>((totals, item) => {
      for (const [reason, count] of Object.entries(item.byReason)) totals[reason] = (totals[reason] ?? 0) + count;
      return totals;
    }, {});
    expect(typeErasureReport.summary).toMatchObject({
      byReason: typeErasuresByReason,
      total: typeErasureReport.modules.reduce((total, item) => total + item.total, 0),
    });
    expect(
      typeErasureReport.modules
        .filter(
          ({ module, source }) =>
            module === 'flight._Scene2DCanvas' &&
            [
              'upstream/packages/scene2d-canvas/src/canvasCache.ts',
              'upstream/packages/scene2d-canvas/src/canvasRenderState.ts',
              'upstream/packages/scene2d-canvas/src/canvasRenderTarget.ts',
            ].includes(source ?? ''),
        )
        .map(({ byReason, module, source, total }) => ({ byReason, module, source, total })),
    ).toEqual([
      {
        byReason: { 'source-any': 2, 'standard-toolkit-boundary': 22 },
        module: 'flight._Scene2DCanvas',
        source: 'upstream/packages/scene2d-canvas/src/canvasCache.ts',
        total: 24,
      },
      {
        byReason: { 'standard-toolkit-boundary': 8 },
        module: 'flight._Scene2DCanvas',
        source: 'upstream/packages/scene2d-canvas/src/canvasRenderState.ts',
        total: 8,
      },
      {
        byReason: { 'standard-toolkit-boundary': 26 },
        module: 'flight._Scene2DCanvas',
        source: 'upstream/packages/scene2d-canvas/src/canvasRenderTarget.ts',
        total: 26,
      },
    ]);
    expect(
      typeErasureReport.modules.find(
        ({ module, source }) =>
          module === 'flight._Interaction' && source === 'upstream/packages/interaction/src/nodeInteractionState.ts',
      ),
    ).toEqual({
      byReason: { 'source-never': 12 },
      module: 'flight._Interaction',
      source: 'upstream/packages/interaction/src/nodeInteractionState.ts',
      total: 12,
    });
    expect(
      typeErasureReport.modules.find(
        ({ module, source }) =>
          module === 'flight._Animation' && source === 'upstream/packages/animation/src/animationClip.ts',
      ),
    ).toEqual({
      byReason: { 'source-unknown': 12, 'standard-toolkit-boundary': 10 },
      module: 'flight._Animation',
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
    expect(rectangle?.emission).toEqual({
      directAccesses: expect.any(Number),
      mode: 'direct',
      pendingAccesses: 0,
      reflectiveSurvivors: [
        { accesses: 1, reason: 'computed-key' },
        { accesses: 2, reason: 'presence-sensitive' },
      ],
    });
    expect(camera2D?.emission).toEqual({
      directAccesses: expect.any(Number),
      mode: 'direct',
      pendingAccesses: 0,
      reflectiveSurvivors: [],
    });
    expect(particleEmitterData).toMatchObject({
      eligible: true,
      emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0 },
      escapes: [],
      fields: expect.arrayContaining([
        expect.objectContaining({ name: 'particleCount', optional: false, type: 'number' }),
        expect.objectContaining({ name: 'transforms', optional: false, type: 'Float32Array<ArrayBufferLike>' }),
      ]),
      reasons: [],
    });
    expect(particleEmitterState).toMatchObject({
      eligible: true,
      emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0 },
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
      emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
      escapes: [],
      migration: { baselineId: null, status: 'new' },
      purpose: 'reviewed escape-free bitmap region',
      reasons: [],
    });
    expect(glRenderStateRuntime).toMatchObject({
      declarationFingerprint: 'sha256:7b13d22a6501300f888dfc1d174bb0d7a4eb02db97f0112d52adcd1f0d4156ba',
      eligible: true,
      emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
      escapes: [],
      migration: { baselineId: null, status: 'new' },
      purpose: 'reviewed escape-free WebGL render-state runtime',
      reasons: [],
    });
    expect(wgpuRenderStateRuntime).toMatchObject({
      declarationFingerprint: 'sha256:98f76831e154a026450321ea0bfc3cef4b621c07bc1dd110b6bbe79adf8982f2',
      eligible: true,
      emission: { directAccesses: 0, mode: 'audit-only', pendingAccesses: 692, reflectiveSurvivors: [] },
      escapes: expect.arrayContaining([expect.objectContaining({ reason: 'presence-sensitive' })]),
      migration: { baselineId: null, status: 'new' },
      purpose: 'checker-discovered public declaration',
      reasons: [],
    });
    for (const [name, declarationFingerprint, purpose] of [
      [
        'CanvasRenderTarget',
        'sha256:aebdf41761931dac048956317e71e4924db4e1d756cdb71350a0c3395cbc6e8b',
        'reviewed escape-free Canvas render target',
      ],
      [
        'GlRenderTarget',
        'sha256:e4935b11659066d8df77aaa20b30893233c77e02a633645dc163e6a9aa544f59',
        'reviewed escape-free WebGL render target',
      ],
      [
        'RenderTarget',
        'sha256:c7a251ae0b80f4ecea3ed0c7bf9d8f702baff476a5465d16cdf5e1d1bc427111',
        'reviewed escape-free portable render target',
      ],
      [
        'RenderTargetDescriptor',
        'sha256:f976a3e923d48395ab6e3ab23594c3979ad742550499012816e1aa6fada959dc',
        'reviewed escape-free render-target descriptor',
      ],
      [
        'WgpuRenderTarget',
        'sha256:e8e718c9a2fc110b9f33f3d8af52a03c9cd022c91939c2ac4a89d8bbec43bf81',
        'reviewed escape-free WebGPU render target',
      ],
    ] as const) {
      expect(renderTargetCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'AnimatedNormalModifierOptions',
        'sha256:97105d620e4afa392d6e85532e6fc45385b94f13a602cd4b6770281e27eded33',
        'reviewed escape-free animated-normal modifier options',
      ],
      [
        'DissolveModifierOptions',
        'sha256:877e24a08322880ba5714aa0116f27f119d937d476e1922d21694b5d5bb03c36',
        'reviewed escape-free dissolve modifier options',
      ],
      [
        'EmissiveModifierOptions',
        'sha256:3178f9ac65a057f14a0f654c4380a341fe76b57d865832040c2b7e3f3a6bf79c',
        'reviewed escape-free emissive modifier options',
      ],
      [
        'FogModifierOptions',
        'sha256:a140958cfd3e17565cf886b6ec71cf5ad24d26795dee44c1741d2a55287472e4',
        'reviewed escape-free fog modifier options',
      ],
      [
        'VertexDisplaceModifierOptions',
        'sha256:4831daeafb37b213acd119f1b235c36ab8b0c9539d23d2958379792fa2a48f98',
        'reviewed escape-free vertex-displacement modifier options',
      ],
    ] as const) {
      expect(shadingModifierOptionCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'InteractionManager',
        'sha256:a54f58b205d53b959529e62ab802c89eab67ac85849468b97f99d2f06f71e5aa',
        'reviewed escape-free interaction manager',
      ],
      [
        'InputState',
        'sha256:216dce6f67c2e578771f19028b5b6df661f640ecf89609634c0f5537d28f30e7',
        'reviewed escape-free input state',
      ],
      [
        'PointerEventData',
        'sha256:a21b27d68119da759ea2e963106f0280744090b06621aba95150c883bc80fb23',
        'reviewed escape-free pointer event data',
      ],
      [
        'NodeInteractionState',
        'sha256:c1566a9ef3f76a0a5845445ebb0ad24f240f195794ca401aff5832dc9ead917b',
        'reviewed escape-free node interaction state',
      ],
      [
        'InteractionPointerState',
        'sha256:2c60e479926c797a20ea429b5a01bfba2c2b8d18bb72b90d1cad2d33d7bf9d60',
        'reviewed escape-free interaction pointer state',
      ],
    ] as const) {
      expect(interactionStateCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'TilemapData',
        'sha256:24320b83bfd5874be2f12540bc06d3b54f1f6d2611c4c7652b684095843ad56b',
        'reviewed escape-free tilemap data',
      ],
      [
        'TiledObject',
        'sha256:d8b583fd4ac5be7b2e225eb093440e762ac18bd63947531c364b379b941aa409',
        'reviewed escape-free Tiled object',
      ],
      [
        'TiledMap',
        'sha256:06addefb47009dd6ad6194898472603ce2dd11f327687e4795e7ed1fa107eb9f',
        'reviewed escape-free Tiled map',
      ],
      [
        'Tilemap',
        'sha256:baaa0bd15356d53492d909bb22e420d309e45d951731b185dddd284a4bfe42b1',
        'reviewed escape-free tilemap',
      ],
      [
        'TiledTileset',
        'sha256:f7f49b1c5693d038732edcc23550418414f1b7bca0501669372a4e0d11f212eb',
        'reviewed escape-free Tiled tileset',
      ],
    ] as const) {
      expect(tilemapTiledCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'TransmissionVolumePbrExtension',
        'sha256:d2e5d9acdd16ea800ff99d016bd6da24a62a410c5efa12e734e9e2649f325602',
        'reviewed escape-free transmission-volume PBR extension',
      ],
      [
        'ClearcoatPbrExtension',
        'sha256:80ae6c1261768bbe66d4437552c4c7ceee1a7368799bb3190699c0895be3795f',
        'reviewed escape-free clearcoat PBR extension',
      ],
      [
        'IridescencePbrExtension',
        'sha256:09159cce23f7c1cbfcbebf1a7c91d65bc7d23a53e199ec7f509d05b93f7bfa9b',
        'reviewed escape-free iridescence PBR extension',
      ],
      [
        'WrappedDiffusePbrExtension',
        'sha256:58c73e60264700f5dcd433febea3ead0758d3e062b8cc68c0b35586324582a31',
        'reviewed escape-free wrapped-diffuse PBR extension',
      ],
      [
        'SpecularPbrExtension',
        'sha256:d028a204fbe4ebdd31bb85d2c26f6c239b3c7a8aff40c22b4f9548c15c012e5f',
        'reviewed escape-free specular PBR extension',
      ],
    ] as const) {
      expect(pbrExtensionCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'FlyCameraController',
        'sha256:5ec7dbb9000ec57efedee41fc853a74e39bf8f7b229155779007e9579f9407b7',
        'reviewed escape-free fly camera controller',
      ],
      [
        'ParticleEmitter3D',
        'sha256:64e20d991efa3af3e4d7ea369d2494215759ec7b97040fd164291220452e4e3d',
        'reviewed escape-free 3D particle emitter',
      ],
      [
        'SocketRuntime',
        'sha256:84a5032e10a50972215d64097cb31bfcac6f4cb43baf03f7b651b7d72bc25864',
        'reviewed escape-free socket runtime',
      ],
      [
        'NodeOrderList',
        'sha256:ac6d71dd26dbaa9e99b676efee5645d01bc94b02da6199e93c5b674e43b77e92',
        'reviewed escape-free node order list',
      ],
      [
        'PackableRectangle',
        'sha256:0d4dd4a03fe6768f388ff1d15945725582f976354ad7cc1f2df54aa966166763',
        'reviewed escape-free packable rectangle',
      ],
    ] as const) {
      expect(highAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'Clock',
        'sha256:e6e95909db1bea0affe3369897e0632ad4f455db8211a678d4d881f01d456a9b',
        'reviewed escape-free clock',
      ],
      [
        'AreaLight',
        'sha256:9ea86c550f139c78db1e1e5f74465c7b5551ae23b4269fa6f342fabefe27471a',
        'reviewed escape-free area light',
      ],
      [
        'LottieLayer',
        'sha256:536acfeb8adf5990afe92ebb61f68034b3e9b20bf0c9ea500f398f8d74b0f718',
        'reviewed escape-free Lottie layer',
      ],
      [
        'MovieClipData',
        'sha256:5aa6485af78fca2067f0720a27927c1e85e3c6481c8299dbe80ef2b73dd1d259',
        'reviewed escape-free movie-clip data',
      ],
      [
        'PathMesh',
        'sha256:66cba4b02f27ccf2d392f2ce60c410aaa294ac9c3344dcc6fe3c41e474430059',
        'reviewed escape-free path mesh',
      ],
    ] as const) {
      expect(secondHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'StandardPbrMaterial',
        'sha256:eb3c5963e698ab1eed121c92ac6e155716fa5e4290d28387409fcdbc96ba6647',
        'reviewed escape-free standard PBR material',
      ],
      [
        'TextSelectionRectangle',
        'sha256:8b127f9af8b5c5c504869aff4b368a55038b3df041dcc04c392bae8aed708e39',
        'reviewed escape-free text selection rectangle',
      ],
      [
        'LayoutNode',
        'sha256:dcb64afdbc4634db6a19bccd9b239a2d46272227ea1bcc4547bb450d8e95b91f',
        'reviewed escape-free layout node',
      ],
      [
        'Scene3DKindUsage',
        'sha256:6221bdcad721b47767821e41a9d71f9e1d6766b425ec20a430f0ee643b761ab6',
        'reviewed escape-free Scene3D kind usage',
      ],
      [
        'TextureSource',
        'sha256:e1aa5f7158dac8804df2b8cb02d88eb0ef695dcb84db0bb0804dc6a2fd8c1b1f',
        'reviewed escape-free texture source',
      ],
    ] as const) {
      expect(thirdHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
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
        'sha256:2bdbe3ada235694e4763bdd4790a27ed58622ac27fe80ef8d7378eebd44f0e9f',
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
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'TextInputOptions',
        'sha256:1b5f5456e620e7bbc76f4a5bb4aaa3a55f80a9ebc786347d9c288be4f77737da',
        'reviewed escape-free text input options',
      ],
      [
        'LottieDocument',
        'sha256:bc1bd8fee72d0e49ff3cc90a7cac976377ee624b49519bc78226652352e72d31',
        'reviewed escape-free Lottie document',
      ],
      [
        'Scene3DLightBlock',
        'sha256:4f02cd2e116d99ce5b2af2c64e24ae32f9498383db2c912a82071baa98a33344',
        'reviewed escape-free Scene3D light block',
      ],
      [
        'GodRaysEffect',
        'sha256:200f20a7b556d1c3a1c4880fde41f35aba28c6d41c03cf434ac1c39eb00f2275',
        'reviewed escape-free god-rays effect',
      ],
      [
        'NativeTextData',
        'sha256:5e7d4b75130bdda69787b9c27ae02b9270e3c086f66849b6aecb864787210fd6',
        'reviewed escape-free native-text data',
      ],
    ] as const) {
      expect(fifthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'Scene3DResourceResolverRuntime',
        'sha256:cca48392cc0563408359655051fa56fa10bc7f87bc7ff62ad06dc65a87430355',
        'reviewed escape-free Scene3D resource-resolver runtime',
      ],
      [
        'GradientGlowEffect',
        'sha256:095a13e1c53d9734759a7a788007e08fb2ad1347e36f353e48ba2e6b730c44ae',
        'reviewed escape-free gradient-glow effect',
      ],
      [
        'BitmapTextData',
        'sha256:63846610c575904018effbac806a0440c7a5eeadaee51b0834ffb45fbf7fd44b',
        'reviewed escape-free bitmap-text data',
      ],
      [
        'WgpuShapeMeshBuffers',
        'sha256:f9514088a8f644f0471aa1aa5a043041544b3296d2aa7a9994fa8dfa8ae9e7b8',
        'reviewed escape-free WebGPU shape-mesh buffers',
      ],
      [
        'Scene3DDocumentNode',
        'sha256:9ed61dc079468b2826972b414de55e5725087be3219b8eea7e4ddf7716ade10c',
        'reviewed escape-free Scene3D document node',
      ],
    ] as const) {
      expect(sixthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'DirectionalLight',
        'sha256:5aa15d73a4d69dda6f617f278e05d90700a178b45474ec248e36e1a1139373ae',
        'reviewed escape-free directional light',
      ],
      [
        'SurfaceMaterial',
        'sha256:ad4981fb8d04361edb9e7e958ecc08e26e759a9934fb583584440ff0296f4f4a',
        'reviewed escape-free surface material',
      ],
      [
        'MorphShapeGradientEndpoint',
        'sha256:f5a125c830ec328239b3260b832a2d808ac31e1e0735b68100978abf63435bde',
        'reviewed escape-free morph-shape gradient endpoint',
      ],
      [
        'SpatialIndexingNotice',
        'sha256:f864004b87b82bcca917b1ed1e00b1b83f330263d4f5c0fce6e3b8e5bc6dafa8',
        'reviewed escape-free spatial-indexing notice',
      ],
      [
        'Scene3DRenderList',
        'sha256:7e7d78288f957c8b5498a6e851712cd492da91353a70049a43a65b9d5abf86ed',
        'reviewed escape-free Scene3D render list',
      ],
    ] as const) {
      expect(seventhHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
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
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'AbcInstruction',
        'sha256:f9b45a313f2614d54a52c279b9226bcc9c33ba384453b6dca79b0f5c1338c57d',
        'reviewed escape-free ABC instruction',
      ],
      [
        'AbcMultiname',
        'sha256:a530f1994767f0978b42abb9d0e32a5edfe81713180e2a2a86d594892bcf840c',
        'reviewed escape-free ABC multiname',
      ],
      [
        'AnimationRootMotionExtractor',
        'sha256:7b66783df68ff872ad421ae76f22aa65a493abbe89363e655126bd5366f4c849',
        'reviewed escape-free animation root-motion extractor',
      ],
      [
        'CanvasRenderTexturePool',
        'sha256:bccbdac026b10fed057b1fa96baa3cd24ad093dbb672ca4714c9f87985872894',
        'reviewed escape-free Canvas render-texture pool',
      ],
      [
        'LogEntry',
        'sha256:386ab33911ac9d6cfda1c53f076da7a8c79abd8f042508f5e4210185d9eacd08',
        'reviewed escape-free log entry',
      ],
    ] as const) {
      expect(ninthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'ToonMaterial',
        'sha256:18941a2c71192e6c26ca772bcfe4339627f7d9de02702c8ca85e91f143e56b31',
        'reviewed escape-free toon material',
      ],
      [
        'UnlitMaterial',
        'sha256:417acaac58c0e2858150ca2c9b932592fac6c505e7cf14fcc530a0751bbb7d65',
        'reviewed escape-free unlit material',
      ],
      [
        'ConvolutionEffect',
        'sha256:bde9a7679c21f48a1a9479c7bfcd6dd049d9255cee1c88feaecc530e7fbfb5fc',
        'reviewed escape-free convolution effect',
      ],
      [
        'EmissiveMaterial',
        'sha256:f6ce7b48e8cfcf10e0d23b4d42b6c4889c92638bfc8343e6505fae82bbb7b586',
        'reviewed escape-free emissive material',
      ],
      [
        'TransformInherit2D',
        'sha256:58e62708f57df42b10b3295377b9c994df1e99c342cdf02e0df5ddac41df98f5',
        'reviewed escape-free 2D transform inheritance',
      ],
    ] as const) {
      expect(tenthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'ExtendedPbrMaterial',
        'sha256:637bd4055c49e86f20dea391c47c2538d7a327645111fedb7d9904eed914daa0',
        'reviewed escape-free extended PBR material',
      ],
      [
        'TweenPropertyDetail',
        'sha256:d8b13478c32c050f10440ebe6dc0b1ef9dc33cabde40a9fddb26ab0bd47a1001',
        'reviewed escape-free tween property detail',
      ],
      [
        'WgpuScene3DShadow',
        'sha256:51198c8940045753f24c81e72c79afa768610dc0b4ad580609876711fd13e77f',
        'reviewed escape-free WebGPU Scene3D shadow',
      ],
      [
        'AnimationClipEvent',
        'sha256:8d540d5dae11b58c4b1f2a43bfcc742aca87555ad5a5c5249f1800ebbc2a9bed',
        'reviewed escape-free animation clip event',
      ],
      [
        'BitmapTextRuntime',
        'sha256:51fd90371ed793b2a0ea3f8784b335ed1ff2a7a7749be968805fd04754d0f5d4',
        'reviewed escape-free bitmap-text runtime',
      ],
    ] as const) {
      expect(eleventhHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'GlColorScaleBiasInstancedShader',
        'sha256:eb2748590ab9d2f4190685a0e0023dcfbc58ae2fcfa924a12b27f0b5867c273c',
        'reviewed escape-free WebGL color scale-bias instanced shader',
      ],
      [
        'LambertMaterial',
        'sha256:7989056728641ab50c58e89af6020dcefd9fe796a4b99bba6047a58af20c103c',
        'reviewed escape-free Lambert material',
      ],
      [
        'OrbitCameraControllerOptions',
        'sha256:f1dbf387c55015f5b44dbbe97535bcc3591c79fc936b1381180dc3f65b3da869',
        'reviewed escape-free orbit-camera options',
      ],
      [
        'WgpuShapeRendererData',
        'sha256:92fef010744eaee91acad5aea117b6edee38f2f89e6546173d8728ac627f103a',
        'reviewed escape-free WebGPU shape-renderer data',
      ],
      [
        'AnimationBlendTree',
        'sha256:054fcb71f93fcdf8767c5be098eb1a25dc1facb91452f1a2fdc42cb37556318c',
        'reviewed escape-free animation blend tree',
      ],
    ] as const) {
      expect(twelfthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'WgpuRenderTexturePool',
        'sha256:8a2e66fa93ab54d34cd36ee7491780879d7f4f726c841200a9a168247ce7152c',
        'reviewed escape-free WebGPU render-texture pool',
      ],
      [
        'GlRenderTexturePool',
        'sha256:31cadf0a506da69f7c8df86f6b91bb4f048c2669d118cde2ce59c15187c99e12',
        'reviewed escape-free WebGL render-texture pool',
      ],
      [
        'GlShadedProgram',
        'sha256:ea78be613c04f60f3a3dfb6529793a1e50fdf4a6d96d13246cb23de6e92ccdab',
        'reviewed escape-free WebGL shaded program',
      ],
      [
        'GlShapeRendererData',
        'sha256:1bdd157fa0fc26ff269d89b93a87f8fdec95c934d02cdafdfd30875efb8edf63',
        'reviewed escape-free WebGL shape-renderer data',
      ],
      [
        'WgpuQuadBatchWriterBufferSlot',
        'sha256:0362fdf0b62095db70100964f8f2d188eae552a2513337d7a145648619fd9486',
        'reviewed escape-free WebGPU quad-batch buffer slot',
      ],
    ] as const) {
      expect(thirteenthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'TextLayoutParams',
        'sha256:1f2c95acb12ba7582d7411b09d418cf403f8a1cfd850662b185e4c344cecdd40',
        'reviewed escape-free text-layout parameters',
      ],
      [
        'SoftKeyboardInfo',
        'sha256:0d37ab980102fd6c29da9c33e3ff69749aa8fc3fceed59fed424bf51c17c3ca4',
        'reviewed escape-free soft-keyboard info',
      ],
      [
        'LayoutTree',
        'sha256:490d3123a670ddb1d15cd2cfd73da271b75c8e85cc7f1fe029718b2079329e7a',
        'reviewed escape-free layout tree',
      ],
      [
        'Sprite',
        'sha256:d7459435d0471453f1a562948d6fa63807ac8d1381c6ea5874b6f8299eb1b9c2',
        'reviewed escape-free sprite',
      ],
    ] as const) {
      expect(fourteenthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    expect(fourteenthHighAccessFrontierCandidates.get('TextShaperBackend')).toMatchObject({
      declarationFingerprint: 'sha256:a6d76855c342cc710304eff6c3034f16a3853a751ee704d881de32f764d3c047',
      eligible: true,
      emission: {
        directAccesses: 0,
        mode: 'audit-only',
        pendingAccesses: 17,
        reflectiveSurvivors: [],
      },
      escapes: [
        expect.objectContaining({ reason: 'computed-key', source: 'upstream/packages/textshaper/src/textShaper.ts' }),
      ],
      migration: { baselineId: null, status: 'new' },
      purpose: 'checker-discovered public declaration',
      reasons: [],
    });
    for (const [name, declarationFingerprint, purpose] of [
      [
        'AnimationSampleAccumulator',
        'sha256:58f7997452442a5677046c8e565087775f4d75bd6d45ce4f5803c92de3077eb7',
        'reviewed escape-free animation sample accumulator',
      ],
      [
        'AnimationLayer',
        'sha256:49e24f8195b6c8f54063c8f1b16b6b8a574fdb6d28380516aa63a0b33289fd55',
        'reviewed escape-free animation layer',
      ],
      [
        'AnimationBlendTreeInput',
        'sha256:999935ff446a57ea847011240330cc4caeb5afe76fd06fddb5d816cbb15d5dfa',
        'reviewed escape-free animation blend-tree input',
      ],
      [
        'LottieKeyframe',
        'sha256:62295208edb23fbfba568845028bd4aed2cdbe7599cc9c81a4c03ce484fccc8d',
        'reviewed escape-free Lottie keyframe',
      ],
      [
        'Skeleton2DTransformConstraint',
        'sha256:7ed2b99d05ce368354bb2e67e4a595cb4863a929c6755cfcdab9902470c39959',
        'reviewed escape-free Skeleton2D transform constraint',
      ],
    ] as const) {
      expect(fifteenthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'AbcTrait',
        'sha256:74c21326aec08c9f2f2e16e6d64e3300ccdb3fc5423d6bf9b2c1145b6def2a8a',
        'reviewed escape-free ABC trait',
      ],
      [
        'CanvasRenderTextureEntry',
        'sha256:347be02a5d0ddbe8c51171c42f0c6fbb5fd7c9a9ce57332156da8e12fbaf5722',
        'reviewed escape-free Canvas render-texture entry',
      ],
      [
        'NetRequest',
        'sha256:be5f077631722591406184fa65398af48876fb3c6e8c82d3a3da4cc352c434e7',
        'reviewed escape-free net request',
      ],
      [
        'SheenPbrExtension',
        'sha256:035a1014631528e9aa9210a89a65d69e398026d9db46131285a1c87aeb2fda16',
        'reviewed escape-free sheen PBR extension',
      ],
      [
        'ThreeDsLight',
        'sha256:1e5fb34fc3ff6df55e616cadbad7a3c2ea2027a5237f3e2d660b7d33d745305e',
        'reviewed escape-free 3DS light',
      ],
    ] as const) {
      expect(sixteenthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'WgpuScene3DIbl',
        'sha256:2c9de49060c0caec1db063676aaff00b42a147d1453a572eebc9698cad804d96',
        'reviewed escape-free WebGPU Scene3D IBL',
      ],
      [
        'WgpuColorLutTextureCache',
        'sha256:c598e5b3c7afe9486b6cb5b0debd608414646860ec136cf35c318b86b51ff1b1',
        'reviewed escape-free WebGPU color-LUT texture cache',
      ],
      [
        'WgpuMeshUpload',
        'sha256:31d73dbaa19b2ef6cf67f3fadd4a1b5319ee6881fb53b0fa1213c11a3b34115d',
        'reviewed escape-free WebGPU mesh upload',
      ],
      [
        'Viewport',
        'sha256:4469ff9b065da72e57da440a045907f3e0002cad6c1040d298d4bdd03720003d',
        'reviewed escape-free viewport',
      ],
      [
        'TauriApi',
        'sha256:44bcb932c0e88a332e71c3d85aecb67af098ff10aec46f4e8e656678fcc4e7e7',
        'reviewed escape-free Tauri API',
      ],
    ] as const) {
      expect(seventeenthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'StrokeStyle',
        'sha256:ec1ee1a0110859d8a51e6fef7add0524114a018e5ce4bb456d8f0d1707c3d278',
        'reviewed escape-free stroke style',
      ],
      [
        'Socket',
        'sha256:b86755aef7f21cdbdf6fe0f9b1b5da2c48bbf6395e26a4466d9c7d69a153cfe6',
        'reviewed escape-free socket',
      ],
      [
        'Physics2DDebugGeometry',
        'sha256:1f8b276b48280ac169c1a2fd693088116385bea498fd8d80746091ed5a42729a',
        'reviewed escape-free physics debug geometry',
      ],
      [
        'Modifier',
        'sha256:796da4037514e9798f33666107ab84b3e7a4d1656e87ad4354d2508e6a10dd38',
        'reviewed escape-free modifier',
      ],
      [
        'StatechartState',
        'sha256:decf7fe340c128e6a1f153a139af5a745851388a7c362e4660bb156def070f05',
        'reviewed escape-free statechart state',
      ],
    ] as const) {
      expect(eighteenthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'SpriteData',
        'sha256:0a192307a03c8542e477cc8b64353c3b5de08c6cde73bec89ca39694c56943b4',
        'reviewed escape-free sprite data',
      ],
      [
        'Skeleton2DIkConstraint',
        'sha256:3c0fee3ae382d16ba3cd1c9fc452d167718acbfee3812c43c4f7942f1c656469',
        'reviewed escape-free skeleton IK constraint',
      ],
      [
        'Physics2DRayResult',
        'sha256:dcd5f590b1f242ab29d2afd97181bbc6e1cfeb173ca544ef716f2f321130ebd8',
        'reviewed escape-free physics ray result',
      ],
      [
        'PbrExtension',
        'sha256:fe60b141f962890b1a4304cac98fcfa9c5c81e8831ac27ee0fa728625f276013',
        'reviewed escape-free PBR extension',
      ],
      [
        'NativeTextRuntime',
        'sha256:a31ec0e776fefad7311e898f90401d6895f78c493ec129f623f6512f580a2a18',
        'reviewed escape-free native text runtime',
      ],
    ] as const) {
      expect(nineteenthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'MatcapMaterial',
        'sha256:9120c1f4326056903cb3c9f42bd0a00ecc74b9e9b0656c18fdcf8047e92f363c',
        'reviewed escape-free matcap material',
      ],
      [
        'LottieShapePath',
        'sha256:ce922284ec58aebfe1997133806dde22e7754a0ac71bda478870249b6a938926',
        'reviewed escape-free Lottie shape path',
      ],
      [
        'GlRenderEffectApplicationExplanation',
        'sha256:9b76f1af7c0c56fb8e63f46501e7fbd383c1ca70e99a8c2150f52e1ecd678a6d',
        'reviewed escape-free WebGL render-effect explanation',
      ],
      [
        'FlexLayoutItemStyle',
        'sha256:5f78f38895f44208c6b9992633e77f10e15cd707cbd579918a67aa00701daa26',
        'reviewed escape-free flex item style',
      ],
      [
        'BitmapFingerprint',
        'sha256:50b5f1e7cf212f956951395d3caf98ac9fefcaaf982b3bc77b182c1b6ae2ecde',
        'reviewed escape-free bitmap fingerprint',
      ],
    ] as const) {
      expect(twentiethHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'AccessibilityState',
        'sha256:1f209c4f7d90191f56d8beee8987f5e88fd79dde04fdb55d2259a7ed5061c8e7',
        'reviewed escape-free accessibility state',
      ],
      [
        'WgpuVideoTextureEntry',
        'sha256:da0f630196cf440da445e080b9729ba42c3fb30d7645cfdfac1fd789e78c86cd',
        'reviewed escape-free WebGPU video texture entry',
      ],
      [
        'WgpuShapeMesh',
        'sha256:a7bf1ac799a7a857268d1b05541826b1ec19e7b1e3f640d485b2a77dfdf793aa',
        'reviewed escape-free WebGPU shape mesh',
      ],
      [
        'WgpuScene3DDrawEntry',
        'sha256:b4d8b046bbaf156d910380ce47f8e5eb9bdcdfac78735a793394fc189153168d',
        'reviewed escape-free WebGPU Scene3D draw entry',
      ],
      [
        'VignetteEffect',
        'sha256:f41110d11eecb97849c3d3c836b7c17e79b58e5fa50dc2486f4e58366b4f3fbe',
        'reviewed escape-free vignette effect',
      ],
    ] as const) {
      expect(twentyFirstHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'CanvasRenderEffectPipeline',
        'sha256:f0f92129b058ee5f05cd9b1720f2d60db4a348e6e4db086f74a9ceb8718520af',
        'reviewed escape-free Canvas render-effect pipeline',
      ],
      [
        'ColorAdjustmentRuntime',
        'sha256:6af421b0c66043312dce3e7248225fbb43b0df05efaec7f3186f4f863b33dd93',
        'reviewed escape-free color-adjustment runtime',
      ],
      [
        'GlScene3DDrawEntry',
        'sha256:19afb18fb092b624bbd1cde411781b148a4786e8dc14bc25d8305755907b3f0c',
        'reviewed escape-free WebGL Scene3D draw entry',
      ],
      [
        'ShadedMaterialOptions',
        'sha256:3f073246cc4c3bc480231452c128a1e7887dfcbe84ace00b3cabb63a2b5a4f9b',
        'reviewed escape-free shaded-material options',
      ],
      [
        'RenderEffectPadding',
        'sha256:d113313a017369bd2254f2d17a856a87160bc56d6a23b1099d81bb802192ff51',
        'reviewed escape-free render-effect padding',
      ],
    ] as const) {
      expect(twentySecondHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'DisplayObject',
        'sha256:d4aa2c07ba8d4abaf82786b5682b8b5a49af14d917e142ef18f4618dcdcd6769',
        'reviewed escape-free display object',
      ],
      [
        'GridLayoutItemStyle',
        'sha256:2a53a77d506c3e24d49ddec40f9177f91887dcb95e9ec7f71474223753bca498',
        'reviewed escape-free grid item style',
      ],
      [
        'NativeText',
        'sha256:88013e44c2b9873292c3001ef0df176f90cb4974f368d0820db78530ca328431',
        'reviewed escape-free native text',
      ],
      [
        'TextLabelRuntime',
        'sha256:668abe75927fb5e032cce2bf278377fd1515b63ef688c280c1aa75fc7c8b8a99',
        'reviewed escape-free text-label runtime',
      ],
      [
        'AccessibilityNode',
        'sha256:0d54531616bd2ab0cae1a50a1978b2e6307e45e6937724a91c4f5dee64f19703',
        'reviewed escape-free accessibility node',
      ],
    ] as const) {
      expect(twentyThirdHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'CapacitorApi',
        'sha256:b0dc0c96ded1a17737bca7c5890baa1686ceb20716717440a7c6d69ac0b5e6fc',
        'reviewed escape-free Capacitor API',
      ],
      [
        'CapacitorDeviceInfo',
        'sha256:0d43596323d2b6bae32b2a18e48f1b8b9d4e1b111f4befd669e75060b5a088be',
        'reviewed escape-free Capacitor device info',
      ],
      [
        'ElectronDisplay',
        'sha256:021cb40f60ced0ae90a2bcc5ab9547ce29c493b006f71521ee347cd68bfc34fa',
        'reviewed escape-free Electron display',
      ],
      [
        'ElectronRectangle',
        'sha256:b6d1c737450f66fa221301095025d2d5cc6e89f73afe45f736ec72dc3c1b39eb',
        'reviewed escape-free Electron rectangle',
      ],
      [
        'SoftKeyboard',
        'sha256:2570847ccc83abcfda2129d907c117c104272439a99cf9c890947af88f800a44',
        'reviewed escape-free soft keyboard',
      ],
    ] as const) {
      expect(twentyFourthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'AnimationLayerStack',
        'sha256:8dcda29032e3645a19eb6084d397110b860b0be81538c518508e62fe6102e21c',
        'reviewed escape-free animation layer stack',
      ],
      [
        'StatechartTransitionExplanation',
        'sha256:f7c1c8098f7f7c82fe01a7ddf2d805715c481cb04fccaf02da88b46b1d167363',
        'reviewed escape-free statechart transition explanation',
      ],
      [
        'StatechartCondition',
        'sha256:3215c135be242191155c72f14deb9e2ac8380b6ca45320c66f824972a1d9f629',
        'reviewed escape-free statechart condition',
      ],
      [
        'StatechartRegion',
        'sha256:882e0d77b136ee617b5ba9c0a7d578d413d16fd2a91d872175aa5135d01bfe4f',
        'reviewed escape-free statechart region',
      ],
      [
        'StatechartInput',
        'sha256:33eaa2d8e27482f0dd168784805292b3f4ea43bb6b6dc4828ec20cf05dc6ec46',
        'reviewed escape-free statechart input',
      ],
    ] as const) {
      expect(twentyFifthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'FlyCameraControllerOptions',
        'sha256:bd85b1817bcc1e551af340721e5efe989bc68b5d35234abedbb53e229cf8d9d4',
        'reviewed escape-free fly-camera controller options',
      ],
      [
        'MeshMorph',
        'sha256:71b4483bdbf0b4a6fc8b0b13a251315a59fc167b5ba49f7629fa1662b1cd429d',
        'reviewed escape-free mesh morph',
      ],
      [
        'Scene3DDocumentMesh',
        'sha256:c49c9ca13d552a40f3f674729c178d641b948943835cef7d9f5125e8bada05dd',
        'reviewed escape-free Scene3D document mesh',
      ],
      [
        'MeshMorphBindPose',
        'sha256:46ae94ec0d2f4ecb8234eaf136c57802dfddfe945afee70775a2cd3b7ed391ec',
        'reviewed escape-free mesh morph bind pose',
      ],
      [
        'Scene3DForwardLightSelection',
        'sha256:8a8917d87d1e9f3bc9fe8e873e99c17984e9b9d84dc790c0049b851acb32e92c',
        'reviewed escape-free Scene3D forward-light selection',
      ],
    ] as const) {
      expect(twentySixthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'CanvasRenderTargetPool',
        'sha256:7236ded9f6ca6035d9481d6c2aca631ca977acd544e75373b5665c2db7fd3722',
        'reviewed escape-free Canvas render-target pool',
      ],
      [
        'ColorLutCache',
        'sha256:0d473d81ac14313acf8701b87b9845ba0b6598bffce370c9661c9a3a0d756df9',
        'reviewed escape-free color LUT cache',
      ],
      [
        'GlShapeMeshBinding',
        'sha256:7b8ccd20857576a7d0ede53323b5a86d6d23b8b307faeba0bc2f406ec71547b2',
        'reviewed escape-free WebGL shape-mesh binding',
      ],
      [
        'GlVelocityContext',
        'sha256:4bb0b95c7721e34f551efe228cd44c568f2c48c8992d41604f80e0f3dc582058',
        'reviewed escape-free WebGL velocity context',
      ],
      [
        'WgpuVelocityContext',
        'sha256:669927618ba45f10b871136f1943ea25c1a7d4367b9becd2dd02df1d475c5715',
        'reviewed escape-free WebGPU velocity context',
      ],
    ] as const) {
      expect(twentySeventhHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'AbcFile',
        'sha256:37795ca287195af002dc2ffce67b2c13f8bd2180ce31d09dbb3de78a3a0740ca',
        'reviewed escape-free ABC file',
      ],
      [
        'AbcConstantPool',
        'sha256:32ae95dcc7d22d69461d4060c53eb50cdd377aa71bb215906736ec0c036da37f',
        'reviewed escape-free ABC constant pool',
      ],
      [
        'LottieTransform',
        'sha256:d21894626b9d2757d1bec65c881dbd34f84463a37d4eb1cebc327db28cbed122',
        'reviewed escape-free Lottie transform',
      ],
      [
        'LottieDashEntry',
        'sha256:60ab6bdec3878f30bcaf79ab485dad342270d5c455ff2eb29b1d706a89b0638a',
        'reviewed escape-free Lottie dash entry',
      ],
      [
        'LottieTextDocument',
        'sha256:6fdb87c8296e70368f5ddd5a6699e7b6e050cb5e2d794d4382bd58fc5e83d4e2',
        'reviewed escape-free Lottie text document',
      ],
    ] as const) {
      expect(twentyEighthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'AreaLightOptions',
        'sha256:2692ed3168285d890bf7abb2054c889a2ddeeaf73b7ed333349c732c3705c662',
        'reviewed escape-free area-light options',
      ],
      [
        'SpotLightOptions',
        'sha256:d0bf1578d5df68cbb0e862e25e3ac2b9d7a0141cb8461c4a9226d61baecee179',
        'reviewed escape-free spot-light options',
      ],
      [
        'PointLightOptions',
        'sha256:35ec8d4b09d8b5e4ec4a3bb1b4cc4df6cae2b1df2ee5ff01c43296dc64029d2c',
        'reviewed escape-free point-light options',
      ],
      [
        'DirectionalLightOptions',
        'sha256:ae22f5138e53cd2df7b843f130bdd9febf39d2cad6f130edf563bb11fc9f4431',
        'reviewed escape-free directional-light options',
      ],
    ] as const) {
      expect(twentyNinthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'WgpuTextureSourceTextureEntry',
        'sha256:89b8cf222fe23605091e257b356350a8d4bf1de8cd89062a08a65cc99128f75a',
        'reviewed escape-free WebGPU texture-source entry',
      ],
      [
        'WgpuEffectPipeline',
        'sha256:0def27f503d792f5c38b473b5e9fbcfc235b9945fc28b8b0a2b972ab472f6d4c',
        'reviewed escape-free WebGPU effect pipeline',
      ],
      [
        'WgpuMeshPipeline',
        'sha256:5457497ed09b0fa23e64aa05dce5b60933f498139db0fc6470ba4f0e29804d8d',
        'reviewed escape-free WebGPU mesh pipeline',
      ],
      [
        'WgpuSavedPassState',
        'sha256:22df7e6d3385e1e076ae9715044784097c49ec0109050e4f7f8424f0fb7c93a1',
        'reviewed escape-free WebGPU saved pass state',
      ],
    ] as const) {
      expect(thirtiethHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    expect(thirtiethHighAccessFrontierCandidates.get('WgpuRenderOptions')).toMatchObject({
      declarationFingerprint: 'sha256:dbdde42a1a776f92206d8716e6d875cf74e8e98ac3a52cec93f84a4d5aaa7542',
      eligible: true,
      emission: { directAccesses: 0, mode: 'audit-only', pendingAccesses: 8, reflectiveSurvivors: [] },
      escapes: expect.arrayContaining([
        expect.objectContaining({ reason: 'width-sensitive' }),
        expect.objectContaining({ reason: 'dynamic-enumeration' }),
      ]),
      migration: { baselineId: null, status: 'new' },
      purpose: 'checker-discovered public declaration',
      reasons: [],
    });
    for (const [name, declarationFingerprint, purpose] of [
      [
        'GltfPunctualLight',
        'sha256:9a4b9d5d9174473533ebcc2cf171e61b59acfc5603eaae96e16d5c9e284a6034',
        'reviewed escape-free glTF punctual light',
      ],
      [
        'GltfCamera',
        'sha256:6bade5e485caee34db3848337c19201905ce4f65982b14d78750efbf48afa1ef',
        'reviewed escape-free glTF camera',
      ],
      [
        'ThreeDsCamera',
        'sha256:09f6242a4cf2fa26b7599d4f94ce760d6bf91fe693341ad46b9691cd24728253',
        'reviewed escape-free 3DS camera',
      ],
      [
        'Scene3DDocumentScene',
        'sha256:6ce66003f1c3681606bdd962b865f63465e80ac078292ae9dba05deeb7ce1be5',
        'reviewed escape-free Scene3D document scene',
      ],
      ['Skin', 'sha256:b7e8ad399e4c8c4380cafd3c1a2f3e74211782882d88f21901a89e54cd5628e8', 'reviewed escape-free skin'],
    ] as const) {
      expect(thirtyFirstHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'TextSegment',
        'sha256:9b243f874c904eab543ac8b4bf5d2d573d276fd43d61844e87ac58bb55bfba3c',
        'reviewed escape-free text segment',
      ],
      [
        'TextInputHistoryEntry',
        'sha256:a9ce5aa975796bb35e867912a36b63da2afa409d140e37ef526468868d688827',
        'reviewed escape-free text-input history entry',
      ],
      [
        'FocusManager',
        'sha256:9243635aa70272176f5cfbfa387824f2d148defb705b2d56775c35a40101d7bd',
        'reviewed escape-free focus manager',
      ],
      [
        'SelectableRichTextManager',
        'sha256:6d058addff5ee1865dc3b94841d6a732b6c5a31f6b9474f0cb5900253ceebf44',
        'reviewed escape-free selectable rich-text manager',
      ],
      [
        'TextInputManager',
        'sha256:8cc504b6ffd314ebe6b2ee4b1fbaffd18de06d27d0633a503699869b5d8a3656',
        'reviewed escape-free text-input manager',
      ],
    ] as const) {
      expect(thirtySecondHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'AnimationBlendTreeChannel',
        'sha256:d73fbec5a2c4773d9e8eb53ed511928234ed9ff9989a54401b85df4ed2c1ad56',
        'reviewed escape-free animation blend-tree channel',
      ],
      [
        'AnimationCrossfadeChannel',
        'sha256:fe06435797da8cf9bf102b8854a6814b5c53dc2c5bb25df2f0dbadd34d731f39',
        'reviewed escape-free animation crossfade channel',
      ],
      [
        'AnimationLayerStackChannel',
        'sha256:9d46d35ab194d129b0c60a82cc260ec545d9c9be36d37d06a76b937ef307f883',
        'reviewed escape-free animation layer-stack channel',
      ],
      [
        'AnimationStateMachineChannel',
        'sha256:454c30877bccdda403fac1dd002f9773048d6cb022fd88f025b11f2a6f45b950',
        'reviewed escape-free animation state-machine channel',
      ],
      [
        'AnimationStateMachineState',
        'sha256:61309ced3413df8041d6b2ae9688589d56cd8c53406af08e2d975a4c7dc40cbc',
        'reviewed escape-free animation state-machine state',
      ],
    ] as const) {
      expect(thirtyThirdHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'BlendEffect',
        'sha256:d63118c410116509a903cf1414b9561e31bee6107c718e648d79b5c96fb3fd3b',
        'reviewed escape-free blend effect',
      ],
      [
        'BlurEffect',
        'sha256:057f7b6cb433bf1bd71e9973328f74a479ab0395a4b8cf9166fc61fc32917bdf',
        'reviewed escape-free blur effect',
      ],
      [
        'FilmGrainEffect',
        'sha256:9a00b56b3964f4300679fc03b08efc716144f91285ef67e7f80fc772a723c568',
        'reviewed escape-free film-grain effect',
      ],
      [
        'GlitchEffect',
        'sha256:2ca3b14ea2ba238108237a31c7a3a2764abd2981b1ab0e441f8977b7fc5e5df2',
        'reviewed escape-free glitch effect',
      ],
      [
        'OutlineEffect',
        'sha256:e972992e03ced9fb69d2b4ba2fce5bf11410e5c020156d747ef06554c1c3cb36',
        'reviewed escape-free outline effect',
      ],
    ] as const) {
      expect(thirtyFourthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'Physics2DDebugGeometryOptions',
        'sha256:47def074a0904f9f25514d36c9de48c415a0d0363de3612860855ad5f0f9f073',
        'reviewed escape-free physics debug-geometry options',
      ],
      [
        'Physics2DGearJointOptions',
        'sha256:78dcb4caa67b151f54c1f2a426c1264d79135c2d29ddbf220e1f930bbd6fdda1',
        'reviewed escape-free physics gear-joint options',
      ],
      [
        'Physics2DMouseJointOptions',
        'sha256:97b067d24a365ba0250d47d2c37194f205a4c5afd97cf32682b63175e05064b7',
        'reviewed escape-free physics mouse-joint options',
      ],
      [
        'Physics2DPrismaticJointOptions',
        'sha256:ccf2479b5ae0df31a4a6efc5d386748dc1293079d540a6fc6914cbe8ee777b27',
        'reviewed escape-free physics prismatic-joint options',
      ],
      [
        'Physics2DWheelJointOptions',
        'sha256:9775462cd5ce4402fcc41ff2f91c58cc0fefc7a6b29602a4f44f568e829a5334',
        'reviewed escape-free physics wheel-joint options',
      ],
    ] as const) {
      expect(thirtyFifthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'GlColorLutTextureCache',
        'sha256:28022486054f5704cc934e961f951937b26459388fd4d73a20763de668fb2500',
        'reviewed escape-free WebGL color-LUT texture cache',
      ],
      [
        'GlScene3DIbl',
        'sha256:60a7d244805c8bf2b3b72e2fcf4777fe83b902d5676a58e0975baa9b8cf7d52c',
        'reviewed escape-free WebGL Scene3D IBL',
      ],
      [
        'GlShapeMeshColorScaleBiasShader',
        'sha256:df1e98bd12a8d711c970bbc0453b9fbccdcb484b40c72fbb3f426e18442333ed',
        'reviewed escape-free WebGL shape-mesh color-scale-bias shader',
      ],
      [
        'GlToonProgram',
        'sha256:246dc6c529144431c519bf28ad1b7b38a1b7d40a7d85e35ea777ffeaebb1748c',
        'reviewed escape-free WebGL toon program',
      ],
      [
        'GlWireframeUpload',
        'sha256:6aaa4136bcd431697355c53644dbe3b6636296775ee6f35ff740addf61f844ce',
        'reviewed escape-free WebGL wireframe upload',
      ],
    ] as const) {
      expect(thirtySixthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'CrtEffect',
        'sha256:5e68df6723770b9c423c2bfb2e8b4b0535c8c16e64ebadb99798468ce7acadff',
        'reviewed escape-free CRT effect',
      ],
      [
        'DirectionalBlurEffect',
        'sha256:3826059319d02a6dce524539dfa04c76d510f7c5a7cdd738f758f7d5caac4b4d',
        'reviewed escape-free directional-blur effect',
      ],
      [
        'LensFlareEffect',
        'sha256:fd7a053e9ad1fb2da43a056833df82c8be9d0574e7f6abf1be97c220b5f28e87',
        'reviewed escape-free lens-flare effect',
      ],
      [
        'RadialBlurEffect',
        'sha256:22f272013c3655070dc964707dbebbc4b5eb6699cfe0e632dba09392544d5981',
        'reviewed escape-free radial-blur effect',
      ],
      [
        'TiltShiftEffect',
        'sha256:fbcbf389afcd6233e11df0aa41d734c8fa5b4c26a8c9ed22d9e3e46a707e24a6',
        'reviewed escape-free tilt-shift effect',
      ],
    ] as const) {
      expect(thirtySeventhHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'AnisotropyPbrExtension',
        'sha256:37096ced174312eb2922c58215277db0bb82a6aaef5a6151e566048a172e830e',
        'reviewed escape-free anisotropy PBR extension',
      ],
      [
        'DepthMaterial',
        'sha256:68e7295714b2fbaa9741f254f5f12995e21e9b4a8db40c02677f0694edaf83f9',
        'reviewed escape-free depth material',
      ],
      [
        'NormalMaterial',
        'sha256:f5890f2123b567fa23eb37ae03f8a1a034edb3401d767ecf0ebe2b21c4150aeb',
        'reviewed escape-free normal material',
      ],
      [
        'VertexColorMaterial',
        'sha256:4bf6ae337857c46e758e1e6d3c41b4e825691cb9c928807201900208e1193f81',
        'reviewed escape-free vertex-color material',
      ],
      [
        'WireframeMaterial',
        'sha256:ab30087b99039af61030abaaff2f6f9edad3bd9efe3df354900c8d3b8cfc158a',
        'reviewed escape-free wireframe material',
      ],
    ] as const) {
      expect(thirtyEighthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'FlowStack',
        'sha256:3e145f4a7645c5e37bb6f4d5be12c006ea332396a6f233562d12006faa6dd9e0',
        'reviewed escape-free flow stack',
      ],
      [
        'FlowState',
        'sha256:1dcf59ee7b59c493adf889564e539b8495ed2a5e9f0b6145954c455cb28fe588',
        'reviewed escape-free flow state',
      ],
      [
        'TimelineAudioCue',
        'sha256:377abc726388df0405759cb105b7d9a4595770d0c3b4ce711608981605770862',
        'reviewed escape-free timeline audio cue',
      ],
      [
        'TimelineLabel',
        'sha256:f1bcd87631389ed349560d3d4adc78ee8835215d5e36b96236cc9169f128a773',
        'reviewed escape-free timeline label',
      ],
      [
        'TimelineSignals',
        'sha256:c87cb1c6c826c9d4a5ac66245abd3b19328174cc315ae7f9153271c2700ce41c',
        'reviewed escape-free timeline signals',
      ],
    ] as const) {
      expect(thirtyNinthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'VelocityField',
        'sha256:705d00847da60afc2542ab08050acc46b9574d8b5be35d87aab6a6f3d9bfd8cb',
        'reviewed escape-free velocity field',
      ],
      [
        'CreateExternalTextureOptions',
        'sha256:0c6e30c09f9b1aa220dd099bab1745b568ae3029b443ad4d3c91a0af35b21d56',
        'reviewed escape-free external-texture options',
      ],
      [
        'RenderQueue',
        'sha256:3ff8f98c70e258e788235d2d468ab190af55513ae4c7692f0bbf58b1b1de6803',
        'reviewed escape-free render queue',
      ],
      [
        'QuadBatchRuntime',
        'sha256:e420cd628a1440e52a58f0ec478200b7597ac27f4757124600f5951f22965216',
        'reviewed escape-free quad-batch runtime',
      ],
      [
        'Raster2DSurface',
        'sha256:8f5956e935f6aa84c5eb19bef04c2b1e4be1d2b138d4fc7bc1ba46e6b5b95e20',
        'reviewed escape-free backend-neutral raster surface',
      ],
    ] as const) {
      expect(fortiethHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'BitmapBevelOptions',
        'sha256:0a011bdbca5a41569ee8a81d5ebca8c94dc47e164f8c24aef36dbdab9b78f282',
        'reviewed escape-free bitmap bevel options',
      ],
      [
        'BitmapDisplacementMapOptions',
        'sha256:c2fd0040fbc7b51bf0203d08bdd9632541b02207997542283e86c19175cd69c8',
        'reviewed escape-free bitmap displacement-map options',
      ],
      [
        'BitmapConvolutionOptions',
        'sha256:36622be26b0d6d74ad2b9612c9d5c08e151474680298a719a6cb4f5e3099003e',
        'reviewed escape-free bitmap convolution options',
      ],
      [
        'BitmapGradientBevelOptions',
        'sha256:307bfb2ceb94a4971dc35171139a7328552f9ffa06a0d76954467b57d86f1f46',
        'reviewed escape-free bitmap gradient-bevel options',
      ],
      [
        'BitmapGradientGlowOptions',
        'sha256:5934bc8bbdd8f85c1b5ec613312ae1ec3003b2e0ea21b365a6e52226aee60329',
        'reviewed escape-free bitmap gradient-glow options',
      ],
    ] as const) {
      expect(fortyFirstHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'AttachmentSkin2D',
        'sha256:ee92865a82180e0ce674675c8bac3e1b141b827e87a26ad52b628cff1b27174c',
        'reviewed escape-free attachment skin',
      ],
      [
        'RegionAttachment2D',
        'sha256:40a66fe8322fa267e67064792d5723c3deb89468073fc92abe8cb4df5603bcbf',
        'reviewed escape-free region attachment',
      ],
      [
        'PathAttachment2D',
        'sha256:e9b6dcb1216bfc2e91a753d24eb0a7320ccca947cd062903bc3d24707bc4d426',
        'reviewed escape-free path attachment',
      ],
      [
        'PointAttachment2D',
        'sha256:8b6a11c7ae1419ecec6e1cc58e9b3fe2f0501773aef0e74d574670c48299165a',
        'reviewed escape-free point attachment',
      ],
      [
        'ClippingAttachment2D',
        'sha256:069b4df44a3486606cce30493977aebffc60f2fba30fa4e33ea784fbd06ba962',
        'reviewed escape-free clipping attachment',
      ],
    ] as const) {
      expect(fortySecondHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'MorphShapeLineEndpoint',
        'sha256:9f08ed93b7149ba994f4cc6c6ddd65acb4d6899ce85afdd0cc31c16d82ebd125',
        'reviewed escape-free morph-shape line endpoint',
      ],
      [
        'MorphShapeColorEndpoint',
        'sha256:7b64793cbbbbba919e192888fc21a8521ab2e265520986d959157929a2d9b0a3',
        'reviewed escape-free morph-shape color endpoint',
      ],
      [
        'MorphShapePathBinding',
        'sha256:0f9f71ff1557793611652434f7be0c4c1277647dc9314a7ebeb461cb0b163816',
        'reviewed escape-free morph-shape path binding',
      ],
      [
        'MorphShapeAnimationTarget',
        'sha256:fe1394427e35042ec6cc108bd2924960765e205372f08ad78f79be2edf26d287',
        'reviewed escape-free morph-shape animation target',
      ],
      [
        'SwfMorphShapePaths',
        'sha256:7eb385b918d55147dd586f7df3f0131e718f5dbed8ec4151fa4d72c8d6270c70',
        'reviewed escape-free SWF morph-shape paths',
      ],
    ] as const) {
      expect(fortyThirdHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'Physics3DWorld',
        'sha256:e5725966d9ef05f5946cb352fed09496a74c30c0931384dfe860330c0b994b4f',
        'reviewed escape-free Physics3D world',
      ],
      [
        'Physics3DMassData',
        'sha256:280e588114daf5dcd9e2597b4995772ffbf8cb4fecc34588b8f09d93669e2ca3',
        'reviewed escape-free Physics3D mass data',
      ],
      [
        'Physics3DHingeJoint',
        'sha256:7cdcbd182487a3c0fea4385828ea058a2622c2848a1e377996500b7d691bb753',
        'reviewed escape-free Physics3D hinge joint',
      ],
      [
        'Physics3DSliderJoint',
        'sha256:050a531fd480fabcd1aea7602a27f733b1e2c3ef774e92d8c8679c5810e9c6c9',
        'reviewed escape-free Physics3D slider joint',
      ],
    ] as const) {
      expect(fortyFourthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'Physics3DContactConstraint',
        'sha256:6d07842a2d670fb1682fd93b1839bfaa4fe0a59f9deb40eaf02e28f44c143c85',
        'reviewed escape-free Physics3D contact constraint',
      ],
      [
        'Physics3DContactConstraintPoint',
        'sha256:262ba078e6dc17f030e8b05484f7767f17eec8b6912054f110ba8e1c96ebc41a',
        'reviewed escape-free Physics3D contact-constraint point',
      ],
      [
        'Physics3DConeTwistJoint',
        'sha256:799f1e572fee32caea94d4bd140ed192e65896eee0d7ea6eaa43a7cc93803755',
        'reviewed escape-free Physics3D cone-twist joint',
      ],
      [
        'Physics3DGeneric6DofJoint',
        'sha256:5e4c27794d880512671571711e950187f564950a5e70b027e9a1917bc8c16f99',
        'reviewed escape-free Physics3D generic six-DOF joint',
      ],
    ] as const) {
      expect(fortyFifthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'DomRenderRegistries',
        'sha256:3b8ef9dbbfa02ffa5cbfa60a7794d052d50f559167276292a2a620425bedb3e0',
        'reviewed escape-free DOM render registries',
      ],
      [
        'RenderRegistries',
        'sha256:588c462592a24ac1b9e061518dccbccc047d97b96b263401df8da4d7e08e710f',
        'reviewed escape-free render registries',
      ],
    ] as const) {
      expect(fortySixthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, pendingAccesses] of [
      ['CanvasRenderRegistries', 'sha256:548d036e6d8839aa0630872584d45c63301c735f9804f2dc56cacec0164e56f7', 10],
      ['GlRenderRegistries', 'sha256:43740eafc1e1c310207dcce7ac38be6340b29e9a1a67fcec617ff72fef5634ea', 71],
      ['WgpuRenderRegistries', 'sha256:f5551d589160fc35e1139116253248f4c16e1ad60ac13a770de379aeceed80d9', 53],
    ] as const) {
      expect(fortySixthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: 0, mode: 'audit-only', pendingAccesses, reflectiveSurvivors: [] },
        escapes: expect.arrayContaining([expect.objectContaining({ reason: 'dynamic-enumeration' })]),
        migration: { baselineId: null, status: 'new' },
        purpose: 'checker-discovered public declaration',
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'CffIndex',
        'sha256:5ce6595f77e48ec51736d037cd6c477e81146a82bc72dfb055963b7abde227bd',
        'reviewed escape-free CFF index',
      ],
      [
        'SfntTableDirectory',
        'sha256:9c0a9c97e23fa85d9ef93e4bb92eafc52268728257918105ad7b2bef22c8528c',
        'reviewed escape-free SFNT table directory',
      ],
      [
        'SfntTableRange',
        'sha256:1bdecf5ebe419641dbe4f01ba3a31d542cbefad13bccc3e91e726fc63246e2af',
        'reviewed escape-free SFNT table range',
      ],
      [
        'Woff2GlyfStreams',
        'sha256:a464d3b4df6257129e226fa1fadfafb5d4a0c32b02aac84a101f84c5fc5ab615',
        'reviewed escape-free WOFF2 glyf streams',
      ],
      [
        'Woff2TableEntry',
        'sha256:24ae797b8608d8871a3ebd378c3101ddb9f4b4bc1859b2b282e50ae9f4b8c1f8',
        'reviewed escape-free WOFF2 table entry',
      ],
    ] as const) {
      expect(fortySeventhHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'CatalogEntry',
        'sha256:61e5a2afeb5fc4305782f3ec26802e743184324e02741a4f319c17f6fa1a4f71',
        'reviewed escape-free scene coverage catalog entry',
      ],
      [
        'CatalogRegistration',
        'sha256:359fc1ad0b03454fe4b30b9b03e6c0d3168dc09661565639c4b852f15805603b',
        'reviewed escape-free scene coverage catalog registration',
      ],
      [
        'RegistryCatalog',
        'sha256:892e19dcdb6b8738da74754dfde8302f697b0f2a80e50e7ae89f82ca40b46abf',
        'reviewed escape-free registry catalog',
      ],
      [
        'RegistryCatalogEntry',
        'sha256:c07292691d0d6993f70b9fa7dc7d3a6492cf5cd5c205c2aaff99343d7d1aec05',
        'reviewed escape-free registry catalog entry',
      ],
      [
        'Requirement',
        'sha256:6c0abbca38fb4e58ed608773c6e6d182b4d2c2b128b40c7466834f2cf5adcb74',
        'reviewed escape-free registry requirement',
      ],
    ] as const) {
      expect(fortyEighthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'Physics3DGeneric6DofJointOptions',
        'sha256:1a3a86ea0b1f69e258717f4914660a834f0c7be7d67f4f95d5258fb93a7f3344',
        'reviewed escape-free Physics3D generic six-DOF joint options',
      ],
      [
        'Physics3DJointFrameOptions',
        'sha256:edac07364f90df64b39c2d1ac50a306e9877d7e8c4ab1c4d6c02dc7e80cb0395',
        'reviewed escape-free Physics3D joint-frame options',
      ],
      [
        'Physics3DJointOptions',
        'sha256:46ad4888a7ca52b21b8591d90409b267d6433313e236c5bf988ae892dd07b4ff',
        'reviewed escape-free Physics3D joint options',
      ],
      [
        'Physics3DSequentialImpulseConfig',
        'sha256:0de6797dfe9c8f540e889ae0af3a97e5cd7aff54d43a7d4cc885954bac19f8df',
        'reviewed escape-free Physics3D sequential-impulse config',
      ],
    ] as const) {
      expect(fortyNinthHighAccessFrontierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'Physics3DAbiBodyBuffer',
        'sha256:12a0644da563b2ee03d54d165a4f82450dc0c2c3f0b91efcf202796d89a86966',
        'reviewed escape-free Physics3D ABI body buffer',
      ],
      [
        'Physics3DAbiCommandBuffer',
        'sha256:344bf545e06f4e1231e04047048a038aa36ce6c322e2dcb7a7952c66f10b1476',
        'reviewed escape-free Physics3D ABI command buffer',
      ],
      [
        'Physics3DAbiContactBuffer',
        'sha256:8c8cfb7227ae63c538fd07f3e9812decc564d7e6a15be244c2e15578ebd43c4e',
        'reviewed escape-free Physics3D ABI contact buffer',
      ],
      [
        'Physics3DAbiContactHooks',
        'sha256:39fa096a0116e610a50835a085a2034e132dca54573c19203348e8b450e5cdaa',
        'reviewed escape-free Physics3D ABI contact hooks',
      ],
      [
        'Physics3DAbiExecutionResult',
        'sha256:e232874df593acd78d53e3976d1775517dc020564d8ee4cb42d2c27e4b4c4c36',
        'reviewed escape-free Physics3D ABI execution result',
      ],
      [
        'Physics3DAbiJointBuffer',
        'sha256:fd9990b1ea1d2d95da9a48ffe73617a18a78364b58f571f88d9e86bbaa225d61',
        'reviewed escape-free Physics3D ABI joint buffer',
      ],
      [
        'Physics3DAbiQueryBuffer',
        'sha256:821df23149ae8b3765a926b09e971b64583f169a123723d6d18539453b27ec00',
        'reviewed escape-free Physics3D ABI query buffer',
      ],
      [
        'Physics3DRotationalCcdEnvelope',
        'sha256:187b301955811c3de7115138e2c44a0d076c84a92749130d9bb5050b498bb95d',
        'reviewed escape-free Physics3D rotational CCD envelope',
      ],
    ] as const) {
      expect(physics3DAbiDirectCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'TiledTilesetTile',
        'sha256:f20a5988a4c187a5ab14cafc6d9e22031b7dd254f8a130eb362beafdafe8fe92',
        'reviewed escape-free Tiled tileset tile',
      ],
      [
        'TiledTilesetRef',
        'sha256:240a78b98b30601002a1f3bfa62be8394bd11f25ff22d798f7c1ac216d01ba3b',
        'reviewed escape-free Tiled tileset reference',
      ],
      [
        'TiledProperty',
        'sha256:e8f81c64bbdac1c2bfe70e245844a7449d62dfc1978d2a4d1340dd6f30e16109',
        'reviewed escape-free Tiled property',
      ],
      [
        'TiledTilesetTileFrame',
        'sha256:d03a4ec13a0db461ca7538d2c409c6030e58dc2cc2c5929fe64061d173a5d9a8',
        'reviewed escape-free Tiled tileset tile frame',
      ],
      [
        'TiledGid',
        'sha256:24fed34412a32b4a4ec7eb62f8605d0827907769a2c1dc6e641efe2b97808e4e',
        'reviewed escape-free Tiled gid',
      ],
    ] as const) {
      expect(tilemapTiledCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'CanvasRenderEffectContext',
        'sha256:56f73a3c7c106c2cfc9affd8f47d517ff6685a4a5bad8083b9d9fe76d3fcf217',
        'reviewed escape-free Canvas render-effect context',
      ],
      [
        'GlRenderEffectContext',
        'sha256:fdc15a042a1a80053691e6e5e9fdcec40ccc068adde5e22e51ae98764f1520a6',
        'reviewed escape-free WebGL render-effect context',
      ],
      [
        'WgpuRenderEffectContext',
        'sha256:fd9b6f3f63bcd3f4391e10fb091fcb7444196085bcefc1d301287787dfe3a3e2',
        'reviewed escape-free WebGPU render-effect context',
      ],
      [
        'GlScene3DRuntime',
        'sha256:22fd14cbeff906498e6edbd2d1b4bacab27556b1e3e49e1216933d2785fec45d',
        'reviewed escape-free WebGL scene runtime',
      ],
      [
        'WgpuScene3DRuntime',
        'sha256:d73b5ce1b57506125a02a6af3df57a93e786f126e2f9cc4a43a4ca12cc6647fe',
        'reviewed escape-free WebGPU scene runtime',
      ],
    ] as const) {
      expect(renderContextRuntimeCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'QuadBatchData',
        'sha256:c5ddb66c3aa664642f434b204e28cd767990fb68dccd61d95ddce1217b271f85',
        'reviewed escape-free quad batch data',
      ],
      [
        'CanvasShapeDrawState',
        'sha256:02c299290855d11a256afa1f89ac05ea04f2bd5c9cfbd95f9b8f313c8291d5dc',
        'reviewed escape-free Canvas shape draw state',
      ],
      [
        'Scene3DDocument',
        'sha256:8917d122db3e102ae4d684a953b0aace8b57597d4e4b6b10c66a3af8f3b19094',
        'reviewed escape-free Scene3D document',
      ],
      [
        'OrbitCameraController',
        'sha256:b5f317c10fcee34f5c8ab37de7d06314754e9bcc0fb48124146a562f9117cb5f',
        'reviewed escape-free orbit camera controller',
      ],
      [
        'RiveCoreObject',
        'sha256:9252f9146b93933f51443521632f05794eed7f39a6e8059a7ae12d86167e16ac',
        'reviewed escape-free Rive core object',
      ],
    ] as const) {
      expect(nextHotCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'AnimationTrack',
        'sha256:a3e8b0a6c23713f4d8e46cae1937cd775b8337ee098c6b36ecb5a906b35a8a44',
        'reviewed escape-free animation track',
      ],
      [
        'Tween',
        'sha256:6903b4fa8a509237f7ff329abd18f797ff86f22fe5115266aa530240bdad1859',
        'reviewed escape-free tween state',
      ],
      [
        'AnimationChannel',
        'sha256:bdb2b9a80b19b26d3da6a39bd5641971941622f788716891ce6a299c97dd325b',
        'reviewed escape-free animation channel',
      ],
      [
        'AnimationPlayer',
        'sha256:7737db1e82e8f1bf7d07b4ebd21bd0f18946927b22ba3b0216c93a3d85241c6d',
        'reviewed escape-free animation player',
      ],
      [
        'Timeline',
        'sha256:aaf49d1e409fd3c60824a648cf8edd8e53ad11411923a0b5ab74c34be4da89a6',
        'reviewed escape-free timeline state',
      ],
    ] as const) {
      expect(animationTimelineCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'RiveArtboardGraph',
        'sha256:44aafe6b8ad37be7a692fd5ee540a56e2b48628f12925791a38e546b9f3e5987',
        'reviewed escape-free Rive artboard graph',
      ],
      [
        'RiveProperty',
        'sha256:33b8ffeb2ffb3539affbe33b3665d4d8946af0486ae79f57a1ac3062d75617c5',
        'reviewed escape-free Rive property',
      ],
      [
        'RivePathRecord',
        'sha256:c9e4515a60d200d26308fa2a4d98c62ed83db38350d9545f6ef795ad4dd0edc7',
        'reviewed escape-free Rive path record',
      ],
      [
        'RiveFileAsset',
        'sha256:e705df1c2ba082092310edcd7d71a4484273ee3cfd2d09ba1a644921b06566be',
        'reviewed escape-free Rive file asset',
      ],
      [
        'RiveDocumentImportResult',
        'sha256:c4246370c176d4205f5e869630515aeaf9affbf5d1a594c50a0c8d82e0d371d0',
        'reviewed escape-free Rive document import result',
      ],
    ] as const) {
      expect(riveDocumentCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'TextInputState',
        'sha256:b8c71131b48fb802bf08fc22ab717a50b460ecb96f29c0d9615fb6319184d31c',
        'reviewed escape-free text-input state',
      ],
      [
        'KeyboardEventData',
        'sha256:31ee934c70dc671de1fcf994c61ced46730f1b001bc666d65bcd71240f0101a3',
        'reviewed escape-free keyboard event data',
      ],
      [
        'InputManager',
        'sha256:acb1ec5a0825eae2955aba234b8019647bfebc6c07a57b04c1ffb62af7cc98bd',
        'reviewed escape-free input manager',
      ],
      [
        'InputPointerData',
        'sha256:68dfff739dbd1da432c2948738490cd16465a4b8165214a711165ef6c7f52acc',
        'reviewed escape-free input pointer data',
      ],
      [
        'InputKeyboardData',
        'sha256:771b0863ccf5de23a04937149a041c06baa00c7f1fdc857df31c9928a0953f0d',
        'reviewed escape-free input keyboard data',
      ],
    ] as const) {
      expect(inputStateCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'StandardPbrMaterialProperties',
        'sha256:44fad9b5706a5df98cf0027a1603a725ef02feb70f58928c41700c9d56bd5de4',
        'reviewed escape-free standard PBR material properties',
      ],
      [
        'ShadedMaterial',
        'sha256:0cc5d013eb9ecafdeb4d08c1a88a6db2734c337e645bf5418e9d7f11c3d797ea',
        'reviewed escape-free shaded material',
      ],
      [
        'SpecularGlossinessPbrMaterial',
        'sha256:a4bf57d5ee691bc8b9bbd14d7522a743ffab830d31566f22e4deef7b6d723d58',
        'reviewed escape-free specular-glossiness PBR material',
      ],
      [
        'PhongMaterial',
        'sha256:0510aa935e4804e99b66c1a10f6e1279ab32589493498ca1dbebaf24176c331f',
        'reviewed escape-free Phong material',
      ],
      [
        'BlinnPhongMaterial',
        'sha256:fc92192bbae7a57eeb08054226aa4afeb15de7cf2c60739109a4b5803a61bb20',
        'reviewed escape-free Blinn-Phong material',
      ],
    ] as const) {
      expect(materialCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'RenderStateRuntime',
        'sha256:1c285541caead8d5b1b57d898fffaf5eb240a01f1ca74a91bb910133f58947eb',
        'reviewed escape-free render-state runtime',
      ],
      [
        'RenderProxy',
        'sha256:f0d40c25ffe0591e6ea74f08dd22ec61859b14d72b08dbf54d2b642fd68e5cb9',
        'reviewed escape-free render proxy',
      ],
      [
        'DomRenderStateRuntime',
        'sha256:0a8d83da2d0248649e6b7200c1cef7462b9438b5ae01577f4efa27d8fb957109',
        'reviewed escape-free DOM render-state runtime',
      ],
      [
        'ResolvedRenderTargetDescriptor',
        'sha256:f1ab7ec236b568f33e9b66eec91b29426d97375591f5060c6a649f9439d5d083',
        'reviewed escape-free resolved render-target descriptor',
      ],
      [
        'Scene3DRenderProxy',
        'sha256:23b508e780cb7961f22f26d996610340b3542df2d5804c493ad65292e48a3e68',
        'reviewed escape-free Scene3D render proxy',
      ],
    ] as const) {
      expect(renderRuntimeCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'Velocity2D',
        'sha256:9857efd596ffe6f3cd132688ed2264e350ad971fb56bbc6ab0c21e04bf59a1f8',
        'reviewed escape-free 2D velocity',
      ],
      [
        'CollisionTimeOfImpact2D',
        'sha256:c0ed0a556d84d92379c5ceea6f10db4b92255b6633ea4e34a9d102483f40da61',
        'reviewed escape-free 2D collision time of impact after dimension-explicit upstream rename',
      ],
      [
        'Physics2DMassData',
        'sha256:4db498c8ac68087d55e1489e845ae6c93c321ef8e63c84e2848d03acd2aca853',
        'reviewed escape-free physics mass data',
      ],
      [
        'CollisionManifold2D',
        'sha256:d6aeed28d689880b86690274be5bf1bbae4e6925518f467b381c0a3fb848ba57',
        'reviewed escape-free 2D collision manifold after dimension-explicit upstream rename',
      ],
      [
        'CollisionContactManifold2D',
        'sha256:70433e9e6573de517e1e3ff1ea8550a8fbcd0d69578f822f81a548ac128a2cc3',
        'reviewed escape-free 2D collision contact manifold after dimension-explicit upstream rename',
      ],
    ] as const) {
      expect(collisionPhysicsCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'Physics2DPrismaticJoint',
        'sha256:2bb0058f4ee30df35910f715952ba564655e18a8f91d5e981212a644478e74e5',
        'reviewed escape-free physics prismatic joint',
      ],
      [
        'Physics2DPulleyJoint',
        'sha256:a169f1f5512b2bf35e7587690e6ef634681878d267026c2ab03a3dafd517ed12',
        'reviewed escape-free physics pulley joint',
      ],
      [
        'Physics2DGearJoint',
        'sha256:7a2a5c30028a7ebe59854b90338612f99a484da9d05bd71eaaa7de448bbb2b7c',
        'reviewed escape-free physics gear joint',
      ],
      [
        'Physics2DWheelJoint',
        'sha256:70b93b46c79fe10b1370af8bf3c98f46e51df7082eb8bc53ed35ae7680de8fd4',
        'reviewed escape-free physics wheel joint',
      ],
      [
        'Physics2DRevoluteJoint',
        'sha256:2e891860961c40694e0204cbd987d650d4f8762a6d3d6ef3bd340e98b44c1af2',
        'reviewed escape-free physics revolute joint',
      ],
    ] as const) {
      expect(physicsJointCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'Skeleton2D',
        'sha256:4c5c7df2276c0ba36c720adc9c2f10a21508a54448a1f67dcb2587581d3ca5c2',
        'reviewed escape-free 2D skeleton',
      ],
      [
        'Skeleton3D',
        'sha256:f3df109087ade0de26157b3ee09b2f37ab1e92d4685ace63c1b088c3809b829c',
        'reviewed escape-free 3D skeleton',
      ],
      [
        'MeshSkinBindPose',
        'sha256:77bf0f172a896ccce04fb27b31e7fdedec6d24293ad0864f737721597d4d0aa7',
        'reviewed escape-free mesh skin bind pose',
      ],
      [
        'SkinAttachment2D',
        'sha256:5b923770aadf08c459c517186e28a6ca1a7ffcabd35a29d8d97ca742aa95996c',
        'reviewed escape-free 2D skin attachment',
      ],
      [
        'Skeleton2DPathConstraint',
        'sha256:3831dc7503c830297819df165667142b18595623fb5320f616539f5dbb48b1bd',
        'reviewed escape-free 2D skeleton path constraint',
      ],
    ] as const) {
      expect(skeletonSkinCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'AnimationStateMachine',
        'sha256:fe1c6f9a7092aaf16cd71f41a141a74e9ef235eec04fa6afa7ea048439b63fde',
        'reviewed escape-free animation state machine',
      ],
      [
        'StatechartInstance',
        'sha256:99282de81a9db1f080a9e203455b3ae137163ab87e2b608b70d3defc5949fa86',
        'reviewed escape-free statechart instance',
      ],
      [
        'StatechartTransition',
        'sha256:ee1a1c67324b9c8fb812541fc64da6edb13d01144a9bfd7289e47a151cefd755',
        'reviewed escape-free statechart transition',
      ],
      [
        'AnimationCrossfade',
        'sha256:592fba8ca0e3d4c3037c94796a1c24af517eaa4337ffd428ae340ca7f8c0bf29',
        'reviewed escape-free animation crossfade',
      ],
      [
        'Statechart',
        'sha256:cfe564914537b7c6b1f9b16a293e7a1b8c28d3d743a920f8054b8d1304fa39b7',
        'reviewed escape-free statechart',
      ],
    ] as const) {
      expect(stateMachineCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'TextureContainer',
        'sha256:8ec3670c4d9138ddabd2f31f44282b7a63234e7b28abfeaaa79fb46b60386ac4',
        'reviewed escape-free texture container',
      ],
      [
        'TextureContainerLevel',
        'sha256:22098c0143137cb3701785c749ec0e7c11469f7bd572f09d9e5d884bb1662a2a',
        'reviewed escape-free texture container level',
      ],
      [
        'RenderTexture',
        'sha256:0bd021297d7eda8245da83f5d68c7bc9458594d019d2b8fe0106ff9cc338fcb0',
        'reviewed escape-free render texture',
      ],
      [
        'GlRenderTextureEntry',
        'sha256:a7fa638af0c9e6325e55fe5a74a9b9a6af64eb5bcba6dd5adbd45c089c1d8836',
        'reviewed escape-free WebGL render-texture entry',
      ],
      [
        'WgpuRenderTextureEntry',
        'sha256:a5243909363d6d37ff704867c3df7bbceae877b0eac612d58b88af423e746572',
        'reviewed escape-free WebGPU render-texture entry',
      ],
    ] as const) {
      expect(textureContainerCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'Scene3DHit',
        'sha256:1f1a4f489fe6eccd17a7e7fa5d1f588954faea0ba5f647040ad72640141a377c',
        'reviewed escape-free Scene3D hit',
      ],
      [
        'CollisionRaycastHit2D',
        'sha256:7e697ecfffc8e5104e3e0bc9d2257c08f1f4b162258e53df6c4201f24ee96223',
        'reviewed escape-free 2D collision raycast hit after dimension-explicit upstream rename',
      ],
      [
        'Physics2DRayHit',
        'sha256:9094ab4baa041a3973eb2471908827999044b59892109431e6ce46c93436a483',
        'reviewed escape-free physics ray hit',
      ],
      [
        'VelocitySample',
        'sha256:735f8f6b33ae4a5c730243d8695d7b81baf6bb3777af4dd6effa7492f291b1b1',
        'reviewed escape-free velocity sample',
      ],
      [
        'CollisionContactPoint2D',
        'sha256:49d86e4cbb8bd06a2c29ad03a6c6f45088a9596d1f200bb9bb55f07c6842ee10',
        'reviewed escape-free 2D collision contact point after dimension-explicit upstream rename',
      ],
    ] as const) {
      expect(hitAndContactCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'RichTextRuntime',
        'sha256:8366b22af6581d9b3d860205d8d5245e7bb40398342313332aa3c7da2e420aa1',
        'reviewed escape-free rich-text runtime',
      ],
      [
        'TextLabelData',
        'sha256:d94505d93827743797a2c6724668ebc639ebab71ea755df4bdc4fee0ae7971e5',
        'reviewed escape-free text-label data',
      ],
      [
        'BitmapTextPage',
        'sha256:d2115dbabb239acfc6288812800f14051a58f3141d2cff821ddea724af316ba8',
        'reviewed escape-free bitmap-text page',
      ],
      [
        'TextLabel',
        'sha256:f0658231700532c1d5a1d52e203c8f41115d1e60669fa2fd9a98bad1aacb4416',
        'reviewed escape-free text label',
      ],
      [
        'ShapedRun',
        'sha256:8b0fb4643dfec361ac4d51caaaef5867c9e05efc2ef364fddcf328380fc07ac5',
        'reviewed escape-free shaped run',
      ],
    ] as const) {
      expect(textRuntimeCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'Shape',
        'sha256:2b31b5b9c65d277eeeeb327a2e2fcb4452dfbc7cb3117508c5bafbdd7d741f34',
        'reviewed escape-free shape',
      ],
      [
        'Scale9Shape',
        'sha256:c4d9690d18b21e3fb00e7e50dfe7d187fcf5b4135c164263b85824d18571e746',
        'reviewed escape-free scale-9 shape',
      ],
      [
        'ShapeData',
        'sha256:c3677e835bf0844d2df50b06f28145cdeebf386b4c0f584f8296158a84558aa4',
        'reviewed escape-free shape data',
      ],
      [
        'MorphShape',
        'sha256:4d520958150bb3f2e2c1beebf07d580ca947c836dca809a68b34ea205143529c',
        'reviewed escape-free morph shape',
      ],
      [
        'MorphShapeData',
        'sha256:3c3ad2fcb2496c19ddf40cd7c5c6c20d5ddde69456be127c40066abd544b30e8',
        'reviewed escape-free morph-shape data',
      ],
    ] as const) {
      expect(shapeDataCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'GlMeshProgram',
        'sha256:a10acf0108d1714db25e5cd6fb3fd0b81964716afd987ef044dd1fcd2333e459',
        'reviewed escape-free WebGL mesh program',
      ],
      [
        'GlClassicProgram',
        'sha256:b20947fd9184317c7f029c89d578561437626fa7ec03965c083784006319e1ec',
        'reviewed escape-free WebGL classic program',
      ],
      [
        'GlMeshUpload',
        'sha256:ea701c770e76279c2c1ed247f4e08cca4953589f33791d7e9964c4acbb38c508',
        'reviewed escape-free WebGL mesh upload',
      ],
      [
        'GlParticleShader',
        'sha256:92ef9e960d48ccadf9d840f3dc2863ee3f64c2089ea081effa5c2ecaa9d1a079',
        'reviewed escape-free WebGL particle shader',
      ],
      [
        'GlPbrProgram',
        'sha256:6abe913b84fc928aa0aa4bbda552125819c350c09026b795363905f3f0410759',
        'reviewed escape-free WebGL PBR program',
      ],
    ] as const) {
      expect(glProgramCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'BevelEffect',
        'sha256:58ebca8ad2f0cc535020211940a5e2321e01db30093d6a5988a44efb977cdd04',
        'reviewed escape-free bevel effect',
      ],
      [
        'DropShadowEffect',
        'sha256:6848511a980718c7082335e4839bb93de5a772a3a8714f0f1a720796bc2ca393',
        'reviewed escape-free drop-shadow effect',
      ],
      [
        'GradientBevelEffect',
        'sha256:76e90209baf6a5c6e39df6d8af199bc57e81f9812b2b9e6407b949000f3c38ab',
        'reviewed escape-free gradient-bevel effect',
      ],
      [
        'InnerShadowEffect',
        'sha256:7183cdb448684c12099a20b237230f777d4b82a482de25e13c022cf188053e0b',
        'reviewed escape-free inner-shadow effect',
      ],
      [
        'OuterGlowEffect',
        'sha256:ec80a0d48ff955f3df6a19bad5643e1e576384f33c4c3ba299bd5e14d2253eff',
        'reviewed escape-free outer-glow effect',
      ],
    ] as const) {
      expect(directionalEffectCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'GlScissorRect',
        'sha256:c5eed51656152d130c5bd39967bda2fdec09e68c7666b1789992993ec2ac9b57',
        'reviewed escape-free WebGL scissor rectangle',
      ],
      [
        'WgpuScissorRect',
        'sha256:34dfe22efbf1d2f4e16ac9a93fc703b8a54032d9ea689c75c5e61549dc76a3c9',
        'reviewed escape-free WebGPU scissor rectangle',
      ],
      [
        'CanvasRenderStateRuntime',
        'sha256:49829034e818c85135b2db072891f05b640940dd5d6514596579035b22109f96',
        'reviewed escape-free Canvas render-state runtime',
      ],
      [
        'GlRenderEffectPipeline',
        'sha256:ea1b2223d50df5b640545106804895714d12cb99a7838ab014ed2e3816d701a9',
        'reviewed escape-free WebGL render-effect pipeline',
      ],
      [
        'WgpuRenderEffectPipeline',
        'sha256:a7039648e61c44e19af4213680f60efe61ad6452ffc0b16c420927d0116c0349',
        'reviewed escape-free WebGPU render-effect pipeline',
      ],
    ] as const) {
      expect(backendStatePipelineCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'VertexDisplaceModifier',
        'sha256:6e37b62b50d5b48500aae731c8675045a8e2096273488315f353d68df10c6e8c',
        'reviewed escape-free vertex-displacement modifier',
      ],
      [
        'AnimatedNormalModifier',
        'sha256:ffe9e013055090ced18c33db3dc23624189ee7c37ad89167e5ab4878f51bab9c',
        'reviewed escape-free animated-normal modifier',
      ],
      [
        'EmissiveModifier',
        'sha256:1a8dbcef5fd253b0791b984f6f9941f1d377d618e6cffc3d199824faebde91f9',
        'reviewed escape-free emissive modifier',
      ],
      [
        'FogModifier',
        'sha256:0ddef0017cb9786dae56bccef54787182c9ff0a31489f925f8ac31bcf61731a4',
        'reviewed escape-free fog modifier',
      ],
      [
        'DissolveModifier',
        'sha256:b4447f68b4d80c5a7fc46ba4dfaedef76ea959785551545cb6cb49842f894138',
        'reviewed escape-free dissolve modifier',
      ],
    ] as const) {
      expect(shadingModifierCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'Physics2DWorld',
        'sha256:55ee81118f0e45a43a3c48b30232417b99732ab1105927547fb55f44cdfe6c00',
        'reviewed escape-free physics world',
      ],
      [
        'Physics2DContact',
        'sha256:3a89f0bc11ff1e68096dbb0499ae192d3abb1cde4962391c47b614b9bc6d616f',
        'reviewed escape-free physics contact',
      ],
      [
        'Physics2DSolverConfig',
        'sha256:29644de2ca268e7003a01a34866533f5279d4bc6da62b2de3f2f702b1a5eaaab',
        'reviewed escape-free physics solver config',
      ],
      [
        'Physics2DCollider',
        'sha256:c4157b990247a1cf3e358e8ddae5bef9ee4b2d0acebc1f3630e6e3594369951c',
        'reviewed escape-free physics collider',
      ],
      [
        'ClipRegion',
        'sha256:f73b90fe6168b429bc413bda84ebe794b96c7345e5da4ab65264c4241d9995b2',
        'reviewed escape-free clip region',
      ],
    ] as const) {
      expect(physicsAndClipCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    for (const [name, declarationFingerprint, purpose] of [
      [
        'RichText',
        'sha256:ede1beea3240687757ee8455992b246d3497476a47de43d9b8e5d02d8b73abe7',
        'reviewed escape-free rich text',
      ],
      [
        'RichTextContent',
        'sha256:048d186739d8bfe34b14f636cd57fb89116b401bab1347c3742749f04b2838be',
        'reviewed escape-free rich-text content',
      ],
      [
        'RichTextData',
        'sha256:fa82e08e1863fcc75e3ed9619dc8585f19565703bc84971444398c1df93031eb',
        'reviewed escape-free rich-text data',
      ],
      [
        'TextLayoutGroup',
        'sha256:25a70f58982f05188d38a15abf985c669e653dddf4bebfad31755210bff86a5b',
        'reviewed escape-free text-layout group',
      ],
      [
        'TextLayoutResult',
        'sha256:0775b68e5d326626f79c05fb51f2b81d734453706da315289b1c8772c0062d88',
        'reviewed escape-free text-layout result',
      ],
    ] as const) {
      expect(textStructCandidates.get(name)).toMatchObject({
        declarationFingerprint,
        eligible: true,
        emission: { directAccesses: expect.any(Number), mode: 'direct', pendingAccesses: 0, reflectiveSurvivors: [] },
        escapes: [],
        migration: { baselineId: null, status: 'new' },
        purpose,
        reasons: [],
      });
    }
    const reviewedDirectCandidates = report.candidates.filter((candidate) =>
      candidate.purpose.startsWith('reviewed escape-free'),
    );
    expect(reviewedDirectCandidates).toHaveLength(381);
    expect(
      reviewedDirectCandidates.every(
        (candidate) =>
          candidate.eligible &&
          candidate.emission.mode === 'direct' &&
          candidate.emission.pendingAccesses === 0 &&
          candidate.emission.reflectiveSurvivors.length === 0,
      ),
    ).toBe(true);
    expect(reviewedDirectCandidates.reduce((total, candidate) => total + candidate.emission.directAccesses, 0)).toBe(
      13_928,
    );

    // Merged implementation modules invalidate whole-file receiver-name scans:
    // an unrelated source in the same package may legitimately use a dynamic
    // `source`, `target`, or `state`. Keep representative emitted-code
    // checks scoped to the declaration range that owns the reviewed schema.
    const bitmapModule = readFileSync('generated/flight/_Bitmap.hx', 'utf8');
    const bitmapTransform = generatedSourceRange(
      bitmapModule,
      '  public static function transformBitmap(',
      '  public static function copyBitmapAlpha(',
    );
    expect(bitmapTransform).not.toMatch(/_Runtime\.field\((?:dest|source),/u);

    const renderGlModule = readFileSync('generated/flight/_RenderGl.hx', 'utf8');
    const glRenderState = generatedSourceRange(
      renderGlModule,
      '  public static function createGlRenderState(',
      '  private static function createGlRenderStateRuntime(',
    );
    expect(glRenderState).toContain(
      '(runtime.currentFramebuffer = cast (null : Null<flight._internal.dom.WebGLFramebuffer>));',
    );
    expect(glRenderState).not.toMatch(/_Runtime\.field\((?:runtime|sourceRuntime|targetRuntime),/u);

    const renderWgpuModule = readFileSync('generated/flight/_RenderWgpu.hx', 'utf8');
    const wgpuRenderState = generatedSourceRange(
      renderWgpuModule,
      '  public static function initializeWgpuDeviceRenderState__wgpuRenderState(',
      '  public static function destroyWgpuRenderState(',
    );
    expect(wgpuRenderState).toContain('((cast runtime : WgpuRenderStateRuntime).uniformBuffer = uniformBuffer);');
    expect(wgpuRenderState).not.toMatch(/_Runtime\.field\((?:runtime|sourceRuntime|targetRuntime),/u);

    const scene2DFormats = readFileSync('generated/flight/_Scene2DFormats.hx', 'utf8');
    for (const riveCore of [
      generatedSourceRange(
        scene2DFormats,
        '  public static function applyAnimationClipToRiveDocument(',
        '  public static function createRiveFileAssets(',
      ),
      generatedSourceRange(
        scene2DFormats,
        '  public static function createRiveObjectGraph(',
        '  public static function createRiveArtboardImport__riveScene2D(',
      ),
      generatedSourceRange(
        scene2DFormats,
        '  public static function appendRiveShapePaint(',
        '  public static function createRivePath(',
      ),
    ]) {
      expect(riveCore).not.toMatch(/_Runtime\.field\((?:keyframe|object|source),/u);
    }

    const animationModule = readFileSync('generated/flight/_Animation.hx', 'utf8');
    const animationTrack = generatedSourceRange(animationModule, '  public static function cloneAnimationTrack(');
    expect(animationTrack).not.toMatch(/_Runtime\.field\((?:source|track),/u);
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
  }, 300_000);

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
      haxePackage: 'flight.types',
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
      haxePackage: 'flight.types',
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
    expect(output).toContain('typedef GenericOptions<Type> = flight._internal._Partial<Type>;');
    expect(output).toContain(
      'typedef OpenOptions = flight._internal._Partial<flight._internal._Record<String, Float>>;',
    );
    expect(output).toContain('typedef StandardOptions = flight._internal._Partial<Date>;');
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
      haxePackage: 'flight.types',
      imports: [],
      name: 'Options',
      packageName: '@flighthq/types',
    });

    expect(result.lowered.diagnostics).toEqual([]);
    expect(output).toContain('typedef ShadowedOptions = Partial<Options>;');
    expect(output).not.toContain('typedef ShadowedOptions = {');
  });

  it('materializes the reviewed production mapped aliases without erasing named field types', () => {
    expect(readFileSync('generated/flight/types/ViewportLike.hx', 'utf8')).toContain(
      'typedef ViewportLike = { @:optional var devicePixelRatio:Null<Float>; @:optional var height:Null<Float>; @:optional var width:Null<Float>; @:optional var x:Null<Float>; @:optional var y:Null<Float>; @:optional var __symbol__EntityRuntime:Null<EntityRuntime>; };',
    );
    expect(readFileSync('generated/flight/types/ApplicationRenderViewTargetOptions.hx', 'utf8')).toContain(
      'typedef ApplicationRenderViewTargetOptions = { @:optional var format:Null<RenderTargetFormat>; @:optional var colorAttachments:Null<Float>; @:optional var colorFormats:Null<Array<RenderTargetFormat>>;',
    );
    expect(readFileSync('generated/flight/types/FocusNavigationInput.hx', 'utf8')).toContain(
      'typedef FocusNavigationInput = { var onKeyDown:Signal<InputKeyboardData->Void>; };',
    );
    expect(readFileSync('generated/flight/types/InteractionInputSource.hx', 'utf8')).toContain(
      'typedef InteractionInputSource = { var onKeyDown:Signal<InputKeyboardData->Void>; var onKeyUp:Signal<InputKeyboardData->Void>;',
    );
    expect(readFileSync('generated/flight/_Physics2D.hx', 'utf8')).toContain(
      'typedef Physics2DJointBase__jointFactories = { var bodyA:Float; var bodyB:Float;',
    );
    expect(readFileSync('generated/flight/types/EntityWithoutRuntime.hx', 'utf8')).toContain(
      'typedef EntityWithoutRuntime<Type> = flight._internal._Omit<Type, Dynamic>;',
    );
    expect(readFileSync('generated/flight/types/TextureLike.hx', 'utf8')).toContain(
      'typedef TextureLike = TextureLikeFrom__Texture<Texture>;',
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

function generatedSourceRange(module: string, startMarker: string, endMarker?: string): string {
  const start = module.indexOf(startMarker);
  if (start < 0) throw new Error(`Missing generated source-range start marker: ${startMarker}`);
  const end = endMarker === undefined ? module.length : module.indexOf(endMarker, start + startMarker.length);
  if (end < 0) throw new Error(`Missing generated source-range end marker: ${endMarker}`);
  return module.slice(start, end);
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
