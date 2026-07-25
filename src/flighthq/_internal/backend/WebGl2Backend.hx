// Maintained runtime support for generated Flight Haxe.
package flighthq._internal.backend;

import flighthq._internal._Runtime;
import haxe.extern.EitherType;
#if (lime && !js)
import flighthq._internal._LimeTypedArray;
#end

/**
 * Cross-target WebGL2 context and object handle types.
 *
 * Under Lime the context is the typed `WebGL2RenderContext` abstract, whose
 * members are statically dispatched on every Lime backend (HTML5, native GL,
 * GLES). Under plain JavaScript (the Vitest bridge) the browser externs apply.
 * The remaining targets compile the full namespace for portability checks but
 * never execute GL, so the types erase to `Dynamic` there.
 */
#if lime
typedef GlContext = lime.graphics.WebGL2RenderContext;
typedef GlActiveInfo = lime.graphics.opengl.GLActiveInfo;
typedef GlBuffer = lime.graphics.opengl.GLBuffer;
typedef GlFramebuffer = lime.graphics.opengl.GLFramebuffer;
typedef GlProgram = lime.graphics.opengl.GLProgram;
typedef GlRenderbuffer = lime.graphics.opengl.GLRenderbuffer;
typedef GlShader = lime.graphics.opengl.GLShader;
typedef GlTexture = lime.graphics.opengl.GLTexture;
typedef GlUniformLocation = lime.graphics.opengl.GLUniformLocation;
typedef GlVertexArray = lime.graphics.opengl.GLVertexArrayObject;
#elseif js
typedef GlContext = js.html.webgl.WebGL2RenderingContext;
typedef GlActiveInfo = js.html.webgl.ActiveInfo;
typedef GlBuffer = js.html.webgl.Buffer;
typedef GlFramebuffer = js.html.webgl.Framebuffer;
typedef GlProgram = js.html.webgl.Program;
typedef GlRenderbuffer = js.html.webgl.Renderbuffer;
typedef GlShader = js.html.webgl.Shader;
typedef GlTexture = js.html.webgl.Texture;
typedef GlUniformLocation = js.html.webgl.UniformLocation;
typedef GlVertexArray = js.html.webgl.VertexArrayObject;
#else
typedef GlContext = Dynamic;
typedef GlActiveInfo = Dynamic;
typedef GlBuffer = Dynamic;
typedef GlFramebuffer = Dynamic;
typedef GlProgram = Dynamic;
typedef GlRenderbuffer = Dynamic;
typedef GlShader = Dynamic;
typedef GlTexture = Dynamic;
typedef GlUniformLocation = Dynamic;
typedef GlVertexArray = Dynamic;
#end

/** Float list accepted by `uniform*fv`-style entry points (`Float32List` upstream). */
abstract GlFloatList(Dynamic) from flighthq._internal._Float32Array from Array<Float> from Array<Dynamic> {}

/** Integer list accepted by `drawBuffers` (`sequence<GLenum>` upstream). */
abstract GlIntList(Dynamic) from Array<Int> from Array<Float> from Array<Dynamic> {}

/** Typed-array view accepted by buffer and texture upload entry points. */
abstract GlBufferSource(Dynamic) from flighthq._internal._Float32Array from flighthq._internal._Int16Array
  from flighthq._internal._UInt16Array from flighthq._internal._UInt8Array {}

/** `bufferData` second argument: a byte size or a typed-array view. The
 * upstream overload cannot be split mechanically without checker types, so the
 * discrimination is a single runtime test inside the endpoint. */
abstract GlBufferDataSource(Dynamic) from Float from Int from flighthq._internal._Float32Array
  from flighthq._internal._Int16Array from flighthq._internal._UInt16Array from flighthq._internal._UInt8Array {}

/**
 * Strictly typed static endpoints for every WebGL2 member reached by generated
 * Flight code, replacing name-string dispatch. Numeric parameters are `Float`
 * because generated TypeScript numbers are Float-typed; each endpoint owns the
 * `Std.int` coercion its underlying GL signature requires, so the generator
 * emits arguments unchanged. Constants are receiver-less `inline final` Int
 * values fixed by the WebGL specification and identical on every target.
 *
 * The legacy `call`/`field` name-string surface at the bottom dispatches into
 * the typed endpoints and remains only until regenerated output stops
 * referencing it.
 */
