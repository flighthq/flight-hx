package flight.esm.types.render_gl;

#if (js && flight_esm)
typedef GlAppRenderView = { renderState:flight.esm.types.render_gl.Types.GlRenderState, renderTarget:flight.esm.types.render_gl.Types.GlTextureRenderTarget, viewport:flight.esm.types.node.Types.Viewport };

typedef GlAppRenderViewOptions = { ?context:Null<flight.esm.types.render_gl.Types.GlContextOptions>, ?render:Null<flight.esm.types.render_gl.Types.GlRenderStateOptions>, ?target:Dynamic };

typedef GlBitmapShader = { program:Dynamic, bind:((gl:flight.esm.types.render_gl.Types.GlContext, state:flight.esm.types.render_gl.Types.GlRenderState, renderProxy:flight.esm.types.render_contract.Types.RenderProxy2D) -> Void), locations:flight.esm.types.render_gl.Types.GlShaderLocations };

typedef GlBlendEquation = String;

typedef GlBlendFactor = String;

typedef GlBlendRealization = { src:flight.esm.types.render_gl.Types.GlBlendFactor, dst:flight.esm.types.render_gl.Types.GlBlendFactor, ?equation:Null<String> };

typedef GlBlendSignature = { dst:Float, equation:Float, src:Float };

typedef GlBoundShader = { locations:Null<flight.esm.types.render_gl.Types.GlShaderLocations>, program:Dynamic };

typedef GlCapabilities = { maxTextureSize:Float, maxTextureUnits:Float, maxSamples:Float, maxDrawBuffers:Float, maxColorAttachments:Float, maxRenderbufferSize:Float, supportsColorBufferFloat:Bool, supportsFloatLinear:Bool, supportsSrgb:Bool, maxAnisotropy:Float };

typedef GlColorAdjustmentMaterialFeature = { fragmentShaderChunk:String, matrixFragmentShaderChunk:String, drawShapeMeshes:((state:flight.esm.types.render_gl.Types.GlRenderState, renderProxy:flight.esm.types.render_contract.Types.RenderProxy2D, meshes:Array<flight.esm.types.render_gl.Types.GlShapeMesh>) -> Void), flush:((state:flight.esm.types.render_gl.Types.GlRenderState, count:Float) -> Bool), record:((runtime:flight.esm.types.render_gl.Types.GlRenderStateRuntime, colorScaleBias:Dynamic, instanceIndex:Float) -> Void) };

typedef GlColorAdjustmentMaterialFeatureGuard = ((state:flight.esm.types.render_gl.Types.GlRenderState, colorScaleBias:Dynamic) -> Void);

typedef GlColorAdjustmentResources = { matrixInstancedShader:flight.esm.types.render_gl.Types.GlColorScaleBiasInstancedShader, scaleBiasInstancedShader:flight.esm.types.render_gl.Types.GlColorScaleBiasInstancedShader, tintInstancedShader:flight.esm.types.render_gl.Types.GlColorScaleBiasInstancedShader, uniformScaleBiasShader:flight.esm.types.render_gl.Types.GlUniformColorScaleBiasShader };

typedef GlColorScaleBiasInstancedShader = { program:Dynamic, locCorner:Float, locWorldMatrix:Dynamic, locTexture:Dynamic, locStraightTextureAlpha:Dynamic };

typedef GlCompressedTextureDecoder = ((format:flight.esm.types.texture_formats.Types.TextureContainerFormat, width:Float, height:Float, data:js.lib.Uint8Array) -> Null<js.lib.Uint8Array>);

typedef GlCompressedTextureSupport = { astc:Bool, bptc:Bool, etc:Bool, pvrtc:Bool, rgtc:Bool, s3tc:Bool };

typedef GlCompressedTextureUploader = ((gl:flight.esm.types.render_gl.Types.GlContext, image:flight.esm.types.image_contract.Types.CompressedImageResource, decode:Null<flight.esm.types.render_gl.Types.GlCompressedTextureDecoder>, ?colorSpace:Null<String>) -> Bool);

