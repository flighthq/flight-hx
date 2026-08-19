import { createHash } from 'node:crypto';
import { readFileSync } from 'node:fs';
import path from 'node:path';
import ts from 'typescript';

import type { UpstreamInventory } from '../model/inventory.ts';

import { excludedPackageDirectories } from './exclusions.ts';
import { analyzeUpstream, sourcePathToHaxePackage, sourcePathToImplementationModule } from './inventory.ts';
import { upstreamTypeScriptProgram } from './program.ts';

// Target-conditional class emission is default-off. Every enabled schema is an
// explicit canonical identity so an upstream declaration cannot enter silently.
export const cppStructInitTypedStructIds: readonly string[] = [
  '@flighthq/types:interface#Camera2D',
  '@flighthq/types:interface#ParticleEmitterState',
];

const cppStructInitTypedStructIdSet = new Set(cppStructInitTypedStructIds);

interface ReviewedTypedStructDirectAddition {
  declarationFingerprint: string;
  id: string;
  purpose: string;
}

// Checker-discovered rows enter audit-only. Moving one to direct emission is a
// separate, reviewable decision locked to its declaration fingerprint; this
// list must not be folded into the historical migration baseline.
export const reviewedTypedStructDirectAdditions: readonly ReviewedTypedStructDirectAddition[] = [
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
];

const reviewedTypedStructDirectAdditionsById = new Map(
  reviewedTypedStructDirectAdditions.map((addition) => [addition.id, addition]),
);

export interface TypedStructCandidate {
  declarationKind?: TypedStructDeclarationKind;
  emission: 'audit-only' | 'direct';
  name: string;
  packageName: string;
  purpose: string;
  source: string;
}

export type TypedStructDeclarationKind = 'interface' | 'type';

export type TypedStructMigrationStatus = 'kind-changed' | 'new' | 'preserved' | 'relocated' | 'renamed';

export interface TypedStructMigrationIdentity {
  baselineId: string | null;
  status: TypedStructMigrationStatus;
}

export interface ResolvedTypedStructCandidate extends TypedStructCandidate {
  configuredDeclarationKind: TypedStructDeclarationKind;
  configuredName: string;
  configuredPackageName: string;
  configuredSource: string;
  declarationKind: TypedStructDeclarationKind;
  definingPackageName: string;
  migration: TypedStructMigrationIdentity;
  sourceResolution: 'exact' | 'relocated';
}

export interface TypedStructMigrationAudit {
  baselineUpstreamCommit: string;
  removed: Array<{
    baselineId: string;
    successorIds: string[];
  }>;
  sourceReportSha256: string;
  summary: {
    baseline: number;
    kindChanged: number;
    newAuditOnly: number;
    preserved: number;
    relocated: number;
    removed: number;
    renamed: number;
  };
}

export interface TypedStructDiscoveryAudit {
  candidates: ResolvedTypedStructCandidate[];
  migration: TypedStructMigrationAudit;
}

export interface TypedStructIdentityIssue {
  actualKinds: TypedStructDeclarationKind[];
  alternatives: Array<{
    declarationKind: TypedStructDeclarationKind;
    publicPackageName: string;
    source: string;
  }>;
  candidate: TypedStructCandidate;
  declarationKind: TypedStructDeclarationKind;
  kind: 'ambiguous' | 'kind-changed' | 'missing';
  sources: string[];
}

export interface TypedStructIdentityResolutionAudit {
  issues: TypedStructIdentityIssue[];
  matched: ResolvedTypedStructCandidate[];
  summary: {
    ambiguous: number;
    exact: number;
    kindChanged: number;
    matched: number;
    missing: number;
    relocated: number;
    requested: number;
  };
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
    | 'unknown-member'
    | 'width-sensitive';
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
  definingPackageName: string;
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
  migration: TypedStructMigrationIdentity;
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
  sourceProvenance: {
    configuredDeclarationKind: TypedStructDeclarationKind;
    configuredName: string;
    configuredPackageName: string;
    configuredSource: string;
    resolution: 'exact' | 'relocated';
  };
}

export interface TypedStructAudit {
  candidates: TypedStructSchemaAudit[];
  migration: TypedStructMigrationAudit;
  schemaVersion: 5;
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
  excludedPackageDirectories: ReadonlySet<string>;
  report: TypedStructAudit;
  resolve(type: ts.Type): TypedStructResolution;
  resolveDirect(type: ts.Type): TypedStructResolution;
  resolveCppStructInitConstruction(type: ts.Type): TypedStructConstructionBinding | undefined;
  resolveField(type: ts.Type, member: string, property?: ts.Symbol): TypedStructFieldBinding | undefined;
}

export function typedStructStableId(
  packageName: string,
  declarationKind: TypedStructDeclarationKind,
  name: string,
): string {
  return `${packageName}:${declarationKind}#${name}`;
}