class WebGl2Backend {
  public static inline final ACTIVE_UNIFORMS:Int = 35718;
  public static inline final ALWAYS:Int = 519;
  public static inline final ARRAY_BUFFER:Int = 34962;
  public static inline final BACK:Int = 1029;
  public static inline final BLEND:Int = 3042;
  public static inline final CLAMP_TO_EDGE:Int = 33071;
  public static inline final COLOR:Int = 6144;
  public static inline final COLOR_ATTACHMENT0:Int = 36064;
  public static inline final COLOR_BUFFER_BIT:Int = 16384;
  public static inline final COMPILE_STATUS:Int = 35713;
  public static inline final CULL_FACE:Int = 2884;
  public static inline final DECR_WRAP:Int = 34056;
  public static inline final DEPTH24_STENCIL8:Int = 35056;
  public static inline final DEPTH_BUFFER_BIT:Int = 256;
  public static inline final DEPTH_STENCIL:Int = 34041;
  public static inline final DEPTH_STENCIL_ATTACHMENT:Int = 33306;
  public static inline final DEPTH_TEST:Int = 2929;
  public static inline final DRAW_FRAMEBUFFER:Int = 36009;
  public static inline final DST_COLOR:Int = 774;
  public static inline final DYNAMIC_DRAW:Int = 35048;
  public static inline final ELEMENT_ARRAY_BUFFER:Int = 34963;
  public static inline final EQUAL:Int = 514;
  public static inline final FLOAT:Int = 5126;
  public static inline final FLOAT_MAT2:Int = 35674;
  public static inline final FLOAT_MAT3:Int = 35675;
  public static inline final FLOAT_MAT4:Int = 35676;
  public static inline final FLOAT_VEC2:Int = 35664;
  public static inline final FLOAT_VEC3:Int = 35665;
  public static inline final FLOAT_VEC4:Int = 35666;
  public static inline final FRAGMENT_SHADER:Int = 35632;
  public static inline final FRAMEBUFFER:Int = 36160;
  public static inline final FRAMEBUFFER_BINDING:Int = 36006;
  public static inline final FRAMEBUFFER_COMPLETE:Int = 36053;
  public static inline final FRONT:Int = 1028;
  public static inline final FUNC_ADD:Int = 32774;
  public static inline final FUNC_REVERSE_SUBTRACT:Int = 32779;
  public static inline final HALF_FLOAT:Int = 5131;
  public static inline final INCR_WRAP:Int = 34055;
  public static inline final INVERT:Int = 5386;
  public static inline final KEEP:Int = 7680;
  public static inline final LESS:Int = 513;
  public static inline final LINEAR:Int = 9729;
  public static inline final LINEAR_MIPMAP_LINEAR:Int = 9987;
  public static inline final LINEAR_MIPMAP_NEAREST:Int = 9985;
  public static inline final LINES:Int = 1;
  public static inline final LINE_STRIP:Int = 3;
  public static inline final LINK_STATUS:Int = 35714;
  public static inline final MAX:Int = 32776;
  public static inline final MAX_SAMPLES:Int = 36183;
  public static inline final MIN:Int = 32775;
  public static inline final MIRRORED_REPEAT:Int = 33648;
  public static inline final NEAREST:Int = 9728;
  public static inline final NEAREST_MIPMAP_LINEAR:Int = 9986;
  public static inline final NEAREST_MIPMAP_NEAREST:Int = 9984;
  public static inline final NONE:Int = 0;
  public static inline final NOTEQUAL:Int = 517;
  public static inline final ONE:Int = 1;
  public static inline final ONE_MINUS_SRC_ALPHA:Int = 771;
  public static inline final ONE_MINUS_SRC_COLOR:Int = 769;
  public static inline final POINTS:Int = 0;
  public static inline final READ_FRAMEBUFFER:Int = 36008;
  public static inline final RENDERBUFFER:Int = 36161;
  public static inline final REPEAT:Int = 10497;
  public static inline final RGBA:Int = 6408;
  public static inline final RGBA16F:Int = 34842;
  public static inline final RGBA32F:Int = 34836;
  public static inline final RGBA8:Int = 32856;
  public static inline final SCISSOR_TEST:Int = 3089;
  public static inline final SRC_ALPHA:Int = 770;
  public static inline final STATIC_DRAW:Int = 35044;
  public static inline final STENCIL_BUFFER_BIT:Int = 1024;
  public static inline final STENCIL_TEST:Int = 2960;
  public static inline final STREAM_DRAW:Int = 35040;
  public static inline final TEXTURE0:Int = 33984;
  public static inline final TEXTURE1:Int = 33985;
  public static inline final TEXTURE2:Int = 33986;
  public static inline final TEXTURE_2D:Int = 3553;
  public static inline final TEXTURE_2D_ARRAY:Int = 35866;
  public static inline final TEXTURE_3D:Int = 32879;
  public static inline final TEXTURE_CUBE_MAP:Int = 34067;
  public static inline final TEXTURE_CUBE_MAP_POSITIVE_X:Int = 34069;
  public static inline final TEXTURE_MAG_FILTER:Int = 10240;
  public static inline final TEXTURE_MAX_LEVEL:Int = 33085;
  public static inline final TEXTURE_MIN_FILTER:Int = 10241;
  public static inline final TEXTURE_WRAP_R:Int = 32882;
  public static inline final TEXTURE_WRAP_S:Int = 10242;
  public static inline final TEXTURE_WRAP_T:Int = 10243;
  public static inline final TRIANGLES:Int = 4;
  public static inline final TRIANGLE_FAN:Int = 6;
  public static inline final TRIANGLE_STRIP:Int = 5;
  public static inline final UNPACK_PREMULTIPLY_ALPHA_WEBGL:Int = 37441;
  public static inline final UNSIGNED_BYTE:Int = 5121;
  public static inline final UNSIGNED_INT:Int = 5125;
  public static inline final UNSIGNED_INT_24_8:Int = 34042;
  public static inline final UNSIGNED_SHORT:Int = 5123;
  public static inline final VERTEX_SHADER:Int = 35633;
  public static inline final VIEWPORT:Int = 2978;
  public static inline final ZERO:Int = 0;

  public static inline function activeTexture(gl:GlContext, texture:Float):Void {
    gl.activeTexture(Std.int(texture));
  }

  public static inline function attachShader(gl:GlContext, program:GlProgram, shader:GlShader):Void {
    gl.attachShader(program, shader);
  }

  public static inline function bindBuffer(gl:GlContext, target:Float, buffer:Null<GlBuffer>):Void {
    gl.bindBuffer(Std.int(target), buffer);
  }

  public static inline function bindFramebuffer(gl:GlContext, target:Float, framebuffer:Null<GlFramebuffer>):Void {
    gl.bindFramebuffer(Std.int(target), framebuffer);
  }

  public static inline function bindRenderbuffer(gl:GlContext, target:Float, renderbuffer:Null<GlRenderbuffer>):Void {
    gl.bindRenderbuffer(Std.int(target), renderbuffer);
  }

  public static inline function bindTexture(gl:GlContext, target:Float, texture:Null<GlTexture>):Void {
    gl.bindTexture(Std.int(target), texture);
  }

  public static inline function bindVertexArray(gl:GlContext, vertexArray:Null<GlVertexArray>):Void {
    gl.bindVertexArray(vertexArray);
  }

  public static inline function blendEquation(gl:GlContext, mode:Float):Void {
    gl.blendEquation(Std.int(mode));
  }

  public static inline function blendFunc(gl:GlContext, sfactor:Float, dfactor:Float):Void {
    gl.blendFunc(Std.int(sfactor), Std.int(dfactor));
  }

  public static inline function blitFramebuffer(gl:GlContext, srcX0:Float, srcY0:Float, srcX1:Float, srcY1:Float,
      dstX0:Float, dstY0:Float, dstX1:Float, dstY1:Float, mask:Float, filter:Float):Void {
    gl.blitFramebuffer(Std.int(srcX0), Std.int(srcY0), Std.int(srcX1), Std.int(srcY1), Std.int(dstX0), Std.int(dstY0),
      Std.int(dstX1), Std.int(dstY1), Std.int(mask), Std.int(filter));
  }

  public static function bufferData(gl:GlContext, target:Float, sizeOrData:GlBufferDataSource, usage:Float):Void {
    final raw:Dynamic = sizeOrData;
    #if (lime && !js)
    if (Std.isOfType(raw, Int) || Std.isOfType(raw, Float)) {
      gl.bufferData(Std.int(target), new lime.utils.UInt8Array(Std.int(raw)), Std.int(usage));
    } else {
      gl.bufferData(Std.int(target), nativeView(cast raw), Std.int(usage));
    }
    #else
    gl.bufferData(Std.int(target), raw, Std.int(usage));
    #end
  }