typedef GlContext = { RGBA:Float, createBuffer:(() -> Dynamic), viewport:((x:Float, y:Float, width:Float, height:Float) -> Void), FUNC_ADD:Float, FUNC_REVERSE_SUBTRACT:Float, MAX:Float, MIN:Float, DST_COLOR:Float, ONE:Float, ONE_MINUS_SRC_ALPHA:Float, ONE_MINUS_SRC_COLOR:Float, ZERO:Float, ACTIVE_TEXTURE:Float, ACTIVE_UNIFORMS:Float, ALWAYS:Float, ARRAY_BUFFER:Float, BACK:Float, BLEND:Float, BLEND_DST_ALPHA:Float, BLEND_DST_RGB:Float, BLEND_EQUATION_ALPHA:Float, BLEND_EQUATION_RGB:Float, BLEND_SRC_ALPHA:Float, BLEND_SRC_RGB:Float, CCW:Float, CLAMP_TO_EDGE:Float, COLOR:Float, COLOR_ATTACHMENT0:Float, COLOR_BUFFER_BIT:Float, COLOR_CLEAR_VALUE:Float, COLOR_WRITEMASK:Float, COMPILE_STATUS:Float, CULL_FACE:Float, CULL_FACE_MODE:Float, CURRENT_PROGRAM:Float, CW:Float, DECR_WRAP:Float, DEPTH24_STENCIL8:Float, DEPTH_BUFFER_BIT:Float, DEPTH_FUNC:Float, DEPTH:Float, DEPTH_STENCIL:Float, DEPTH_STENCIL_ATTACHMENT:Float, DEPTH_TEST:Float, DEPTH_WRITEMASK:Float, DRAW_FRAMEBUFFER:Float, DYNAMIC_DRAW:Float, ELEMENT_ARRAY_BUFFER:Float, EQUAL:Float, FLOAT:Float, FLOAT_MAT2:Float, FLOAT_MAT3:Float, FLOAT_MAT4:Float, FLOAT_VEC2:Float, FLOAT_VEC3:Float, FLOAT_VEC4:Float, FRAGMENT_SHADER:Float, FRAMEBUFFER:Float, FRAMEBUFFER_BINDING:Float, FRAMEBUFFER_COMPLETE:Float, FRONT:Float, FRONT_FACE:Float, HALF_FLOAT:Float, INCR_WRAP:Float, INVERT:Float, KEEP:Float, LESS:Float, LINEAR:Float, LINEAR_MIPMAP_LINEAR:Float, LINEAR_MIPMAP_NEAREST:Float, LINES:Float, LINE_STRIP:Float, LINK_STATUS:Float, MAX_SAMPLES:Float, MAX_TEXTURE_IMAGE_UNITS:Float, MAX_TEXTURE_SIZE:Float, MIRRORED_REPEAT:Float, NEAREST:Float, NEAREST_MIPMAP_LINEAR:Float, NEAREST_MIPMAP_NEAREST:Float, NONE:Float, NOTEQUAL:Float, POINTS:Float, READ_FRAMEBUFFER:Float, RENDERBUFFER:Float, RENDERBUFFER_BINDING:Float, REPEAT:Float, RGBA16F:Float, RGBA32F:Float, RGBA8:Float, SCISSOR_BOX:Float, SCISSOR_TEST:Float, SRGB8_ALPHA8:Float, STATIC_DRAW:Float, STENCIL_BACK_FAIL:Float, STENCIL_BACK_FUNC:Float, STENCIL_BACK_PASS_DEPTH_FAIL:Float, STENCIL_BACK_PASS_DEPTH_PASS:Float, STENCIL_BACK_REF:Float, STENCIL_BACK_VALUE_MASK:Float, STENCIL_BACK_WRITEMASK:Float, STENCIL:Float, STENCIL_BUFFER_BIT:Float, STENCIL_FAIL:Float, STENCIL_FUNC:Float, STENCIL_PASS_DEPTH_FAIL:Float, STENCIL_PASS_DEPTH_PASS:Float, STENCIL_REF:Float, STENCIL_TEST:Float, STENCIL_VALUE_MASK:Float, STENCIL_WRITEMASK:Float, STREAM_DRAW:Float, TEXTURE0:Float, TEXTURE1:Float, TEXTURE2:Float, TEXTURE3:Float, TEXTURE_2D:Float, TEXTURE_2D_ARRAY:Float, TEXTURE_3D:Float, TEXTURE_BINDING_2D:Float, TEXTURE_BINDING_CUBE_MAP:Float, TEXTURE_CUBE_MAP:Float, TEXTURE_CUBE_MAP_POSITIVE_X:Float, TEXTURE_MAG_FILTER:Float, TEXTURE_MAX_LEVEL:Float, TEXTURE_MIN_FILTER:Float, TEXTURE_WRAP_R:Float, TEXTURE_WRAP_S:Float, TEXTURE_WRAP_T:Float, TRIANGLES:Float, TRIANGLE_FAN:Float, TRIANGLE_STRIP:Float, UNPACK_PREMULTIPLY_ALPHA_WEBGL:Float, UNSIGNED_BYTE:Float, UNSIGNED_INT:Float, UNSIGNED_INT_24_8:Float, UNSIGNED_SHORT:Float, VERTEX_ARRAY_BINDING:Float, VERTEX_SHADER:Float, VIEWPORT:Float, activeTexture:((texture:Float) -> Void), attachShader:((program:Dynamic, shader:Dynamic) -> Void), bindBuffer:((target:Float, buffer:Dynamic) -> Void), bindFramebuffer:((target:Float, framebuffer:Dynamic) -> Void), bindRenderbuffer:((target:Float, renderbuffer:Dynamic) -> Void), bindTexture:((target:Float, texture:Dynamic) -> Void), bindVertexArray:((array:Dynamic) -> Void), blendEquation:((mode:Float) -> Void), blendEquationSeparate:((modeRGB:Float, modeAlpha:Float) -> Void), blendFunc:((sfactor:Float, dfactor:Float) -> Void), blendFuncSeparate:((srcRGB:Float, dstRGB:Float, srcAlpha:Float, dstAlpha:Float) -> Void), blitFramebuffer:((srcX0:Float, srcY0:Float, srcX1:Float, srcY1:Float, dstX0:Float, dstY0:Float, dstX1:Float, dstY1:Float, mask:Float, filter:Float) -> Void), bufferData:Dynamic, bufferSubData:Dynamic, checkFramebufferStatus:((target:Float) -> Float), clear:((mask:Float) -> Void), clearBufferfi:((buffer:Float, drawbuffer:Float, depth:Float, stencil:Float) -> Void), clearBufferfv:Dynamic, clearBufferiv:Dynamic, clearColor:((red:Float, green:Float, blue:Float, alpha:Float) -> Void), clearDepth:((depth:Float) -> Void), colorMask:((red:Bool, green:Bool, blue:Bool, alpha:Bool) -> Void), compileShader:((shader:Dynamic) -> Void), compressedTexImage2D:Dynamic, compressedTexSubImage3D:Dynamic, createFramebuffer:(() -> Dynamic), createProgram:(() -> Dynamic), createRenderbuffer:(() -> Dynamic), createShader:((type:Float) -> Dynamic), createTexture:(() -> Dynamic), createVertexArray:(() -> Dynamic), cullFace:((mode:Float) -> Void), deleteBuffer:((buffer:Dynamic) -> Void), deleteFramebuffer:((framebuffer:Dynamic) -> Void), deleteProgram:((program:Dynamic) -> Void), deleteRenderbuffer:((renderbuffer:Dynamic) -> Void), deleteShader:((shader:Dynamic) -> Void), deleteTexture:((texture:Dynamic) -> Void), deleteVertexArray:((vertexArray:Dynamic) -> Void), depthFunc:((func:Float) -> Void), depthMask:((flag:Bool) -> Void), disable:((cap:Float) -> Void), disableVertexAttribArray:((index:Float) -> Void), drawArrays:((mode:Float, first:Float, count:Float) -> Void), drawArraysInstanced:((mode:Float, first:Float, count:Float, instanceCount:Float) -> Void), drawBuffers:Dynamic, drawElements:((mode:Float, count:Float, type:Float, offset:Float) -> Void), drawElementsInstanced:((mode:Float, count:Float, type:Float, offset:Float, instanceCount:Float) -> Void), drawingBufferHeight:Float, drawingBufferWidth:Float, enable:((cap:Float) -> Void), enableVertexAttribArray:((index:Float) -> Void), finish:(() -> Void), flush:(() -> Void), framebufferRenderbuffer:((target:Float, attachment:Float, renderbuffertarget:Float, renderbuffer:Dynamic) -> Void), framebufferTexture2D:((target:Float, attachment:Float, textarget:Float, texture:Dynamic, level:Float) -> Void), frontFace:((mode:Float) -> Void), generateMipmap:((target:Float) -> Void), getActiveUniform:((program:Dynamic, index:Float) -> Dynamic), getAttribLocation:((program:Dynamic, name:String) -> Float), getExtension:Dynamic, getParameter:((pname:Float) -> Dynamic), getProgramInfoLog:((program:Dynamic) -> Null<String>), getProgramParameter:((program:Dynamic, pname:Float) -> Dynamic), getShaderInfoLog:((shader:Dynamic) -> Null<String>), getShaderParameter:((shader:Dynamic, pname:Float) -> Dynamic), getUniformLocation:((program:Dynamic, name:String) -> Dynamic), isEnabled:((cap:Float) -> Bool), linkProgram:((program:Dynamic) -> Void), pixelStorei:((pname:Float, param:Dynamic) -> Void), readBuffer:((src:Float) -> Void), readPixels:Dynamic, renderbufferStorage:((target:Float, internalformat:Float, width:Float, height:Float) -> Void), renderbufferStorageMultisample:((target:Float, samples:Float, internalformat:Float, width:Float, height:Float) -> Void), scissor:((x:Float, y:Float, width:Float, height:Float) -> Void), shaderSource:((shader:Dynamic, source:String) -> Void), stencilFunc:((func:Float, ref:Float, mask:Float) -> Void), stencilFuncSeparate:((face:Float, func:Float, ref:Float, mask:Float) -> Void), stencilMask:((mask:Float) -> Void), stencilMaskSeparate:((face:Float, mask:Float) -> Void), stencilOp:((fail:Float, zfail:Float, zpass:Float) -> Void), stencilOpSeparate:((face:Float, fail:Float, zfail:Float, zpass:Float) -> Void), texImage2D:Dynamic, texImage3D:Dynamic, texParameterf:((target:Float, pname:Float, param:Float) -> Void), texParameteri:((target:Float, pname:Float, param:Float) -> Void), texStorage3D:((target:Float, levels:Float, internalformat:Float, width:Float, height:Float, depth:Float) -> Void), texSubImage2D:Dynamic, uniform1f:((location:Dynamic, x:Float) -> Void), uniform1fv:Dynamic, uniform1i:((location:Dynamic, x:Float) -> Void), uniform2f:((location:Dynamic, x:Float, y:Float) -> Void), uniform2fv:Dynamic, uniform3f:((location:Dynamic, x:Float, y:Float, z:Float) -> Void), uniform3fv:Dynamic, uniform4f:((location:Dynamic, x:Float, y:Float, z:Float, w:Float) -> Void), uniform4fv:Dynamic, uniformMatrix3fv:Dynamic, uniformMatrix4fv:Dynamic, useProgram:((program:Dynamic) -> Void), vertexAttrib4f:((index:Float, x:Float, y:Float, z:Float, w:Float) -> Void), vertexAttribDivisor:((index:Float, divisor:Float) -> Void), vertexAttribPointer:((index:Float, size:Float, type:Float, normalized:Bool, stride:Float, offset:Float) -> Void) };