interface TypedStructMigrationBaselineCandidate {
  declarationKind: TypedStructDeclarationKind;
  emission: 'audit-only' | 'direct';
  name: string;
  packageName: string;
  purpose: string;
  source: string;
}

interface TypedStructMigrationBaseline {
  baselineUpstreamCommit: string;
  candidates: TypedStructMigrationBaselineCandidate[];
  schemaVersion: 1;
  sourceReportSha256: string;
}

const typedStructMigrationBaselinePath = 'tools/generator/baselines/typed-structs-v3.json';

const approvedTypedStructRenames = new Map<string, string>([
  ['@flighthq/scene-formats:interface#GltfScene', '@flighthq/types:interface#GltfScene3D'],
  ['@flighthq/scene-resources:interface#LoadSceneOptions', '@flighthq/types:interface#LoadScene3DResourcesOptions'],
  [
    '@flighthq/scene-resources:interface#ResolveSceneResourcesOptions',
    '@flighthq/types:interface#UpdateScene3DResourceStreamingOptions',
  ],
  [
    '@flighthq/scene-resources:interface#SceneMaterialTextureRegistry',
    '@flighthq/types:interface#Scene3DMaterialTextureRegistry',
  ],
  ['@flighthq/scene-resources:interface#SceneResourceEvent', '@flighthq/types:interface#Scene3DResourceEvent'],
  ['@flighthq/scene-resources:interface#SceneResourceInFlight', '@flighthq/types:interface#Scene3DResourceInFlight'],
  ['@flighthq/scene-resources:interface#SceneResourceResolver', '@flighthq/types:interface#Scene3DResourceResolver'],
  [
    '@flighthq/scene-resources:interface#SceneResourceResolverOptions',
    '@flighthq/types:interface#Scene3DResourceResolverOptions',
  ],
  [
    '@flighthq/scene-resources:interface#SceneResourceRevealOptions',
    '@flighthq/types:interface#Scene3DResourceRevealOptions',
  ],
  ['@flighthq/scene-resources:interface#SceneResourceSignals', '@flighthq/types:interface#Scene3DResourceSignals'],
  ['@flighthq/shape-formats:interface#ShapeBitmapReference', '@flighthq/types:interface#ShapeTextureReference'],
  ['@flighthq/types:interface#Camera', '@flighthq/types:interface#Camera3D'],
  ['@flighthq/types:interface#ColorTransform', '@flighthq/types:interface#ColorScaleBias'],
  ['@flighthq/types:interface#EmbeddedSceneResourceRef', '@flighthq/types:interface#EmbeddedImageResourceReference'],
  ['@flighthq/types:interface#ExternalSceneResourceRef', '@flighthq/types:interface#ExternalImageResourceReference'],
  ['@flighthq/types:interface#ImageResourceCompressed', '@flighthq/types:interface#CompressedImageData'],
  ['@flighthq/types:interface#ParticleEmitter', '@flighthq/types:interface#ParticleEmitter2D'],
  ['@flighthq/types:interface#ParticleEmitterRuntime', '@flighthq/types:interface#ParticleEmitter2DRuntime'],
  ['@flighthq/types:interface#Scene', '@flighthq/types:interface#Scene3D'],
  ['@flighthq/types:interface#SceneAnimationTarget', '@flighthq/types:interface#Scene3DAnimationTarget'],
  ['@flighthq/types:interface#SceneNodeTraits', '@flighthq/types:interface#Node3DTraits'],
  ['@flighthq/types:interface#Surface', '@flighthq/types:interface#Bitmap'],
  ['@flighthq/types:type#SceneRuntime', '@flighthq/types:type#Scene3DRuntime'],
]);

const approvedTypedStructKindChanges = new Map<string, string>([
  ['@flighthq/types:interface#CubeTexture', '@flighthq/types:type#CubeTexture'],
  ['@flighthq/types:interface#Texture', '@flighthq/types:type#Texture'],
]);

const approvedTypedStructReplacementRemovals = new Map<string, string[]>([
  [
    '@flighthq/types:interface#ImageResource',
    [
      '@flighthq/types:interface#Bitmap',
      '@flighthq/types:interface#CompressedImage',
      '@flighthq/types:interface#Image',
    ],
  ],
  [
    '@flighthq/types:interface#Tileset',
    ['@flighthq/types:interface#TiledTileset', '@flighthq/types:interface#TilemapData'],
  ],
  [
    '@flighthq/types:interface#VideoTexture',
    ['@flighthq/types:interface#Image', '@flighthq/types:interface#VideoResource', '@flighthq/types:type#Texture'],
  ],
]);