  public static function bufferSubData(gl:GlContext, target:Float, dstByteOffset:Float, source:GlBufferSource,
      srcOffset:Float = 0, ?length:Float):Void {
    #if (lime && !js)
    final data = nativeView(source);
    if (length == null) {
      gl.bufferSubData(Std.int(target), Std.int(dstByteOffset), data);
    } else {
      // Lime's native srcOffset/length are byte quantities, WebGL2's are elements.
      final bytesPerElement = Std.int(data.byteLength / data.length);
      gl.bufferSubData(Std.int(target), Std.int(dstByteOffset), data, Std.int(srcOffset) * bytesPerElement,
        Std.int(length) * bytesPerElement);
    }
    #elseif js
    if (length == null) {
      js.Syntax.code('{0}.bufferSubData({1}, {2}, {3})', gl, Std.int(target), Std.int(dstByteOffset), source);
    } else {
      js.Syntax.code('{0}.bufferSubData({1}, {2}, {3}, {4}, {5})', gl, Std.int(target), Std.int(dstByteOffset), source,
        Std.int(srcOffset), Std.int(length));
    }
    #else
    if (length == null) {
      gl.bufferSubData(Std.int(target), Std.int(dstByteOffset), source);
    } else {
      gl.bufferSubData(Std.int(target), Std.int(dstByteOffset), source, Std.int(srcOffset), Std.int(length));
    }
    #end
  }

  public static inline function checkFramebufferStatus(gl:GlContext, target:Float):Int {
    return gl.checkFramebufferStatus(Std.int(target));
  }

  public static inline function clear(gl:GlContext, mask:Float):Void {
    gl.clear(Std.int(mask));
  }

  public static inline function clearBufferfi(gl:GlContext, buffer:Float, drawbuffer:Float, depth:Float, stencil:Float):Void {
    gl.clearBufferfi(Std.int(buffer), Std.int(drawbuffer), depth, Std.int(stencil));
  }

  public static inline function clearBufferfv(gl:GlContext, buffer:Float, drawbuffer:Float, values:GlFloatList):Void {
    #if (lime && !js)
    gl.clearBufferfv(Std.int(buffer), Std.int(drawbuffer), nativeFloats(values));
    #else
    gl.clearBufferfv(Std.int(buffer), Std.int(drawbuffer), cast values);
    #end
  }

  public static inline function clearColor(gl:GlContext, red:Float, green:Float, blue:Float, alpha:Float):Void {
    gl.clearColor(red, green, blue, alpha);
  }

  public static inline function colorMask(gl:GlContext, red:Bool, green:Bool, blue:Bool, alpha:Bool):Void {
    gl.colorMask(red, green, blue, alpha);
  }

  public static inline function compileShader(gl:GlContext, shader:GlShader):Void {
    gl.compileShader(shader);
  }

  public static inline function compressedTexImage2D(gl:GlContext, target:Float, level:Float, internalformat:Float,
      width:Float, height:Float, border:Float, data:GlBufferSource):Void {
    #if (lime && !js)
    gl.compressedTexImage2D(Std.int(target), Std.int(level), Std.int(internalformat), Std.int(width), Std.int(height),
      Std.int(border), nativeView(data));
    #else
    gl.compressedTexImage2D(Std.int(target), Std.int(level), Std.int(internalformat), Std.int(width), Std.int(height),
      Std.int(border), cast data);
    #end
  }

  public static inline function compressedTexSubImage3D(gl:GlContext, target:Float, level:Float, xoffset:Float,
      yoffset:Float, zoffset:Float, width:Float, height:Float, depth:Float, format:Float, data:GlBufferSource):Void {
    #if (lime && !js)
    gl.compressedTexSubImage3D(Std.int(target), Std.int(level), Std.int(xoffset), Std.int(yoffset), Std.int(zoffset),
      Std.int(width), Std.int(height), Std.int(depth), Std.int(format), nativeView(data));
    #else
    gl.compressedTexSubImage3D(Std.int(target), Std.int(level), Std.int(xoffset), Std.int(yoffset), Std.int(zoffset),
      Std.int(width), Std.int(height), Std.int(depth), Std.int(format), cast data);
    #end
  }

  public static inline function createBuffer(gl:GlContext):GlBuffer {
    return gl.createBuffer();
  }

  public static inline function createFramebuffer(gl:GlContext):GlFramebuffer {
    return gl.createFramebuffer();
  }

  public static inline function createProgram(gl:GlContext):GlProgram {
    return gl.createProgram();
  }

  public static inline function createRenderbuffer(gl:GlContext):GlRenderbuffer {
    return gl.createRenderbuffer();
  }

  public static inline function createShader(gl:GlContext, type:Float):GlShader {
    return gl.createShader(Std.int(type));
  }

  public static inline function createTexture(gl:GlContext):GlTexture {
    return gl.createTexture();
  }

  public static inline function createVertexArray(gl:GlContext):GlVertexArray {
    return gl.createVertexArray();
  }

  public static inline function cullFace(gl:GlContext, mode:Float):Void {
    gl.cullFace(Std.int(mode));
  }

  public static inline function deleteBuffer(gl:GlContext, buffer:Null<GlBuffer>):Void {
    gl.deleteBuffer(buffer);
  }

  public static inline function deleteFramebuffer(gl:GlContext, framebuffer:Null<GlFramebuffer>):Void {
    gl.deleteFramebuffer(framebuffer);
  }

  public static inline function deleteProgram(gl:GlContext, program:Null<GlProgram>):Void {
    gl.deleteProgram(program);
  }

  public static inline function deleteRenderbuffer(gl:GlContext, renderbuffer:Null<GlRenderbuffer>):Void {
    gl.deleteRenderbuffer(renderbuffer);
  }

  public static inline function deleteShader(gl:GlContext, shader:Null<GlShader>):Void {
    gl.deleteShader(shader);
  }

  public static inline function deleteTexture(gl:GlContext, texture:Null<GlTexture>):Void {
    gl.deleteTexture(texture);
  }

  public static inline function deleteVertexArray(gl:GlContext, vertexArray:Null<GlVertexArray>):Void {
    gl.deleteVertexArray(vertexArray);
  }