typedef GlContextLossSignals = { onGlContextLost:flight.esm.types.signals.Types.Signal<((state:flight.esm.types.render_gl.Types.GlRenderState) -> Void)>, onGlContextRestored:flight.esm.types.signals.Types.Signal<((state:flight.esm.types.render_gl.Types.GlRenderState) -> Void)> };

typedef GlContextOptions = { ?antialias:Null<Bool>, ?contextAttributes:Dynamic, ?powerPreference:Null<String> };

typedef GlContextRuntime = { gl:flight.esm.types.render_gl.Types.GlContext, references:Float, teardowns:Array<((gl:flight.esm.types.render_gl.Types.GlContext) -> Void)>, currentBlendSignature:Null<flight.esm.types.render_gl.Types.GlBlendSignature>, currentShader:Null<flight.esm.types.render_gl.Types.GlBoundShader>, currentTextureRealization:Null<flight.esm.types.render_gl.Types.GlTextureRealization>, quadIndexBuffer:Dynamic, quadVertexBuffer:Dynamic, textureCache:Dynamic, textureSourcePremultipliedTextureCache:Dynamic, textureSourcePremultipliedSrgbTextureCache:Dynamic, textureSourceStraightTextureCache:Dynamic, textureSourceStraightSrgbTextureCache:Dynamic, ?glExternalTextureCache:Dynamic, ?glRenderTextureCache:Dynamic, ?videoTextureCache:Dynamic, ?videoSrgbTextureCache:Dynamic, ?mipmappedTextures:Dynamic, ?anisotropyExt:Dynamic, ?maxAnisotropy:Null<Float>, ?sceneMeshUploadCache:Dynamic, colorAdjustmentResources:Null<flight.esm.types.render_gl.Types.GlColorAdjustmentResources>, particleResources:Null<flight.esm.types.render_gl.Types.GlParticleResources>, quadBatchResources:Null<flight.esm.types.render_gl.Types.GlQuadBatchResources>, shapeMeshResources:Null<flight.esm.types.render_gl.Types.GlShapeMeshResources>, binding:Dynamic, ?uid:Null<String> };