export function discoverTypedStructUniverse(
  workspaceDirectory: string,
  program: ts.Program,
  inventory: UpstreamInventory = analyzeUpstream(workspaceDirectory),
): TypedStructDiscoveryAudit {
  const declarations = typedStructDeclarationIdentities(workspaceDirectory, program, inventory).filter(
    (declaration) =>
      declaration.publicPackageName === declaration.definingPackageName &&
      !isExcludedTypedStructPackage(declaration.publicPackageName, inventory),
  );
  const candidatesById = new Map<string, ResolvedTypedStructCandidate>();
  for (const declaration of declarations) {
    const id = typedStructStableId(declaration.publicPackageName, declaration.declarationKind, declaration.name);
    const existing = candidatesById.get(id);
    if (existing && existing.source !== declaration.source) {
      throw new Error(
        `Ambiguous checker-derived typed-struct identity ${id}: ${existing.source}, ${declaration.source}`,
      );
    }
    candidatesById.set(id, {
      configuredDeclarationKind: declaration.declarationKind,
      configuredName: declaration.name,
      configuredPackageName: declaration.publicPackageName,
      configuredSource: declaration.source,
      declarationKind: declaration.declarationKind,
      definingPackageName: declaration.definingPackageName,
      emission: 'audit-only',
      migration: { baselineId: null, status: 'new' },
      name: declaration.name,
      packageName: declaration.publicPackageName,
      purpose: 'checker-discovered public declaration',
      source: declaration.source,
      sourceResolution: 'exact',
    });
  }

  const baseline = readTypedStructMigrationBaseline(workspaceDirectory);
  const claimedCurrentIds = new Map<string, string>();
  const consumedExceptionalBaselineIds = new Set<string>();
  for (const entry of baseline.candidates) {
    const baselineId = typedStructStableId(entry.packageName, entry.declarationKind, entry.name);
    const removalSuccessors = approvedTypedStructReplacementRemovals.get(baselineId);
    if (removalSuccessors) {
      consumedExceptionalBaselineIds.add(baselineId);
      continue;
    }
    const renamedId = approvedTypedStructRenames.get(baselineId);
    const kindChangedId = approvedTypedStructKindChanges.get(baselineId);
    const approvedId = renamedId ?? kindChangedId;
    if (approvedId) consumedExceptionalBaselineIds.add(baselineId);
    const current = approvedId
      ? candidatesById.get(approvedId)
      : resolveMigratedTypedStructCandidate(entry, candidatesById);
    if (!current) {
      throw new Error(
        `Approved typed-struct migration target is missing: ${baselineId} -> ${approvedId ?? '(same-name public owner)'}`,
      );
    }
    const currentId = typedStructStableId(current.packageName, current.declarationKind, current.name);
    const previouslyClaimed = claimedCurrentIds.get(currentId);
    if (previouslyClaimed) {
      throw new Error(
        `Typed-struct migration target ${currentId} is claimed by both ${previouslyClaimed} and ${baselineId}`,
      );
    }
    claimedCurrentIds.set(currentId, baselineId);
    const status: TypedStructMigrationStatus = kindChangedId
      ? 'kind-changed'
      : renamedId
        ? 'renamed'
        : current.packageName === entry.packageName && current.source === entry.source
          ? 'preserved'
          : 'relocated';
    candidatesById.set(currentId, {
      ...current,
      configuredDeclarationKind: entry.declarationKind,
      configuredName: entry.name,
      configuredPackageName: entry.packageName,
      configuredSource: entry.source,
      emission: entry.emission,
      migration: { baselineId, status },
      purpose: entry.purpose,
      sourceResolution: status === 'preserved' ? 'exact' : 'relocated',
    });
  }

  for (const addition of reviewedTypedStructDirectAdditions) {
    const current = candidatesById.get(addition.id);
    if (!current) throw new Error(`Reviewed typed-struct direct addition is missing: ${addition.id}`);
    if (current.migration.status !== 'new' || current.migration.baselineId !== null) {
      throw new Error(`Reviewed typed-struct direct addition is no longer checker-new: ${addition.id}`);
    }
    candidatesById.set(addition.id, {
      ...current,
      emission: 'direct',
      purpose: addition.purpose,
    });
  }

  validateTypedStructMigrationApprovals(baseline, consumedExceptionalBaselineIds, candidatesById);
  const candidates = [...candidatesById.values()].sort(compareResolvedTypedStructCandidates);
  const removed = [...approvedTypedStructReplacementRemovals]
    .map(([baselineId, successorIds]) => {
      for (const successorId of successorIds) {
        if (!candidatesById.has(successorId)) {
          throw new Error(`Approved typed-struct replacement successor is missing: ${baselineId} -> ${successorId}`);
        }
      }
      return { baselineId, successorIds: successorIds.slice().sort() };
    })
    .sort((left, right) => left.baselineId.localeCompare(right.baselineId));
  const countStatus = (status: TypedStructMigrationStatus): number =>
    candidates.filter((candidate) => candidate.migration.status === status).length;
  const newCandidates = candidates.filter((candidate) => candidate.migration.status === 'new');
  const unreviewedDirectCandidates = newCandidates.filter(
    (candidate) =>
      candidate.emission === 'direct' &&
      !reviewedTypedStructDirectAdditionsById.has(
        typedStructStableId(candidate.packageName, candidate.declarationKind, candidate.name),
      ),
  );
  if (unreviewedDirectCandidates.length > 0) {
    throw new Error(
      `Checker-discovered typed-struct rows require direct-emission review: ${unreviewedDirectCandidates
        .map((candidate) => typedStructStableId(candidate.packageName, candidate.declarationKind, candidate.name))
        .sort()
        .join(', ')}`,
    );
  }

  return {
    candidates,
    migration: {
      baselineUpstreamCommit: baseline.baselineUpstreamCommit,
      removed,
      sourceReportSha256: baseline.sourceReportSha256,
      summary: {
        baseline: baseline.candidates.length,
        kindChanged: countStatus('kind-changed'),
        newAuditOnly: newCandidates.filter((candidate) => candidate.emission === 'audit-only').length,
        preserved: countStatus('preserved'),
        relocated: countStatus('relocated'),
        removed: removed.length,
        renamed: countStatus('renamed'),
      },
    },
  };
}