  public static inline function depthFunc(gl:GlContext, func:Float):Void {
    gl.depthFunc(Std.int(func));
  }

  public static inline function depthMask(gl:GlContext, flag:Bool):Void {
    gl.depthMask(flag);
  }

  public static inline function disable(gl:GlContext, cap:Float):Void {
    gl.disable(Std.int(cap));
  }

  public static inline function disableVertexAttribArray(gl:GlContext, index:Float):Void {
    gl.disableVertexAttribArray(Std.int(index));
  }

  public static inline function drawArrays(gl:GlContext, mode:Float, first:Float, count:Float):Void {
    gl.drawArrays(Std.int(mode), Std.int(first), Std.int(count));
  }

  public static inline function drawBuffers(gl:GlContext, buffers:GlIntList):Void {
    #if (lime && !js)
    gl.drawBuffers(nativeInts(buffers));
    #else
    gl.drawBuffers(cast buffers);
    #end
  }

  public static inline function drawElements(gl:GlContext, mode:Float, count:Float, type:Float, offset:Float):Void {
    gl.drawElements(Std.int(mode), Std.int(count), Std.int(type), Std.int(offset));
  }

  public static inline function drawElementsInstanced(gl:GlContext, mode:Float, count:Float, type:Float, offset:Float,
      instanceCount:Float):Void {
    gl.drawElementsInstanced(Std.int(mode), Std.int(count), Std.int(type), Std.int(offset), Std.int(instanceCount));
  }

  public static inline function enable(gl:GlContext, cap:Float):Void {
    gl.enable(Std.int(cap));
  }

  public static inline function enableVertexAttribArray(gl:GlContext, index:Float):Void {
    gl.enableVertexAttribArray(Std.int(index));
  }

  public static inline function flush(gl:GlContext):Void {
    gl.flush();
  }

  public static inline function framebufferRenderbuffer(gl:GlContext, target:Float, attachment:Float,
      renderbuffertarget:Float, renderbuffer:Null<GlRenderbuffer>):Void {
    gl.framebufferRenderbuffer(Std.int(target), Std.int(attachment), Std.int(renderbuffertarget), renderbuffer);
  }

  public static inline function framebufferTexture2D(gl:GlContext, target:Float, attachment:Float, textarget:Float,
      texture:Null<GlTexture>, level:Float):Void {
    gl.framebufferTexture2D(Std.int(target), Std.int(attachment), Std.int(textarget), texture, Std.int(level));
  }

  public static inline function generateMipmap(gl:GlContext, target:Float):Void {
    gl.generateMipmap(Std.int(target));
  }

  public static inline function getActiveUniform(gl:GlContext, program:GlProgram, index:Float):GlActiveInfo {
    return gl.getActiveUniform(program, Std.int(index));
  }

  public static inline function getAttribLocation(gl:GlContext, program:GlProgram, name:String):Int {
    return gl.getAttribLocation(program, name);
  }

  public static inline function getExtension(gl:GlContext, name:String):Dynamic {
    return gl.getExtension(name);
  }

  public static inline function getParameter(gl:GlContext, pname:Float):Dynamic {
    return gl.getParameter(Std.int(pname));
  }

  public static inline function getProgramInfoLog(gl:GlContext, program:GlProgram):String {
    return gl.getProgramInfoLog(program);
  }

  public static inline function getProgramParameter(gl:GlContext, program:GlProgram, pname:Float):Dynamic {
    return gl.getProgramParameter(program, Std.int(pname));
  }

  public static inline function getShaderInfoLog(gl:GlContext, shader:GlShader):String {
    return gl.getShaderInfoLog(shader);
  }

  public static inline function getShaderParameter(gl:GlContext, shader:GlShader, pname:Float):Dynamic {
    return gl.getShaderParameter(shader, Std.int(pname));
  }

  public static inline function getUniformLocation(gl:GlContext, program:GlProgram, name:String):GlUniformLocation {
    return gl.getUniformLocation(program, name);
  }

  public static inline function linkProgram(gl:GlContext, program:GlProgram):Void {
    gl.linkProgram(program);
  }

  public static inline function pixelStorei(gl:GlContext, pname:Float, param:EitherType<Float, Bool>):Void {
    #if (lime && !js)
    final raw:Dynamic = param;
    gl.pixelStorei(Std.int(pname), Std.isOfType(raw, Bool) ? ((raw : Bool) ? 1 : 0) : Std.int(raw));
    #elseif js
    js.Syntax.code('{0}.pixelStorei({1}, {2})', gl, Std.int(pname), param);
    #else
    gl.pixelStorei(Std.int(pname), param);
    #end
  }

  public static inline function readBuffer(gl:GlContext, src:Float):Void {
    gl.readBuffer(Std.int(src));
  }

  public static inline function readPixels(gl:GlContext, x:Float, y:Float, width:Float, height:Float, format:Float,
      type:Float, pixels:GlBufferSource):Void {
    #if (lime && !js)
    gl.readPixels(Std.int(x), Std.int(y), Std.int(width), Std.int(height), Std.int(format), Std.int(type),
      nativeView(pixels));
    #else
    gl.readPixels(Std.int(x), Std.int(y), Std.int(width), Std.int(height), Std.int(format), Std.int(type), cast pixels);
    #end
  }

  public static inline function renderbufferStorage(gl:GlContext, target:Float, internalformat:Float, width:Float,
      height:Float):Void {
    gl.renderbufferStorage(Std.int(target), Std.int(internalformat), Std.int(width), Std.int(height));
  }

  public static inline function renderbufferStorageMultisample(gl:GlContext, target:Float, samples:Float,
      internalformat:Float, width:Float, height:Float):Void {
    gl.renderbufferStorageMultisample(Std.int(target), Std.int(samples), Std.int(internalformat), Std.int(width),
      Std.int(height));
  }

  public static inline function scissor(gl:GlContext, x:Float, y:Float, width:Float, height:Float):Void {
    gl.scissor(Std.int(x), Std.int(y), Std.int(width), Std.int(height));
  }

  public static inline function shaderSource(gl:GlContext, shader:GlShader, source:String):Void {
    #if (lime && !js)
    gl.shaderSource(shader, adaptShaderSource(gl, source));
    #else
    gl.shaderSource(shader, source);
    #end
  }

  public static inline function stencilFunc(gl:GlContext, func:Float, ref:Float, mask:Float):Void {
    gl.stencilFunc(Std.int(func), Std.int(ref), Std.int(mask));
  }