typedef GlContextState = { gl:flight.esm.types.render_gl.Types.GlContext };

typedef GlCubeRenderTarget = { gl:flight.esm.types.render_gl.Types.GlContext, colorSpace:flight.esm.types.render_contract.Types.RenderTargetColorSpace, depthStencilRenderbuffer:Dynamic, framebuffer:Dynamic, height:Float, size:Float, texture:Dynamic, textures:Array<Dynamic>, width:Float };

typedef GlCubeRenderTargetOptions = { ?depth:Null<Bool> };

typedef GlCullFaceKind = String;

typedef GlCustomMaterialShaderSource = { fragment:String, vertex:String };

typedef GlDepthFuncKind = String;

typedef GlEffectContext = { state:flight.esm.types.render_gl.Types.GlRenderState, source:flight.esm.types.render_gl.Types.GlTextureRenderTarget, dest:flight.esm.types.render_gl.Types.GlTextureRenderTarget, pool:flight.esm.types.render_gl.Types.GlTextureRenderTargetPool, sceneDepthTexture:Dynamic, sceneVelocityTexture:Dynamic };

typedef GlEffectRegistration = { ?isResolvable:Null<flight.esm.types.render_gl.Types.GlEffectResolver>, runner:flight.esm.types.render_gl.Types.GlEffectRunner };

typedef GlEffectResolver = ((state:flight.esm.types.render_gl.Types.GlRenderState, effect:flight.esm.types.effects.Types.Effect) -> Bool);

typedef GlEffectRunner = ((context:flight.esm.types.render_gl.Types.GlEffectContext, effect:flight.esm.types.effects.Types.Effect) -> Void);

typedef GlFramebufferStatusKind = String;

typedef GlFullscreenProgram = { program:Dynamic, locPosition:Float, locTexCoord:Float, texture:Dynamic, textures:Array<Dynamic> };

typedef GlMeshMaterialRenderer = { bind:((state:flight.esm.types.render_gl.Types.GlRenderState, material:Null<flight.esm.types.materials_contract.Types.Material>, lights:flight.esm.types.lighting_contract.Types.Scene3DLightBlock, camera:flight.esm.types.camera.Types.Camera3D) -> Void), draw:((state:flight.esm.types.render_gl.Types.GlRenderState, proxy:flight.esm.types.render_contract.Types.Scene3DRenderProxy, geometry:flight.esm.types.meshgeometry.Types.MeshGeometry) -> Void) };

typedef GlModifierBindContext = { acquireModifierTextureUnit:(() -> Float), index:Float, program:Dynamic, state:flight.esm.types.render_gl.Types.GlRenderState };

typedef GlModifierSnippet = { ?bind:Null<((modifier:flight.esm.types.shading.Types.Modifier, context:flight.esm.types.render_gl.Types.GlModifierBindContext) -> Void)>, contribution:((modifier:flight.esm.types.shading.Types.Modifier, index:Float) -> String), ?declarations:Null<((modifier:flight.esm.types.shading.Types.Modifier, index:Float) -> String)>, kind:String, slot:String, ?getDefineSignature:Null<((modifier:flight.esm.types.shading.Types.Modifier) -> String)> };

typedef GlParticleResources = { cornerBuffer:Dynamic, instanceBuffer:Dynamic, shader:flight.esm.types.render_gl.Types.GlParticleShader };

