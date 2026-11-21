package flight.esm.types.scene3d_gl_contract;

#if (js && flight_esm)
typedef FakeGl2 = { calls:Array<Dynamic>, RGBA:Float, createBuffer:(() -> Dynamic), viewport:((x:Float, y:Float, width:Float, height:Float) -> Void), FUNC_ADD:Float, FUNC_REVERSE_SUBTRACT:Float, MAX:Float, MIN:Float, DST_COLOR:Float, ONE:Float, ONE_MINUS_SRC_ALPHA:Float, ONE_MINUS_SRC_COLOR:Float, ZERO:Float, ACTIVE_TEXTURE:Float, ACTIVE_UNIFORMS:Float, ALWAYS:Float, ARRAY_BUFFER:Float, BACK:Float, BLEND:Float, BLEND_DST_ALPHA:Float, BLEND_DST_RGB:Float, BLEND_EQUATION_ALPHA:Float, BLEND_EQUATION_RGB:Float, BLEND_SRC_ALPHA:Float, BLEND_SRC_RGB:Float, CCW:Float, CLAMP_TO_EDGE:Float, COLOR:Float, COLOR_ATTACHMENT0:Float, COLOR_BUFFER_BIT:Float, COLOR_CLEAR_VALUE:Float, COLOR_WRITEMASK:Float, COMPILE_STATUS:Float, CULL_FACE:Float, CULL_FACE_MODE:Float, CURRENT_PROGRAM:Float, CW:Float, DECR_WRAP:Float, DEPTH24_STENCIL8:Float, DEPTH_BUFFER_BIT:Float, DEPTH_FUNC:Float, DEPTH:Float, DEPTH_STENCIL:Float, DEPTH_STENCIL_ATTACHMENT:Float, DEPTH_TEST:Float, DEPTH_WRITEMASK:Float, DRAW_FRAMEBUFFER:Float, DYNAMIC_DRAW:Float, ELEMENT_ARRAY_BUFFER:Float, EQUAL:Float, FLOAT:Float, FLOAT_MAT2:Float, FLOAT_MAT3:Float, FLOAT_MAT4:Float, FLOAT_VEC2:Float, FLOAT_VEC3:Float, FLOAT_VEC4:Float, FRAGMENT_SHADER:Float, FRAMEBUFFER:Float, FRAMEBUFFER_BINDING:Float, FRAMEBUFFER_COMPLETE:Float, FRONT:Float, FRONT_FACE:Float, HALF_FLOAT:Float, INCR_WRAP:Float, INVERT:Float, KEEP:Float, LESS:Float, LINEAR:Float, LINEAR_MIPMAP_LINEAR:Float, LINEAR_MIPMAP_NEAREST:Float, LINES:Float, LINE_STRIP:Float, LINK_STATUS:Float, MAX_SAMPLES:Float, MAX_TEXTURE_IMAGE_UNITS:Float, MAX_TEXTURE_SIZE:Float, MIRRORED_REPEAT:Float, NEAREST:Float, NEAREST_MIPMAP_LINEAR:Float, NEAREST_MIPMAP_NEAREST:Float, NONE:Float, NOTEQUAL:Float, POINTS:Float, READ_FRAMEBUFFER:Float, RENDERBUFFER:Float, RENDERBUFFER_BINDING:Float, REPEAT:Float, RGBA16F:Float, RGBA32F:Float, RGBA8:Float, SCISSOR_BOX:Float, SCISSOR_TEST:Float, SRGB8_ALPHA8:Float, STATIC_DRAW:Float, STENCIL_BACK_FAIL:Float, STENCIL_BACK_FUNC:Float, STENCIL_BACK_PASS_DEPTH_FAIL:Float, STENCIL_BACK_PASS_DEPTH_PASS:Float, STENCIL_BACK_REF:Float, STENCIL_BACK_VALUE_MASK:Float, STENCIL_BACK_WRITEMASK:Float, STENCIL:Float, STENCIL_BUFFER_BIT:Float, STENCIL_FAIL:Float, STENCIL_FUNC:Float, STENCIL_PASS_DEPTH_FAIL:Float, STENCIL_PASS_DEPTH_PASS:Float, STENCIL_REF:Float, STENCIL_TEST:Float, STENCIL_VALUE_MASK:Float, STENCIL_WRITEMASK:Float, STREAM_DRAW:Float, TEXTURE0:Float, TEXTURE1:Float, TEXTURE2:Float, TEXTURE3:Float, TEXTURE_2D:Float, TEXTURE_2D_ARRAY:Float, TEXTURE_3D:Float, TEXTURE_BINDING_2D:Float, TEXTURE_BINDING_CUBE_MAP:Float, TEXTURE_CUBE_MAP:Float, TEXTURE_CUBE_MAP_POSITIVE_X:Float, TEXTURE_MAG_FILTER:Float, TEXTURE_MAX_LEVEL:Float, TEXTURE_MIN_FILTER:Float, TEXTURE_WRAP_R:Float, TEXTURE_WRAP_S:Float, TEXTURE_WRAP_T:Float, TRIANGLES:Float, TRIANGLE_FAN:Float, TRIANGLE_STRIP:Float, UNPACK_PREMULTIPLY_ALPHA_WEBGL:Float, UNSIGNED_BYTE:Float, UNSIGNED_INT:Float, UNSIGNED_INT_24_8:Float, UNSIGNED_SHORT:Float, VERTEX_ARRAY_BINDING:Float, VERTEX_SHADER:Float, VIEWPORT:Float, activeTexture:((texture:Float) -> Void), attachShader:((program:Dynamic, shader:Dynamic) -> Void), bindBuffer:((target:Float, buffer:Dynamic) -> Void), bindFramebuffer:((target:Float, framebuffer:Dynamic) -> Void), bindRenderbuffer:((target:Float, renderbuffer:Dynamic) -> Void), bindTexture:((target:Float, texture:Dynamic) -> Void), bindVertexArray:((array:Dynamic) -> Void), blendEquation:((mode:Float) -> Void), blendEquationSeparate:((modeRGB:Float, modeAlpha:Float) -> Void), blendFunc:((sfactor:Float, dfactor:Float) -> Void), blendFuncSeparate:((srcRGB:Float, dstRGB:Float, srcAlpha:Float, dstAlpha:Float) -> Void), blitFramebuffer:((srcX0:Float, srcY0:Float, srcX1:Float, srcY1:Float, dstX0:Float, dstY0:Float, dstX1:Float, dstY1:Float, mask:Float, filter:Float) -> Void), bufferData:Dynamic, bufferSubData:Dynamic, checkFramebufferStatus:((target:Float) -> Float), clear:((mask:Float) -> Void), clearBufferfi:((buffer:Float, drawbuffer:Float, depth:Float, stencil:Float) -> Void), clearBufferfv:Dynamic, clearBufferiv:Dynamic, clearColor:((red:Float, green:Float, blue:Float, alpha:Float) -> Void), clearDepth:((depth:Float) -> Void), colorMask:((red:Bool, green:Bool, blue:Bool, alpha:Bool) -> Void), compileShader:((shader:Dynamic) -> Void), compressedTexImage2D:Dynamic, compressedTexSubImage3D:Dynamic, createFramebuffer:(() -> Dynamic), createProgram:(() -> Dynamic), createRenderbuffer:(() -> Dynamic), createShader:((type:Float) -> Dynamic), createTexture:(() -> Dynamic), createVertexArray:(() -> Dynamic), cullFace:((mode:Float) -> Void), deleteBuffer:((buffer:Dynamic) -> Void), deleteFramebuffer:((framebuffer:Dynamic) -> Void), deleteProgram:((program:Dynamic) -> Void), deleteRenderbuffer:((renderbuffer:Dynamic) -> Void), deleteShader:((shader:Dynamic) -> Void), deleteTexture:((texture:Dynamic) -> Void), deleteVertexArray:((vertexArray:Dynamic) -> Void), depthFunc:((func:Float) -> Void), depthMask:((flag:Bool) -> Void), disable:((cap:Float) -> Void), disableVertexAttribArray:((index:Float) -> Void), drawArrays:((mode:Float, first:Float, count:Float) -> Void), drawArraysInstanced:((mode:Float, first:Float, count:Float, instanceCount:Float) -> Void), drawBuffers:Dynamic, drawElements:((mode:Float, count:Float, type:Float, offset:Float) -> Void), drawElementsInstanced:((mode:Float, count:Float, type:Float, offset:Float, instanceCount:Float) -> Void), drawingBufferHeight:Float, drawingBufferWidth:Float, enable:((cap:Float) -> Void), enableVertexAttribArray:((index:Float) -> Void), finish:(() -> Void), flush:(() -> Void), framebufferRenderbuffer:((target:Float, attachment:Float, renderbuffertarget:Float, renderbuffer:Dynamic) -> Void), framebufferTexture2D:((target:Float, attachment:Float, textarget:Float, texture:Dynamic, level:Float) -> Void), frontFace:((mode:Float) -> Void), generateMipmap:((target:Float) -> Void), getActiveUniform:((program:Dynamic, index:Float) -> Dynamic), getAttribLocation:((program:Dynamic, name:String) -> Float), getExtension:Dynamic, getParameter:((pname:Float) -> Dynamic), getProgramInfoLog:((program:Dynamic) -> Null<String>), getProgramParameter:((program:Dynamic, pname:Float) -> Dynamic), getShaderInfoLog:((shader:Dynamic) -> Null<String>), getShaderParameter:((shader:Dynamic, pname:Float) -> Dynamic), getUniformLocation:((program:Dynamic, name:String) -> Dynamic), isEnabled:((cap:Float) -> Bool), linkProgram:((program:Dynamic) -> Void), pixelStorei:((pname:Float, param:Dynamic) -> Void), readBuffer:((src:Float) -> Void), readPixels:Dynamic, renderbufferStorage:((target:Float, internalformat:Float, width:Float, height:Float) -> Void), renderbufferStorageMultisample:((target:Float, samples:Float, internalformat:Float, width:Float, height:Float) -> Void), scissor:((x:Float, y:Float, width:Float, height:Float) -> Void), shaderSource:((shader:Dynamic, source:String) -> Void), stencilFunc:((func:Float, ref:Float, mask:Float) -> Void), stencilFuncSeparate:((face:Float, func:Float, ref:Float, mask:Float) -> Void), stencilMask:((mask:Float) -> Void), stencilMaskSeparate:((face:Float, mask:Float) -> Void), stencilOp:((fail:Float, zfail:Float, zpass:Float) -> Void), stencilOpSeparate:((face:Float, fail:Float, zfail:Float, zpass:Float) -> Void), texImage2D:Dynamic, texImage3D:Dynamic, texParameterf:((target:Float, pname:Float, param:Float) -> Void), texParameteri:((target:Float, pname:Float, param:Float) -> Void), texStorage3D:((target:Float, levels:Float, internalformat:Float, width:Float, height:Float, depth:Float) -> Void), texSubImage2D:Dynamic, uniform1f:((location:Dynamic, x:Float) -> Void), uniform1fv:Dynamic, uniform1i:((location:Dynamic, x:Float) -> Void), uniform2f:((location:Dynamic, x:Float, y:Float) -> Void), uniform2fv:Dynamic, uniform3f:((location:Dynamic, x:Float, y:Float, z:Float) -> Void), uniform3fv:Dynamic, uniform4f:((location:Dynamic, x:Float, y:Float, z:Float, w:Float) -> Void), uniform4fv:Dynamic, uniformMatrix3fv:Dynamic, uniformMatrix4fv:Dynamic, useProgram:((program:Dynamic) -> Void), vertexAttrib4f:((index:Float, x:Float, y:Float, z:Float, w:Float) -> Void), vertexAttribDivisor:((index:Float, divisor:Float) -> Void), vertexAttribPointer:((index:Float, size:Float, type:Float, normalized:Bool, stride:Float, offset:Float) -> Void), getError:(() -> Float), INVALID_ENUM:Float, INVALID_OPERATION:Float, INVALID_VALUE:Float, NO_ERROR:Float, SRC_ALPHA:Float };