function resolveMigratedTypedStructCandidate(
  baseline: TypedStructMigrationBaselineCandidate,
  candidatesById: ReadonlyMap<string, ResolvedTypedStructCandidate>,
): ResolvedTypedStructCandidate | undefined {
  const stableId = typedStructStableId(baseline.packageName, baseline.declarationKind, baseline.name);
  const exact = candidatesById.get(stableId);
  if (exact) return exact;
  const alternatives = [...candidatesById.values()].filter(
    (candidate) => candidate.name === baseline.name && candidate.declarationKind === baseline.declarationKind,
  );
  if (alternatives.length === 1) return alternatives[0];
  if (alternatives.length === 0) return undefined;
  throw new Error(
    `Ambiguous typed-struct migration for ${stableId}: ${alternatives
      .map((candidate) => typedStructStableId(candidate.packageName, candidate.declarationKind, candidate.name))
      .sort()
      .join(', ')}`,
  );
}

function readTypedStructMigrationBaseline(workspaceDirectory: string): TypedStructMigrationBaseline {
  const file = path.join(workspaceDirectory, typedStructMigrationBaselinePath);
  const baseline = JSON.parse(readFileSync(file, 'utf8')) as Partial<TypedStructMigrationBaseline>;
  if (
    baseline.schemaVersion !== 1 ||
    typeof baseline.baselineUpstreamCommit !== 'string' ||
    typeof baseline.sourceReportSha256 !== 'string' ||
    !Array.isArray(baseline.candidates)
  ) {
    throw new Error(`Invalid typed-struct migration baseline: ${typedStructMigrationBaselinePath}`);
  }
  const candidates = baseline.candidates as TypedStructMigrationBaselineCandidate[];
  const ids = candidates.map((candidate) =>
    typedStructStableId(candidate.packageName, candidate.declarationKind, candidate.name),
  );
  if (new Set(ids).size !== candidates.length) {
    throw new Error('Typed-struct migration baseline contains duplicate stable identities');
  }
  return { ...baseline, candidates } as TypedStructMigrationBaseline;
}

function validateTypedStructMigrationApprovals(
  baseline: TypedStructMigrationBaseline,
  consumedExceptionalBaselineIds: ReadonlySet<string>,
  candidatesById: ReadonlyMap<string, ResolvedTypedStructCandidate>,
): void {
  const baselineIds = new Set(
    baseline.candidates.map((candidate) =>
      typedStructStableId(candidate.packageName, candidate.declarationKind, candidate.name),
    ),
  );
  const exceptionalIds = [
    ...approvedTypedStructRenames.keys(),
    ...approvedTypedStructKindChanges.keys(),
    ...approvedTypedStructReplacementRemovals.keys(),
  ];
  const staleApprovals = exceptionalIds.filter((id) => !baselineIds.has(id) || !consumedExceptionalBaselineIds.has(id));
  if (staleApprovals.length > 0) {
    throw new Error(`Stale typed-struct migration approvals: ${staleApprovals.sort().join(', ')}`);
  }
  const missingTargets = [...approvedTypedStructRenames.values(), ...approvedTypedStructKindChanges.values()].filter(
    (id) => !candidatesById.has(id),
  );
  if (missingTargets.length > 0) {
    throw new Error(`Missing typed-struct migration targets: ${missingTargets.sort().join(', ')}`);
  }
}

function compareResolvedTypedStructCandidates(
  left: ResolvedTypedStructCandidate,
  right: ResolvedTypedStructCandidate,
): number {
  return (
    left.packageName.localeCompare(right.packageName) ||
    left.name.localeCompare(right.name) ||
    left.declarationKind.localeCompare(right.declarationKind) ||
    left.source.localeCompare(right.source)
  );
}