typedef GlParticleShader = { program:Dynamic, locCorner:Float, locPos:Float, locCosScale:Float, locSinScale:Float, locColor:Float, locUvRect:Float, locSize:Float, locWorldMatrix:Dynamic, locTexture:Dynamic, locStraightTextureAlpha:Dynamic };

typedef GlPbrExtensionBindContext = { bindTransmissionSceneColor:((samplerUniform:String, maxLodUniform:String) -> Bool), bindTexture:((samplerUniform:String, uvSetUniform:String, uvTransformUniform:String, texture:Dynamic, uvSet:flight.esm.types.materials_contract.Types.PbrUvSet) -> Bool), setLinearColor:((uniform:String, color:Float) -> Void), setFloat:((uniform:String, value:Float) -> Void) };

typedef GlPbrExtensionRegistration = { bind:((context:flight.esm.types.render_gl.Types.GlPbrExtensionBindContext, extension:flight.esm.types.materials_contract.Types.PbrExtension) -> Void), createShaderContribution:((context:flight.esm.types.render_gl.Types.GlPbrExtensionShaderContext, extension:flight.esm.types.materials_contract.Types.PbrExtension) -> flight.esm.types.render_gl.Types.GlPbrExtensionShaderContribution), isSupported:((extension:flight.esm.types.materials_contract.Types.PbrExtension) -> Bool) };

typedef GlPbrExtensionShaderContext = { hasTransmissionSceneColor:(() -> Bool), isTextureReady:((texture:Dynamic) -> Bool) };

typedef GlPbrExtensionShaderContribution = { applySurface:String, contributeIbl:String, contributePunctual:String, finalize:String, fragmentDeclarations:String, fragmentFunctions:String, key:String, ?samplesTransmissionSceneColor:Null<Bool>, textureCount:Float };

typedef GlQuadBatchResources = { cornerBuffer:Dynamic, shader:flight.esm.types.render_gl.Types.GlQuadBatchShader, writerColorScaleBiasBuffer:Dynamic, writerInstanceBuffer:Dynamic, writerMaterialBuffer:Dynamic };

typedef GlQuadBatchShader = { program:Dynamic, locCorner:Float, locMatAB:Float, locMatCD:Float, locMatTXTY:Float, locUvOriginAxisU:Float, locUvAxisV:Float, locAlpha:Float, locWorldMatrix:Dynamic, locTexture:Dynamic, locStraightTextureAlpha:Dynamic };

typedef GlQuadMaterialRenderer = { instanceFloatCount:Float, bind:((state:flight.esm.types.render_gl.Types.GlRenderState, material:Null<flight.esm.types.materials_contract.Types.Material>) -> Void), ?packInstance:Null<((state:flight.esm.types.render_gl.Types.GlRenderState, materialData:Null<flight.esm.types.materials_contract.Types.MaterialData>, out:js.lib.Float32Array, offset:Float) -> Void)> };

typedef GlRenderOptions = { ?allowSmoothing:Null<Bool>, ?canvasHost:Null<flight.esm.types.surface.Types.HostCanvasCapability>, ?imageHost:Null<flight.esm.types.image_contract.Types.HostImageCapability>, ?imageSmoothingEnabled:Null<Bool>, ?pixelRatio:Null<Float>, ?roundPixels:Null<Bool>, ?sceneGraphSyncPolicy:Null<String> };

typedef GlRenderPass = { gl:flight.esm.types.render_gl.Types.GlContext, state:flight.esm.types.render_gl.Types.GlRenderState, target:flight.esm.types.render_gl.Types.GlRenderTarget };

typedef GlRenderRegistries = { blendRealizations:js.lib.Map<String, flight.esm.types.render_gl.Types.GlBlendRealization>, ?colorAdjustmentFeature:Null<flight.esm.types.render_gl.Types.GlColorAdjustmentMaterialFeature>, ?colorAdjustmentFeatureGuard:Null<flight.esm.types.render_gl.Types.GlColorAdjustmentMaterialFeatureGuard>, compressedTextureDecoder:Null<flight.esm.types.render_gl.Types.GlCompressedTextureDecoder>, compressedTextureUpload:Null<flight.esm.types.render_gl.Types.GlCompressedTextureUploader>, customEffectShaders:js.lib.Map<String, String>, customMaterialShaders:js.lib.Map<String, flight.esm.types.render_gl.Types.GlCustomMaterialShaderSource>, materialRenderers:js.lib.Map<String, Dynamic>, modifierSnippets:js.lib.Map<String, flight.esm.types.render_gl.Types.GlModifierSnippet>, pbrExtensions:js.lib.Map<String, flight.esm.types.render_gl.Types.GlPbrExtensionRegistration>, effects:js.lib.Map<String, flight.esm.types.render_gl.Types.GlEffectRegistration>, passes:Null<Array<flight.esm.types.render_gl.Types.GlScene3DPass>>, shapeRasterizer:Null<flight.esm.types.render_contract.Types.ShapeRasterizer>, textureResolvers:js.lib.Map<String, flight.esm.types.render_gl.Types.GlTextureResolver>, velocityWriters:js.lib.Map<String, flight.esm.types.render_gl.Types.GlVelocityWriter>, ?canvasShapeCommands:Null<js.lib.Map<String, Dynamic>>, ?colorAdjustments:Null<((state:flight.esm.types.render_contract.Types.RenderState, data:flight.esm.types.render_contract.Types.RenderProxy, ?parentData:Null<flight.esm.types.render_contract.Types.RenderProxy>) -> Void)>, ?colorAdjustmentUnsupportedGuard:Null<flight.esm.types.render_contract.Types.ColorAdjustmentUnsupportedGuard>, ?effectPaddingResolvers:Null<js.lib.Map<String, flight.esm.types.render.Types.EffectPaddingResolver>>, nodeRenderers:js.lib.Map<String, flight.esm.types.render_contract.Types.NodeRenderer>, ?renderRootGuard:Null<flight.esm.types.render_contract.Types.RenderRootGuard>, strokeTessellator:Null<flight.esm.types.render_contract.Types.StrokeTessellator> };