typedef GlClassicDefineKey = flight.esm.types.scene3d_gl.Types.GlClassicDefineKey;

typedef GlClassicLightingModel = flight.esm.types.scene3d_gl.Types.GlClassicLightingModel;

typedef GlClassicProgram = flight.esm.types.scene3d_gl.Types.GlClassicProgram;

typedef GlDebugDefineKey = flight.esm.types.scene3d_gl.Types.GlDebugDefineKey;

typedef GlDebugProgram = flight.esm.types.scene3d_gl.Types.GlDebugProgram;

typedef GlEnvironmentCaptureOptions = flight.esm.types.scene3d_gl.Types.GlEnvironmentCaptureOptions;

typedef GlLitProgram = flight.esm.types.scene3d_gl.Types.GlLitProgram;

typedef GlMatcapDefineKey = flight.esm.types.scene3d_gl.Types.GlMatcapDefineKey;

typedef GlMatcapProgram = flight.esm.types.scene3d_gl.Types.GlMatcapProgram;

typedef GlMeshProgram = flight.esm.types.scene3d_gl.Types.GlMeshProgram;

typedef GlMeshSkinFeature = flight.esm.types.scene3d_gl.Types.GlMeshSkinFeature;

typedef GlMeshUpload = flight.esm.types.scene3d_gl.Types.GlMeshUpload;

