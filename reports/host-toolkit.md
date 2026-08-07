# Host Toolkit Dependency Audit

Upstream commit: `cad72aa3ea4e6e76a050918a403dcb10efdfcb0d`

Generated code owns checker-known source types and stable lookup keys. Maintained source owns the declarations, target values, and adapters behind those keys. Generation fails when a referenced key has no declared toolkit provider; Dynamic compatibility declarations remain visible as toolkit debt rather than changing the generated type or member expression.

| Metric | Count |
| --- | ---: |
| Host type keys | 218 |
| External type keys | 4 |
| Dynamic compatibility type entries | 218 |
| Global value keys | 68 |
| Portable global value keys | 15 |
| JavaScript-only global value keys | 53 |
| Module value keys | 0 |
| Type uses | 9128 |
| Value uses | 1562 |
| Missing toolkit entries | 0 |

## Types

| Key | Kind | Emitted Haxe type | Provider | Coverage | Uses |
| --- | --- | --- | --- | --- | ---: |
| `external:GLenum` | `external` | `flighthq._internal.WebExterns.GLenum` | `src/flighthq/_internal/WebExterns.hx` | `typed` | 1 |
| `external:WgpuRichTextData` | `external` | `flighthq._internal.WebExterns.WgpuRichTextData` | `src/flighthq/_internal/WebExterns.hx` | `dynamic-stub` | 1 |
| `external:WgpuScale9ShapeData` | `external` | `flighthq._internal.WebExterns.WgpuScale9ShapeData` | `src/flighthq/_internal/WebExterns.hx` | `dynamic-stub` | 1 |
| `external:WgpuTextLabelData` | `external` | `flighthq._internal.WebExterns.WgpuTextLabelData` | `src/flighthq/_internal/WebExterns.hx` | `dynamic-stub` | 1 |
| `host:AbortController` | `host` | `flighthq._internal.dom.AbortController` | `src/flighthq/_internal/dom/AbortController.hx` | `dynamic-stub` | 37 |
| `host:AbortSignal` | `host` | `flighthq._internal.dom.AbortSignal` | `src/flighthq/_internal/dom/AbortSignal.hx` | `dynamic-stub` | 110 |
| `host:AudioBuffer` | `host` | `flighthq._internal.dom.AudioBuffer` | `src/flighthq/_internal/dom/AudioBuffer.hx` | `typed` | 23 |
| `host:AudioBufferSourceNode` | `host` | `flighthq._internal.dom.AudioBufferSourceNode` | `src/flighthq/_internal/dom/AudioBufferSourceNode.hx` | `dynamic-stub` | 13 |
| `host:AudioContext` | `host` | `flighthq._internal.dom.AudioContext` | `src/flighthq/_internal/dom/AudioContext.hx` | `dynamic-stub` | 35 |
| `host:AudioDestinationNode` | `host` | `flighthq._internal.dom.AudioDestinationNode` | `src/flighthq/_internal/dom/AudioDestinationNode.hx` | `dynamic-stub` | 2 |
| `host:AudioNode` | `host` | `flighthq._internal.dom.AudioNode` | `src/flighthq/_internal/dom/AudioNode.hx` | `dynamic-stub` | 7 |
| `host:AudioParam` | `host` | `flighthq._internal.dom.AudioParam` | `src/flighthq/_internal/dom/AudioParam.hx` | `dynamic-stub` | 21 |
| `host:BeforeUnloadEvent` | `host` | `flighthq._internal.dom.BeforeUnloadEvent` | `src/flighthq/_internal/dom/BeforeUnloadEvent.hx` | `dynamic-stub` | 5 |
| `host:Blob` | `host` | `flighthq._internal.dom.Blob` | `src/flighthq/_internal/dom/Blob.hx` | `dynamic-stub` | 36 |
| `host:BodyInit` | `host` | `flighthq._internal.dom.BodyInit` | `src/flighthq/_internal/dom/BodyInit.hx` | `dynamic-stub` | 1 |
| `host:BufferSource` | `host` | `flighthq._internal.dom.BufferSource` | `src/flighthq/_internal/dom/BufferSource.hx` | `dynamic-stub` | 1 |
| `host:CanvasFillRule` | `host` | `flighthq._internal.dom.CanvasFillRule` | `src/flighthq/_internal/dom/CanvasFillRule.hx` | `dynamic-stub` | 1 |
| `host:CanvasGradient` | `host` | `flighthq._internal.dom.CanvasGradient` | `src/flighthq/_internal/dom/CanvasGradient.hx` | `typed` | 36 |
| `host:CanvasImageSource` | `host` | `flighthq._internal.dom.CanvasImageSource` | `src/flighthq/_internal/dom/CanvasImageSource.hx` | `dynamic-stub` | 23 |
| `host:CanvasLineCap` | `host` | `flighthq._internal.dom.CanvasLineCap` | `src/flighthq/_internal/dom/CanvasLineCap.hx` | `dynamic-stub` | 1 |
| `host:CanvasLineJoin` | `host` | `flighthq._internal.dom.CanvasLineJoin` | `src/flighthq/_internal/dom/CanvasLineJoin.hx` | `dynamic-stub` | 1 |
| `host:CanvasPattern` | `host` | `flighthq._internal.dom.CanvasPattern` | `src/flighthq/_internal/dom/CanvasPattern.hx` | `dynamic-stub` | 28 |
| `host:CanvasRenderingContext2D` | `host` | `flighthq._internal.dom.CanvasRenderingContext2D` | `src/flighthq/_internal/dom/CanvasRenderingContext2D.hx` | `dynamic-stub` | 599 |
| `host:CanvasRenderingContext2DSettings` | `host` | `flighthq._internal.dom.CanvasRenderingContext2DSettings` | `src/flighthq/_internal/dom/CanvasRenderingContext2DSettings.hx` | `dynamic-stub` | 5 |
| `host:ChildNode` | `host` | `flighthq._internal.dom.ChildNode` | `src/flighthq/_internal/dom/ChildNode.hx` | `dynamic-stub` | 8 |
| `host:Clipboard` | `host` | `flighthq._internal.dom.Clipboard` | `src/flighthq/_internal/dom/Clipboard.hx` | `dynamic-stub` | 20 |
| `host:ClipboardItem` | `host` | `flighthq._internal.dom.ClipboardItem` | `src/flighthq/_internal/dom/ClipboardItem.hx` | `dynamic-stub` | 8 |
| `host:CloseEvent` | `host` | `flighthq._internal.dom.CloseEvent` | `src/flighthq/_internal/dom/CloseEvent.hx` | `dynamic-stub` | 6 |
| `host:CompositionEvent` | `host` | `flighthq._internal.dom.CompositionEvent` | `src/flighthq/_internal/dom/CompositionEvent.hx` | `dynamic-stub` | 3 |
| `host:Console` | `host` | `flighthq._internal.dom.Console` | `src/flighthq/_internal/dom/Console.hx` | `dynamic-stub` | 2 |
| `host:Crypto` | `host` | `flighthq._internal.dom.Crypto` | `src/flighthq/_internal/dom/Crypto.hx` | `dynamic-stub` | 3 |
| `host:CSSStyleDeclaration` | `host` | `flighthq._internal.dom.CSSStyleDeclaration` | `src/flighthq/_internal/dom/CSSStyleDeclaration.hx` | `dynamic-stub` | 157 |
| `host:CustomEvent` | `host` | `flighthq._internal.dom.CustomEvent` | `src/flighthq/_internal/dom/CustomEvent.hx` | `dynamic-stub` | 2 |
| `host:DataTransfer` | `host` | `flighthq._internal.dom.DataTransfer` | `src/flighthq/_internal/dom/DataTransfer.hx` | `dynamic-stub` | 2 |
| `host:Document` | `host` | `flighthq._internal.dom.Document` | `src/flighthq/_internal/dom/Document.hx` | `dynamic-stub` | 162 |
| `host:DOMException` | `host` | `flighthq._internal.dom.DOMException` | `src/flighthq/_internal/dom/DOMException.hx` | `dynamic-stub` | 6 |
| `host:DOMRect` | `host` | `flighthq._internal.dom.DOMRect` | `src/flighthq/_internal/dom/DOMRect.hx` | `dynamic-stub` | 17 |
| `host:DOMRectReadOnly` | `host` | `flighthq._internal.dom.DOMRectReadOnly` | `src/flighthq/_internal/dom/DOMRectReadOnly.hx` | `dynamic-stub` | 3 |
| `host:DOMStringMap` | `host` | `flighthq._internal.dom.DOMStringMap` | `src/flighthq/_internal/dom/DOMStringMap.hx` | `dynamic-stub` | 1 |
| `host:DragEvent` | `host` | `flighthq._internal.dom.DragEvent` | `src/flighthq/_internal/dom/DragEvent.hx` | `dynamic-stub` | 8 |
| `host:Element` | `host` | `flighthq._internal.dom.Element` | `src/flighthq/_internal/dom/Element.hx` | `dynamic-stub` | 10 |
| `host:Event` | `host` | `flighthq._internal.dom.Event` | `src/flighthq/_internal/dom/Event.hx` | `dynamic-stub` | 41 |
| `host:EventListener` | `host` | `flighthq._internal.dom.EventListener` | `src/flighthq/_internal/dom/EventListener.hx` | `dynamic-stub` | 12 |
| `host:EventTarget` | `host` | `flighthq._internal.dom.EventTarget` | `src/flighthq/_internal/dom/EventTarget.hx` | `dynamic-stub` | 13 |
| `host:EXT_color_buffer_float` | `host` | `flighthq._internal.dom.EXT_color_buffer_float` | `src/flighthq/_internal/dom/EXT_color_buffer_float.hx` | `dynamic-stub` | 2 |
| `host:EXT_texture_compression_bptc` | `host` | `flighthq._internal.dom.EXT_texture_compression_bptc` | `src/flighthq/_internal/dom/EXT_texture_compression_bptc.hx` | `dynamic-stub` | 1 |
| `host:EXT_texture_compression_rgtc` | `host` | `flighthq._internal.dom.EXT_texture_compression_rgtc` | `src/flighthq/_internal/dom/EXT_texture_compression_rgtc.hx` | `dynamic-stub` | 1 |
| `host:EXT_texture_filter_anisotropic` | `host` | `flighthq._internal.dom.EXT_texture_filter_anisotropic` | `src/flighthq/_internal/dom/EXT_texture_filter_anisotropic.hx` | `dynamic-stub` | 9 |
| `host:File` | `host` | `flighthq._internal.dom.File` | `src/flighthq/_internal/dom/File.hx` | `dynamic-stub` | 35 |
| `host:FileList` | `host` | `flighthq._internal.dom.FileList` | `src/flighthq/_internal/dom/FileList.hx` | `dynamic-stub` | 8 |
| `host:FileReader` | `host` | `flighthq._internal.dom.FileReader` | `src/flighthq/_internal/dom/FileReader.hx` | `dynamic-stub` | 17 |
| `host:FileSystemDirectoryHandle` | `host` | `flighthq._internal.dom.FileSystemDirectoryHandle` | `src/flighthq/_internal/dom/FileSystemDirectoryHandle.hx` | `dynamic-stub` | 20 |
| `host:FileSystemFileHandle` | `host` | `flighthq._internal.dom.FileSystemFileHandle` | `src/flighthq/_internal/dom/FileSystemFileHandle.hx` | `dynamic-stub` | 23 |
| `host:FileSystemWritableFileStream` | `host` | `flighthq._internal.dom.FileSystemWritableFileStream` | `src/flighthq/_internal/dom/FileSystemWritableFileStream.hx` | `dynamic-stub` | 5 |
| `host:FileSystemWriteChunkType` | `host` | `flighthq._internal.dom.FileSystemWriteChunkType` | `src/flighthq/_internal/dom/FileSystemWriteChunkType.hx` | `dynamic-stub` | 1 |
| `host:FontFace` | `host` | `flighthq._internal.dom.FontFace` | `src/flighthq/_internal/dom/FontFace.hx` | `dynamic-stub` | 20 |
| `host:FontFaceSet` | `host` | `flighthq._internal.dom.FontFaceSet` | `src/flighthq/_internal/dom/FontFaceSet.hx` | `dynamic-stub` | 7 |
| `host:FormData` | `host` | `flighthq._internal.dom.FormData` | `src/flighthq/_internal/dom/FormData.hx` | `dynamic-stub` | 1 |
| `host:GainNode` | `host` | `flighthq._internal.dom.GainNode` | `src/flighthq/_internal/dom/GainNode.hx` | `dynamic-stub` | 34 |
| `host:Gamepad` | `host` | `flighthq._internal.dom.Gamepad` | `src/flighthq/_internal/dom/Gamepad.hx` | `dynamic-stub` | 26 |
| `host:GamepadButton` | `host` | `flighthq._internal.dom.GamepadButton` | `src/flighthq/_internal/dom/GamepadButton.hx` | `dynamic-stub` | 8 |
| `host:GamepadEvent` | `host` | `flighthq._internal.dom.GamepadEvent` | `src/flighthq/_internal/dom/GamepadEvent.hx` | `dynamic-stub` | 4 |
| `host:Geolocation` | `host` | `flighthq._internal.dom.Geolocation` | `src/flighthq/_internal/dom/Geolocation.hx` | `dynamic-stub` | 16 |
| `host:GeolocationCoordinates` | `host` | `flighthq._internal.dom.GeolocationCoordinates` | `src/flighthq/_internal/dom/GeolocationCoordinates.hx` | `dynamic-stub` | 8 |
| `host:GeolocationPosition` | `host` | `flighthq._internal.dom.GeolocationPosition` | `src/flighthq/_internal/dom/GeolocationPosition.hx` | `dynamic-stub` | 8 |
| `host:GeolocationPositionError` | `host` | `flighthq._internal.dom.GeolocationPositionError` | `src/flighthq/_internal/dom/GeolocationPositionError.hx` | `dynamic-stub` | 5 |
| `host:GlobalCompositeOperation` | `host` | `flighthq._internal.dom.GlobalCompositeOperation` | `src/flighthq/_internal/dom/GlobalCompositeOperation.hx` | `dynamic-stub` | 8 |
| `host:GPU` | `host` | `flighthq._internal.dom.GPU` | `src/flighthq/_internal/dom/GPU.hx` | `dynamic-stub` | 5 |
| `host:GPUAdapter` | `host` | `flighthq._internal.dom.GPUAdapter` | `src/flighthq/_internal/dom/GPUAdapter.hx` | `dynamic-stub` | 15 |
| `host:GPUBindGroup` | `host` | `flighthq._internal.dom.GPUBindGroup` | `src/flighthq/_internal/dom/GPUBindGroup.hx` | `dynamic-stub` | 137 |
| `host:GPUBindGroupEntry` | `host` | `flighthq._internal.dom.GPUBindGroupEntry` | `src/flighthq/_internal/dom/GPUBindGroupEntry.hx` | `dynamic-stub` | 9 |
| `host:GPUBindGroupLayout` | `host` | `flighthq._internal.dom.GPUBindGroupLayout` | `src/flighthq/_internal/dom/GPUBindGroupLayout.hx` | `dynamic-stub` | 130 |
| `host:GPUBindGroupLayoutEntry` | `host` | `flighthq._internal.dom.GPUBindGroupLayoutEntry` | `src/flighthq/_internal/dom/GPUBindGroupLayoutEntry.hx` | `dynamic-stub` | 6 |
| `host:GPUBlendComponent` | `host` | `flighthq._internal.dom.GPUBlendComponent` | `src/flighthq/_internal/dom/GPUBlendComponent.hx` | `dynamic-stub` | 1 |
| `host:GPUBlendFactor` | `host` | `flighthq._internal.dom.GPUBlendFactor` | `src/flighthq/_internal/dom/GPUBlendFactor.hx` | `dynamic-stub` | 2 |
| `host:GPUBlendOperation` | `host` | `flighthq._internal.dom.GPUBlendOperation` | `src/flighthq/_internal/dom/GPUBlendOperation.hx` | `dynamic-stub` | 1 |
| `host:GPUBlendState` | `host` | `flighthq._internal.dom.GPUBlendState` | `src/flighthq/_internal/dom/GPUBlendState.hx` | `dynamic-stub` | 22 |
| `host:GPUBuffer` | `host` | `flighthq._internal.dom.GPUBuffer` | `src/flighthq/_internal/dom/GPUBuffer.hx` | `dynamic-stub` | 133 |
| `host:GPUBufferBinding` | `host` | `flighthq._internal.dom.GPUBufferBinding` | `src/flighthq/_internal/dom/GPUBufferBinding.hx` | `dynamic-stub` | 10 |
| `host:GPUBufferUsage` | `host` | `flighthq._internal.dom.GPUBufferUsage` | `src/flighthq/_internal/dom/GPUBufferUsage.hx` | `dynamic-stub` | 72 |
| `host:GPUCanvasContext` | `host` | `flighthq._internal.dom.GPUCanvasContext` | `src/flighthq/_internal/dom/GPUCanvasContext.hx` | `dynamic-stub` | 13 |
| `host:GPUColor` | `host` | `flighthq._internal.dom.GPUColor` | `src/flighthq/_internal/dom/GPUColor.hx` | `dynamic-stub` | 4 |
| `host:GPUColorDict` | `host` | `flighthq._internal.dom.GPUColorDict` | `src/flighthq/_internal/dom/GPUColorDict.hx` | `dynamic-stub` | 2 |
| `host:GPUColorWrite` | `host` | `flighthq._internal.dom.GPUColorWrite` | `src/flighthq/_internal/dom/GPUColorWrite.hx` | `dynamic-stub` | 2 |
| `host:GPUCommandBuffer` | `host` | `flighthq._internal.dom.GPUCommandBuffer` | `src/flighthq/_internal/dom/GPUCommandBuffer.hx` | `dynamic-stub` | 5 |
| `host:GPUCommandEncoder` | `host` | `flighthq._internal.dom.GPUCommandEncoder` | `src/flighthq/_internal/dom/GPUCommandEncoder.hx` | `dynamic-stub` | 34 |
| `host:GPUCopyExternalImageDestInfo` | `host` | `flighthq._internal.dom.GPUCopyExternalImageDestInfo` | `src/flighthq/_internal/dom/GPUCopyExternalImageDestInfo.hx` | `dynamic-stub` | 3 |
| `host:GPUCopyExternalImageSource` | `host` | `flighthq._internal.dom.GPUCopyExternalImageSource` | `src/flighthq/_internal/dom/GPUCopyExternalImageSource.hx` | `dynamic-stub` | 8 |
| `host:GPUCopyExternalImageSourceInfo` | `host` | `flighthq._internal.dom.GPUCopyExternalImageSourceInfo` | `src/flighthq/_internal/dom/GPUCopyExternalImageSourceInfo.hx` | `dynamic-stub` | 4 |
| `host:GPUDevice` | `host` | `flighthq._internal.dom.GPUDevice` | `src/flighthq/_internal/dom/GPUDevice.hx` | `dynamic-stub` | 379 |
| `host:GPUDeviceDescriptor` | `host` | `flighthq._internal.dom.GPUDeviceDescriptor` | `src/flighthq/_internal/dom/GPUDeviceDescriptor.hx` | `dynamic-stub` | 4 |
| `host:GPUDeviceLostInfo` | `host` | `flighthq._internal.dom.GPUDeviceLostInfo` | `src/flighthq/_internal/dom/GPUDeviceLostInfo.hx` | `dynamic-stub` | 1 |
| `host:GPUExternalTexture` | `host` | `flighthq._internal.dom.GPUExternalTexture` | `src/flighthq/_internal/dom/GPUExternalTexture.hx` | `dynamic-stub` | 10 |
| `host:GPUFeatureName` | `host` | `flighthq._internal.dom.GPUFeatureName` | `src/flighthq/_internal/dom/GPUFeatureName.hx` | `dynamic-stub` | 1 |
| `host:GPUFilterMode` | `host` | `flighthq._internal.dom.GPUFilterMode` | `src/flighthq/_internal/dom/GPUFilterMode.hx` | `dynamic-stub` | 14 |
| `host:GPUIndexFormat` | `host` | `flighthq._internal.dom.GPUIndexFormat` | `src/flighthq/_internal/dom/GPUIndexFormat.hx` | `dynamic-stub` | 2 |
| `host:GPULoadOp` | `host` | `flighthq._internal.dom.GPULoadOp` | `src/flighthq/_internal/dom/GPULoadOp.hx` | `dynamic-stub` | 6 |
| `host:GPUMapMode` | `host` | `flighthq._internal.dom.GPUMapMode` | `src/flighthq/_internal/dom/GPUMapMode.hx` | `dynamic-stub` | 1 |
| `host:GPUMipmapFilterMode` | `host` | `flighthq._internal.dom.GPUMipmapFilterMode` | `src/flighthq/_internal/dom/GPUMipmapFilterMode.hx` | `dynamic-stub` | 4 |
| `host:GPUOrigin3D` | `host` | `flighthq._internal.dom.GPUOrigin3D` | `src/flighthq/_internal/dom/GPUOrigin3D.hx` | `dynamic-stub` | 3 |
| `host:GPUOrigin3DDict` | `host` | `flighthq._internal.dom.GPUOrigin3DDict` | `src/flighthq/_internal/dom/GPUOrigin3DDict.hx` | `typed` | 2 |
| `host:GPUPipelineLayout` | `host` | `flighthq._internal.dom.GPUPipelineLayout` | `src/flighthq/_internal/dom/GPUPipelineLayout.hx` | `dynamic-stub` | 28 |
| `host:GPUPowerPreference` | `host` | `flighthq._internal.dom.GPUPowerPreference` | `src/flighthq/_internal/dom/GPUPowerPreference.hx` | `dynamic-stub` | 1 |
| `host:GPUPrimitiveTopology` | `host` | `flighthq._internal.dom.GPUPrimitiveTopology` | `src/flighthq/_internal/dom/GPUPrimitiveTopology.hx` | `dynamic-stub` | 1 |
| `host:GPUQueue` | `host` | `flighthq._internal.dom.GPUQueue` | `src/flighthq/_internal/dom/GPUQueue.hx` | `dynamic-stub` | 80 |
| `host:GPURenderPassEncoder` | `host` | `flighthq._internal.dom.GPURenderPassEncoder` | `src/flighthq/_internal/dom/GPURenderPassEncoder.hx` | `dynamic-stub` | 246 |
| `host:GPURenderPipeline` | `host` | `flighthq._internal.dom.GPURenderPipeline` | `src/flighthq/_internal/dom/GPURenderPipeline.hx` | `dynamic-stub` | 79 |
| `host:GPURenderPipelineDescriptor` | `host` | `flighthq._internal.dom.GPURenderPipelineDescriptor` | `src/flighthq/_internal/dom/GPURenderPipelineDescriptor.hx` | `dynamic-stub` | 4 |
| `host:GPUSampler` | `host` | `flighthq._internal.dom.GPUSampler` | `src/flighthq/_internal/dom/GPUSampler.hx` | `dynamic-stub` | 87 |
| `host:GPUSamplerDescriptor` | `host` | `flighthq._internal.dom.GPUSamplerDescriptor` | `src/flighthq/_internal/dom/GPUSamplerDescriptor.hx` | `dynamic-stub` | 4 |
| `host:GPUShaderModule` | `host` | `flighthq._internal.dom.GPUShaderModule` | `src/flighthq/_internal/dom/GPUShaderModule.hx` | `dynamic-stub` | 56 |
| `host:GPUShaderStage` | `host` | `flighthq._internal.dom.GPUShaderStage` | `src/flighthq/_internal/dom/GPUShaderStage.hx` | `dynamic-stub` | 103 |
| `host:GPUStencilFaceState` | `host` | `flighthq._internal.dom.GPUStencilFaceState` | `src/flighthq/_internal/dom/GPUStencilFaceState.hx` | `dynamic-stub` | 3 |
| `host:GPUStencilOperation` | `host` | `flighthq._internal.dom.GPUStencilOperation` | `src/flighthq/_internal/dom/GPUStencilOperation.hx` | `dynamic-stub` | 1 |
| `host:GPUSupportedFeatures` | `host` | `flighthq._internal.dom.GPUSupportedFeatures` | `src/flighthq/_internal/dom/GPUSupportedFeatures.hx` | `dynamic-stub` | 9 |
| `host:GPUSupportedLimits` | `host` | `flighthq._internal.dom.GPUSupportedLimits` | `src/flighthq/_internal/dom/GPUSupportedLimits.hx` | `dynamic-stub` | 10 |
| `host:GPUTexture` | `host` | `flighthq._internal.dom.GPUTexture` | `src/flighthq/_internal/dom/GPUTexture.hx` | `dynamic-stub` | 161 |
| `host:GPUTextureFormat` | `host` | `flighthq._internal.dom.GPUTextureFormat` | `src/flighthq/_internal/dom/GPUTextureFormat.hx` | `dynamic-stub` | 57 |
| `host:GPUTextureUsage` | `host` | `flighthq._internal.dom.GPUTextureUsage` | `src/flighthq/_internal/dom/GPUTextureUsage.hx` | `dynamic-stub` | 64 |
| `host:GPUTextureView` | `host` | `flighthq._internal.dom.GPUTextureView` | `src/flighthq/_internal/dom/GPUTextureView.hx` | `dynamic-stub` | 117 |
| `host:GPUVertexBufferLayout` | `host` | `flighthq._internal.dom.GPUVertexBufferLayout` | `src/flighthq/_internal/dom/GPUVertexBufferLayout.hx` | `dynamic-stub` | 8 |
| `host:Headers` | `host` | `flighthq._internal.dom.Headers` | `src/flighthq/_internal/dom/Headers.hx` | `dynamic-stub` | 8 |
| `host:HTMLAudioElement` | `host` | `flighthq._internal.dom.HTMLAudioElement` | `src/flighthq/_internal/dom/HTMLAudioElement.hx` | `dynamic-stub` | 2 |
| `host:HTMLCanvasElement` | `host` | `flighthq._internal.dom.HTMLCanvasElement` | `src/flighthq/_internal/dom/HTMLCanvasElement.hx` | `dynamic-stub` | 363 |
| `host:HTMLDivElement` | `host` | `flighthq._internal.dom.HTMLDivElement` | `src/flighthq/_internal/dom/HTMLDivElement.hx` | `dynamic-stub` | 37 |
| `host:HTMLElement` | `host` | `flighthq._internal.dom.HTMLElement` | `src/flighthq/_internal/dom/HTMLElement.hx` | `dynamic-stub` | 257 |
| `host:HTMLHeadElement` | `host` | `flighthq._internal.dom.HTMLHeadElement` | `src/flighthq/_internal/dom/HTMLHeadElement.hx` | `dynamic-stub` | 8 |
| `host:HTMLImageElement` | `host` | `flighthq._internal.dom.HTMLImageElement` | `src/flighthq/_internal/dom/HTMLImageElement.hx` | `dynamic-stub` | 56 |
| `host:HTMLInputElement` | `host` | `flighthq._internal.dom.HTMLInputElement` | `src/flighthq/_internal/dom/HTMLInputElement.hx` | `dynamic-stub` | 31 |
| `host:HTMLLIElement` | `host` | `flighthq._internal.dom.HTMLLIElement` | `src/flighthq/_internal/dom/HTMLLIElement.hx` | `dynamic-stub` | 22 |
| `host:HTMLLinkElement` | `host` | `flighthq._internal.dom.HTMLLinkElement` | `src/flighthq/_internal/dom/HTMLLinkElement.hx` | `dynamic-stub` | 5 |
| `host:HTMLMediaElement` | `host` | `flighthq._internal.dom.HTMLMediaElement` | `src/flighthq/_internal/dom/HTMLMediaElement.hx` | `dynamic-stub` | 1 |
| `host:HTMLSpanElement` | `host` | `flighthq._internal.dom.HTMLSpanElement` | `src/flighthq/_internal/dom/HTMLSpanElement.hx` | `dynamic-stub` | 15 |
| `host:HTMLStyleElement` | `host` | `flighthq._internal.dom.HTMLStyleElement` | `src/flighthq/_internal/dom/HTMLStyleElement.hx` | `dynamic-stub` | 3 |
| `host:HTMLUListElement` | `host` | `flighthq._internal.dom.HTMLUListElement` | `src/flighthq/_internal/dom/HTMLUListElement.hx` | `dynamic-stub` | 13 |
| `host:HTMLVideoElement` | `host` | `flighthq._internal.dom.HTMLVideoElement` | `src/flighthq/_internal/dom/HTMLVideoElement.hx` | `dynamic-stub` | 120 |
| `host:ImageBitmap` | `host` | `flighthq._internal.dom.ImageBitmap` | `src/flighthq/_internal/dom/ImageBitmap.hx` | `dynamic-stub` | 42 |
| `host:ImageData` | `host` | `flighthq._internal.dom.ImageData` | `src/flighthq/_internal/dom/ImageData.hx` | `dynamic-stub` | 27 |
| `host:ImageDataArray` | `host` | `flighthq._internal.dom.ImageDataArray` | `src/flighthq/_internal/dom/ImageDataArray.hx` | `dynamic-stub` | 2 |
| `host:ImageSmoothingQuality` | `host` | `flighthq._internal.dom.ImageSmoothingQuality` | `src/flighthq/_internal/dom/ImageSmoothingQuality.hx` | `dynamic-stub` | 2 |
| `host:InputEvent` | `host` | `flighthq._internal.dom.InputEvent` | `src/flighthq/_internal/dom/InputEvent.hx` | `dynamic-stub` | 4 |
| `host:KeyboardEvent` | `host` | `flighthq._internal.dom.KeyboardEvent` | `src/flighthq/_internal/dom/KeyboardEvent.hx` | `dynamic-stub` | 29 |
| `host:Location` | `host` | `flighthq._internal.dom.Location` | `src/flighthq/_internal/dom/Location.hx` | `dynamic-stub` | 8 |
| `host:MediaDevices` | `host` | `flighthq._internal.dom.MediaDevices` | `src/flighthq/_internal/dom/MediaDevices.hx` | `dynamic-stub` | 5 |
| `host:MediaMetadata` | `host` | `flighthq._internal.dom.MediaMetadata` | `src/flighthq/_internal/dom/MediaMetadata.hx` | `dynamic-stub` | 2 |
| `host:MediaQueryList` | `host` | `flighthq._internal.dom.MediaQueryList` | `src/flighthq/_internal/dom/MediaQueryList.hx` | `dynamic-stub` | 4 |
| `host:MediaSession` | `host` | `flighthq._internal.dom.MediaSession` | `src/flighthq/_internal/dom/MediaSession.hx` | `dynamic-stub` | 9 |
| `host:MediaSource` | `host` | `flighthq._internal.dom.MediaSource` | `src/flighthq/_internal/dom/MediaSource.hx` | `dynamic-stub` | 1 |
| `host:MediaStream` | `host` | `flighthq._internal.dom.MediaStream` | `src/flighthq/_internal/dom/MediaStream.hx` | `dynamic-stub` | 7 |
| `host:MediaStreamTrack` | `host` | `flighthq._internal.dom.MediaStreamTrack` | `src/flighthq/_internal/dom/MediaStreamTrack.hx` | `dynamic-stub` | 4 |
| `host:MessageEvent` | `host` | `flighthq._internal.dom.MessageEvent` | `src/flighthq/_internal/dom/MessageEvent.hx` | `dynamic-stub` | 4 |
| `host:MouseEvent` | `host` | `flighthq._internal.dom.MouseEvent` | `src/flighthq/_internal/dom/MouseEvent.hx` | `dynamic-stub` | 8 |
| `host:Navigator` | `host` | `flighthq._internal.dom.Navigator` | `src/flighthq/_internal/dom/Navigator.hx` | `dynamic-stub` | 91 |
| `host:Node` | `host` | `flighthq._internal.dom.Node` | `src/flighthq/_internal/dom/Node.hx` | `dynamic-stub` | 1 |
| `host:NodeListOf` | `host` | `flighthq._internal.dom.NodeListOf` | `src/flighthq/_internal/dom/NodeListOf.hx` | `dynamic-stub` | 2 |
| `host:Notification` | `host` | `flighthq._internal.dom.Notification` | `src/flighthq/_internal/dom/Notification.hx` | `dynamic-stub` | 10 |
| `host:NotificationOptions` | `host` | `flighthq._internal.dom.NotificationOptions` | `src/flighthq/_internal/dom/NotificationOptions.hx` | `dynamic-stub` | 4 |
| `host:NotificationPermission` | `host` | `flighthq._internal.dom.NotificationPermission` | `src/flighthq/_internal/dom/NotificationPermission.hx` | `dynamic-stub` | 1 |
| `host:OES_texture_float_linear` | `host` | `flighthq._internal.dom.OES_texture_float_linear` | `src/flighthq/_internal/dom/OES_texture_float_linear.hx` | `dynamic-stub` | 1 |
| `host:OffscreenCanvas` | `host` | `flighthq._internal.dom.OffscreenCanvas` | `src/flighthq/_internal/dom/OffscreenCanvas.hx` | `dynamic-stub` | 38 |
| `host:OffscreenCanvasRenderingContext2D` | `host` | `flighthq._internal.dom.OffscreenCanvasRenderingContext2D` | `src/flighthq/_internal/dom/OffscreenCanvasRenderingContext2D.hx` | `dynamic-stub` | 17 |
| `host:ParentNode` | `host` | `flighthq._internal.dom.ParentNode` | `src/flighthq/_internal/dom/ParentNode.hx` | `dynamic-stub` | 6 |
| `host:Performance` | `host` | `flighthq._internal.dom.Performance` | `src/flighthq/_internal/dom/Performance.hx` | `dynamic-stub` | 12 |
| `host:PerformanceNavigationTiming` | `host` | `flighthq._internal.dom.PerformanceNavigationTiming` | `src/flighthq/_internal/dom/PerformanceNavigationTiming.hx` | `dynamic-stub` | 4 |
| `host:PermissionDescriptor` | `host` | `flighthq._internal.dom.PermissionDescriptor` | `src/flighthq/_internal/dom/PermissionDescriptor.hx` | `dynamic-stub` | 2 |
| `host:PermissionName` | `host` | `flighthq._internal.dom.PermissionName` | `src/flighthq/_internal/dom/PermissionName.hx` | `dynamic-stub` | 4 |
| `host:Permissions` | `host` | `flighthq._internal.dom.Permissions` | `src/flighthq/_internal/dom/Permissions.hx` | `dynamic-stub` | 22 |
| `host:PermissionStatus` | `host` | `flighthq._internal.dom.PermissionStatus` | `src/flighthq/_internal/dom/PermissionStatus.hx` | `dynamic-stub` | 29 |
| `host:PointerEvent` | `host` | `flighthq._internal.dom.PointerEvent` | `src/flighthq/_internal/dom/PointerEvent.hx` | `dynamic-stub` | 39 |
| `host:PositionOptions` | `host` | `flighthq._internal.dom.PositionOptions` | `src/flighthq/_internal/dom/PositionOptions.hx` | `dynamic-stub` | 2 |
| `host:ReadableStream` | `host` | `flighthq._internal.dom.ReadableStream` | `src/flighthq/_internal/dom/ReadableStream.hx` | `dynamic-stub` | 10 |
| `host:ReadableStreamDefaultReader` | `host` | `flighthq._internal.dom.ReadableStreamDefaultReader` | `src/flighthq/_internal/dom/ReadableStreamDefaultReader.hx` | `dynamic-stub` | 2 |
| `host:RequestInit` | `host` | `flighthq._internal.dom.RequestInit` | `src/flighthq/_internal/dom/RequestInit.hx` | `dynamic-stub` | 8 |
| `host:ResizeObserver` | `host` | `flighthq._internal.dom.ResizeObserver` | `src/flighthq/_internal/dom/ResizeObserver.hx` | `dynamic-stub` | 7 |
| `host:ResizeObserverEntry` | `host` | `flighthq._internal.dom.ResizeObserverEntry` | `src/flighthq/_internal/dom/ResizeObserverEntry.hx` | `dynamic-stub` | 5 |
| `host:Response` | `host` | `flighthq._internal.dom.Response` | `src/flighthq/_internal/dom/Response.hx` | `dynamic-stub` | 31 |
| `host:Screen` | `host` | `flighthq._internal.dom.Screen` | `src/flighthq/_internal/dom/Screen.hx` | `dynamic-stub` | 25 |
| `host:ScreenOrientation` | `host` | `flighthq._internal.dom.ScreenOrientation` | `src/flighthq/_internal/dom/ScreenOrientation.hx` | `dynamic-stub` | 3 |
| `host:ShareData` | `host` | `flighthq._internal.dom.ShareData` | `src/flighthq/_internal/dom/ShareData.hx` | `dynamic-stub` | 7 |
| `host:StereoPannerNode` | `host` | `flighthq._internal.dom.StereoPannerNode` | `src/flighthq/_internal/dom/StereoPannerNode.hx` | `dynamic-stub` | 11 |
| `host:Storage` | `host` | `flighthq._internal.dom.Storage` | `src/flighthq/_internal/dom/Storage.hx` | `dynamic-stub` | 12 |
| `host:StorageEstimate` | `host` | `flighthq._internal.dom.StorageEstimate` | `src/flighthq/_internal/dom/StorageEstimate.hx` | `dynamic-stub` | 11 |
| `host:StorageEvent` | `host` | `flighthq._internal.dom.StorageEvent` | `src/flighthq/_internal/dom/StorageEvent.hx` | `dynamic-stub` | 6 |
| `host:StorageManager` | `host` | `flighthq._internal.dom.StorageManager` | `src/flighthq/_internal/dom/StorageManager.hx` | `dynamic-stub` | 13 |
| `host:SVGImageElement` | `host` | `flighthq._internal.dom.SVGImageElement` | `src/flighthq/_internal/dom/SVGImageElement.hx` | `dynamic-stub` | 19 |
| `host:TexImageSource` | `host` | `flighthq._internal.dom.TexImageSource` | `src/flighthq/_internal/dom/TexImageSource.hx` | `dynamic-stub` | 5 |
| `host:Text` | `host` | `flighthq._internal.dom.Text` | `src/flighthq/_internal/dom/Text.hx` | `dynamic-stub` | 2 |
| `host:TextDecoder` | `host` | `flighthq._internal.dom.TextDecoder` | `src/flighthq/_internal/dom/TextDecoder.hx` | `dynamic-stub` | 16 |
| `host:TextEncoder` | `host` | `flighthq._internal.dom.TextEncoder` | `src/flighthq/_internal/dom/TextEncoder.hx` | `dynamic-stub` | 2 |
| `host:TextMetrics` | `host` | `flighthq._internal.dom.TextMetrics` | `src/flighthq/_internal/dom/TextMetrics.hx` | `dynamic-stub` | 38 |
| `host:Timeout` | `host` | `flighthq._internal.dom.Timeout` | `src/flighthq/_internal/dom/Timeout.hx` | `dynamic-stub` | 36 |
| `host:URL` | `host` | `flighthq._internal.dom.URL` | `src/flighthq/_internal/dom/URL.hx` | `dynamic-stub` | 4 |
| `host:URLSearchParams` | `host` | `flighthq._internal.dom.URLSearchParams` | `src/flighthq/_internal/dom/URLSearchParams.hx` | `dynamic-stub` | 3 |
| `host:VideoFrame` | `host` | `flighthq._internal.dom.VideoFrame` | `src/flighthq/_internal/dom/VideoFrame.hx` | `dynamic-stub` | 25 |
| `host:VisualViewport` | `host` | `flighthq._internal.dom.VisualViewport` | `src/flighthq/_internal/dom/VisualViewport.hx` | `dynamic-stub` | 8 |
| `host:WakeLock` | `host` | `flighthq._internal.dom.WakeLock` | `src/flighthq/_internal/dom/WakeLock.hx` | `dynamic-stub` | 6 |
| `host:WakeLockSentinel` | `host` | `flighthq._internal.dom.WakeLockSentinel` | `src/flighthq/_internal/dom/WakeLockSentinel.hx` | `dynamic-stub` | 4 |
| `host:WEBGL_compressed_texture_astc` | `host` | `flighthq._internal.dom.WEBGL_compressed_texture_astc` | `src/flighthq/_internal/dom/WEBGL_compressed_texture_astc.hx` | `dynamic-stub` | 1 |
| `host:WEBGL_compressed_texture_etc` | `host` | `flighthq._internal.dom.WEBGL_compressed_texture_etc` | `src/flighthq/_internal/dom/WEBGL_compressed_texture_etc.hx` | `dynamic-stub` | 1 |
| `host:WEBGL_compressed_texture_pvrtc` | `host` | `flighthq._internal.dom.WEBGL_compressed_texture_pvrtc` | `src/flighthq/_internal/dom/WEBGL_compressed_texture_pvrtc.hx` | `dynamic-stub` | 1 |
| `host:WEBGL_compressed_texture_s3tc` | `host` | `flighthq._internal.dom.WEBGL_compressed_texture_s3tc` | `src/flighthq/_internal/dom/WEBGL_compressed_texture_s3tc.hx` | `dynamic-stub` | 1 |
| `host:WEBGL_compressed_texture_s3tc_srgb` | `host` | `flighthq._internal.dom.WEBGL_compressed_texture_s3tc_srgb` | `src/flighthq/_internal/dom/WEBGL_compressed_texture_s3tc_srgb.hx` | `dynamic-stub` | 1 |
| `host:WEBGL_debug_renderer_info` | `host` | `flighthq._internal.dom.WEBGL_debug_renderer_info` | `src/flighthq/_internal/dom/WEBGL_debug_renderer_info.hx` | `dynamic-stub` | 4 |
| `host:WebGL2RenderingContext` | `host` | `flighthq._internal.dom.WebGL2RenderingContext` | `src/flighthq/_internal/dom/WebGL2RenderingContext.hx` | `dynamic-stub` | 2550 |
| `host:WebGLActiveInfo` | `host` | `flighthq._internal.dom.WebGLActiveInfo` | `src/flighthq/_internal/dom/WebGLActiveInfo.hx` | `dynamic-stub` | 8 |
| `host:WebGLBuffer` | `host` | `flighthq._internal.dom.WebGLBuffer` | `src/flighthq/_internal/dom/WebGLBuffer.hx` | `dynamic-stub` | 44 |
| `host:WebGLContextAttributes` | `host` | `flighthq._internal.dom.WebGLContextAttributes` | `src/flighthq/_internal/dom/WebGLContextAttributes.hx` | `dynamic-stub` | 3 |
| `host:WebGLFramebuffer` | `host` | `flighthq._internal.dom.WebGLFramebuffer` | `src/flighthq/_internal/dom/WebGLFramebuffer.hx` | `dynamic-stub` | 33 |
| `host:WebGLPowerPreference` | `host` | `flighthq._internal.dom.WebGLPowerPreference` | `src/flighthq/_internal/dom/WebGLPowerPreference.hx` | `dynamic-stub` | 1 |
| `host:WebGLProgram` | `host` | `flighthq._internal.dom.WebGLProgram` | `src/flighthq/_internal/dom/WebGLProgram.hx` | `dynamic-stub` | 130 |
| `host:WebGLRenderbuffer` | `host` | `flighthq._internal.dom.WebGLRenderbuffer` | `src/flighthq/_internal/dom/WebGLRenderbuffer.hx` | `dynamic-stub` | 6 |
| `host:WebGLRenderingContext` | `host` | `flighthq._internal.dom.WebGLRenderingContext` | `src/flighthq/_internal/dom/WebGLRenderingContext.hx` | `dynamic-stub` | 9 |
| `host:WebGLShader` | `host` | `flighthq._internal.dom.WebGLShader` | `src/flighthq/_internal/dom/WebGLShader.hx` | `dynamic-stub` | 3 |
| `host:WebGLTexture` | `host` | `flighthq._internal.dom.WebGLTexture` | `src/flighthq/_internal/dom/WebGLTexture.hx` | `dynamic-stub` | 287 |
| `host:WebGLUniformLocation` | `host` | `flighthq._internal.dom.WebGLUniformLocation` | `src/flighthq/_internal/dom/WebGLUniformLocation.hx` | `dynamic-stub` | 269 |
| `host:WebGLVertexArrayObject` | `host` | `flighthq._internal.dom.WebGLVertexArrayObject` | `src/flighthq/_internal/dom/WebGLVertexArrayObject.hx` | `dynamic-stub` | 15 |
| `host:WebSocket` | `host` | `flighthq._internal.dom.WebSocket` | `src/flighthq/_internal/dom/WebSocket.hx` | `dynamic-stub` | 9 |
| `host:WheelEvent` | `host` | `flighthq._internal.dom.WheelEvent` | `src/flighthq/_internal/dom/WheelEvent.hx` | `dynamic-stub` | 9 |
| `host:Window` | `host` | `flighthq._internal.dom.Window` | `src/flighthq/_internal/dom/Window.hx` | `dynamic-stub` | 122 |
| `host:WindowEventMap` | `host` | `flighthq._internal.dom.WindowEventMap` | `src/flighthq/_internal/dom/WindowEventMap.hx` | `dynamic-stub` | 2 |
| `host:WritableStream` | `host` | `flighthq._internal.dom.WritableStream` | `src/flighthq/_internal/dom/WritableStream.hx` | `dynamic-stub` | 8 |
| `host:WritableStreamDefaultWriter` | `host` | `flighthq._internal.dom.WritableStreamDefaultWriter` | `src/flighthq/_internal/dom/WritableStreamDefaultWriter.hx` | `dynamic-stub` | 4 |