  public static inline function stencilMask(gl:GlContext, mask:Float):Void {
    gl.stencilMask(Std.int(mask));
  }

  public static inline function stencilOp(gl:GlContext, fail:Float, zfail:Float, zpass:Float):Void {
    gl.stencilOp(Std.int(fail), Std.int(zfail), Std.int(zpass));
  }

  public static inline function stencilOpSeparate(gl:GlContext, face:Float, fail:Float, zfail:Float, zpass:Float):Void {
    gl.stencilOpSeparate(Std.int(face), Std.int(fail), Std.int(zfail), Std.int(zpass));
  }

  public static inline function texImage2D(gl:GlContext, target:Float, level:Float, internalformat:Float, width:Float,
      height:Float, border:Float, format:Float, type:Float, pixels:Null<GlBufferSource>):Void {
    #if (lime && !js)
    gl.texImage2D(Std.int(target), Std.int(level), Std.int(internalformat), Std.int(width), Std.int(height),
      Std.int(border), Std.int(format), Std.int(type), pixels == null ? null : nativeView(pixels));
    #elseif js
    js.Syntax.code('{0}.texImage2D({1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, {9})', gl, Std.int(target), Std.int(level),
      Std.int(internalformat), Std.int(width), Std.int(height), Std.int(border), Std.int(format), Std.int(type), pixels);
    #else
    gl.texImage2D(Std.int(target), Std.int(level), Std.int(internalformat), Std.int(width), Std.int(height),
      Std.int(border), Std.int(format), Std.int(type), pixels);
    #end
  }

  /** The 6-argument DOM-source overload of `texImage2D`. The source is a host
   * object (canvas, image, video, ImageData), which has no native GL
   * equivalent; native texture uploads use the 9-argument pixel form. */
  public static inline function texImage2DSource(gl:GlContext, target:Float, level:Float, internalformat:Float,
      format:Float, type:Float, source:Dynamic):Void {
    #if (lime && !js)
    throw 'WebGl2Backend: texImage2D from a DOM source is not supported on native GL targets';
    #elseif js
    js.Syntax.code('{0}.texImage2D({1}, {2}, {3}, {4}, {5}, {6})', gl, Std.int(target), Std.int(level),
      Std.int(internalformat), Std.int(format), Std.int(type), source);
    #else
    gl.texImage2D(Std.int(target), Std.int(level), Std.int(internalformat), Std.int(format), Std.int(type), source);
    #end
  }

  public static inline function texImage3D(gl:GlContext, target:Float, level:Float, internalformat:Float, width:Float,
      height:Float, depth:Float, border:Float, format:Float, type:Float, pixels:Null<GlBufferSource>):Void {
    #if (lime && !js)
    gl.texImage3D(Std.int(target), Std.int(level), Std.int(internalformat), Std.int(width), Std.int(height),
      Std.int(depth), Std.int(border), Std.int(format), Std.int(type), pixels == null ? null : nativeView(pixels));
    #elseif js
    js.Syntax.code('{0}.texImage3D({1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, {9}, {10})', gl, Std.int(target),
      Std.int(level), Std.int(internalformat), Std.int(width), Std.int(height), Std.int(depth), Std.int(border),
      Std.int(format), Std.int(type), pixels);
    #else
    gl.texImage3D(Std.int(target), Std.int(level), Std.int(internalformat), Std.int(width), Std.int(height),
      Std.int(depth), Std.int(border), Std.int(format), Std.int(type), pixels);
    #end
  }

  public static inline function texParameterf(gl:GlContext, target:Float, pname:Float, param:Float):Void {
    gl.texParameterf(Std.int(target), Std.int(pname), param);
  }

  public static inline function texParameteri(gl:GlContext, target:Float, pname:Float, param:Float):Void {
    gl.texParameteri(Std.int(target), Std.int(pname), Std.int(param));
  }

  public static inline function texStorage3D(gl:GlContext, target:Float, levels:Float, internalformat:Float,
      width:Float, height:Float, depth:Float):Void {
    gl.texStorage3D(Std.int(target), Std.int(levels), Std.int(internalformat), Std.int(width), Std.int(height),
      Std.int(depth));
  }

  public static inline function texSubImage2D(gl:GlContext, target:Float, level:Float, xoffset:Float, yoffset:Float,
      width:Float, height:Float, format:Float, type:Float, pixels:GlBufferSource):Void {
    #if (lime && !js)
    gl.texSubImage2D(Std.int(target), Std.int(level), Std.int(xoffset), Std.int(yoffset), Std.int(width),
      Std.int(height), Std.int(format), Std.int(type), nativeView(pixels));
    #elseif js
    js.Syntax.code('{0}.texSubImage2D({1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, {9})', gl, Std.int(target),
      Std.int(level), Std.int(xoffset), Std.int(yoffset), Std.int(width), Std.int(height), Std.int(format),
      Std.int(type), pixels);
    #else
    gl.texSubImage2D(Std.int(target), Std.int(level), Std.int(xoffset), Std.int(yoffset), Std.int(width),
      Std.int(height), Std.int(format), Std.int(type), pixels);
    #end
  }

  public static inline function uniform1f(gl:GlContext, location:Null<GlUniformLocation>, x:Float):Void {
    gl.uniform1f(location, x);
  }

  public static inline function uniform1fv(gl:GlContext, location:Null<GlUniformLocation>, values:GlFloatList):Void {
    #if (lime && !js)
    gl.uniform1fv(location, nativeFloats(values));
    #else
    gl.uniform1fv(location, cast values);
    #end
  }

  public static inline function uniform1i(gl:GlContext, location:Null<GlUniformLocation>, x:Float):Void {
    gl.uniform1i(location, Std.int(x));
  }

  public static inline function uniform2f(gl:GlContext, location:Null<GlUniformLocation>, x:Float, y:Float):Void {
    gl.uniform2f(location, x, y);
  }

  public static inline function uniform2fv(gl:GlContext, location:Null<GlUniformLocation>, values:GlFloatList):Void {
    #if (lime && !js)
    gl.uniform2fv(location, nativeFloats(values));
    #else
    gl.uniform2fv(location, cast values);
    #end
  }

  public static inline function uniform3f(gl:GlContext, location:Null<GlUniformLocation>, x:Float, y:Float, z:Float):Void {
    gl.uniform3f(location, x, y, z);
  }