function isExcludedTypedStructPackage(packageName: string, inventory: UpstreamInventory): boolean {
  return inventory.packages.some((item) => item.name === packageName && item.exclusion !== null);
}

function migrationAuditForCustomCandidates(
  candidates: readonly { migration: TypedStructMigrationIdentity }[],
  upstreamCommit: string,
): TypedStructMigrationAudit {
  const countStatus = (status: TypedStructMigrationStatus): number =>
    candidates.filter((candidate) => candidate.migration.status === status).length;
  return {
    baselineUpstreamCommit: upstreamCommit,
    removed: [],
    sourceReportSha256: 'custom-candidates',
    summary: {
      baseline: candidates.filter((candidate) => candidate.migration.baselineId !== null).length,
      kindChanged: countStatus('kind-changed'),
      newAuditOnly: countStatus('new'),
      preserved: countStatus('preserved'),
      relocated: countStatus('relocated'),
      removed: 0,
      renamed: countStatus('renamed'),
    },
  };
}

export function resolveTypedStructCandidateIdentities(
  workspaceDirectory: string,
  program: ts.Program,
  candidates: readonly TypedStructCandidate[],
  inventory?: UpstreamInventory,
): TypedStructIdentityResolutionAudit {
  const declarations = typedStructDeclarationIdentities(workspaceDirectory, program, inventory);
  const matched: ResolvedTypedStructCandidate[] = [];
  const issues: TypedStructIdentityIssue[] = [];

  for (const candidate of candidates) {
    const namedDeclarations = declarations.filter((declaration) => declaration.name === candidate.name);
    const declarationKind = configuredTypedStructDeclarationKind(candidate);
    const availableKinds = new Set(namedDeclarations.map((declaration) => declaration.declarationKind));
    const compatibleDeclarations = namedDeclarations.filter(
      (declaration) => declaration.declarationKind === declarationKind,
    );
    const packageDeclarations = compatibleDeclarations.filter(
      (declaration) => declaration.publicPackageName === candidate.packageName,
    );
    const exactPackageDeclarations = packageDeclarations.filter(
      (declaration) => declaration.source === candidate.source,
    );
    const exactSourceDeclarations = compatibleDeclarations.filter(
      (declaration) => declaration.source === candidate.source,
    );
    const owningPackageDeclarations = compatibleDeclarations.filter(
      (declaration) => declaration.publicPackageName === declaration.definingPackageName,
    );
    const resolved =
      packageDeclarations.length === 1
        ? packageDeclarations[0]
        : exactPackageDeclarations.length === 1
          ? exactPackageDeclarations[0]
          : owningPackageDeclarations.length === 1
            ? owningPackageDeclarations[0]
            : exactSourceDeclarations.length === 1
              ? exactSourceDeclarations[0]
              : compatibleDeclarations.length === 1
                ? compatibleDeclarations[0]
                : undefined;
    if (!resolved) {
      issues.push({
        actualKinds: [...availableKinds].sort(),
        alternatives: typedStructIdentityAlternatives(
          compatibleDeclarations.length === 0 ? namedDeclarations : compatibleDeclarations,
        ),
        candidate,
        declarationKind,
        kind:
          compatibleDeclarations.length === 0
            ? namedDeclarations.length === 0
              ? 'missing'
              : 'kind-changed'
            : 'ambiguous',
        sources: [
          ...new Set(
            (compatibleDeclarations.length === 0 ? namedDeclarations : compatibleDeclarations).map(
              (declaration) => declaration.source,
            ),
          ),
        ].sort(),
      });
      continue;
    }
    matched.push({
      ...candidate,
      configuredDeclarationKind: declarationKind,
      configuredName: candidate.name,
      configuredPackageName: candidate.packageName,
      configuredSource: candidate.source,
      declarationKind,
      definingPackageName: resolved.definingPackageName,
      packageName: resolved.publicPackageName,
      source: resolved.source,
      migration: {
        baselineId: typedStructStableId(candidate.packageName, declarationKind, candidate.name),
        status:
          resolved.publicPackageName === candidate.packageName && resolved.source === candidate.source
            ? 'preserved'
            : 'relocated',
      },
      sourceResolution:
        resolved.publicPackageName === candidate.packageName && resolved.source === candidate.source
          ? 'exact'
          : 'relocated',
    });
  }

  issues.sort(
    (left, right) =>
      left.candidate.packageName.localeCompare(right.candidate.packageName) ||
      left.candidate.name.localeCompare(right.candidate.name) ||
      left.declarationKind.localeCompare(right.declarationKind) ||
      left.candidate.source.localeCompare(right.candidate.source),
  );
  return {
    issues,
    matched,
    summary: {
      ambiguous: issues.filter((issue) => issue.kind === 'ambiguous').length,
      exact: matched.filter((candidate) => candidate.sourceResolution === 'exact').length,
      kindChanged: issues.filter((issue) => issue.kind === 'kind-changed').length,
      matched: matched.length,
      missing: issues.filter((issue) => issue.kind === 'missing').length,
      relocated: matched.filter((candidate) => candidate.sourceResolution === 'relocated').length,
      requested: candidates.length,
    },
  };
}

