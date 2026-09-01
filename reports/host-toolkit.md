# Host Toolkit Dependency Audit

Upstream commit: `b3bb4bf61833f7723e7033dd5c732e91a6601400`

Generated code owns checker-known source types and stable lookup keys. Maintained source owns the declarations, target values, and adapters behind those keys. Generation fails when a referenced key has no declared toolkit provider; Dynamic compatibility declarations remain visible as toolkit debt rather than changing the generated type or member expression.

| Metric | Count |
| --- | ---: |
| Host type keys | 237 |
| External type keys | 1 |
| Dynamic compatibility type entries | 212 |
| Global value keys | 70 |
| Portable global value keys | 35 |
| JavaScript-only global value keys | 35 |
| Module value keys | 0 |
| Type uses | 8738 |
| Value uses | 2084 |
| Missing toolkit entries | 0 |

## Types

| Key | Kind | Emitted Haxe type | Provider | Coverage | Uses |
| --- | --- | --- | --- | --- | ---: |
| `external:GLenum` | `external` | `flight._internal.WebExterns.GLenum` | `src/flight/_internal/WebExterns.hx` | `typed` | 1 |
| `host:AbortController` | `host` | `flight._internal.dom.AbortController` | `src/flight/_internal/dom/AbortController.hx` | `typed` | 40 |
| `host:AbortSignal` | `host` | `flight._internal.dom.AbortSignal` | `src/flight/_internal/dom/AbortSignal.hx` | `typed` | 167 |
| `host:AddEventListenerOptions` | `host` | `flight._internal.dom.AddEventListenerOptions` | `src/flight/_internal/dom/AddEventListenerOptions.hx` | `typed` | 1 |
| `host:AudioBuffer` | `host` | `flight._internal.dom.AudioBuffer` | `src/flight/_internal/dom/AudioBuffer.hx` | `typed` | 39 |
| `host:AudioBufferSourceNode` | `host` | `flight._internal.dom.AudioBufferSourceNode` | `src/flight/_internal/dom/AudioBufferSourceNode.hx` | `dynamic-stub` | 29 |
| `host:AudioContext` | `host` | `flight._internal.dom.AudioContext` | `src/flight/_internal/dom/AudioContext.hx` | `dynamic-stub` | 43 |
| `host:AudioDestinationNode` | `host` | `flight._internal.dom.AudioDestinationNode` | `src/flight/_internal/dom/AudioDestinationNode.hx` | `dynamic-stub` | 2 |
| `host:AudioNode` | `host` | `flight._internal.dom.AudioNode` | `src/flight/_internal/dom/AudioNode.hx` | `dynamic-stub` | 9 |
| `host:AudioParam` | `host` | `flight._internal.dom.AudioParam` | `src/flight/_internal/dom/AudioParam.hx` | `dynamic-stub` | 20 |
| `host:BeforeUnloadEvent` | `host` | `flight._internal.dom.BeforeUnloadEvent` | `src/flight/_internal/dom/BeforeUnloadEvent.hx` | `dynamic-stub` | 5 |
| `host:Blob` | `host` | `flight._internal.dom.Blob` | `src/flight/_internal/dom/Blob.hx` | `dynamic-stub` | 44 |
| `host:BodyInit` | `host` | `flight._internal.dom.BodyInit` | `src/flight/_internal/dom/BodyInit.hx` | `dynamic-stub` | 1 |
| `host:CanvasFillRule` | `host` | `flight._internal.dom.CanvasFillRule` | `src/flight/_internal/dom/CanvasFillRule.hx` | `dynamic-stub` | 1 |
| `host:CanvasGradient` | `host` | `flight._internal.dom.CanvasGradient` | `src/flight/_internal/dom/CanvasGradient.hx` | `typed` | 39 |
| `host:CanvasImageSource` | `host` | `flight._internal.dom.CanvasImageSource` | `src/flight/_internal/dom/CanvasImageSource.hx` | `dynamic-stub` | 26 |
| `host:CanvasLineCap` | `host` | `flight._internal.dom.CanvasLineCap` | `src/flight/_internal/dom/CanvasLineCap.hx` | `dynamic-stub` | 1 |
| `host:CanvasLineJoin` | `host` | `flight._internal.dom.CanvasLineJoin` | `src/flight/_internal/dom/CanvasLineJoin.hx` | `dynamic-stub` | 1 |
| `host:CanvasPattern` | `host` | `flight._internal.dom.CanvasPattern` | `src/flight/_internal/dom/CanvasPattern.hx` | `dynamic-stub` | 36 |
| `host:CanvasRenderingContext2D` | `host` | `flight._internal.dom.CanvasRenderingContext2D` | `src/flight/_internal/dom/CanvasRenderingContext2D.hx` | `dynamic-stub` | 632 |
| `host:CanvasRenderingContext2DSettings` | `host` | `flight._internal.dom.CanvasRenderingContext2DSettings` | `src/flight/_internal/dom/CanvasRenderingContext2DSettings.hx` | `dynamic-stub` | 12 |
| `host:ChildNode` | `host` | `flight._internal.dom.ChildNode` | `src/flight/_internal/dom/ChildNode.hx` | `dynamic-stub` | 8 |
| `host:Clipboard` | `host` | `flight._internal.dom.Clipboard` | `src/flight/_internal/dom/Clipboard.hx` | `dynamic-stub` | 22 |
| `host:ClipboardItem` | `host` | `flight._internal.dom.ClipboardItem` | `src/flight/_internal/dom/ClipboardItem.hx` | `dynamic-stub` | 9 |
| `host:CloseEvent` | `host` | `flight._internal.dom.CloseEvent` | `src/flight/_internal/dom/CloseEvent.hx` | `dynamic-stub` | 6 |
| `host:CompositionEvent` | `host` | `flight._internal.dom.CompositionEvent` | `src/flight/_internal/dom/CompositionEvent.hx` | `dynamic-stub` | 3 |
| `host:Console` | `host` | `flight._internal.dom.Console` | `src/flight/_internal/dom/Console.hx` | `typed` | 2 |
| `host:Crypto` | `host` | `flight._internal.dom.Crypto` | `src/flight/_internal/dom/Crypto.hx` | `dynamic-stub` | 3 |
| `host:CSSStyleDeclaration` | `host` | `flight._internal.dom.CSSStyleDeclaration` | `src/flight/_internal/dom/CSSStyleDeclaration.hx` | `dynamic-stub` | 158 |
| `host:CustomEvent` | `host` | `flight._internal.dom.CustomEvent` | `src/flight/_internal/dom/CustomEvent.hx` | `dynamic-stub` | 3 |
| `host:DataTransfer` | `host` | `flight._internal.dom.DataTransfer` | `src/flight/_internal/dom/DataTransfer.hx` | `dynamic-stub` | 2 |
| `host:Document` | `host` | `flight._internal.dom.Document` | `src/flight/_internal/dom/Document.hx` | `dynamic-stub` | 142 |
| `host:DOMException` | `host` | `flight._internal.dom.DOMException` | `src/flight/_internal/dom/DOMException.hx` | `typed` | 11 |
| `host:DOMRect` | `host` | `flight._internal.dom.DOMRect` | `src/flight/_internal/dom/DOMRect.hx` | `dynamic-stub` | 17 |
| `host:DOMRectReadOnly` | `host` | `flight._internal.dom.DOMRectReadOnly` | `src/flight/_internal/dom/DOMRectReadOnly.hx` | `dynamic-stub` | 3 |
| `host:DOMStringMap` | `host` | `flight._internal.dom.DOMStringMap` | `src/flight/_internal/dom/DOMStringMap.hx` | `dynamic-stub` | 1 |
| `host:DragEvent` | `host` | `flight._internal.dom.DragEvent` | `src/flight/_internal/dom/DragEvent.hx` | `dynamic-stub` | 8 |
| `host:Element` | `host` | `flight._internal.dom.Element` | `src/flight/_internal/dom/Element.hx` | `dynamic-stub` | 22 |
| `host:Event` | `host` | `flight._internal.dom.Event` | `src/flight/_internal/dom/Event.hx` | `dynamic-stub` | 55 |
| `host:EventListener` | `host` | `flight._internal.dom.EventListener` | `src/flight/_internal/dom/EventListener.hx` | `dynamic-stub` | 17 |
| `host:EventListenerObject` | `host` | `flight._internal.dom.EventListenerObject` | `src/flight/_internal/dom/EventListenerObject.hx` | `typed` | 1 |
| `host:EventListenerOptions` | `host` | `flight._internal.dom.EventListenerOptions` | `src/flight/_internal/dom/EventListenerOptions.hx` | `typed` | 1 |
| `host:EventTarget` | `host` | `flight._internal.dom.EventTarget` | `src/flight/_internal/dom/EventTarget.hx` | `typed` | 42 |
| `host:EXT_color_buffer_float` | `host` | `flight._internal.dom.EXT_color_buffer_float` | `src/flight/_internal/dom/EXT_color_buffer_float.hx` | `dynamic-stub` | 2 |
| `host:EXT_texture_compression_bptc` | `host` | `flight._internal.dom.EXT_texture_compression_bptc` | `src/flight/_internal/dom/EXT_texture_compression_bptc.hx` | `dynamic-stub` | 1 |
| `host:EXT_texture_compression_rgtc` | `host` | `flight._internal.dom.EXT_texture_compression_rgtc` | `src/flight/_internal/dom/EXT_texture_compression_rgtc.hx` | `dynamic-stub` | 1 |
| `host:EXT_texture_filter_anisotropic` | `host` | `flight._internal.dom.EXT_texture_filter_anisotropic` | `src/flight/_internal/dom/EXT_texture_filter_anisotropic.hx` | `dynamic-stub` | 8 |
| `host:File` | `host` | `flight._internal.dom.File` | `src/flight/_internal/dom/File.hx` | `dynamic-stub` | 36 |
| `host:FileList` | `host` | `flight._internal.dom.FileList` | `src/flight/_internal/dom/FileList.hx` | `dynamic-stub` | 5 |
| `host:FileReader` | `host` | `flight._internal.dom.FileReader` | `src/flight/_internal/dom/FileReader.hx` | `dynamic-stub` | 23 |
| `host:FileSystemDirectoryHandle` | `host` | `flight._internal.dom.FileSystemDirectoryHandle` | `src/flight/_internal/dom/FileSystemDirectoryHandle.hx` | `dynamic-stub` | 22 |
| `host:FileSystemFileHandle` | `host` | `flight._internal.dom.FileSystemFileHandle` | `src/flight/_internal/dom/FileSystemFileHandle.hx` | `dynamic-stub` | 23 |
| `host:FileSystemWritableFileStream` | `host` | `flight._internal.dom.FileSystemWritableFileStream` | `src/flight/_internal/dom/FileSystemWritableFileStream.hx` | `dynamic-stub` | 5 |
| `host:FileSystemWriteChunkType` | `host` | `flight._internal.dom.FileSystemWriteChunkType` | `src/flight/_internal/dom/FileSystemWriteChunkType.hx` | `dynamic-stub` | 1 |
| `host:FontFace` | `host` | `flight._internal.dom.FontFace` | `src/flight/_internal/dom/FontFace.hx` | `dynamic-stub` | 35 |
| `host:FontFaceSet` | `host` | `flight._internal.dom.FontFaceSet` | `src/flight/_internal/dom/FontFaceSet.hx` | `dynamic-stub` | 6 |
| `host:FormData` | `host` | `flight._internal.dom.FormData` | `src/flight/_internal/dom/FormData.hx` | `dynamic-stub` | 1 |
| `host:GainNode` | `host` | `flight._internal.dom.GainNode` | `src/flight/_internal/dom/GainNode.hx` | `dynamic-stub` | 50 |
| `host:Gamepad` | `host` | `flight._internal.dom.Gamepad` | `src/flight/_internal/dom/Gamepad.hx` | `dynamic-stub` | 25 |
| `host:GamepadButton` | `host` | `flight._internal.dom.GamepadButton` | `src/flight/_internal/dom/GamepadButton.hx` | `dynamic-stub` | 8 |
| `host:GamepadEvent` | `host` | `flight._internal.dom.GamepadEvent` | `src/flight/_internal/dom/GamepadEvent.hx` | `dynamic-stub` | 5 |
| `host:Geolocation` | `host` | `flight._internal.dom.Geolocation` | `src/flight/_internal/dom/Geolocation.hx` | `dynamic-stub` | 14 |
| `host:GeolocationCoordinates` | `host` | `flight._internal.dom.GeolocationCoordinates` | `src/flight/_internal/dom/GeolocationCoordinates.hx` | `dynamic-stub` | 8 |
| `host:GeolocationPosition` | `host` | `flight._internal.dom.GeolocationPosition` | `src/flight/_internal/dom/GeolocationPosition.hx` | `dynamic-stub` | 7 |
| `host:GeolocationPositionError` | `host` | `flight._internal.dom.GeolocationPositionError` | `src/flight/_internal/dom/GeolocationPositionError.hx` | `dynamic-stub` | 10 |
| `host:GlobalCompositeOperation` | `host` | `flight._internal.dom.GlobalCompositeOperation` | `src/flight/_internal/dom/GlobalCompositeOperation.hx` | `dynamic-stub` | 8 |
| `host:GPU` | `host` | `flight._internal.dom.GPU` | `src/flight/_internal/dom/GPU.hx` | `dynamic-stub` | 10 |
| `host:GPUAdapter` | `host` | `flight._internal.dom.GPUAdapter` | `src/flight/_internal/dom/GPUAdapter.hx` | `dynamic-stub` | 17 |
| `host:GPUAllowSharedBufferSource` | `host` | `flight._internal.dom.GPUAllowSharedBufferSource` | `src/flight/_internal/dom/GPUAllowSharedBufferSource.hx` | `typed` | 4 |
| `host:GPUBindGroup` | `host` | `flight._internal.dom.GPUBindGroup` | `src/flight/_internal/dom/GPUBindGroup.hx` | `dynamic-stub` | 209 |
| `host:GPUBindGroupEntry` | `host` | `flight._internal.dom.GPUBindGroupEntry` | `src/flight/_internal/dom/GPUBindGroupEntry.hx` | `dynamic-stub` | 15 |
| `host:GPUBindGroupLayout` | `host` | `flight._internal.dom.GPUBindGroupLayout` | `src/flight/_internal/dom/GPUBindGroupLayout.hx` | `dynamic-stub` | 281 |
| `host:GPUBindGroupLayoutEntry` | `host` | `flight._internal.dom.GPUBindGroupLayoutEntry` | `src/flight/_internal/dom/GPUBindGroupLayoutEntry.hx` | `dynamic-stub` | 10 |
| `host:GPUBlendComponent` | `host` | `flight._internal.dom.GPUBlendComponent` | `src/flight/_internal/dom/GPUBlendComponent.hx` | `dynamic-stub` | 3 |
| `host:GPUBlendFactor` | `host` | `flight._internal.dom.GPUBlendFactor` | `src/flight/_internal/dom/GPUBlendFactor.hx` | `dynamic-stub` | 2 |
| `host:GPUBlendOperation` | `host` | `flight._internal.dom.GPUBlendOperation` | `src/flight/_internal/dom/GPUBlendOperation.hx` | `dynamic-stub` | 1 |
| `host:GPUBlendState` | `host` | `flight._internal.dom.GPUBlendState` | `src/flight/_internal/dom/GPUBlendState.hx` | `dynamic-stub` | 62 |
| `host:GPUBuffer` | `host` | `flight._internal.dom.GPUBuffer` | `src/flight/_internal/dom/GPUBuffer.hx` | `dynamic-stub` | 301 |
| `host:GPUBufferBinding` | `host` | `flight._internal.dom.GPUBufferBinding` | `src/flight/_internal/dom/GPUBufferBinding.hx` | `dynamic-stub` | 10 |
| `host:GPUBufferDescriptor` | `host` | `flight._internal.dom.GPUBufferDescriptor` | `src/flight/_internal/dom/GPUBufferDescriptor.hx` | `typed` | 8 |
| `host:GPUBufferUsage` | `host` | `flight._internal.dom.GPUBufferUsage` | `src/flight/_internal/dom/GPUBufferUsage.hx` | `dynamic-stub` | 71 |
| `host:GPUCanvasContext` | `host` | `flight._internal.dom.GPUCanvasContext` | `src/flight/_internal/dom/GPUCanvasContext.hx` | `dynamic-stub` | 16 |
| `host:GPUColor` | `host` | `flight._internal.dom.GPUColor` | `src/flight/_internal/dom/GPUColor.hx` | `dynamic-stub` | 4 |
| `host:GPUColorDict` | `host` | `flight._internal.dom.GPUColorDict` | `src/flight/_internal/dom/GPUColorDict.hx` | `dynamic-stub` | 16 |
| `host:GPUColorWrite` | `host` | `flight._internal.dom.GPUColorWrite` | `src/flight/_internal/dom/GPUColorWrite.hx` | `dynamic-stub` | 2 |
| `host:GPUCommandBuffer` | `host` | `flight._internal.dom.GPUCommandBuffer` | `src/flight/_internal/dom/GPUCommandBuffer.hx` | `dynamic-stub` | 10 |
| `host:GPUCommandEncoder` | `host` | `flight._internal.dom.GPUCommandEncoder` | `src/flight/_internal/dom/GPUCommandEncoder.hx` | `dynamic-stub` | 43 |
| `host:GPUCopyExternalImageDestInfo` | `host` | `flight._internal.dom.GPUCopyExternalImageDestInfo` | `src/flight/_internal/dom/GPUCopyExternalImageDestInfo.hx` | `dynamic-stub` | 4 |
| `host:GPUCopyExternalImageSource` | `host` | `flight._internal.dom.GPUCopyExternalImageSource` | `src/flight/_internal/dom/GPUCopyExternalImageSource.hx` | `dynamic-stub` | 8 |
| `host:GPUCopyExternalImageSourceInfo` | `host` | `flight._internal.dom.GPUCopyExternalImageSourceInfo` | `src/flight/_internal/dom/GPUCopyExternalImageSourceInfo.hx` | `dynamic-stub` | 4 |
| `host:GPUDevice` | `host` | `flight._internal.dom.GPUDevice` | `src/flight/_internal/dom/GPUDevice.hx` | `dynamic-stub` | 408 |
| `host:GPUDeviceDescriptor` | `host` | `flight._internal.dom.GPUDeviceDescriptor` | `src/flight/_internal/dom/GPUDeviceDescriptor.hx` | `dynamic-stub` | 4 |
| `host:GPUDeviceLostInfo` | `host` | `flight._internal.dom.GPUDeviceLostInfo` | `src/flight/_internal/dom/GPUDeviceLostInfo.hx` | `dynamic-stub` | 15 |
| `host:GPUExtent3D` | `host` | `flight._internal.dom.GPUExtent3D` | `src/flight/_internal/dom/GPUExtent3D.hx` | `typed` | 3 |
| `host:GPUExtent3DDict` | `host` | `flight._internal.dom.GPUExtent3DDict` | `src/flight/_internal/dom/GPUExtent3DDict.hx` | `typed` | 10 |
| `host:GPUExtent3DDictStrict` | `host` | `flight._internal.dom.GPUExtent3DDictStrict` | `src/flight/_internal/dom/GPUExtent3DDictStrict.hx` | `typed` | 1 |
| `host:GPUExternalTexture` | `host` | `flight._internal.dom.GPUExternalTexture` | `src/flight/_internal/dom/GPUExternalTexture.hx` | `dynamic-stub` | 10 |
| `host:GPUFeatureName` | `host` | `flight._internal.dom.GPUFeatureName` | `src/flight/_internal/dom/GPUFeatureName.hx` | `dynamic-stub` | 1 |
| `host:GPUFilterMode` | `host` | `flight._internal.dom.GPUFilterMode` | `src/flight/_internal/dom/GPUFilterMode.hx` | `dynamic-stub` | 14 |
| `host:GPUIndexFormat` | `host` | `flight._internal.dom.GPUIndexFormat` | `src/flight/_internal/dom/GPUIndexFormat.hx` | `dynamic-stub` | 2 |
| `host:GPULoadOp` | `host` | `flight._internal.dom.GPULoadOp` | `src/flight/_internal/dom/GPULoadOp.hx` | `dynamic-stub` | 6 |
| `host:GPUMapMode` | `host` | `flight._internal.dom.GPUMapMode` | `src/flight/_internal/dom/GPUMapMode.hx` | `dynamic-stub` | 1 |
| `host:GPUMipmapFilterMode` | `host` | `flight._internal.dom.GPUMipmapFilterMode` | `src/flight/_internal/dom/GPUMipmapFilterMode.hx` | `dynamic-stub` | 4 |
| `host:GPUOrigin3D` | `host` | `flight._internal.dom.GPUOrigin3D` | `src/flight/_internal/dom/GPUOrigin3D.hx` | `dynamic-stub` | 3 |
| `host:GPUOrigin3DDict` | `host` | `flight._internal.dom.GPUOrigin3DDict` | `src/flight/_internal/dom/GPUOrigin3DDict.hx` | `typed` | 6 |
| `host:GPUPipelineLayout` | `host` | `flight._internal.dom.GPUPipelineLayout` | `src/flight/_internal/dom/GPUPipelineLayout.hx` | `dynamic-stub` | 60 |
| `host:GPUPowerPreference` | `host` | `flight._internal.dom.GPUPowerPreference` | `src/flight/_internal/dom/GPUPowerPreference.hx` | `dynamic-stub` | 1 |
| `host:GPUPrimitiveTopology` | `host` | `flight._internal.dom.GPUPrimitiveTopology` | `src/flight/_internal/dom/GPUPrimitiveTopology.hx` | `dynamic-stub` | 1 |
| `host:GPUQueue` | `host` | `flight._internal.dom.GPUQueue` | `src/flight/_internal/dom/GPUQueue.hx` | `dynamic-stub` | 88 |
| `host:GPURenderPassEncoder` | `host` | `flight._internal.dom.GPURenderPassEncoder` | `src/flight/_internal/dom/GPURenderPassEncoder.hx` | `dynamic-stub` | 265 |
| `host:GPURenderPipeline` | `host` | `flight._internal.dom.GPURenderPipeline` | `src/flight/_internal/dom/GPURenderPipeline.hx` | `dynamic-stub` | 120 |
| `host:GPURenderPipelineDescriptor` | `host` | `flight._internal.dom.GPURenderPipelineDescriptor` | `src/flight/_internal/dom/GPURenderPipelineDescriptor.hx` | `dynamic-stub` | 8 |
| `host:GPUSampler` | `host` | `flight._internal.dom.GPUSampler` | `src/flight/_internal/dom/GPUSampler.hx` | `dynamic-stub` | 222 |
| `host:GPUSamplerDescriptor` | `host` | `flight._internal.dom.GPUSamplerDescriptor` | `src/flight/_internal/dom/GPUSamplerDescriptor.hx` | `dynamic-stub` | 4 |
| `host:GPUShaderModule` | `host` | `flight._internal.dom.GPUShaderModule` | `src/flight/_internal/dom/GPUShaderModule.hx` | `dynamic-stub` | 156 |
| `host:GPUShaderStage` | `host` | `flight._internal.dom.GPUShaderStage` | `src/flight/_internal/dom/GPUShaderStage.hx` | `dynamic-stub` | 109 |
| `host:GPUStencilFaceState` | `host` | `flight._internal.dom.GPUStencilFaceState` | `src/flight/_internal/dom/GPUStencilFaceState.hx` | `dynamic-stub` | 9 |
| `host:GPUStencilOperation` | `host` | `flight._internal.dom.GPUStencilOperation` | `src/flight/_internal/dom/GPUStencilOperation.hx` | `dynamic-stub` | 1 |
| `host:GPUSupportedFeatures` | `host` | `flight._internal.dom.GPUSupportedFeatures` | `src/flight/_internal/dom/GPUSupportedFeatures.hx` | `dynamic-stub` | 9 |
| `host:GPUSupportedLimits` | `host` | `flight._internal.dom.GPUSupportedLimits` | `src/flight/_internal/dom/GPUSupportedLimits.hx` | `dynamic-stub` | 16 |
| `host:GPUTexelCopyBufferLayout` | `host` | `flight._internal.dom.GPUTexelCopyBufferLayout` | `src/flight/_internal/dom/GPUTexelCopyBufferLayout.hx` | `typed` | 10 |
| `host:GPUTexelCopyTextureInfo` | `host` | `flight._internal.dom.GPUTexelCopyTextureInfo` | `src/flight/_internal/dom/GPUTexelCopyTextureInfo.hx` | `typed` | 8 |
| `host:GPUTexture` | `host` | `flight._internal.dom.GPUTexture` | `src/flight/_internal/dom/GPUTexture.hx` | `dynamic-stub` | 235 |
| `host:GPUTextureDescriptor` | `host` | `flight._internal.dom.GPUTextureDescriptor` | `src/flight/_internal/dom/GPUTextureDescriptor.hx` | `typed` | 13 |
| `host:GPUTextureFormat` | `host` | `flight._internal.dom.GPUTextureFormat` | `src/flight/_internal/dom/GPUTextureFormat.hx` | `dynamic-stub` | 59 |
| `host:GPUTextureUsage` | `host` | `flight._internal.dom.GPUTextureUsage` | `src/flight/_internal/dom/GPUTextureUsage.hx` | `dynamic-stub` | 67 |
| `host:GPUTextureView` | `host` | `flight._internal.dom.GPUTextureView` | `src/flight/_internal/dom/GPUTextureView.hx` | `dynamic-stub` | 297 |
| `host:GPUVertexBufferLayout` | `host` | `flight._internal.dom.GPUVertexBufferLayout` | `src/flight/_internal/dom/GPUVertexBufferLayout.hx` | `dynamic-stub` | 23 |
| `host:Headers` | `host` | `flight._internal.dom.Headers` | `src/flight/_internal/dom/Headers.hx` | `dynamic-stub` | 8 |
| `host:HTMLAudioElement` | `host` | `flight._internal.dom.HTMLAudioElement` | `src/flight/_internal/dom/HTMLAudioElement.hx` | `dynamic-stub` | 2 |
| `host:HTMLCanvasElement` | `host` | `flight._internal.dom.HTMLCanvasElement` | `src/flight/_internal/dom/HTMLCanvasElement.hx` | `dynamic-stub` | 301 |
| `host:HTMLDivElement` | `host` | `flight._internal.dom.HTMLDivElement` | `src/flight/_internal/dom/HTMLDivElement.hx` | `dynamic-stub` | 38 |
| `host:HTMLElement` | `host` | `flight._internal.dom.HTMLElement` | `src/flight/_internal/dom/HTMLElement.hx` | `dynamic-stub` | 279 |
| `host:HTMLHeadElement` | `host` | `flight._internal.dom.HTMLHeadElement` | `src/flight/_internal/dom/HTMLHeadElement.hx` | `dynamic-stub` | 7 |
| `host:HTMLImageElement` | `host` | `flight._internal.dom.HTMLImageElement` | `src/flight/_internal/dom/HTMLImageElement.hx` | `dynamic-stub` | 87 |
| `host:HTMLInputElement` | `host` | `flight._internal.dom.HTMLInputElement` | `src/flight/_internal/dom/HTMLInputElement.hx` | `dynamic-stub` | 29 |
| `host:HTMLLIElement` | `host` | `flight._internal.dom.HTMLLIElement` | `src/flight/_internal/dom/HTMLLIElement.hx` | `dynamic-stub` | 22 |
| `host:HTMLLinkElement` | `host` | `flight._internal.dom.HTMLLinkElement` | `src/flight/_internal/dom/HTMLLinkElement.hx` | `dynamic-stub` | 5 |
| `host:HTMLMediaElement` | `host` | `flight._internal.dom.HTMLMediaElement` | `src/flight/_internal/dom/HTMLMediaElement.hx` | `dynamic-stub` | 1 |
| `host:HTMLMetaElement` | `host` | `flight._internal.dom.HTMLMetaElement` | `src/flight/_internal/dom/HTMLMetaElement.hx` | `dynamic-stub` | 1 |
| `host:HTMLSpanElement` | `host` | `flight._internal.dom.HTMLSpanElement` | `src/flight/_internal/dom/HTMLSpanElement.hx` | `dynamic-stub` | 15 |
| `host:HTMLStyleElement` | `host` | `flight._internal.dom.HTMLStyleElement` | `src/flight/_internal/dom/HTMLStyleElement.hx` | `dynamic-stub` | 3 |
| `host:HTMLUListElement` | `host` | `flight._internal.dom.HTMLUListElement` | `src/flight/_internal/dom/HTMLUListElement.hx` | `dynamic-stub` | 14 |
| `host:HTMLVideoElement` | `host` | `flight._internal.dom.HTMLVideoElement` | `src/flight/_internal/dom/HTMLVideoElement.hx` | `dynamic-stub` | 163 |
| `host:ImageBitmap` | `host` | `flight._internal.dom.ImageBitmap` | `src/flight/_internal/dom/ImageBitmap.hx` | `dynamic-stub` | 72 |
| `host:ImageBitmapRenderingContext` | `host` | `flight._internal.dom.ImageBitmapRenderingContext` | `src/flight/_internal/dom/ImageBitmapRenderingContext.hx` | `dynamic-stub` | 1 |
| `host:ImageData` | `host` | `flight._internal.dom.ImageData` | `src/flight/_internal/dom/ImageData.hx` | `dynamic-stub` | 36 |
| `host:ImageDataArray` | `host` | `flight._internal.dom.ImageDataArray` | `src/flight/_internal/dom/ImageDataArray.hx` | `dynamic-stub` | 2 |
| `host:ImageDataSettings` | `host` | `flight._internal.dom.ImageDataSettings` | `src/flight/_internal/dom/ImageDataSettings.hx` | `typed` | 1 |
| `host:ImageSmoothingQuality` | `host` | `flight._internal.dom.ImageSmoothingQuality` | `src/flight/_internal/dom/ImageSmoothingQuality.hx` | `dynamic-stub` | 2 |
| `host:InputEvent` | `host` | `flight._internal.dom.InputEvent` | `src/flight/_internal/dom/InputEvent.hx` | `dynamic-stub` | 4 |
| `host:KeyboardEvent` | `host` | `flight._internal.dom.KeyboardEvent` | `src/flight/_internal/dom/KeyboardEvent.hx` | `dynamic-stub` | 33 |
| `host:Location` | `host` | `flight._internal.dom.Location` | `src/flight/_internal/dom/Location.hx` | `dynamic-stub` | 8 |
| `host:MediaDevices` | `host` | `flight._internal.dom.MediaDevices` | `src/flight/_internal/dom/MediaDevices.hx` | `dynamic-stub` | 6 |
| `host:MediaMetadata` | `host` | `flight._internal.dom.MediaMetadata` | `src/flight/_internal/dom/MediaMetadata.hx` | `dynamic-stub` | 8 |
| `host:MediaQueryList` | `host` | `flight._internal.dom.MediaQueryList` | `src/flight/_internal/dom/MediaQueryList.hx` | `dynamic-stub` | 7 |
| `host:MediaSession` | `host` | `flight._internal.dom.MediaSession` | `src/flight/_internal/dom/MediaSession.hx` | `dynamic-stub` | 37 |
| `host:MediaSource` | `host` | `flight._internal.dom.MediaSource` | `src/flight/_internal/dom/MediaSource.hx` | `dynamic-stub` | 2 |
| `host:MediaStream` | `host` | `flight._internal.dom.MediaStream` | `src/flight/_internal/dom/MediaStream.hx` | `dynamic-stub` | 10 |
| `host:MediaStreamTrack` | `host` | `flight._internal.dom.MediaStreamTrack` | `src/flight/_internal/dom/MediaStreamTrack.hx` | `dynamic-stub` | 6 |
| `host:MessageEvent` | `host` | `flight._internal.dom.MessageEvent` | `src/flight/_internal/dom/MessageEvent.hx` | `dynamic-stub` | 4 |
| `host:MIDIAccess` | `host` | `flight._internal.dom.MIDIAccess` | `src/flight/_internal/dom/MIDIAccess.hx` | `dynamic-stub` | 8 |
| `host:MIDIConnectionEvent` | `host` | `flight._internal.dom.MIDIConnectionEvent` | `src/flight/_internal/dom/MIDIConnectionEvent.hx` | `dynamic-stub` | 6 |
| `host:MIDIInput` | `host` | `flight._internal.dom.MIDIInput` | `src/flight/_internal/dom/MIDIInput.hx` | `dynamic-stub` | 10 |
| `host:MIDIInputMap` | `host` | `flight._internal.dom.MIDIInputMap` | `src/flight/_internal/dom/MIDIInputMap.hx` | `dynamic-stub` | 1 |
| `host:MIDIMessageEvent` | `host` | `flight._internal.dom.MIDIMessageEvent` | `src/flight/_internal/dom/MIDIMessageEvent.hx` | `dynamic-stub` | 8 |
| `host:MIDIOutput` | `host` | `flight._internal.dom.MIDIOutput` | `src/flight/_internal/dom/MIDIOutput.hx` | `dynamic-stub` | 11 |
| `host:MIDIOutputMap` | `host` | `flight._internal.dom.MIDIOutputMap` | `src/flight/_internal/dom/MIDIOutputMap.hx` | `dynamic-stub` | 1 |
| `host:MIDIPort` | `host` | `flight._internal.dom.MIDIPort` | `src/flight/_internal/dom/MIDIPort.hx` | `dynamic-stub` | 6 |
| `host:MouseEvent` | `host` | `flight._internal.dom.MouseEvent` | `src/flight/_internal/dom/MouseEvent.hx` | `dynamic-stub` | 8 |
| `host:Navigator` | `host` | `flight._internal.dom.Navigator` | `src/flight/_internal/dom/Navigator.hx` | `dynamic-stub` | 87 |
| `host:Node` | `host` | `flight._internal.dom.Node` | `src/flight/_internal/dom/Node.hx` | `dynamic-stub` | 5 |
| `host:NodeListOf` | `host` | `flight._internal.dom.NodeListOf` | `src/flight/_internal/dom/NodeListOf.hx` | `dynamic-stub` | 2 |
| `host:OES_texture_float_linear` | `host` | `flight._internal.dom.OES_texture_float_linear` | `src/flight/_internal/dom/OES_texture_float_linear.hx` | `dynamic-stub` | 1 |
| `host:OffscreenCanvas` | `host` | `flight._internal.dom.OffscreenCanvas` | `src/flight/_internal/dom/OffscreenCanvas.hx` | `dynamic-stub` | 67 |
| `host:OffscreenCanvasRenderingContext2D` | `host` | `flight._internal.dom.OffscreenCanvasRenderingContext2D` | `src/flight/_internal/dom/OffscreenCanvasRenderingContext2D.hx` | `dynamic-stub` | 25 |
| `host:ParentNode` | `host` | `flight._internal.dom.ParentNode` | `src/flight/_internal/dom/ParentNode.hx` | `dynamic-stub` | 4 |
| `host:Performance` | `host` | `flight._internal.dom.Performance` | `src/flight/_internal/dom/Performance.hx` | `typed` | 12 |
| `host:PerformanceNavigationTiming` | `host` | `flight._internal.dom.PerformanceNavigationTiming` | `src/flight/_internal/dom/PerformanceNavigationTiming.hx` | `typed` | 4 |
| `host:PermissionDescriptor` | `host` | `flight._internal.dom.PermissionDescriptor` | `src/flight/_internal/dom/PermissionDescriptor.hx` | `dynamic-stub` | 4 |
| `host:PermissionName` | `host` | `flight._internal.dom.PermissionName` | `src/flight/_internal/dom/PermissionName.hx` | `dynamic-stub` | 5 |
| `host:Permissions` | `host` | `flight._internal.dom.Permissions` | `src/flight/_internal/dom/Permissions.hx` | `dynamic-stub` | 25 |
| `host:PermissionStatus` | `host` | `flight._internal.dom.PermissionStatus` | `src/flight/_internal/dom/PermissionStatus.hx` | `dynamic-stub` | 27 |
| `host:PointerEvent` | `host` | `flight._internal.dom.PointerEvent` | `src/flight/_internal/dom/PointerEvent.hx` | `dynamic-stub` | 42 |
| `host:PositionOptions` | `host` | `flight._internal.dom.PositionOptions` | `src/flight/_internal/dom/PositionOptions.hx` | `dynamic-stub` | 2 |
| `host:Process` | `host` | `flight._internal.dom.Process` | `src/flight/_internal/dom/Process.hx` | `typed` | 1 |
| `host:ProgressEvent` | `host` | `flight._internal.dom.ProgressEvent` | `src/flight/_internal/dom/ProgressEvent.hx` | `typed` | 6 |
| `host:ReadableStream` | `host` | `flight._internal.dom.ReadableStream` | `src/flight/_internal/dom/ReadableStream.hx` | `dynamic-stub` | 12 |
| `host:ReadableStreamDefaultReader` | `host` | `flight._internal.dom.ReadableStreamDefaultReader` | `src/flight/_internal/dom/ReadableStreamDefaultReader.hx` | `dynamic-stub` | 2 |
| `host:RequestInit` | `host` | `flight._internal.dom.RequestInit` | `src/flight/_internal/dom/RequestInit.hx` | `dynamic-stub` | 7 |
| `host:ResizeObserver` | `host` | `flight._internal.dom.ResizeObserver` | `src/flight/_internal/dom/ResizeObserver.hx` | `dynamic-stub` | 7 |
| `host:ResizeObserverEntry` | `host` | `flight._internal.dom.ResizeObserverEntry` | `src/flight/_internal/dom/ResizeObserverEntry.hx` | `dynamic-stub` | 5 |
| `host:Response` | `host` | `flight._internal.dom.Response` | `src/flight/_internal/dom/Response.hx` | `dynamic-stub` | 26 |
| `host:Screen` | `host` | `flight._internal.dom.Screen` | `src/flight/_internal/dom/Screen.hx` | `dynamic-stub` | 23 |
| `host:ScreenOrientation` | `host` | `flight._internal.dom.ScreenOrientation` | `src/flight/_internal/dom/ScreenOrientation.hx` | `dynamic-stub` | 4 |
| `host:ShareData` | `host` | `flight._internal.dom.ShareData` | `src/flight/_internal/dom/ShareData.hx` | `dynamic-stub` | 14 |
| `host:StereoPannerNode` | `host` | `flight._internal.dom.StereoPannerNode` | `src/flight/_internal/dom/StereoPannerNode.hx` | `dynamic-stub` | 11 |
| `host:Storage` | `host` | `flight._internal.dom.Storage` | `src/flight/_internal/dom/Storage.hx` | `dynamic-stub` | 14 |
| `host:StorageEstimate` | `host` | `flight._internal.dom.StorageEstimate` | `src/flight/_internal/dom/StorageEstimate.hx` | `dynamic-stub` | 4 |
| `host:StorageEvent` | `host` | `flight._internal.dom.StorageEvent` | `src/flight/_internal/dom/StorageEvent.hx` | `dynamic-stub` | 8 |
| `host:StorageManager` | `host` | `flight._internal.dom.StorageManager` | `src/flight/_internal/dom/StorageManager.hx` | `dynamic-stub` | 11 |
| `host:SVGImageElement` | `host` | `flight._internal.dom.SVGImageElement` | `src/flight/_internal/dom/SVGImageElement.hx` | `dynamic-stub` | 41 |
| `host:TexImageSource` | `host` | `flight._internal.dom.TexImageSource` | `src/flight/_internal/dom/TexImageSource.hx` | `dynamic-stub` | 5 |
| `host:Text` | `host` | `flight._internal.dom.Text` | `src/flight/_internal/dom/Text.hx` | `dynamic-stub` | 2 |
| `host:TextDecoder` | `host` | `flight._internal.dom.TextDecoder` | `src/flight/_internal/dom/TextDecoder.hx` | `dynamic-stub` | 16 |
| `host:TextEncoder` | `host` | `flight._internal.dom.TextEncoder` | `src/flight/_internal/dom/TextEncoder.hx` | `typed` | 2 |
| `host:TextMetrics` | `host` | `flight._internal.dom.TextMetrics` | `src/flight/_internal/dom/TextMetrics.hx` | `dynamic-stub` | 37 |
| `host:Timeout` | `host` | `flight._internal.dom.Timeout` | `src/flight/_internal/dom/Timeout.hx` | `dynamic-stub` | 36 |
| `host:URL` | `host` | `flight._internal.dom.URL` | `src/flight/_internal/dom/URL.hx` | `dynamic-stub` | 4 |
| `host:URLSearchParams` | `host` | `flight._internal.dom.URLSearchParams` | `src/flight/_internal/dom/URLSearchParams.hx` | `dynamic-stub` | 3 |
| `host:VideoFrame` | `host` | `flight._internal.dom.VideoFrame` | `src/flight/_internal/dom/VideoFrame.hx` | `dynamic-stub` | 54 |
| `host:VisualViewport` | `host` | `flight._internal.dom.VisualViewport` | `src/flight/_internal/dom/VisualViewport.hx` | `dynamic-stub` | 8 |
| `host:WakeLock` | `host` | `flight._internal.dom.WakeLock` | `src/flight/_internal/dom/WakeLock.hx` | `dynamic-stub` | 2 |
| `host:WakeLockSentinel` | `host` | `flight._internal.dom.WakeLockSentinel` | `src/flight/_internal/dom/WakeLockSentinel.hx` | `dynamic-stub` | 2 |
| `host:WEBGL_compressed_texture_astc` | `host` | `flight._internal.dom.WEBGL_compressed_texture_astc` | `src/flight/_internal/dom/WEBGL_compressed_texture_astc.hx` | `dynamic-stub` | 1 |
| `host:WEBGL_compressed_texture_etc` | `host` | `flight._internal.dom.WEBGL_compressed_texture_etc` | `src/flight/_internal/dom/WEBGL_compressed_texture_etc.hx` | `dynamic-stub` | 1 |
| `host:WEBGL_compressed_texture_pvrtc` | `host` | `flight._internal.dom.WEBGL_compressed_texture_pvrtc` | `src/flight/_internal/dom/WEBGL_compressed_texture_pvrtc.hx` | `dynamic-stub` | 1 |
| `host:WEBGL_compressed_texture_s3tc` | `host` | `flight._internal.dom.WEBGL_compressed_texture_s3tc` | `src/flight/_internal/dom/WEBGL_compressed_texture_s3tc.hx` | `dynamic-stub` | 1 |
| `host:WEBGL_compressed_texture_s3tc_srgb` | `host` | `flight._internal.dom.WEBGL_compressed_texture_s3tc_srgb` | `src/flight/_internal/dom/WEBGL_compressed_texture_s3tc_srgb.hx` | `dynamic-stub` | 1 |
| `host:WEBGL_debug_renderer_info` | `host` | `flight._internal.dom.WEBGL_debug_renderer_info` | `src/flight/_internal/dom/WEBGL_debug_renderer_info.hx` | `dynamic-stub` | 4 |
| `host:WebGL2RenderingContext` | `host` | `flight._internal.dom.WebGL2RenderingContext` | `src/flight/_internal/dom/WebGL2RenderingContext.hx` | `dynamic-stub` | 2 |
| `host:WebGLActiveInfo` | `host` | `flight._internal.dom.WebGLActiveInfo` | `src/flight/_internal/dom/WebGLActiveInfo.hx` | `dynamic-stub` | 8 |
| `host:WebGLBuffer` | `host` | `flight._internal.dom.WebGLBuffer` | `src/flight/_internal/dom/WebGLBuffer.hx` | `dynamic-stub` | 67 |
| `host:WebGLContextAttributes` | `host` | `flight._internal.dom.WebGLContextAttributes` | `src/flight/_internal/dom/WebGLContextAttributes.hx` | `dynamic-stub` | 1 |
| `host:WebGLFramebuffer` | `host` | `flight._internal.dom.WebGLFramebuffer` | `src/flight/_internal/dom/WebGLFramebuffer.hx` | `dynamic-stub` | 45 |
| `host:WebGLPowerPreference` | `host` | `flight._internal.dom.WebGLPowerPreference` | `src/flight/_internal/dom/WebGLPowerPreference.hx` | `dynamic-stub` | 1 |
| `host:WebGLProgram` | `host` | `flight._internal.dom.WebGLProgram` | `src/flight/_internal/dom/WebGLProgram.hx` | `dynamic-stub` | 252 |
| `host:WebGLRenderbuffer` | `host` | `flight._internal.dom.WebGLRenderbuffer` | `src/flight/_internal/dom/WebGLRenderbuffer.hx` | `dynamic-stub` | 11 |
| `host:WebGLRenderingContext` | `host` | `flight._internal.dom.WebGLRenderingContext` | `src/flight/_internal/dom/WebGLRenderingContext.hx` | `dynamic-stub` | 8 |
| `host:WebGLShader` | `host` | `flight._internal.dom.WebGLShader` | `src/flight/_internal/dom/WebGLShader.hx` | `dynamic-stub` | 4 |
| `host:WebGLTexture` | `host` | `flight._internal.dom.WebGLTexture` | `src/flight/_internal/dom/WebGLTexture.hx` | `dynamic-stub` | 422 |
| `host:WebGLUniformLocation` | `host` | `flight._internal.dom.WebGLUniformLocation` | `src/flight/_internal/dom/WebGLUniformLocation.hx` | `dynamic-stub` | 375 |
| `host:WebGLVertexArrayObject` | `host` | `flight._internal.dom.WebGLVertexArrayObject` | `src/flight/_internal/dom/WebGLVertexArrayObject.hx` | `dynamic-stub` | 34 |
| `host:WebSocket` | `host` | `flight._internal.dom.WebSocket` | `src/flight/_internal/dom/WebSocket.hx` | `dynamic-stub` | 9 |
| `host:WheelEvent` | `host` | `flight._internal.dom.WheelEvent` | `src/flight/_internal/dom/WheelEvent.hx` | `dynamic-stub` | 9 |
| `host:Window` | `host` | `flight._internal.dom.Window` | `src/flight/_internal/dom/Window.hx` | `dynamic-stub` | 145 |
| `host:WritableStream` | `host` | `flight._internal.dom.WritableStream` | `src/flight/_internal/dom/WritableStream.hx` | `dynamic-stub` | 11 |
| `host:WritableStreamDefaultWriter` | `host` | `flight._internal.dom.WritableStreamDefaultWriter` | `src/flight/_internal/dom/WritableStreamDefaultWriter.hx` | `dynamic-stub` | 4 |