typedef GlPbrDefineKey = flight.esm.types.scene3d_gl.Types.GlPbrDefineKey;

typedef GlPbrExtensionBindContext = flight.esm.types.render_gl.Types.GlPbrExtensionBindContext;

typedef GlPbrExtensionIssue = flight.esm.types.scene3d_gl.Types.GlPbrExtensionIssue;

typedef GlPbrExtensionIssueCode = flight.esm.types.scene3d_gl.Types.GlPbrExtensionIssueCode;

typedef GlPbrExtensionShaderContext = flight.esm.types.render_gl.Types.GlPbrExtensionShaderContext;

typedef GlPbrExtensionShaderContribution = flight.esm.types.render_gl.Types.GlPbrExtensionShaderContribution;

typedef GlPbrProgram = flight.esm.types.scene3d_gl.Types.GlPbrProgram;

typedef GlPbrTransmissionSceneColor = flight.esm.types.scene3d_gl.Types.GlPbrTransmissionSceneColor;

typedef GlScene3DDrawEntry = flight.esm.types.scene3d_gl.Types.GlScene3DDrawEntry;

typedef GlScene3DForwardLightList = flight.esm.types.scene3d_gl.Types.GlScene3DForwardLightList;

typedef GlScene3DIbl = flight.esm.types.scene3d_gl.Types.GlScene3DIbl;

typedef GlScene3DPass = flight.esm.types.render_gl.Types.GlScene3DPass;

typedef GlScene3DRuntime = flight.esm.types.scene3d_gl.Types.GlScene3DRuntime;

typedef GlScene3DShadow = flight.esm.types.scene3d_gl.Types.GlScene3DShadow;

typedef GlShadedDefineKey = flight.esm.types.scene3d_gl.Types.GlShadedDefineKey;

typedef GlShadedProgram = flight.esm.types.scene3d_gl.Types.GlShadedProgram;

typedef GlToonDefineKey = flight.esm.types.scene3d_gl.Types.GlToonDefineKey;

typedef GlToonProgram = flight.esm.types.scene3d_gl.Types.GlToonProgram;

typedef GlUnlitDefineKey = flight.esm.types.scene3d_gl.Types.GlUnlitDefineKey;

typedef GlUnlitProgram = flight.esm.types.scene3d_gl.Types.GlUnlitProgram;

typedef GlWireframeProgram = flight.esm.types.scene3d_gl.Types.GlWireframeProgram;

typedef GlWireframeUpload = flight.esm.types.scene3d_gl.Types.GlWireframeUpload;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