interface TypedStructDeclarationIdentity {
  declarationKind: TypedStructDeclarationKind;
  definingPackageName: string;
  name: string;
  publicPackageName: string;
  source: string;
}

const typedStructDeclarationIdentityCache = new WeakMap<ts.Program, TypedStructDeclarationIdentity[]>();

function typedStructDeclarationIdentities(
  workspaceDirectory: string,
  program: ts.Program,
  inventory?: UpstreamInventory,
): TypedStructDeclarationIdentity[] {
  const cached = typedStructDeclarationIdentityCache.get(program);
  if (cached) return cached;
  const declarationsByIdentity = new Map<string, TypedStructDeclarationIdentity>();
  for (const packageInventory of (inventory ?? analyzeUpstream(workspaceDirectory)).packages) {
    for (const lane of packageInventory.exportLanes) {
      for (const record of lane.exports) {
        if (record.kind !== 'interface' && record.kind !== 'type') continue;
        const identity = `${packageInventory.name}:${record.kind}#${record.name}:${record.source}`;
        declarationsByIdentity.set(identity, {
          declarationKind: record.kind,
          definingPackageName: packageNameFromSource(record.source),
          name: record.name,
          publicPackageName: packageInventory.name,
          source: record.source,
        });
      }
    }
  }
  const declarations = [...declarationsByIdentity.values()].sort(
    (left, right) =>
      left.name.localeCompare(right.name) ||
      left.declarationKind.localeCompare(right.declarationKind) ||
      left.publicPackageName.localeCompare(right.publicPackageName) ||
      left.definingPackageName.localeCompare(right.definingPackageName) ||
      left.source.localeCompare(right.source),
  );
  typedStructDeclarationIdentityCache.set(program, declarations);
  return declarations;
}

function configuredTypedStructDeclarationKind(candidate: TypedStructCandidate): TypedStructDeclarationKind {
  return candidate.declarationKind ?? 'interface';
}

function typedStructIdentityAlternatives(
  declarations: readonly TypedStructDeclarationIdentity[],
): TypedStructIdentityIssue['alternatives'] {
  const alternatives = new Map<string, TypedStructIdentityIssue['alternatives'][number]>();
  for (const declaration of declarations) {
    const alternative = {
      declarationKind: declaration.declarationKind,
      publicPackageName: declaration.publicPackageName,
      source: declaration.source,
    };
    alternatives.set(
      `${alternative.publicPackageName}:${alternative.declarationKind}:${alternative.source}`,
      alternative,
    );
  }
  return [...alternatives.values()].sort(
    (left, right) =>
      left.publicPackageName.localeCompare(right.publicPackageName) ||
      left.declarationKind.localeCompare(right.declarationKind) ||
      left.source.localeCompare(right.source),
  );
}

function packageNameFromSource(source: string): string {
  const directoryName = /^upstream\/packages\/([^/]+)\//u.exec(source)?.[1];
  if (!directoryName) throw new Error(`Cannot derive defining package from typed-struct source: ${source}`);
  return `@flighthq/${directoryName}`;
}

function formatTypedStructIdentityIssues(issues: readonly TypedStructIdentityIssue[]): string {
  return `Typed-struct stable declaration identities need review:\n${issues
    .map((issue) => {
      const identity = `${issue.candidate.packageName}:${issue.declarationKind}#${issue.candidate.name}`;
      const available =
        issue.alternatives.length === 0
          ? 'no public export with that name'
          : `available ${issue.alternatives
              .map(
                (alternative) =>
                  `${alternative.publicPackageName}:${alternative.declarationKind}#${issue.candidate.name} at ${alternative.source}`,
              )
              .join(', ')}`;
      return `- ${identity} (configured ${issue.candidate.source}): ${issue.kind}; ${available}`;
    })
    .join('\n')}`;
}

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