## Ambient values

| Key | Provider | Coverage | Uses |
| --- | --- | --- | ---: |
| `global:AbortController` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 10 |
| `global:AbortSignal` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 3 |
| `global:ArrayBuffer` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 14 |
| `global:atob` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 4 |
| `global:Audio` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 1 |
| `global:AudioBuffer` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 2 |
| `global:AudioContext` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 1 |
| `global:Blob` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 4 |
| `global:btoa` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 1 |
| `global:cancelAnimationFrame` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 2 |
| `global:ClipboardItem` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 4 |
| `global:console` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 6 |
| `global:createImageBitmap` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 1 |
| `global:crypto` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 3 |
| `global:DataView` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 49 |
| `global:Date` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 16 |
| `global:decodeURIComponent` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 2 |
| `global:DeviceMotionEvent` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 7 |
| `global:document` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 27 |
| `global:DOMException` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 15 |
| `global:encodeURIComponent` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 2 |
| `global:fetch` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 5 |
| `global:File` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 1 |
| `global:FileReader` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 4 |
| `global:Float32Array` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 2 |
| `global:FontFace` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 1 |
| `global:getComputedStyle` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 1 |
| `global:globalThis` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 7 |
| `global:HTMLCanvasElement` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 10 |
| `global:HTMLImageElement` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 4 |
| `global:HTMLVideoElement` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 5 |
| `global:Image` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 1 |
| `global:ImageBitmap` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 3 |
| `global:ImageData` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 1 |
| `global:Intl` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 11 |
| `global:isNaN` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 12 |
| `global:KeyboardEvent` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 5 |
| `global:localStorage` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 4 |
| `global:location` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 7 |
| `global:Map` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 359 |
| `global:matchMedia` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 6 |
| `global:MediaMetadata` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 2 |
| `global:navigator` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 29 |
| `global:Number` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 782 |
| `global:OffscreenCanvas` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 10 |
| `global:parseFloat` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 84 |
| `global:parseInt` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 38 |
| `global:performance` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 9 |
| `global:process` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 2 |
| `global:Proxy` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 3 |
| `global:RegExp` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 5 |
| `global:requestAnimationFrame` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 3 |
| `global:ResizeObserver` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 4 |
| `global:screen` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 5 |
| `global:Set` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 156 |
| `global:setInterval` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 1 |
| `global:SharedArrayBuffer` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 4 |
| `global:structuredClone` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 3 |
| `global:TextDecoder` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 8 |
| `global:TextEncoder` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 1 |
| `global:Uint32Array` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 1 |
| `global:Uint8Array` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 5 |
| `global:URL` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 8 |
| `global:URLSearchParams` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 1 |
| `global:VideoFrame` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 2 |
| `global:WeakMap` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 221 |
| `global:WeakSet` | `src/flight/_internal/_HostValueLut.hx` | `portable` | 20 |
| `global:WebSocket` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 4 |
| `global:WheelEvent` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 3 |
| `global:window` | `src/flight/_internal/_HostValueLut.hx` | `js-only` | 47 |

## External module values

| Key | Specifier | Imported binding | Coverage | Uses |
| --- | --- | --- | --- | ---: |