typedef GlRenderState = { applyBlendMode:Null<((state:flight.esm.types.render_gl.Types.GlRenderState, blendMode:Null<String>) -> Void)>, contextState:flight.esm.types.render_gl.Types.GlContextState, gl:flight.esm.types.render_gl.Types.GlContext, registries:flight.esm.types.render_gl.Types.GlRenderRegistries, allowSmoothing:Bool, currentClipDepth:Float, displayObjectClipHooks:Null<flight.esm.types.render_contract.Types.Scene2DClipHooks>, pixelRatio:Float, canvasHost:Null<flight.esm.types.surface.Types.HostCanvasCapability>, imageHost:Null<flight.esm.types.image_contract.Types.HostImageCapability>, renderAlpha:Float, renderBlendMode:Null<String>, sceneGraphSyncPolicy:flight.esm.types.render_contract.Types.Scene3DGraphSyncPolicy, roundPixels:Bool };

typedef GlRenderStateOptions = { ?blendRealizations:Null<js.lib.Map<String, flight.esm.types.render_gl.Types.GlBlendRealization>>, ?colorAdjustmentFeature:Null<flight.esm.types.render_gl.Types.GlColorAdjustmentMaterialFeature>, ?colorAdjustmentFeatureGuard:Null<flight.esm.types.render_gl.Types.GlColorAdjustmentMaterialFeatureGuard>, ?compressedTextureDecoder:Null<flight.esm.types.render_gl.Types.GlCompressedTextureDecoder>, ?compressedTextureUpload:Null<flight.esm.types.render_gl.Types.GlCompressedTextureUploader>, ?customEffectShaders:Null<js.lib.Map<String, String>>, ?customMaterialShaders:Null<js.lib.Map<String, flight.esm.types.render_gl.Types.GlCustomMaterialShaderSource>>, ?effects:Null<js.lib.Map<String, flight.esm.types.render_gl.Types.GlEffectRegistration>>, ?materialRenderers:Null<js.lib.Map<String, Dynamic>>, ?modifierSnippets:Null<js.lib.Map<String, flight.esm.types.render_gl.Types.GlModifierSnippet>>, ?passes:Null<Array<flight.esm.types.render_gl.Types.GlScene3DPass>>, ?pbrExtensions:Null<js.lib.Map<String, flight.esm.types.render_gl.Types.GlPbrExtensionRegistration>>, ?shapeRasterizer:Null<flight.esm.types.render_contract.Types.ShapeRasterizer>, ?textureResolvers:Null<js.lib.Map<String, flight.esm.types.render_gl.Types.GlTextureResolver>>, ?velocityWriters:Null<js.lib.Map<String, flight.esm.types.render_gl.Types.GlVelocityWriter>>, ?canvasShapeCommands:Null<js.lib.Map<String, Dynamic>>, ?colorAdjustments:Null<((state:flight.esm.types.render_contract.Types.RenderState, data:flight.esm.types.render_contract.Types.RenderProxy, ?parentData:Null<flight.esm.types.render_contract.Types.RenderProxy>) -> Void)>, ?colorAdjustmentUnsupportedGuard:Null<flight.esm.types.render_contract.Types.ColorAdjustmentUnsupportedGuard>, ?effectPaddingResolvers:Null<js.lib.Map<String, flight.esm.types.render.Types.EffectPaddingResolver>>, ?nodeRenderers:Null<js.lib.Map<String, flight.esm.types.render_contract.Types.NodeRenderer>>, ?renderRootGuard:Null<flight.esm.types.render_contract.Types.RenderRootGuard>, ?strokeTessellator:Null<flight.esm.types.render_contract.Types.StrokeTessellator>, ?allowSmoothing:Null<Bool>, ?canvasHost:Null<flight.esm.types.surface.Types.HostCanvasCapability>, ?imageHost:Null<flight.esm.types.image_contract.Types.HostImageCapability>, ?imageSmoothingEnabled:Null<Bool>, ?pixelRatio:Null<Float>, ?roundPixels:Null<Bool>, ?sceneGraphSyncPolicy:Null<String> };