interface AnalyzableTypedStructCandidate extends TypedStructCandidate {
  configuredDeclarationKind: TypedStructDeclarationKind;
  configuredName: string;
  configuredPackageName: string;
  configuredSource: string;
  definingPackageName: string;
  migration: TypedStructMigrationIdentity;
  sourceResolution: 'exact' | 'relocated';
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
  candidates?: readonly TypedStructCandidate[],
  programAndChecker = upstreamTypeScriptProgram(workspaceDirectory),
  inventory?: UpstreamInventory,
): TypedStructRegistry {
  const activeInventory = inventory ?? analyzeUpstream(workspaceDirectory);
  const discovery = candidates
    ? undefined
    : discoverTypedStructUniverse(workspaceDirectory, programAndChecker.program, activeInventory);
  const identities = candidates
    ? resolveTypedStructCandidateIdentities(workspaceDirectory, programAndChecker.program, candidates, activeInventory)
    : undefined;
  if (identities && identities.issues.length > 0) {
    throw new Error(formatTypedStructIdentityIssues(identities.issues));
  }
  const resolvedCandidates = discovery?.candidates ?? identities?.matched ?? [];
  const migration = discovery?.migration ?? migrationAuditForCustomCandidates(resolvedCandidates, upstreamCommit);
  const excludedDirectories = excludedPackageDirectories(activeInventory);
  const cacheKey = `${upstreamCommit}|excluded=${[...excludedDirectories].sort().join(',')}|${resolvedCandidates
    .map(
      (candidate) =>
        `${typedStructStableId(candidate.packageName, candidate.declarationKind, candidate.name)}:${candidate.source}:${candidate.emission}:${candidate.migration.status}`,
    )
    .join('|')}`;
  const cached = registryCache.get(programAndChecker.program)?.get(cacheKey);
  if (cached) return cached;

  const registry = createTypedStructRegistry(
    workspaceDirectory,
    upstreamCommit,
    candidates ?? resolvedCandidates,
    programAndChecker.program,
    programAndChecker.checker,
    resolvedCandidates,
    migration,
    excludedDirectories,
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
  resolvedCandidates?: readonly ResolvedTypedStructCandidate[],
  migration?: TypedStructMigrationAudit,
  excludedDirectories: ReadonlySet<string> = new Set(),
): TypedStructRegistry {
  const analyzableCandidates: readonly AnalyzableTypedStructCandidate[] =
    resolvedCandidates ??
    candidates.map((candidate) => ({
      ...candidate,
      configuredDeclarationKind: configuredTypedStructDeclarationKind(candidate),
      configuredName: candidate.name,
      configuredPackageName: candidate.packageName,
      configuredSource: candidate.source,
      definingPackageName: packageNameFromSource(candidate.source),
      migration: {
        baselineId: typedStructStableId(
          candidate.packageName,
          configuredTypedStructDeclarationKind(candidate),
          candidate.name,
        ),
        status: 'preserved' as const,
      },
      sourceResolution: 'exact',
    }));
  const schemas = analyzableCandidates.map((candidate) =>
    analyzeCandidate(candidate, workspaceDirectory, program, checker),
  );
  const createResolver = (resolverSchemas: readonly InternalSchema[]) => {
    const bySymbol = new Map(resolverSchemas.map((schema) => [canonicalSymbol(schema.symbol, checker), schema]));
    return (type: ts.Type): TypedStructResolution =>
      resolveType(type, checker, bySymbol, new Set<ts.Type>(), new Set<ts.Symbol>());
  };
  const directSchemas = schemas.filter((schema) => schema.audit.emission.mode === 'direct');
  const auditOnlySchemas = schemas.filter((schema) => schema.audit.emission.mode === 'audit-only');
  const resolve = createResolver(schemas);
  const resolveDirect = createResolver(directSchemas);
  const resolveOwnedField = (
    resolverSchemas: readonly InternalSchema[],
    resolver: (type: ts.Type) => TypedStructResolution,
    type: ts.Type,
    member: string,
    property = checker.getPropertyOfType(type, member),
  ):
    | {
        field: TypedStructField;
        schema: InternalSchema;
      }
    | undefined => {
    const resolution = resolver(type);
    if (resolution.kind !== 'matched') return undefined;
    const schema = resolverSchemas.find((candidate) => candidate.audit.id === resolution.schemas[0]?.id);
    const field = schema?.fields.get(member);
    if (!schema || !field || !property || !isCandidateFieldDeclaration(property, field.declarations)) {
      return undefined;
    }
    return { field: field.audit, schema };
  };

  for (const resolverSchemas of [directSchemas, auditOnlySchemas]) {
    const resolver = createResolver(resolverSchemas);
    auditUses(
      workspaceDirectory,
      program,
      checker,
      resolverSchemas,
      resolver,
      (type, member, property) => resolveOwnedField(resolverSchemas, resolver, type, member, property),
      excludedDirectories,
    );
  }
  for (const schema of schemas) {
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

  validateReviewedTypedStructDirectAdditions(schemas);

  const report: TypedStructAudit = {
    candidates: schemas.map((schema) => schema.audit),
    migration: migration ?? migrationAuditForCustomCandidates(analyzableCandidates, upstreamCommit),
    schemaVersion: 5,
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
    excludedPackageDirectories: excludedDirectories,
    report,
    resolve,
    resolveDirect,
    resolveCppStructInitConstruction(type) {
      const resolution = resolveDirect(type);
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
      const owned = resolveOwnedField(directSchemas, resolveDirect, type, member, property);
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

function validateReviewedTypedStructDirectAdditions(schemas: readonly InternalSchema[]): void {
  const schemasById = new Map(schemas.map((schema) => [schema.audit.id, schema.audit]));
  for (const addition of reviewedTypedStructDirectAdditions) {
    const schema = schemasById.get(addition.id);
    if (!schema) continue;
    if (schema.declarationFingerprint !== addition.declarationFingerprint) {
      throw new Error(
        `Reviewed typed-struct direct addition fingerprint drift for ${addition.id}: expected ${addition.declarationFingerprint}, received ${schema.declarationFingerprint}`,
      );
    }
    if (!schema.eligible || schema.emission.mode !== 'direct' || schema.escapes.length > 0) {
      throw new Error(`Reviewed typed-struct direct addition is no longer eligible and escape-free: ${addition.id}`);
    }
  }
}

function typedStructHaxeType(schema: TypedStructSchemaAudit): string {
  const moduleName = sourcePathToImplementationModule(schema.source);
  const modulePath = `${sourcePathToHaxePackage(schema.definingPackageName, schema.source)}.${moduleName}`;
  return moduleName === schema.name ? modulePath : `${modulePath}.${schema.name}`;
}

function analyzeCandidate(
  candidate: AnalyzableTypedStructCandidate,
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
  const declarationKind = ts.isInterfaceDeclaration(declaration) ? 'interface' : 'type';
  if (candidate.declarationKind && candidate.declarationKind !== declarationKind) {
    throw new Error(
      `Typed-struct declaration kind drift for ${candidate.packageName}#${candidate.name}: expected ${candidate.declarationKind}, received ${declarationKind}`,
    );
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
    declarationKind,
    definingPackageName: candidate.definingPackageName,
    eligible: false,
    emission: {
      directAccesses: 0,
      mode: candidate.emission,
      pendingAccesses: 0,
      reflectiveSurvivors: [],
    },
    escapes: [],
    fields,
    id: typedStructStableId(candidate.packageName, declarationKind, candidate.name),
    memberEscapes,
    migration: candidate.migration,
    name: candidate.name,
    packageName: candidate.packageName,
    purpose: candidate.purpose,
    reasons,
    source: candidate.source,
    sourceProvenance: {
      configuredDeclarationKind: candidate.configuredDeclarationKind,
      configuredName: candidate.configuredName,
      configuredPackageName: candidate.configuredPackageName,
      configuredSource: candidate.configuredSource,
      resolution: candidate.sourceResolution,
    },
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
  excludedDirectories: ReadonlySet<string>,
): void {
  const byId = new Map(schemas.map((schema) => [schema.audit.id, schema]));
  const visit = (node: ts.Node): void => {
    if (ts.isPropertyAccessExpression(node)) {
      const receiverType = checker.getTypeAtLocation(node.expression);
      const resolution = resolve(receiverType);
      if (resolution.kind === 'incompatible') {
        for (const audit of resolution.schemas) {
          addEscape(
            audit,
            node,
            workspaceDirectory,
            receiverType.isUnion() ? 'incompatible-union' : 'width-sensitive',
            node.name.text,
          );
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
    } else if (ts.isBindingElement(node) && ts.isObjectBindingPattern(node.parent)) {
      const member = objectBindingMemberName(node);
      const receiverType = checker.getTypeAtLocation(node.parent);
      const resolution = resolve(receiverType);
      if (member && resolution.kind === 'matched') {
        const audit = resolution.schemas[0]!;
        const property = checker.getPropertyOfType(checker.getNonNullableType(receiverType), member);
        const owned = resolveOwnedField(receiverType, member, property);
        if (!owned || owned.schema !== byId.get(audit.id)) {
          addEscape(audit, node, workspaceDirectory, 'unknown-member', member);
        } else {
          audit.accesses.reads += 1;
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

  for (const source of program
    .getSourceFiles()
    .filter((item) => isProductionUpstreamSource(item, excludedDirectories))) {
    visit(source);
  }
}

function objectBindingMemberName(node: ts.BindingElement): string | undefined {
  const name = node.propertyName ?? (ts.isIdentifier(node.name) ? node.name : undefined);
  if (name && (ts.isIdentifier(name) || ts.isStringLiteral(name) || ts.isNumericLiteral(name))) return name.text;
  return undefined;
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

function isProductionUpstreamSource(source: ts.SourceFile, excludedDirectories: ReadonlySet<string>): boolean {
  const normalized = source.fileName.split(path.sep).join('/');
  const packageDirectory = /\/upstream\/packages\/([^/]+)\/src\//u.exec(normalized)?.[1];
  return (
    packageDirectory !== undefined &&
    !excludedDirectories.has(packageDirectory) &&
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