  public static inline function uniform3fv(gl:GlContext, location:Null<GlUniformLocation>, values:GlFloatList):Void {
    #if (lime && !js)
    gl.uniform3fv(location, nativeFloats(values));
    #else
    gl.uniform3fv(location, cast values);
    #end
  }

  public static inline function uniform4f(gl:GlContext, location:Null<GlUniformLocation>, x:Float, y:Float, z:Float,
      w:Float):Void {
    gl.uniform4f(location, x, y, z, w);
  }

  public static inline function uniform4fv(gl:GlContext, location:Null<GlUniformLocation>, values:GlFloatList):Void {
    #if (lime && !js)
    gl.uniform4fv(location, nativeFloats(values));
    #else
    gl.uniform4fv(location, cast values);
    #end
  }

  public static inline function uniformMatrix3fv(gl:GlContext, location:Null<GlUniformLocation>, transpose:Bool,
      values:GlFloatList):Void {
    #if (lime && !js)
    gl.uniformMatrix3fv(location, transpose, nativeFloats(values));
    #else
    gl.uniformMatrix3fv(location, transpose, cast values);
    #end
  }

  public static inline function uniformMatrix4fv(gl:GlContext, location:Null<GlUniformLocation>, transpose:Bool,
      values:GlFloatList):Void {
    #if (lime && !js)
    gl.uniformMatrix4fv(location, transpose, nativeFloats(values));
    #else
    gl.uniformMatrix4fv(location, transpose, cast values);
    #end
  }

  public static inline function useProgram(gl:GlContext, program:Null<GlProgram>):Void {
    gl.useProgram(program);
  }

  public static inline function vertexAttrib4f(gl:GlContext, index:Float, x:Float, y:Float, z:Float, w:Float):Void {
    gl.vertexAttrib4f(Std.int(index), x, y, z, w);
  }

  public static inline function vertexAttribDivisor(gl:GlContext, index:Float, divisor:Float):Void {
    gl.vertexAttribDivisor(Std.int(index), Std.int(divisor));
  }

  public static inline function vertexAttribPointer(gl:GlContext, index:Float, size:Float, type:Float, normalized:Bool,
      stride:Float, offset:Float):Void {
    gl.vertexAttribPointer(Std.int(index), Std.int(size), Std.int(type), normalized, Std.int(stride), Std.int(offset));
  }

  public static inline function viewport(gl:GlContext, x:Float, y:Float, width:Float, height:Float):Void {
    gl.viewport(Std.int(x), Std.int(y), Std.int(width), Std.int(height));
  }

  #if (lime && !js)
  /**
   * Flight shaders target WebGL2's GLSL ES 3.00 dialect. Lime's compatibility
   * context on desktop is OpenGL, where the equivalent language is GLSL 3.30
   * core and ES precision declarations are invalid.
   */
  public static function adaptShaderSource(context:Dynamic, source:String):String {
    if (Reflect.field(context, 'type') != 'opengl') return source;
    final version = ~/^\s*#version\s+300\s+es[^\n]*\n?/;
    var result = version.match(source)
      ? version.replace(source, '#version 330 core\n')
      : '#version 330 core\n' + source;
    result = ~/^\s*precision\s+\w+\s+\w+\s*;\s*$/gm.replace(result, '');
    return ~/\b(lowp|mediump|highp)\s+/g.replace(result, '');
  }

  static function nativeFloats(values:GlFloatList):lime.utils.ArrayBufferView {
    return nativeView(cast values);
  }

  static function nativeInts(values:GlIntList):Array<Int> {
    final array:Array<Dynamic> = cast (values : Dynamic);
    return [for (value in array) Std.int(value)];
  }

  static function nativeView(source:GlBufferSource):lime.utils.ArrayBufferView {
    final raw:Dynamic = source;
    if (Std.isOfType(raw, _LimeTypedArray)) return cast (raw : _LimeTypedArray).nativeView;
    if (Std.isOfType(raw, Array)) return cast new lime.utils.Float32Array(null, null, cast raw);
    return cast raw;
  }
  #end

  // Legacy name-string surface: dispatches into the typed endpoints so
  // pre-regeneration generated output keeps compiling. Delete once regenerated
  // code emits the typed endpoints directly.