## Ambient values

| Key | Provider | Coverage | Uses |
| --- | --- | --- | ---: |
| `global:AbortController` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 9 |
| `global:AbortSignal` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 3 |
| `global:ArrayBuffer` | `src/flighthq/_internal/_HostValueLut.hx` | `portable` | 9 |
| `global:atob` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 4 |
| `global:Audio` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 1 |
| `global:AudioBuffer` | `src/flighthq/_internal/_HostValueLut.hx` | `portable` | 1 |
| `global:Blob` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 4 |
| `global:btoa` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 1 |
| `global:cancelAnimationFrame` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 2 |
| `global:ClipboardItem` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 4 |
| `global:console` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 6 |
| `global:createImageBitmap` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 1 |
| `global:crypto` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 3 |
| `global:DataView` | `src/flighthq/_internal/_HostValueLut.hx` | `portable` | 16 |
| `global:Date` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 20 |
| `global:decodeURIComponent` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 2 |
| `global:DeviceMotionEvent` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 7 |
| `global:document` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 27 |
| `global:DOMException` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 8 |
| `global:encodeURIComponent` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 2 |
| `global:fetch` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 6 |
| `global:File` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 1 |
| `global:FileReader` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 4 |
| `global:Float32Array` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 2 |
| `global:FontFace` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 1 |
| `global:getComputedStyle` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 1 |
| `global:globalThis` | `src/flighthq/_internal/_HostValueLut.hx` | `portable` | 8 |
| `global:HTMLCanvasElement` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 6 |
| `global:HTMLImageElement` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 4 |
| `global:HTMLVideoElement` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 5 |
| `global:Image` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 1 |
| `global:ImageBitmap` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 3 |
| `global:ImageData` | `src/flighthq/_internal/_HostValueLut.hx` | `portable` | 1 |
| `global:Intl` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 11 |
| `global:isNaN` | `src/flighthq/_internal/_HostValueLut.hx` | `portable` | 12 |
| `global:KeyboardEvent` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 5 |
| `global:localStorage` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 4 |
| `global:location` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 8 |
| `global:Map` | `src/flighthq/_internal/_HostValueLut.hx` | `portable` | 303 |
| `global:MediaMetadata` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 2 |
| `global:navigator` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 42 |
| `global:Notification` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 19 |
| `global:Number` | `src/flighthq/_internal/_HostValueLut.hx` | `portable` | 424 |
| `global:OffscreenCanvas` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 10 |
| `global:parseFloat` | `src/flighthq/_internal/_HostValueLut.hx` | `portable` | 84 |
| `global:parseInt` | `src/flighthq/_internal/_HostValueLut.hx` | `portable` | 40 |
| `global:performance` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 9 |
| `global:process` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 2 |
| `global:Proxy` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 3 |
| `global:RegExp` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 5 |
| `global:requestAnimationFrame` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 3 |
| `global:ResizeObserver` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 3 |
| `global:screen` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 8 |
| `global:Set` | `src/flighthq/_internal/_HostValueLut.hx` | `portable` | 106 |
| `global:setInterval` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 1 |
| `global:structuredClone` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 3 |
| `global:TextDecoder` | `src/flighthq/_internal/_HostValueLut.hx` | `portable` | 8 |
| `global:TextEncoder` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 1 |
| `global:Uint32Array` | `src/flighthq/_internal/_HostValueLut.hx` | `portable` | 1 |
| `global:Uint8Array` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 5 |
| `global:URL` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 7 |
| `global:URLSearchParams` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 1 |
| `global:VideoFrame` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 2 |
| `global:WeakMap` | `src/flighthq/_internal/_HostValueLut.hx` | `portable` | 190 |
| `global:WeakSet` | `src/flighthq/_internal/_HostValueLut.hx` | `portable` | 10 |
| `global:WebSocket` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 4 |
| `global:WheelEvent` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 3 |
| `global:window` | `src/flighthq/_internal/_HostValueLut.hx` | `js-only` | 50 |

## External module values

| Key | Specifier | Imported binding | Coverage | Uses |
| --- | --- | --- | --- | ---: |