typedef GlRenderStateRuntime = { context:flight.esm.types.render_gl.Types.GlContextRuntime, registries:flight.esm.types.render_gl.Types.GlRenderRegistries, modifierSnippetRevision:Float, pbrExtensionRevision:Float, teardowns:Array<((state:flight.esm.types.render_gl.Types.GlRenderState) -> Void)>, bindingCacheGuard:Null<((state:flight.esm.types.render_gl.Types.GlRenderState, expectedProgram:Dynamic) -> Void)>, ?flushPendingDraws:Null<((state:flight.esm.types.render_gl.Types.GlRenderState) -> Void)>, defaultBitmapShader:Null<flight.esm.types.render_gl.Types.GlBitmapShader>, ?particleInstanceData:Null<js.lib.Float32Array>, ?materialBitmapShaderMap:Null<js.lib.Map<String, flight.esm.types.render_gl.Types.GlBitmapShader>>, ?webglShaderBindingResolver:Null<((renderProxy:flight.esm.types.render_contract.Types.RenderProxy2D) -> Null<flight.esm.types.render_gl.Types.GlBitmapShader>)>, quadBatchWriterBlendMode:Null<String>, quadBatchWriterMaterial:Null<flight.esm.types.materials_contract.Types.Material>, quadBatchWriterMaterialRenderer:Null<flight.esm.types.render_gl.Types.GlQuadMaterialRenderer>, quadBatchWriterMaterialFloats:Float, quadBatchWriterMaterialData:js.lib.Float32Array, quadBatchWriterCount:Float, quadBatchWriterInstanceData:js.lib.Float32Array, quadBatchWriterTexture:Dynamic, quadBatchWriterSampler:Null<flight.esm.types.texture_contract.Types.SamplerLike>, quadBatchWriterStraightAlpha:Bool, quadBatchWriterSmoothing:Null<Bool>, ?quadBatchWriterColorScaleBiasMode:Null<Float>, ?quadBatchWriterUniformColorScaleBias:Dynamic, ?quadBatchWriterColorScaleBiasData:Null<js.lib.Float32Array>, ?quadBatchWriterColorMatrixData:Null<js.lib.Float32Array>, ?quadBatchWriterColorTintData:Null<js.lib.Uint32Array>, clipForms:Array<String>, ?currentMaskDepth:Null<Float>, ?currentScissorRect:Null<flight.esm.types.render_gl.Types.GlScissorRect>, currentFramebuffer:Dynamic, currentPass:Null<flight.esm.types.render_gl.Types.GlRenderPass>, ?currentRenderTarget:Dynamic, renderTargetViewport:Null<flight.esm.types.render_gl.Types.GlViewportRect>, ?glRenderTextureGuard:Null<flight.esm.types.render_gl.Types.GlRenderTextureGuard>, quadVertexData:js.lib.Float32Array, matrixArray:js.lib.Float32Array, ?scissorStack:Null<Array<flight.esm.types.render_gl.Types.GlScissorRect>>, currentFrameId:Float, renderAdaptHook:Null<((state:flight.esm.types.render_contract.Types.RenderState, source:flight.esm.types.node.Types.NodeAny, data:flight.esm.types.render_contract.Types.RenderProxy2D) -> Void)>, renderProxyAdapterMap:Dynamic, renderProxyMap:Dynamic, renderProxySources:js.lib.Set<flight.esm.types.node.Types.NodeAny>, registryMiss:Null<((registry:flight.esm.types.render_contract.Types.RenderRegistryTable, kind:String) -> Void)>, rendererMapId:Float, tempStack:Array<flight.esm.types.node.Types.NodeAny>, binding:Dynamic, ?uid:Null<String> };

typedef GlRenderStats = { drawCalls:Float, triangles:Float, textureBinds:Float, programSwitches:Float, framebufferBinds:Float, uniformUploads:Float };

typedef GlRenderTarget = { gl:flight.esm.types.render_gl.Types.GlContext, framebuffer:Dynamic, width:Float, height:Float, colorAttachments:Float, colorSpace:flight.esm.types.render_contract.Types.RenderTargetColorSpace };

typedef GlRenderTextureEntry = { status:flight.esm.types.render_gl.Types.GlRenderTextureStatus, target:flight.esm.types.render_gl.Types.GlTextureRenderTarget };

typedef GlRenderTextureExplanation = { height:Float, status:flight.esm.types.render_gl.Types.GlRenderTextureStatus, width:Float };

typedef GlRenderTextureGuard = ((state:flight.esm.types.render_gl.Types.GlRenderState, renderTexture:flight.esm.types.render_contract.Types.RenderTexture, explanation:flight.esm.types.render_gl.Types.GlRenderTextureExplanation) -> Void);

typedef GlRenderTexturePool = { context:Null<flight.esm.types.render_gl.Types.GlContext>, destroyed:Bool, effectTargets:flight.esm.types.render_gl.Types.GlTextureRenderTargetPool, free:Array<flight.esm.types.render_contract.Types.RenderTexture>, leased:js.lib.Set<flight.esm.types.render_contract.Types.RenderTexture> };

typedef GlRenderTextureStatus = String;

typedef GlRenderViewResources = { renderState:flight.esm.types.render_gl.Types.GlRenderState, renderTarget:flight.esm.types.render_gl.Types.GlTextureRenderTarget, viewport:flight.esm.types.node.Types.Viewport };

typedef GlScene3DPass = ((state:flight.esm.types.render_gl.Types.GlRenderState, scene:flight.esm.types.scene3d.Types.Node3D, camera:flight.esm.types.camera.Types.Camera3D, lights:flight.esm.types.lighting_contract.Types.Scene3DLightsLike) -> Void);

typedef GlScissorRect = { height:Float, width:Float, x:Float, y:Float };