  public static function call(context:Dynamic, name:String, a:Array<Dynamic>):Dynamic {
    if (context == null) return null;
    final gl:GlContext = context;
    switch (name) {
      case 'activeTexture': activeTexture(gl, a[0]);
      case 'attachShader': attachShader(gl, a[0], a[1]);
      case 'bindBuffer': bindBuffer(gl, a[0], a[1]);
      case 'bindFramebuffer': bindFramebuffer(gl, a[0], a[1]);
      case 'bindRenderbuffer': bindRenderbuffer(gl, a[0], a[1]);
      case 'bindTexture': bindTexture(gl, a[0], a[1]);
      case 'bindVertexArray': bindVertexArray(gl, a[0]);
      case 'blendEquation': blendEquation(gl, a[0]);
      case 'blendFunc': blendFunc(gl, a[0], a[1]);
      case 'blitFramebuffer': blitFramebuffer(gl, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]);
      case 'bufferData': bufferData(gl, a[0], a[1], a[2]);
      case 'bufferSubData':
        if (a.length == 5) bufferSubData(gl, a[0], a[1], a[2], a[3], a[4]);
        else bufferSubData(gl, a[0], a[1], a[2]);
      case 'checkFramebufferStatus': return checkFramebufferStatus(gl, a[0]);
      case 'clear': clear(gl, a[0]);
      case 'clearBufferfi': clearBufferfi(gl, a[0], a[1], a[2], a[3]);
      case 'clearBufferfv': clearBufferfv(gl, a[0], a[1], a[2]);
      case 'clearColor': clearColor(gl, a[0], a[1], a[2], a[3]);
      case 'colorMask': colorMask(gl, a[0], a[1], a[2], a[3]);
      case 'compileShader': compileShader(gl, a[0]);
      case 'compressedTexImage2D': compressedTexImage2D(gl, a[0], a[1], a[2], a[3], a[4], a[5], a[6]);
      case 'compressedTexSubImage3D': compressedTexSubImage3D(gl, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]);
      case 'createBuffer': return createBuffer(gl);
      case 'createFramebuffer': return createFramebuffer(gl);
      case 'createProgram': return createProgram(gl);
      case 'createRenderbuffer': return createRenderbuffer(gl);
      case 'createShader': return createShader(gl, a[0]);
      case 'createTexture': return createTexture(gl);
      case 'createVertexArray': return createVertexArray(gl);
      case 'cullFace': cullFace(gl, a[0]);
      case 'deleteBuffer': deleteBuffer(gl, a[0]);
      case 'deleteFramebuffer': deleteFramebuffer(gl, a[0]);
      case 'deleteProgram': deleteProgram(gl, a[0]);
      case 'deleteRenderbuffer': deleteRenderbuffer(gl, a[0]);
      case 'deleteShader': deleteShader(gl, a[0]);
      case 'deleteTexture': deleteTexture(gl, a[0]);
      case 'deleteVertexArray': deleteVertexArray(gl, a[0]);
      case 'depthFunc': depthFunc(gl, a[0]);
      case 'depthMask': depthMask(gl, a[0]);
      case 'disable': disable(gl, a[0]);
      case 'disableVertexAttribArray': disableVertexAttribArray(gl, a[0]);
      case 'drawArrays': drawArrays(gl, a[0], a[1], a[2]);
      case 'drawBuffers': drawBuffers(gl, a[0]);
      case 'drawElements': drawElements(gl, a[0], a[1], a[2], a[3]);
      case 'drawElementsInstanced': drawElementsInstanced(gl, a[0], a[1], a[2], a[3], a[4]);
      case 'enable': enable(gl, a[0]);
      case 'enableVertexAttribArray': enableVertexAttribArray(gl, a[0]);
      case 'flush': flush(gl);
      case 'framebufferRenderbuffer': framebufferRenderbuffer(gl, a[0], a[1], a[2], a[3]);
      case 'framebufferTexture2D': framebufferTexture2D(gl, a[0], a[1], a[2], a[3], a[4]);
      case 'generateMipmap': generateMipmap(gl, a[0]);
      case 'getActiveUniform': return getActiveUniform(gl, a[0], a[1]);
      case 'getAttribLocation': return getAttribLocation(gl, a[0], a[1]);
      case 'getExtension': return getExtension(gl, a[0]);
      case 'getParameter': return getParameter(gl, a[0]);
      case 'getProgramInfoLog': return getProgramInfoLog(gl, a[0]);
      case 'getProgramParameter': return getProgramParameter(gl, a[0], a[1]);
      case 'getShaderInfoLog': return getShaderInfoLog(gl, a[0]);
      case 'getShaderParameter': return getShaderParameter(gl, a[0], a[1]);
      case 'getUniformLocation': return getUniformLocation(gl, a[0], a[1]);
      case 'linkProgram': linkProgram(gl, a[0]);
      case 'pixelStorei': pixelStorei(gl, a[0], a[1]);
      case 'readBuffer': readBuffer(gl, a[0]);
      case 'readPixels': readPixels(gl, a[0], a[1], a[2], a[3], a[4], a[5], a[6]);
      case 'renderbufferStorage': renderbufferStorage(gl, a[0], a[1], a[2], a[3]);
      case 'renderbufferStorageMultisample': renderbufferStorageMultisample(gl, a[0], a[1], a[2], a[3], a[4]);
      case 'scissor': scissor(gl, a[0], a[1], a[2], a[3]);
      case 'shaderSource': shaderSource(gl, a[0], a[1]);
      case 'stencilFunc': stencilFunc(gl, a[0], a[1], a[2]);
      case 'stencilMask': stencilMask(gl, a[0]);
      case 'stencilOp': stencilOp(gl, a[0], a[1], a[2]);
      case 'stencilOpSeparate': stencilOpSeparate(gl, a[0], a[1], a[2], a[3]);
      case 'texImage2D':
        if (a.length == 6) texImage2DSource(gl, a[0], a[1], a[2], a[3], a[4], a[5]);
        else texImage2D(gl, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]);
      case 'texImage3D': texImage3D(gl, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]);
      case 'texParameterf': texParameterf(gl, a[0], a[1], a[2]);
      case 'texParameteri': texParameteri(gl, a[0], a[1], a[2]);
      case 'texStorage3D': texStorage3D(gl, a[0], a[1], a[2], a[3], a[4], a[5]);
      case 'texSubImage2D': texSubImage2D(gl, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]);
      case 'uniform1f': uniform1f(gl, a[0], a[1]);
      case 'uniform1fv': uniform1fv(gl, a[0], a[1]);
      case 'uniform1i': uniform1i(gl, a[0], a[1]);
      case 'uniform2f': uniform2f(gl, a[0], a[1], a[2]);
      case 'uniform2fv': uniform2fv(gl, a[0], a[1]);
      case 'uniform3f': uniform3f(gl, a[0], a[1], a[2], a[3]);
      case 'uniform3fv': uniform3fv(gl, a[0], a[1]);
      case 'uniform4f': uniform4f(gl, a[0], a[1], a[2], a[3], a[4]);
      case 'uniform4fv': uniform4fv(gl, a[0], a[1]);
      case 'uniformMatrix3fv': uniformMatrix3fv(gl, a[0], a[1], a[2]);
      case 'uniformMatrix4fv': uniformMatrix4fv(gl, a[0], a[1], a[2]);
      case 'useProgram': useProgram(gl, a[0]);
      case 'vertexAttrib4f': vertexAttrib4f(gl, a[0], a[1], a[2], a[3], a[4]);
      case 'vertexAttribDivisor': vertexAttribDivisor(gl, a[0], a[1]);
      case 'vertexAttribPointer': vertexAttribPointer(gl, a[0], a[1], a[2], a[3], a[4], a[5]);
      case 'viewport': viewport(gl, a[0], a[1], a[2], a[3]);
      default:
        throw 'WebGl2Backend: unmapped GL method ' + name;
    }
    return null;
  }

  public static function callOptional(context:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (context == null) return _Runtime.UNDEFINED;
    return call(context, name, arguments);
  }

  public static function field(context:Dynamic, name:String):Dynamic {
    return switch (name) {
      case 'ACTIVE_UNIFORMS': ACTIVE_UNIFORMS;
      case 'ALWAYS': ALWAYS;
      case 'ARRAY_BUFFER': ARRAY_BUFFER;
      case 'BACK': BACK;
      case 'BLEND': BLEND;
      case 'CLAMP_TO_EDGE': CLAMP_TO_EDGE;
      case 'COLOR': COLOR;
      case 'COLOR_ATTACHMENT0': COLOR_ATTACHMENT0;
      case 'COLOR_BUFFER_BIT': COLOR_BUFFER_BIT;
      case 'COMPILE_STATUS': COMPILE_STATUS;
      case 'CULL_FACE': CULL_FACE;
      case 'DECR_WRAP': DECR_WRAP;
      case 'DEPTH24_STENCIL8': DEPTH24_STENCIL8;
      case 'DEPTH_BUFFER_BIT': DEPTH_BUFFER_BIT;
      case 'DEPTH_STENCIL': DEPTH_STENCIL;
      case 'DEPTH_STENCIL_ATTACHMENT': DEPTH_STENCIL_ATTACHMENT;
      case 'DEPTH_TEST': DEPTH_TEST;
      case 'DRAW_FRAMEBUFFER': DRAW_FRAMEBUFFER;
      case 'DST_COLOR': DST_COLOR;
      case 'DYNAMIC_DRAW': DYNAMIC_DRAW;
      case 'ELEMENT_ARRAY_BUFFER': ELEMENT_ARRAY_BUFFER;
      case 'EQUAL': EQUAL;
      case 'FLOAT': FLOAT;
      case 'FLOAT_MAT2': FLOAT_MAT2;
      case 'FLOAT_MAT3': FLOAT_MAT3;
      case 'FLOAT_MAT4': FLOAT_MAT4;
      case 'FLOAT_VEC2': FLOAT_VEC2;
      case 'FLOAT_VEC3': FLOAT_VEC3;
      case 'FLOAT_VEC4': FLOAT_VEC4;
      case 'FRAGMENT_SHADER': FRAGMENT_SHADER;
      case 'FRAMEBUFFER': FRAMEBUFFER;
      case 'FRAMEBUFFER_BINDING': FRAMEBUFFER_BINDING;
      case 'FRAMEBUFFER_COMPLETE': FRAMEBUFFER_COMPLETE;
      case 'FRONT': FRONT;
      case 'FUNC_ADD': FUNC_ADD;
      case 'FUNC_REVERSE_SUBTRACT': FUNC_REVERSE_SUBTRACT;
      case 'HALF_FLOAT': HALF_FLOAT;
      case 'INCR_WRAP': INCR_WRAP;
      case 'INVERT': INVERT;
      case 'KEEP': KEEP;
      case 'LESS': LESS;
      case 'LINEAR': LINEAR;
      case 'LINEAR_MIPMAP_LINEAR': LINEAR_MIPMAP_LINEAR;
      case 'LINEAR_MIPMAP_NEAREST': LINEAR_MIPMAP_NEAREST;
      case 'LINES': LINES;
      case 'LINE_STRIP': LINE_STRIP;
      case 'LINK_STATUS': LINK_STATUS;
      case 'MAX': MAX;
      case 'MAX_SAMPLES': MAX_SAMPLES;
      case 'MIN': MIN;
      case 'MIRRORED_REPEAT': MIRRORED_REPEAT;
      case 'NEAREST': NEAREST;
      case 'NEAREST_MIPMAP_LINEAR': NEAREST_MIPMAP_LINEAR;
      case 'NEAREST_MIPMAP_NEAREST': NEAREST_MIPMAP_NEAREST;
      case 'NONE': NONE;
      case 'NOTEQUAL': NOTEQUAL;
      case 'ONE': ONE;
      case 'ONE_MINUS_SRC_ALPHA': ONE_MINUS_SRC_ALPHA;
      case 'ONE_MINUS_SRC_COLOR': ONE_MINUS_SRC_COLOR;
      case 'POINTS': POINTS;
      case 'READ_FRAMEBUFFER': READ_FRAMEBUFFER;
      case 'RENDERBUFFER': RENDERBUFFER;
      case 'REPEAT': REPEAT;
      case 'RGBA': RGBA;
      case 'RGBA16F': RGBA16F;
      case 'RGBA32F': RGBA32F;
      case 'RGBA8': RGBA8;
      case 'SCISSOR_TEST': SCISSOR_TEST;
      case 'SRC_ALPHA': SRC_ALPHA;
      case 'STATIC_DRAW': STATIC_DRAW;
      case 'STENCIL_BUFFER_BIT': STENCIL_BUFFER_BIT;
      case 'STENCIL_TEST': STENCIL_TEST;
      case 'STREAM_DRAW': STREAM_DRAW;
      case 'TEXTURE0': TEXTURE0;
      case 'TEXTURE1': TEXTURE1;
      case 'TEXTURE2': TEXTURE2;
      case 'TEXTURE_2D': TEXTURE_2D;
      case 'TEXTURE_2D_ARRAY': TEXTURE_2D_ARRAY;
      case 'TEXTURE_3D': TEXTURE_3D;
      case 'TEXTURE_CUBE_MAP': TEXTURE_CUBE_MAP;
      case 'TEXTURE_CUBE_MAP_POSITIVE_X': TEXTURE_CUBE_MAP_POSITIVE_X;
      case 'TEXTURE_MAG_FILTER': TEXTURE_MAG_FILTER;
      case 'TEXTURE_MAX_LEVEL': TEXTURE_MAX_LEVEL;
      case 'TEXTURE_MIN_FILTER': TEXTURE_MIN_FILTER;
      case 'TEXTURE_WRAP_R': TEXTURE_WRAP_R;
      case 'TEXTURE_WRAP_S': TEXTURE_WRAP_S;
      case 'TEXTURE_WRAP_T': TEXTURE_WRAP_T;
      case 'TRIANGLES': TRIANGLES;
      case 'TRIANGLE_FAN': TRIANGLE_FAN;
      case 'TRIANGLE_STRIP': TRIANGLE_STRIP;
      case 'UNPACK_PREMULTIPLY_ALPHA_WEBGL': UNPACK_PREMULTIPLY_ALPHA_WEBGL;
      case 'UNSIGNED_BYTE': UNSIGNED_BYTE;
      case 'UNSIGNED_INT': UNSIGNED_INT;
      case 'UNSIGNED_INT_24_8': UNSIGNED_INT_24_8;
      case 'UNSIGNED_SHORT': UNSIGNED_SHORT;
      case 'VERTEX_SHADER': VERTEX_SHADER;
      case 'VIEWPORT': VIEWPORT;
      case 'ZERO': ZERO;
      default:
        throw 'WebGl2Backend: unmapped GL constant ' + name;
    };
  }

  public static function setField(context:Dynamic, name:String, value:Dynamic):Dynamic {
    Reflect.setField(context, name, value);
    return value;
  }

  public static function deleteField(context:Dynamic, name:String):Bool {
    return Reflect.deleteField(context, name);
  }
}
