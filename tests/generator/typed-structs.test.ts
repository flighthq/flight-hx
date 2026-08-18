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
      newAuditOnly: 1_546,
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
    expect(discovery.candidates.filter((candidate) => candidate.emission === 'direct')).toHaveLength(460);
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
    expect(newlyDiscovered.filter((candidate) => candidate.emission === 'audit-only')).toHaveLength(1_546);
    const newDirect = newlyDiscovered.filter((candidate) => candidate.emission === 'direct');
    expect(newDirect).toHaveLength(58);
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
      auditOnlySchemas: 1_546,
      bindableAccesses: 30_666,
      candidates: 2_006,
      directAccesses: 19_061,
      directSchemas: 458,
      eligible: 1_536,
      escapes: 10_973,
      fields: 23_912,
      ineligible: 470,
      pendingAccesses: 11_605,
      reflectiveSurvivors: 455,
    });
    expect(report.migration.summary).toEqual({
      baseline: 405,
      kindChanged: 2,
      newAuditOnly: 1_546,
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
    expect(report.summary.directAccesses).toBe(19_061);
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