typedef GlScreenRenderTarget = { framebuffer:Dynamic, gl:flight.esm.types.render_gl.Types.GlContext, width:Float, height:Float, colorAttachments:Float, colorSpace:flight.esm.types.render_contract.Types.RenderTargetColorSpace };

typedef GlShader = { program:Dynamic, bind:((gl:flight.esm.types.render_gl.Types.GlContext, state:flight.esm.types.render_gl.Types.GlRenderState, renderProxy:flight.esm.types.render_contract.Types.RenderProxy2D) -> Void) };

typedef GlShaderLocations = { program:Dynamic, locPosition:Float, locTexCoord:Float, locMatrix:Dynamic, locAlpha:Dynamic, ?locColorScale:Dynamic, ?locColorBias:Dynamic, ?locHasColorScaleBias:Dynamic, locTexture:Dynamic };

typedef GlShapeMesh = { vertices:js.lib.Float32Array, indices:js.lib.Uint16Array, color:Float, alpha:Float };

typedef GlShapeMeshBinding = { program:Dynamic, vertexBuffer:Dynamic, indexBuffer:Dynamic, positionLocation:Float, matrixLocation:Dynamic, colorLocation:Dynamic };

typedef GlShapeMeshColorScaleBiasShader = { program:Dynamic, positionLocation:Float, matrixLocation:Dynamic, colorLocation:Dynamic, colorScaleLocation:Dynamic, colorBiasLocation:Dynamic, ?colorMatrixLocations:Null<Array<Dynamic>> };

typedef GlShapeMeshResources = { binding:flight.esm.types.render_gl.Types.GlShapeMeshBinding, colorMatrixShader:Null<flight.esm.types.render_gl.Types.GlShapeMeshColorScaleBiasShader>, colorScaleBiasShader:Null<flight.esm.types.render_gl.Types.GlShapeMeshColorScaleBiasShader> };

typedef GlSkinPaletteTexture = { jointCapacity:Float, texture:Dynamic };

typedef GlSurface = { __brand:String, context:flight.esm.types.render_gl.Types.GlContext };

typedef GlTextureDescriptor = { ?wrapS:Null<String>, ?wrapT:Null<String>, ?minFilter:Null<String>, ?magFilter:Null<String>, ?mipmaps:Null<Bool>, ?anisotropy:Null<Float>, ?premultiplyAlpha:Null<Bool>, ?format:Null<String> };

typedef GlTextureFilterKind = String;

typedef GlTextureInternalFormat = String;

typedef GlTextureRealization = { straightAlpha:Bool, texture:Dynamic };

typedef GlTextureRenderTarget = { framebuffer:Dynamic, requestedAxes:flight.esm.types.render_contract.Types.RenderTargetAxes, format:flight.esm.types.render_contract.Types.RenderTargetFormat, colorFormats:Array<flight.esm.types.render_contract.Types.RenderTargetFormat>, depth:flight.esm.types.render_contract.Types.RenderTargetDepth, sampleCount:Float, resolveFramebuffer:Dynamic, textures:Array<Dynamic>, texture:Dynamic, depthTexture:Dynamic, colorRenderbuffers:Array<Dynamic>, depthStencilRenderbuffer:Dynamic, gl:flight.esm.types.render_gl.Types.GlContext, width:Float, height:Float, colorAttachments:Float, colorSpace:flight.esm.types.render_contract.Types.RenderTargetColorSpace };

typedef GlTextureRenderTargetPool = { free:Array<flight.esm.types.render_gl.Types.GlTextureRenderTarget> };

typedef GlTextureResolver = ((state:flight.esm.types.render_gl.Types.GlRenderState, texture:flight.esm.types.texture_contract.Types.TextureLike, premultiply:Bool, colorSpace:flight.esm.types.texture_contract.Types.TextureColorSpace) -> Null<flight.esm.types.render_gl.Types.GlTextureRealization>);

typedef GlTextureWrapKind = String;

typedef GlUniformColorScaleBiasShader = { program:Dynamic, locCorner:Float, locWorldMatrix:Dynamic, locTexture:Dynamic, locStraightTextureAlpha:Dynamic, locColorScale:Dynamic, locColorBias:Dynamic };

typedef GlVelocityContext = { state:flight.esm.types.render_gl.Types.GlRenderState, field:flight.esm.types.velocity.Types.VelocityField, width:Float, height:Float, pixelRatio:Float };

typedef GlVelocityWriter = ((context:flight.esm.types.render_gl.Types.GlVelocityContext, node:Dynamic) -> Void);

typedef GlViewportRect = { height:Float, width:Float, x:Float, y:Float };

typedef HostGlCapabilities = { ?context:Null<flight.esm.types.render_gl.Types.HostGlCapability> };

typedef HostGlCapability = { subscribe:((surface:flight.esm.types.surface.Types.Surface, onLost:Dynamic, onRestored:Dynamic) -> Dynamic), acquire:((surface:flight.esm.types.surface.Types.Surface, ?options:Null<flight.esm.types.render_gl.Types.GlContextOptions>) -> Null<flight.esm.types.render_gl.Types.GlContext>), create:((window:flight.esm.types.app.Types.AppWindow, width:Float, height:Float, ?options:Null<flight.esm.types.render_gl.Types.GlContextOptions>) -> Dynamic), release:((surface:flight.esm.types.surface.Types.Surface) -> Void) };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
