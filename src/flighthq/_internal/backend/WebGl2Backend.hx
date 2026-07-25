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
abstract GlBufferSource(Dynamic) from flighthq._internal._Float32Array from flighthq._internal._Float64Array
  from flighthq._internal._Int8Array from flighthq._internal._Int16Array from flighthq._internal._Int32Array
  from flighthq._internal._UInt8Array from flighthq._internal._UInt8ClampedArray
  from flighthq._internal._UInt16Array from flighthq._internal._UInt32Array {}

/** `bufferData` second argument: a byte size or a typed-array view. The
 * upstream overload cannot be split mechanically without checker types, so the
 * discrimination is a single runtime test inside the endpoint. */
abstract GlBufferDataSource(Dynamic) from Float from Int from flighthq._internal._Float32Array
  from flighthq._internal._Float64Array from flighthq._internal._Int8Array from flighthq._internal._Int16Array
  from flighthq._internal._Int32Array from flighthq._internal._UInt8Array
  from flighthq._internal._UInt8ClampedArray from flighthq._internal._UInt16Array
  from flighthq._internal._UInt32Array {}

/**
 * Strictly typed static endpoints for every WebGL2 member reached by generated
 * Flight code, replacing name-string dispatch. Numeric parameters are `Float`
 * because generated TypeScript numbers are Float-typed; each endpoint owns the
 * `Std.int` coercion its underlying GL signature requires, so the generator
 * emits arguments unchanged. Constants are receiver-less `inline final` Int
 * values fixed by the WebGL specification and identical on every target.
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
    #if flight_gl_trace
    final e:Int = gl.getError();
    if (e != 0) glTrace('activeTexture getError -> 0x' + StringTools.hex(e, 4));
    #end
  }

  public static inline function attachShader(gl:GlContext, program:GlProgram, shader:GlShader):Void {
    gl.attachShader(program, shader);
  }

  public static inline function bindBuffer(gl:GlContext, target:Float, buffer:Null<GlBuffer>):Void {
    gl.bindBuffer(Std.int(target), buffer);
  }

  public static inline function bindFramebuffer(gl:GlContext, target:Float, framebuffer:Null<GlFramebuffer>):Void {
    #if flight_gl_trace glTrace('bindFramebuffer(' + Std.int(target) + ', ' + (framebuffer == null ? 'DEFAULT' : 'fbo') + ')'); #end
    gl.bindFramebuffer(Std.int(target), framebuffer);
  }

  public static inline function bindRenderbuffer(gl:GlContext, target:Float, renderbuffer:Null<GlRenderbuffer>):Void {
    gl.bindRenderbuffer(Std.int(target), renderbuffer);
  }

  public static inline function bindTexture(gl:GlContext, target:Float, texture:Null<GlTexture>):Void {
    gl.bindTexture(Std.int(target), texture);
    #if flight_gl_trace
    final e:Int = gl.getError();
    if (e != 0) glTrace('bindTexture getError -> 0x' + StringTools.hex(e, 4));
    #end
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
    #if flight_gl_trace glTrace('bufferData(target=' + Std.int(target) + ', usage=' + Std.int(usage) + ')'); #end
    final raw:Dynamic = sizeOrData;
    #if (lime && !js)
    if (Std.isOfType(raw, Int) || Std.isOfType(raw, Float)) {
      final sizeView = new lime.utils.UInt8Array(Std.int(raw));
      #if flight_gl_trace
      glTrace('bufferData size-form: requested=' + Std.int(raw) + ', view.byteLength='
        + (sizeView : lime.utils.ArrayBufferView).byteLength + ', view.length=' + (sizeView : lime.utils.ArrayBufferView).length);
      #end
      gl.bufferData(Std.int(target), sizeView, Std.int(usage));
    } else {
      gl.bufferData(Std.int(target), nativeView(cast raw), Std.int(usage));
    }
    #else
    gl.bufferData(Std.int(target), raw, Std.int(usage));
    #end
    #if flight_gl_trace
    final e:Int = gl.getError();
    if (e != 0) glTrace('bufferData getError -> 0x' + StringTools.hex(e, 4));
    #end
  }

  public static function bufferSubData(gl:GlContext, target:Float, dstByteOffset:Float, source:GlBufferSource,
      srcOffset:Float = 0, ?length:Float):Void {
    #if (lime && !js)
    final data = nativeView(source);
    #if flight_gl_trace
    glTrace('bufferSubData(target=' + Std.int(target) + ', dstByteOffset=' + Std.int(dstByteOffset) + ', srcOffset='
      + srcOffset + ', length=' + Std.string(length) + ', view.byteLength=' + data.byteLength + ', view.length='
      + data.length + ')');
    #end
    #if neko
    // glBufferSubData through the neko CFFI raises GL_INVALID_VALUE for valid
    // arguments (under investigation); re-uploading the whole view through
    // glBufferData is correct for Flight's usage, where the view spans the
    // buffer store and ranged uploads always start at offset zero.
    gl.bufferData(Std.int(target), data, DYNAMIC_DRAW);
    #else
    if (length == null) {
      gl.bufferSubData(Std.int(target), Std.int(dstByteOffset), data);
    } else {
      // Lime's native srcOffset/length are byte quantities, WebGL2's are elements.
      final bytesPerElement = Std.int(data.byteLength / data.length);
      gl.bufferSubData(Std.int(target), Std.int(dstByteOffset), data, Std.int(srcOffset) * bytesPerElement,
        Std.int(length) * bytesPerElement);
    }
    #end
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
    #if flight_gl_trace
    final e:Int = gl.getError();
    if (e != 0) glTrace('bufferSubData getError -> 0x' + StringTools.hex(e, 4));
    #end
  }

  public static inline function checkFramebufferStatus(gl:GlContext, target:Float):Int {
    return gl.checkFramebufferStatus(Std.int(target));
  }

  public static inline function clear(gl:GlContext, mask:Float):Void {
    #if flight_gl_trace glTrace('clear(0x' + StringTools.hex(Std.int(mask)) + ')'); #end
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
    #if flight_gl_trace glTrace('clearColor(' + red + ',' + green + ',' + blue + ',' + alpha + ')'); #end
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
    final result = gl.createTexture();
    #if flight_gl_trace
    final e:Int = gl.getError();
    if (e != 0) glTrace('createTexture getError -> 0x' + StringTools.hex(e, 4));
    #end
    return result;
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
    #if flight_gl_trace glTrace('drawArrays(mode=' + Std.int(mode) + ', first=' + Std.int(first) + ', count=' + Std.int(count) + ')'); #end
    gl.drawArrays(Std.int(mode), Std.int(first), Std.int(count));
    #if flight_gl_trace debugAfterDraw(gl); #end
  }

  public static inline function drawBuffers(gl:GlContext, buffers:GlIntList):Void {
    #if (lime && !js)
    gl.drawBuffers(nativeInts(buffers));
    #else
    gl.drawBuffers(cast buffers);
    #end
  }

  public static inline function drawElements(gl:GlContext, mode:Float, count:Float, type:Float, offset:Float):Void {
    #if flight_gl_trace glTrace('drawElements(mode=' + Std.int(mode) + ', count=' + Std.int(count) + ', type=' + Std.int(type) + ', offset=' + Std.int(offset) + ')'); #end
    gl.drawElements(Std.int(mode), Std.int(count), Std.int(type), Std.int(offset));
    #if flight_gl_trace debugAfterDraw(gl); #end
  }

  public static inline function drawElementsInstanced(gl:GlContext, mode:Float, count:Float, type:Float, offset:Float,
      instanceCount:Float):Void {
    #if flight_gl_trace glTrace('drawElementsInstanced(count=' + Std.int(count) + ', instances=' + Std.int(instanceCount) + ')'); #end
    gl.drawElementsInstanced(Std.int(mode), Std.int(count), Std.int(type), Std.int(offset), Std.int(instanceCount));
    #if flight_gl_trace debugAfterDraw(gl); #end
  }

  public static inline function enable(gl:GlContext, cap:Float):Void {
    gl.enable(Std.int(cap));
  }

  public static inline function enableVertexAttribArray(gl:GlContext, index:Float):Void {
    #if flight_gl_trace
    if (Std.int(index) < 0) glTrace('enableVertexAttribArray(NEGATIVE index=' + Std.int(index) + ')');
    #end
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
    final result = gl.getAttribLocation(program, name);
    #if flight_gl_trace glTrace('getAttribLocation(' + name + ') -> ' + result); #end
    return result;
  }

  public static inline function getExtension(gl:GlContext, name:String):Dynamic {
    return gl.getExtension(name);
  }

  public static inline function getParameter(gl:GlContext, pname:Float):Dynamic {
    return gl.getParameter(Std.int(pname));
  }

  public static inline function getProgramInfoLog(gl:GlContext, program:GlProgram):String {
    final result = gl.getProgramInfoLog(program);
    #if flight_gl_trace if (result != null && result != '') glTrace('programInfoLog: ' + result); #end
    return result;
  }

  public static inline function getProgramParameter(gl:GlContext, program:GlProgram, pname:Float):Dynamic {
    final result:Dynamic = gl.getProgramParameter(program, Std.int(pname));
    #if flight_gl_trace glTrace('getProgramParameter(' + Std.int(pname) + ') -> ' + Std.string(result)); #end
    return result;
  }

  public static inline function getShaderInfoLog(gl:GlContext, shader:GlShader):String {
    final result = gl.getShaderInfoLog(shader);
    #if flight_gl_trace if (result != null && result != '') glTrace('shaderInfoLog: ' + result); #end
    return result;
  }

  public static inline function getShaderParameter(gl:GlContext, shader:GlShader, pname:Float):Dynamic {
    final result:Dynamic = gl.getShaderParameter(shader, Std.int(pname));
    #if flight_gl_trace glTrace('getShaderParameter(' + Std.int(pname) + ') -> ' + Std.string(result)); #end
    return result;
  }

  public static inline function getUniformLocation(gl:GlContext, program:GlProgram, name:String):GlUniformLocation {
    final result = gl.getUniformLocation(program, name);
    #if flight_gl_trace glTrace('getUniformLocation(' + name + ') -> ' + (result == null ? 'NULL' : Std.string(result))); #end
    return result;
  }

  public static inline function linkProgram(gl:GlContext, program:GlProgram):Void {
    gl.linkProgram(program);
  }

  public static inline function pixelStorei(gl:GlContext, pname:Float, param:EitherType<Float, Bool>):Void {
    #if (lime && !js)
    // WebGL-only pack parameters (UNPACK_FLIP_Y_WEBGL, UNPACK_PREMULTIPLY_ALPHA_WEBGL,
    // UNPACK_COLORSPACE_CONVERSION_WEBGL) do not exist in native GL and would
    // poison getError; Flight performs those conversions CPU-side on this path.
    if (Std.int(pname) >= 0x9240 && Std.int(pname) <= 0x9243) return;
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
    #if flight_gl_trace glTrace('scissor(' + Std.int(x) + ',' + Std.int(y) + ',' + Std.int(width) + 'x' + Std.int(height) + ')'); #end
    gl.scissor(Std.int(x), Std.int(y), Std.int(width), Std.int(height));
  }

  public static inline function shaderSource(gl:GlContext, shader:GlShader, source:String):Void {
    #if (lime && !js)
    final adapted = adaptShaderSource(gl, source);
    #if flight_gl_trace
    glTrace('shaderSource: context.type=' + Std.string(Reflect.field(gl, 'type')) + ', head=' + StringTools.replace(adapted.substr(0, 40), '\n', '\\n'));
    #end
    gl.shaderSource(shader, adapted);
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
    #if flight_gl_trace
    final priorError:Int = gl.getError();
    glTrace('texImage2D(target=' + Std.int(target) + ', level=' + Std.int(level) + ', internal=' + Std.int(internalformat)
      + ', ' + Std.int(width) + 'x' + Std.int(height) + ', fmt=' + Std.int(format) + ', type=' + Std.int(type)
      + ', pixels=' + (pixels == null ? 'null' : 'view')
      + (priorError != 0 ? ', PRIOR getError 0x' + StringTools.hex(priorError, 4) : '') + ')');
    #end
    gl.texImage2D(Std.int(target), Std.int(level), Std.int(internalformat), Std.int(width), Std.int(height),
      Std.int(border), Std.int(format), Std.int(type), pixels == null ? null : nativeView(pixels));
    #if flight_gl_trace
    final uploadError:Int = gl.getError();
    if (uploadError != 0) glTrace('texImage2D getError -> 0x' + StringTools.hex(uploadError, 4));
    #end
    #elseif js
    js.Syntax.code('{0}.texImage2D({1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, {9})', gl, Std.int(target), Std.int(level),
      Std.int(internalformat), Std.int(width), Std.int(height), Std.int(border), Std.int(format), Std.int(type), pixels);
    #else
    gl.texImage2D(Std.int(target), Std.int(level), Std.int(internalformat), Std.int(width), Std.int(height),
      Std.int(border), Std.int(format), Std.int(type), pixels);
    #end
  }

  /** The 6-argument DOM-source overload of `texImage2D`. On native the only
   * supported source is the cairo-backed scratch canvas: its premultiplied
   * ARGB32 pixels are reordered to RGBA and uploaded through the pixel form
   * (Flight's premultiply pack flag is a native no-op, so premultiplied texel
   * content matches the html5 result). */
  public static inline function texImage2DSource(gl:GlContext, target:Float, level:Float, internalformat:Float,
      format:Float, type:Float, source:Dynamic):Void {
    #if (lime && !js && lime_cairo)
    if (!Std.isOfType(source, NativeScratchCanvas)) {
      throw 'WebGl2Backend: unsupported texImage2D source on native GL targets (expected a scratch canvas)';
    }
    final canvasContext = (cast source : NativeScratchCanvas).nativeContext();
    if (canvasContext.surface == null) {
      gl.texImage2D(Std.int(target), Std.int(level), Std.int(internalformat), 0, 0, 0, Std.int(format), Std.int(type),
        null);
      return;
    }
    canvasContext.surface.flush();
    final canvasWidth = canvasContext.width;
    final canvasHeight = canvasContext.height;
    final bgra = canvasContext.pixels;
    final rgba = new lime.utils.UInt8Array(canvasWidth * canvasHeight * 4);
    for (index in 0...canvasWidth * canvasHeight) {
      final offset = index * 4;
      rgba[offset] = bgra[offset + 2];
      rgba[offset + 1] = bgra[offset + 1];
      rgba[offset + 2] = bgra[offset];
      rgba[offset + 3] = bgra[offset + 3];
    }
    gl.texImage2D(Std.int(target), Std.int(level), Std.int(internalformat), canvasWidth, canvasHeight, 0,
      Std.int(format), Std.int(type), rgba);
    #elseif (lime && !js)
    throw 'WebGl2Backend: texImage2D from a canvas source requires Lime\'s cairo feature';
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
    #if flight_gl_trace glTrace('texParameteri(' + Std.int(target) + ', ' + Std.int(pname) + ', ' + Std.int(param) + ')'); #end
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
    #if flight_gl_trace
    final e:Int = gl.getError();
    if (e != 0) glTrace('uniform1i getError -> 0x' + StringTools.hex(e, 4));
    #end
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
    #if flight_gl_trace glTrace('useProgram(' + (program == null ? 'null' : 'program') + ')'); #end
    gl.useProgram(program);
  }

  public static inline function vertexAttrib4f(gl:GlContext, index:Float, x:Float, y:Float, z:Float, w:Float):Void {
    gl.vertexAttrib4f(Std.int(index), x, y, z, w);
  }

  public static inline function vertexAttribDivisor(gl:GlContext, index:Float, divisor:Float):Void {
    gl.vertexAttribDivisor(Std.int(index), Std.int(divisor));
  }

  public static inline function vertexAttribIPointer(gl:GlContext, index:Float, size:Float, type:Float, stride:Float,
      offset:Float):Void {
    gl.vertexAttribIPointer(Std.int(index), Std.int(size), Std.int(type), Std.int(stride), Std.int(offset));
  }

  public static inline function vertexAttribPointer(gl:GlContext, index:Float, size:Float, type:Float, normalized:Bool,
      stride:Float, offset:Float):Void {
    gl.vertexAttribPointer(Std.int(index), Std.int(size), Std.int(type), normalized, Std.int(stride), Std.int(offset));
  }

  public static inline function viewport(gl:GlContext, x:Float, y:Float, width:Float, height:Float):Void {
    #if flight_gl_trace
    lastViewportX = Std.int(x); lastViewportY = Std.int(y); lastViewportW = Std.int(width); lastViewportH = Std.int(height);
    glTrace('viewport(' + Std.int(x) + ',' + Std.int(y) + ',' + Std.int(width) + 'x' + Std.int(height) + ')');
    #end
    gl.viewport(Std.int(x), Std.int(y), Std.int(width), Std.int(height));
  }

  #if flight_gl_trace
  static var traceLines = 0;
  static var drawProbes = 0;
  static var lastViewportX = 0;
  static var lastViewportY = 0;
  static var lastViewportW = 0;
  static var lastViewportH = 0;

  /** Rate-limited GL call log for the `-D flight_gl_trace` diagnostic build. */
  static function glTrace(message:String):Void {
    if (traceLines >= 700) return;
    traceLines++;
    haxe.Log.trace('[gl] ' + message, null);
  }

  /** After-draw probe: surfaces GL errors and samples the center pixel of the
   * last viewport so framebuffer contents are observable without a display. */
  static function debugAfterDraw(gl:GlContext):Void {
    final error:Int = gl.getError();
    if (error != 0) glTrace('getError -> 0x' + StringTools.hex(error, 4));
    if (drawProbes < 40) {
      drawProbes++;
      #if (lime && !js)
      final pixels = new lime.utils.UInt8Array(4);
      final samples = [];
      for (point in [[2, 2], [1, 1], [3, 1], [1, 3], [3, 3]]) {
        gl.readPixels(lastViewportX + ((lastViewportW * point[0]) >> 2), lastViewportY + ((lastViewportH * point[1]) >> 2),
          1, 1, RGBA, UNSIGNED_BYTE, pixels);
        samples.push(pixels[0] + ',' + pixels[1] + ',' + pixels[2] + ',' + pixels[3]);
      }
      final probeError:Int = gl.getError();
      glTrace('probe grid -> ' + samples.join(' | ')
        + (probeError != 0 ? ' (probe getError 0x' + StringTools.hex(probeError, 4) + ')' : ''));
      #if sys
      if (drawProbes == 20 && lastViewportW > 0) {
        // One-shot framebuffer dump for offline inspection (RGBA rows, bottom-up).
        final frame = new lime.utils.UInt8Array(lastViewportW * lastViewportH * 4);
        gl.readPixels(lastViewportX, lastViewportY, lastViewportW, lastViewportH, RGBA, UNSIGNED_BYTE, frame);
        final bytes = haxe.io.Bytes.alloc(lastViewportW * lastViewportH * 4);
        for (index in 0...lastViewportW * lastViewportH * 4) bytes.set(index, frame[index]);
        sys.io.File.saveBytes('flight-gl-dump.rgba', bytes);
        glTrace('framebuffer dumped: flight-gl-dump.rgba ' + lastViewportW + 'x' + lastViewportH);
      }
      #end
      #end
    }
  }
  #end

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

}
