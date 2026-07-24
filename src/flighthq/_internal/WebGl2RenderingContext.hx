package flighthq._internal;

#if (lime && !js)
import lime.graphics.WebGL2RenderContext;

/**
 * Stable target boundary for generated WebGL2 context access.
 *
 * On Lime native targets the render context is a typed `WebGL2RenderContext`
 * abstract whose members and constants are inlined getters and methods, not
 * reflectable fields. Reflection over that abstract resolves to `null` and then
 * fails inside `Reflect.callMethod` (the "apply" error), so generated GL calls
 * are dispatched to the typed WebGL2 surface by name here instead. WebGL2 is the
 * portable Lime context style that also erases onto GLES and desktop GL, so a
 * single typed target covers every Lime backend.
 *
 * The JavaScript branch keeps reflection: there the context erases to the raw
 * browser `WebGL2RenderingContext`, where reflection resolves natively and the
 * DOM-only call overloads remain available.
 */
class WebGl2RenderingContext {
  public static function call(context:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (context == null) return null;
    final gl:WebGL2RenderContext = context;
    switch (name) {
      case 'activeTexture':
        gl.activeTexture(arguments[0]);
        return null;
      case 'attachShader':
        gl.attachShader(arguments[0], arguments[1]);
        return null;
      case 'bindBuffer':
        gl.bindBuffer(arguments[0], arguments[1]);
        return null;
      case 'bindFramebuffer':
        gl.bindFramebuffer(arguments[0], arguments[1]);
        return null;
      case 'bindRenderbuffer':
        gl.bindRenderbuffer(arguments[0], arguments[1]);
        return null;
      case 'bindTexture':
        gl.bindTexture(arguments[0], arguments[1]);
        return null;
      case 'bindVertexArray':
        gl.bindVertexArray(arguments[0]);
        return null;
      case 'blendEquation':
        gl.blendEquation(arguments[0]);
        return null;
      case 'blendFunc':
        gl.blendFunc(arguments[0], arguments[1]);
        return null;
      case 'blitFramebuffer':
        gl.blitFramebuffer(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5], arguments[6], arguments[7], arguments[8], arguments[9]);
        return null;
      case 'bufferData':
        gl.bufferData(arguments[0], arguments[1], arguments[2]);
        return null;
      case 'bufferSubData':
        switch (arguments.length) {
          case 3:
            gl.bufferSubData(arguments[0], arguments[1], arguments[2]);
            return null;
          case 5:
            gl.bufferSubData(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4]);
            return null;
          default:
            throw 'WebGl2RenderingContext: unexpected arity for bufferSubData';
        }
      case 'checkFramebufferStatus':
        return gl.checkFramebufferStatus(arguments[0]);
      case 'clear':
        gl.clear(arguments[0]);
        return null;
      case 'clearBufferfi':
        gl.clearBufferfi(arguments[0], arguments[1], arguments[2], arguments[3]);
        return null;
      case 'clearBufferfv':
        gl.clearBufferfv(arguments[0], arguments[1], arguments[2]);
        return null;
      case 'clearColor':
        gl.clearColor(arguments[0], arguments[1], arguments[2], arguments[3]);
        return null;
      case 'colorMask':
        gl.colorMask(arguments[0], arguments[1], arguments[2], arguments[3]);
        return null;
      case 'compileShader':
        gl.compileShader(arguments[0]);
        return null;
      case 'compressedTexImage2D':
        gl.compressedTexImage2D(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5], arguments[6]);
        return null;
      case 'compressedTexSubImage3D':
        gl.compressedTexSubImage3D(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5], arguments[6], arguments[7], arguments[8], arguments[9]);
        return null;
      case 'createBuffer':
        return gl.createBuffer();
      case 'createFramebuffer':
        return gl.createFramebuffer();
      case 'createProgram':
        return gl.createProgram();
      case 'createRenderbuffer':
        return gl.createRenderbuffer();
      case 'createShader':
        return gl.createShader(arguments[0]);
      case 'createTexture':
        return gl.createTexture();
      case 'createVertexArray':
        return gl.createVertexArray();
      case 'cullFace':
        gl.cullFace(arguments[0]);
        return null;
      case 'deleteBuffer':
        gl.deleteBuffer(arguments[0]);
        return null;
      case 'deleteFramebuffer':
        gl.deleteFramebuffer(arguments[0]);
        return null;
      case 'deleteProgram':
        gl.deleteProgram(arguments[0]);
        return null;
      case 'deleteRenderbuffer':
        gl.deleteRenderbuffer(arguments[0]);
        return null;
      case 'deleteShader':
        gl.deleteShader(arguments[0]);
        return null;
      case 'deleteTexture':
        gl.deleteTexture(arguments[0]);
        return null;
      case 'deleteVertexArray':
        gl.deleteVertexArray(arguments[0]);
        return null;
      case 'depthFunc':
        gl.depthFunc(arguments[0]);
        return null;
      case 'depthMask':
        gl.depthMask(arguments[0]);
        return null;
      case 'disable':
        gl.disable(arguments[0]);
        return null;
      case 'disableVertexAttribArray':
        gl.disableVertexAttribArray(arguments[0]);
        return null;
      case 'drawArrays':
        gl.drawArrays(arguments[0], arguments[1], arguments[2]);
        return null;
      case 'drawBuffers':
        gl.drawBuffers(arguments[0]);
        return null;
      case 'drawElements':
        gl.drawElements(arguments[0], arguments[1], arguments[2], arguments[3]);
        return null;
      case 'drawElementsInstanced':
        gl.drawElementsInstanced(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4]);
        return null;
      case 'enable':
        gl.enable(arguments[0]);
        return null;
      case 'enableVertexAttribArray':
        gl.enableVertexAttribArray(arguments[0]);
        return null;
      case 'flush':
        gl.flush();
        return null;
      case 'framebufferRenderbuffer':
        gl.framebufferRenderbuffer(arguments[0], arguments[1], arguments[2], arguments[3]);
        return null;
      case 'framebufferTexture2D':
        gl.framebufferTexture2D(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4]);
        return null;
      case 'generateMipmap':
        gl.generateMipmap(arguments[0]);
        return null;
      case 'getActiveUniform':
        return gl.getActiveUniform(arguments[0], arguments[1]);
      case 'getAttribLocation':
        return gl.getAttribLocation(arguments[0], arguments[1]);
      case 'getExtension':
        return gl.getExtension(arguments[0]);
      case 'getParameter':
        return gl.getParameter(arguments[0]);
      case 'getProgramInfoLog':
        return gl.getProgramInfoLog(arguments[0]);
      case 'getProgramParameter':
        return gl.getProgramParameter(arguments[0], arguments[1]);
      case 'getShaderInfoLog':
        return gl.getShaderInfoLog(arguments[0]);
      case 'getShaderParameter':
        return gl.getShaderParameter(arguments[0], arguments[1]);
      case 'getUniformLocation':
        return gl.getUniformLocation(arguments[0], arguments[1]);
      case 'linkProgram':
        gl.linkProgram(arguments[0]);
        return null;
      case 'pixelStorei':
        gl.pixelStorei(arguments[0], arguments[1]);
        return null;
      case 'readBuffer':
        gl.readBuffer(arguments[0]);
        return null;
      case 'readPixels':
        gl.readPixels(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5], arguments[6]);
        return null;
      case 'renderbufferStorage':
        gl.renderbufferStorage(arguments[0], arguments[1], arguments[2], arguments[3]);
        return null;
      case 'renderbufferStorageMultisample':
        gl.renderbufferStorageMultisample(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4]);
        return null;
      case 'scissor':
        gl.scissor(arguments[0], arguments[1], arguments[2], arguments[3]);
        return null;
      case 'shaderSource':
        gl.shaderSource(arguments[0], arguments[1]);
        return null;
      case 'stencilFunc':
        gl.stencilFunc(arguments[0], arguments[1], arguments[2]);
        return null;
      case 'stencilMask':
        gl.stencilMask(arguments[0]);
        return null;
      case 'stencilOp':
        gl.stencilOp(arguments[0], arguments[1], arguments[2]);
        return null;
      case 'stencilOpSeparate':
        gl.stencilOpSeparate(arguments[0], arguments[1], arguments[2], arguments[3]);
        return null;
      case 'texImage2D':
        switch (arguments.length) {
          case 6:
            throw 'texImage2D/6 is not supported on native GL targets';
          case 9:
            gl.texImage2D(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5], arguments[6], arguments[7], arguments[8]);
            return null;
          default:
            throw 'WebGl2RenderingContext: unexpected arity for texImage2D';
        }
      case 'texImage3D':
        gl.texImage3D(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5], arguments[6], arguments[7], arguments[8], arguments[9]);
        return null;
      case 'texParameterf':
        gl.texParameterf(arguments[0], arguments[1], arguments[2]);
        return null;
      case 'texParameteri':
        gl.texParameteri(arguments[0], arguments[1], arguments[2]);
        return null;
      case 'texStorage3D':
        gl.texStorage3D(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5]);
        return null;
      case 'texSubImage2D':
        gl.texSubImage2D(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5], arguments[6], arguments[7], arguments[8]);
        return null;
      case 'uniform1f':
        gl.uniform1f(arguments[0], arguments[1]);
        return null;
      case 'uniform1fv':
        gl.uniform1fv(arguments[0], arguments[1]);
        return null;
      case 'uniform1i':
        gl.uniform1i(arguments[0], arguments[1]);
        return null;
      case 'uniform2f':
        gl.uniform2f(arguments[0], arguments[1], arguments[2]);
        return null;
      case 'uniform2fv':
        gl.uniform2fv(arguments[0], arguments[1]);
        return null;
      case 'uniform3f':
        gl.uniform3f(arguments[0], arguments[1], arguments[2], arguments[3]);
        return null;
      case 'uniform3fv':
        gl.uniform3fv(arguments[0], arguments[1]);
        return null;
      case 'uniform4f':
        gl.uniform4f(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4]);
        return null;
      case 'uniform4fv':
        gl.uniform4fv(arguments[0], arguments[1]);
        return null;
      case 'uniformMatrix3fv':
        gl.uniformMatrix3fv(arguments[0], arguments[1], arguments[2]);
        return null;
      case 'uniformMatrix4fv':
        gl.uniformMatrix4fv(arguments[0], arguments[1], arguments[2]);
        return null;
      case 'useProgram':
        gl.useProgram(arguments[0]);
        return null;
      case 'vertexAttrib4f':
        gl.vertexAttrib4f(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4]);
        return null;
      case 'vertexAttribDivisor':
        gl.vertexAttribDivisor(arguments[0], arguments[1]);
        return null;
      case 'vertexAttribPointer':
        gl.vertexAttribPointer(arguments[0], arguments[1], arguments[2], arguments[3], arguments[4], arguments[5]);
        return null;
      case 'viewport':
        gl.viewport(arguments[0], arguments[1], arguments[2], arguments[3]);
        return null;
      default:
        throw 'WebGl2RenderingContext: unmapped GL method ' + name;
    }
  }

  public static function callOptional(context:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (context == null) return _Runtime.UNDEFINED;
    return call(context, name, arguments);
  }

  public static function field(context:Dynamic, name:String):Dynamic {
    if (context == null) return null;
    final gl:WebGL2RenderContext = context;
    switch (name) {
      case 'ACTIVE_UNIFORMS': return gl.ACTIVE_UNIFORMS;
      case 'ALWAYS': return gl.ALWAYS;
      case 'ARRAY_BUFFER': return gl.ARRAY_BUFFER;
      case 'BACK': return gl.BACK;
      case 'BLEND': return gl.BLEND;
      case 'CLAMP_TO_EDGE': return gl.CLAMP_TO_EDGE;
      case 'COLOR': return gl.COLOR;
      case 'COLOR_ATTACHMENT0': return gl.COLOR_ATTACHMENT0;
      case 'COLOR_BUFFER_BIT': return gl.COLOR_BUFFER_BIT;
      case 'COMPILE_STATUS': return gl.COMPILE_STATUS;
      case 'CULL_FACE': return gl.CULL_FACE;
      case 'DECR_WRAP': return gl.DECR_WRAP;
      case 'DEPTH24_STENCIL8': return gl.DEPTH24_STENCIL8;
      case 'DEPTH_BUFFER_BIT': return gl.DEPTH_BUFFER_BIT;
      case 'DEPTH_STENCIL': return gl.DEPTH_STENCIL;
      case 'DEPTH_STENCIL_ATTACHMENT': return gl.DEPTH_STENCIL_ATTACHMENT;
      case 'DEPTH_TEST': return gl.DEPTH_TEST;
      case 'DRAW_FRAMEBUFFER': return gl.DRAW_FRAMEBUFFER;
      case 'DST_COLOR': return gl.DST_COLOR;
      case 'DYNAMIC_DRAW': return gl.DYNAMIC_DRAW;
      case 'ELEMENT_ARRAY_BUFFER': return gl.ELEMENT_ARRAY_BUFFER;
      case 'EQUAL': return gl.EQUAL;
      case 'FLOAT': return gl.FLOAT;
      case 'FLOAT_MAT2': return gl.FLOAT_MAT2;
      case 'FLOAT_MAT3': return gl.FLOAT_MAT3;
      case 'FLOAT_MAT4': return gl.FLOAT_MAT4;
      case 'FLOAT_VEC2': return gl.FLOAT_VEC2;
      case 'FLOAT_VEC3': return gl.FLOAT_VEC3;
      case 'FLOAT_VEC4': return gl.FLOAT_VEC4;
      case 'FRAGMENT_SHADER': return gl.FRAGMENT_SHADER;
      case 'FRAMEBUFFER': return gl.FRAMEBUFFER;
      case 'FRAMEBUFFER_BINDING': return gl.FRAMEBUFFER_BINDING;
      case 'FRAMEBUFFER_COMPLETE': return gl.FRAMEBUFFER_COMPLETE;
      case 'FRONT': return gl.FRONT;
      case 'FUNC_ADD': return gl.FUNC_ADD;
      case 'HALF_FLOAT': return gl.HALF_FLOAT;
      case 'INCR_WRAP': return gl.INCR_WRAP;
      case 'INVERT': return gl.INVERT;
      case 'KEEP': return gl.KEEP;
      case 'LESS': return gl.LESS;
      case 'LINEAR': return gl.LINEAR;
      case 'LINEAR_MIPMAP_LINEAR': return gl.LINEAR_MIPMAP_LINEAR;
      case 'LINEAR_MIPMAP_NEAREST': return gl.LINEAR_MIPMAP_NEAREST;
      case 'LINES': return gl.LINES;
      case 'LINE_STRIP': return gl.LINE_STRIP;
      case 'LINK_STATUS': return gl.LINK_STATUS;
      case 'MAX_SAMPLES': return gl.MAX_SAMPLES;
      case 'MIRRORED_REPEAT': return gl.MIRRORED_REPEAT;
      case 'NEAREST': return gl.NEAREST;
      case 'NEAREST_MIPMAP_LINEAR': return gl.NEAREST_MIPMAP_LINEAR;
      case 'NEAREST_MIPMAP_NEAREST': return gl.NEAREST_MIPMAP_NEAREST;
      case 'NONE': return gl.NONE;
      case 'NOTEQUAL': return gl.NOTEQUAL;
      case 'ONE': return gl.ONE;
      case 'ONE_MINUS_SRC_ALPHA': return gl.ONE_MINUS_SRC_ALPHA;
      case 'ONE_MINUS_SRC_COLOR': return gl.ONE_MINUS_SRC_COLOR;
      case 'POINTS': return gl.POINTS;
      case 'READ_FRAMEBUFFER': return gl.READ_FRAMEBUFFER;
      case 'RENDERBUFFER': return gl.RENDERBUFFER;
      case 'REPEAT': return gl.REPEAT;
      case 'RGBA': return gl.RGBA;
      case 'RGBA16F': return gl.RGBA16F;
      case 'RGBA32F': return gl.RGBA32F;
      case 'RGBA8': return gl.RGBA8;
      case 'SCISSOR_TEST': return gl.SCISSOR_TEST;
      case 'SRC_ALPHA': return gl.SRC_ALPHA;
      case 'STATIC_DRAW': return gl.STATIC_DRAW;
      case 'STENCIL_BUFFER_BIT': return gl.STENCIL_BUFFER_BIT;
      case 'STENCIL_TEST': return gl.STENCIL_TEST;
      case 'STREAM_DRAW': return gl.STREAM_DRAW;
      case 'TEXTURE0': return gl.TEXTURE0;
      case 'TEXTURE1': return gl.TEXTURE1;
      case 'TEXTURE2': return gl.TEXTURE2;
      case 'TEXTURE_2D': return gl.TEXTURE_2D;
      case 'TEXTURE_2D_ARRAY': return gl.TEXTURE_2D_ARRAY;
      case 'TEXTURE_3D': return gl.TEXTURE_3D;
      case 'TEXTURE_CUBE_MAP': return gl.TEXTURE_CUBE_MAP;
      case 'TEXTURE_CUBE_MAP_POSITIVE_X': return gl.TEXTURE_CUBE_MAP_POSITIVE_X;
      case 'TEXTURE_MAG_FILTER': return gl.TEXTURE_MAG_FILTER;
      case 'TEXTURE_MAX_LEVEL': return gl.TEXTURE_MAX_LEVEL;
      case 'TEXTURE_MIN_FILTER': return gl.TEXTURE_MIN_FILTER;
      case 'TEXTURE_WRAP_R': return gl.TEXTURE_WRAP_R;
      case 'TEXTURE_WRAP_S': return gl.TEXTURE_WRAP_S;
      case 'TEXTURE_WRAP_T': return gl.TEXTURE_WRAP_T;
      case 'TRIANGLES': return gl.TRIANGLES;
      case 'TRIANGLE_FAN': return gl.TRIANGLE_FAN;
      case 'TRIANGLE_STRIP': return gl.TRIANGLE_STRIP;
      case 'UNPACK_PREMULTIPLY_ALPHA_WEBGL': return gl.UNPACK_PREMULTIPLY_ALPHA_WEBGL;
      case 'UNSIGNED_BYTE': return gl.UNSIGNED_BYTE;
      case 'UNSIGNED_INT': return gl.UNSIGNED_INT;
      case 'UNSIGNED_INT_24_8': return gl.UNSIGNED_INT_24_8;
      case 'UNSIGNED_SHORT': return gl.UNSIGNED_SHORT;
      case 'VERTEX_SHADER': return gl.VERTEX_SHADER;
      case 'VIEWPORT': return gl.VIEWPORT;
      case 'ZERO': return gl.ZERO;
      default:
        throw 'WebGl2RenderingContext: unmapped GL constant ' + name;
    }
  }

  public static function setField(context:Dynamic, name:String, value:Dynamic):Dynamic {
    Reflect.setField(context, name, value);
    return value;
  }

  public static function deleteField(context:Dynamic, name:String):Bool {
    return Reflect.deleteField(context, name);
  }
}
#else

/**
 * Stable target boundary for generated WebGL2 context access.
 *
 * On JavaScript the context erases to the raw browser `WebGL2RenderingContext`,
 * so reflection resolves natively; the typed Lime dispatch above handles native
 * targets where the context is an inlined abstract instead.
 */
class WebGl2RenderingContext {
  public static inline function call(context:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    #if !js
    if (context == null) return null;
    #end
    return Reflect.callMethod(context, Reflect.field(context, name), arguments);
  }

  public static inline function callOptional(context:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (context == null) return _Runtime.UNDEFINED;
    final callable = Reflect.field(context, name);
    return callable == null ? _Runtime.UNDEFINED : Reflect.callMethod(context, callable, arguments);
  }

  public static inline function field(context:Dynamic, name:String):Dynamic {
    return context == null ? null : Reflect.field(context, name);
  }

  public static inline function setField(context:Dynamic, name:String, value:Dynamic):Dynamic {
    Reflect.setField(context, name, value);
    return value;
  }

  public static inline function deleteField(context:Dynamic, name:String):Bool {
    return Reflect.deleteField(context, name);
  }
}
#end
