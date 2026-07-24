package flighthq._internal.backend;

import flighthq._internal._Runtime;

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
class WebGl2Backend {
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
#elseif (js && html5)

/**
 * Browser (html5) WebGL2 binding. The context erases to the real
 * `WebGL2RenderingContext`, so calls and constants are issued as statically
 * named direct JS (compile-time literal member names + argument spread) instead
 * of reflection. This keeps every GL call on the hot path a plain method call
 * and lets DCE drop unused bindings.
 */
class WebGl2Backend {
  public static function call(context:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    switch (name) {
      case 'activeTexture': return js.Syntax.code('{0}.activeTexture(...{1})', context, arguments);
      case 'attachShader': return js.Syntax.code('{0}.attachShader(...{1})', context, arguments);
      case 'bindBuffer': return js.Syntax.code('{0}.bindBuffer(...{1})', context, arguments);
      case 'bindFramebuffer': return js.Syntax.code('{0}.bindFramebuffer(...{1})', context, arguments);
      case 'bindRenderbuffer': return js.Syntax.code('{0}.bindRenderbuffer(...{1})', context, arguments);
      case 'bindTexture': return js.Syntax.code('{0}.bindTexture(...{1})', context, arguments);
      case 'bindVertexArray': return js.Syntax.code('{0}.bindVertexArray(...{1})', context, arguments);
      case 'blendEquation': return js.Syntax.code('{0}.blendEquation(...{1})', context, arguments);
      case 'blendFunc': return js.Syntax.code('{0}.blendFunc(...{1})', context, arguments);
      case 'blitFramebuffer': return js.Syntax.code('{0}.blitFramebuffer(...{1})', context, arguments);
      case 'bufferData': return js.Syntax.code('{0}.bufferData(...{1})', context, arguments);
      case 'bufferSubData': return js.Syntax.code('{0}.bufferSubData(...{1})', context, arguments);
      case 'checkFramebufferStatus': return js.Syntax.code('{0}.checkFramebufferStatus(...{1})', context, arguments);
      case 'clear': return js.Syntax.code('{0}.clear(...{1})', context, arguments);
      case 'clearBufferfi': return js.Syntax.code('{0}.clearBufferfi(...{1})', context, arguments);
      case 'clearBufferfv': return js.Syntax.code('{0}.clearBufferfv(...{1})', context, arguments);
      case 'clearColor': return js.Syntax.code('{0}.clearColor(...{1})', context, arguments);
      case 'colorMask': return js.Syntax.code('{0}.colorMask(...{1})', context, arguments);
      case 'compileShader': return js.Syntax.code('{0}.compileShader(...{1})', context, arguments);
      case 'compressedTexImage2D': return js.Syntax.code('{0}.compressedTexImage2D(...{1})', context, arguments);
      case 'compressedTexSubImage3D': return js.Syntax.code('{0}.compressedTexSubImage3D(...{1})', context, arguments);
      case 'createBuffer': return js.Syntax.code('{0}.createBuffer(...{1})', context, arguments);
      case 'createFramebuffer': return js.Syntax.code('{0}.createFramebuffer(...{1})', context, arguments);
      case 'createProgram': return js.Syntax.code('{0}.createProgram(...{1})', context, arguments);
      case 'createRenderbuffer': return js.Syntax.code('{0}.createRenderbuffer(...{1})', context, arguments);
      case 'createShader': return js.Syntax.code('{0}.createShader(...{1})', context, arguments);
      case 'createTexture': return js.Syntax.code('{0}.createTexture(...{1})', context, arguments);
      case 'createVertexArray': return js.Syntax.code('{0}.createVertexArray(...{1})', context, arguments);
      case 'cullFace': return js.Syntax.code('{0}.cullFace(...{1})', context, arguments);
      case 'deleteBuffer': return js.Syntax.code('{0}.deleteBuffer(...{1})', context, arguments);
      case 'deleteFramebuffer': return js.Syntax.code('{0}.deleteFramebuffer(...{1})', context, arguments);
      case 'deleteProgram': return js.Syntax.code('{0}.deleteProgram(...{1})', context, arguments);
      case 'deleteRenderbuffer': return js.Syntax.code('{0}.deleteRenderbuffer(...{1})', context, arguments);
      case 'deleteShader': return js.Syntax.code('{0}.deleteShader(...{1})', context, arguments);
      case 'deleteTexture': return js.Syntax.code('{0}.deleteTexture(...{1})', context, arguments);
      case 'deleteVertexArray': return js.Syntax.code('{0}.deleteVertexArray(...{1})', context, arguments);
      case 'depthFunc': return js.Syntax.code('{0}.depthFunc(...{1})', context, arguments);
      case 'depthMask': return js.Syntax.code('{0}.depthMask(...{1})', context, arguments);
      case 'disable': return js.Syntax.code('{0}.disable(...{1})', context, arguments);
      case 'disableVertexAttribArray': return js.Syntax.code('{0}.disableVertexAttribArray(...{1})', context, arguments);
      case 'drawArrays': return js.Syntax.code('{0}.drawArrays(...{1})', context, arguments);
      case 'drawBuffers': return js.Syntax.code('{0}.drawBuffers(...{1})', context, arguments);
      case 'drawElements': return js.Syntax.code('{0}.drawElements(...{1})', context, arguments);
      case 'drawElementsInstanced': return js.Syntax.code('{0}.drawElementsInstanced(...{1})', context, arguments);
      case 'enable': return js.Syntax.code('{0}.enable(...{1})', context, arguments);
      case 'enableVertexAttribArray': return js.Syntax.code('{0}.enableVertexAttribArray(...{1})', context, arguments);
      case 'flush': return js.Syntax.code('{0}.flush(...{1})', context, arguments);
      case 'framebufferRenderbuffer': return js.Syntax.code('{0}.framebufferRenderbuffer(...{1})', context, arguments);
      case 'framebufferTexture2D': return js.Syntax.code('{0}.framebufferTexture2D(...{1})', context, arguments);
      case 'generateMipmap': return js.Syntax.code('{0}.generateMipmap(...{1})', context, arguments);
      case 'getActiveUniform': return js.Syntax.code('{0}.getActiveUniform(...{1})', context, arguments);
      case 'getAttribLocation': return js.Syntax.code('{0}.getAttribLocation(...{1})', context, arguments);
      case 'getExtension': return js.Syntax.code('{0}.getExtension(...{1})', context, arguments);
      case 'getParameter': return js.Syntax.code('{0}.getParameter(...{1})', context, arguments);
      case 'getProgramInfoLog': return js.Syntax.code('{0}.getProgramInfoLog(...{1})', context, arguments);
      case 'getProgramParameter': return js.Syntax.code('{0}.getProgramParameter(...{1})', context, arguments);
      case 'getShaderInfoLog': return js.Syntax.code('{0}.getShaderInfoLog(...{1})', context, arguments);
      case 'getShaderParameter': return js.Syntax.code('{0}.getShaderParameter(...{1})', context, arguments);
      case 'getUniformLocation': return js.Syntax.code('{0}.getUniformLocation(...{1})', context, arguments);
      case 'linkProgram': return js.Syntax.code('{0}.linkProgram(...{1})', context, arguments);
      case 'pixelStorei': return js.Syntax.code('{0}.pixelStorei(...{1})', context, arguments);
      case 'readBuffer': return js.Syntax.code('{0}.readBuffer(...{1})', context, arguments);
      case 'readPixels': return js.Syntax.code('{0}.readPixels(...{1})', context, arguments);
      case 'renderbufferStorage': return js.Syntax.code('{0}.renderbufferStorage(...{1})', context, arguments);
      case 'renderbufferStorageMultisample': return js.Syntax.code('{0}.renderbufferStorageMultisample(...{1})', context, arguments);
      case 'scissor': return js.Syntax.code('{0}.scissor(...{1})', context, arguments);
      case 'shaderSource': return js.Syntax.code('{0}.shaderSource(...{1})', context, arguments);
      case 'stencilFunc': return js.Syntax.code('{0}.stencilFunc(...{1})', context, arguments);
      case 'stencilMask': return js.Syntax.code('{0}.stencilMask(...{1})', context, arguments);
      case 'stencilOp': return js.Syntax.code('{0}.stencilOp(...{1})', context, arguments);
      case 'stencilOpSeparate': return js.Syntax.code('{0}.stencilOpSeparate(...{1})', context, arguments);
      case 'texImage2D': return js.Syntax.code('{0}.texImage2D(...{1})', context, arguments);
      case 'texImage3D': return js.Syntax.code('{0}.texImage3D(...{1})', context, arguments);
      case 'texParameterf': return js.Syntax.code('{0}.texParameterf(...{1})', context, arguments);
      case 'texParameteri': return js.Syntax.code('{0}.texParameteri(...{1})', context, arguments);
      case 'texStorage3D': return js.Syntax.code('{0}.texStorage3D(...{1})', context, arguments);
      case 'texSubImage2D': return js.Syntax.code('{0}.texSubImage2D(...{1})', context, arguments);
      case 'uniform1f': return js.Syntax.code('{0}.uniform1f(...{1})', context, arguments);
      case 'uniform1fv': return js.Syntax.code('{0}.uniform1fv(...{1})', context, arguments);
      case 'uniform1i': return js.Syntax.code('{0}.uniform1i(...{1})', context, arguments);
      case 'uniform2f': return js.Syntax.code('{0}.uniform2f(...{1})', context, arguments);
      case 'uniform2fv': return js.Syntax.code('{0}.uniform2fv(...{1})', context, arguments);
      case 'uniform3f': return js.Syntax.code('{0}.uniform3f(...{1})', context, arguments);
      case 'uniform3fv': return js.Syntax.code('{0}.uniform3fv(...{1})', context, arguments);
      case 'uniform4f': return js.Syntax.code('{0}.uniform4f(...{1})', context, arguments);
      case 'uniform4fv': return js.Syntax.code('{0}.uniform4fv(...{1})', context, arguments);
      case 'uniformMatrix3fv': return js.Syntax.code('{0}.uniformMatrix3fv(...{1})', context, arguments);
      case 'uniformMatrix4fv': return js.Syntax.code('{0}.uniformMatrix4fv(...{1})', context, arguments);
      case 'useProgram': return js.Syntax.code('{0}.useProgram(...{1})', context, arguments);
      case 'vertexAttrib4f': return js.Syntax.code('{0}.vertexAttrib4f(...{1})', context, arguments);
      case 'vertexAttribDivisor': return js.Syntax.code('{0}.vertexAttribDivisor(...{1})', context, arguments);
      case 'vertexAttribPointer': return js.Syntax.code('{0}.vertexAttribPointer(...{1})', context, arguments);
      case 'viewport': return js.Syntax.code('{0}.viewport(...{1})', context, arguments);
      default:
        throw 'WebGl2Backend: unmapped GL method ' + name;
    }
  }

  public static function callOptional(context:Dynamic, name:String, arguments:Array<Dynamic>):Dynamic {
    if (context == null) return _Runtime.UNDEFINED;
    return call(context, name, arguments);
  }

  public static function field(context:Dynamic, name:String):Dynamic {
    switch (name) {
      case 'ACTIVE_UNIFORMS': return js.Syntax.code('{0}.ACTIVE_UNIFORMS', context);
      case 'ALWAYS': return js.Syntax.code('{0}.ALWAYS', context);
      case 'ARRAY_BUFFER': return js.Syntax.code('{0}.ARRAY_BUFFER', context);
      case 'BACK': return js.Syntax.code('{0}.BACK', context);
      case 'BLEND': return js.Syntax.code('{0}.BLEND', context);
      case 'CLAMP_TO_EDGE': return js.Syntax.code('{0}.CLAMP_TO_EDGE', context);
      case 'COLOR': return js.Syntax.code('{0}.COLOR', context);
      case 'COLOR_ATTACHMENT0': return js.Syntax.code('{0}.COLOR_ATTACHMENT0', context);
      case 'COLOR_BUFFER_BIT': return js.Syntax.code('{0}.COLOR_BUFFER_BIT', context);
      case 'COMPILE_STATUS': return js.Syntax.code('{0}.COMPILE_STATUS', context);
      case 'CULL_FACE': return js.Syntax.code('{0}.CULL_FACE', context);
      case 'DECR_WRAP': return js.Syntax.code('{0}.DECR_WRAP', context);
      case 'DEPTH24_STENCIL8': return js.Syntax.code('{0}.DEPTH24_STENCIL8', context);
      case 'DEPTH_BUFFER_BIT': return js.Syntax.code('{0}.DEPTH_BUFFER_BIT', context);
      case 'DEPTH_STENCIL': return js.Syntax.code('{0}.DEPTH_STENCIL', context);
      case 'DEPTH_STENCIL_ATTACHMENT': return js.Syntax.code('{0}.DEPTH_STENCIL_ATTACHMENT', context);
      case 'DEPTH_TEST': return js.Syntax.code('{0}.DEPTH_TEST', context);
      case 'DRAW_FRAMEBUFFER': return js.Syntax.code('{0}.DRAW_FRAMEBUFFER', context);
      case 'DST_COLOR': return js.Syntax.code('{0}.DST_COLOR', context);
      case 'DYNAMIC_DRAW': return js.Syntax.code('{0}.DYNAMIC_DRAW', context);
      case 'ELEMENT_ARRAY_BUFFER': return js.Syntax.code('{0}.ELEMENT_ARRAY_BUFFER', context);
      case 'EQUAL': return js.Syntax.code('{0}.EQUAL', context);
      case 'FLOAT': return js.Syntax.code('{0}.FLOAT', context);
      case 'FLOAT_MAT2': return js.Syntax.code('{0}.FLOAT_MAT2', context);
      case 'FLOAT_MAT3': return js.Syntax.code('{0}.FLOAT_MAT3', context);
      case 'FLOAT_MAT4': return js.Syntax.code('{0}.FLOAT_MAT4', context);
      case 'FLOAT_VEC2': return js.Syntax.code('{0}.FLOAT_VEC2', context);
      case 'FLOAT_VEC3': return js.Syntax.code('{0}.FLOAT_VEC3', context);
      case 'FLOAT_VEC4': return js.Syntax.code('{0}.FLOAT_VEC4', context);
      case 'FRAGMENT_SHADER': return js.Syntax.code('{0}.FRAGMENT_SHADER', context);
      case 'FRAMEBUFFER': return js.Syntax.code('{0}.FRAMEBUFFER', context);
      case 'FRAMEBUFFER_BINDING': return js.Syntax.code('{0}.FRAMEBUFFER_BINDING', context);
      case 'FRAMEBUFFER_COMPLETE': return js.Syntax.code('{0}.FRAMEBUFFER_COMPLETE', context);
      case 'FRONT': return js.Syntax.code('{0}.FRONT', context);
      case 'FUNC_ADD': return js.Syntax.code('{0}.FUNC_ADD', context);
      case 'HALF_FLOAT': return js.Syntax.code('{0}.HALF_FLOAT', context);
      case 'INCR_WRAP': return js.Syntax.code('{0}.INCR_WRAP', context);
      case 'INVERT': return js.Syntax.code('{0}.INVERT', context);
      case 'KEEP': return js.Syntax.code('{0}.KEEP', context);
      case 'LESS': return js.Syntax.code('{0}.LESS', context);
      case 'LINEAR': return js.Syntax.code('{0}.LINEAR', context);
      case 'LINEAR_MIPMAP_LINEAR': return js.Syntax.code('{0}.LINEAR_MIPMAP_LINEAR', context);
      case 'LINEAR_MIPMAP_NEAREST': return js.Syntax.code('{0}.LINEAR_MIPMAP_NEAREST', context);
      case 'LINES': return js.Syntax.code('{0}.LINES', context);
      case 'LINE_STRIP': return js.Syntax.code('{0}.LINE_STRIP', context);
      case 'LINK_STATUS': return js.Syntax.code('{0}.LINK_STATUS', context);
      case 'MAX_SAMPLES': return js.Syntax.code('{0}.MAX_SAMPLES', context);
      case 'MIRRORED_REPEAT': return js.Syntax.code('{0}.MIRRORED_REPEAT', context);
      case 'NEAREST': return js.Syntax.code('{0}.NEAREST', context);
      case 'NEAREST_MIPMAP_LINEAR': return js.Syntax.code('{0}.NEAREST_MIPMAP_LINEAR', context);
      case 'NEAREST_MIPMAP_NEAREST': return js.Syntax.code('{0}.NEAREST_MIPMAP_NEAREST', context);
      case 'NONE': return js.Syntax.code('{0}.NONE', context);
      case 'NOTEQUAL': return js.Syntax.code('{0}.NOTEQUAL', context);
      case 'ONE': return js.Syntax.code('{0}.ONE', context);
      case 'ONE_MINUS_SRC_ALPHA': return js.Syntax.code('{0}.ONE_MINUS_SRC_ALPHA', context);
      case 'ONE_MINUS_SRC_COLOR': return js.Syntax.code('{0}.ONE_MINUS_SRC_COLOR', context);
      case 'POINTS': return js.Syntax.code('{0}.POINTS', context);
      case 'READ_FRAMEBUFFER': return js.Syntax.code('{0}.READ_FRAMEBUFFER', context);
      case 'RENDERBUFFER': return js.Syntax.code('{0}.RENDERBUFFER', context);
      case 'REPEAT': return js.Syntax.code('{0}.REPEAT', context);
      case 'RGBA': return js.Syntax.code('{0}.RGBA', context);
      case 'RGBA16F': return js.Syntax.code('{0}.RGBA16F', context);
      case 'RGBA32F': return js.Syntax.code('{0}.RGBA32F', context);
      case 'RGBA8': return js.Syntax.code('{0}.RGBA8', context);
      case 'SCISSOR_TEST': return js.Syntax.code('{0}.SCISSOR_TEST', context);
      case 'SRC_ALPHA': return js.Syntax.code('{0}.SRC_ALPHA', context);
      case 'STATIC_DRAW': return js.Syntax.code('{0}.STATIC_DRAW', context);
      case 'STENCIL_BUFFER_BIT': return js.Syntax.code('{0}.STENCIL_BUFFER_BIT', context);
      case 'STENCIL_TEST': return js.Syntax.code('{0}.STENCIL_TEST', context);
      case 'STREAM_DRAW': return js.Syntax.code('{0}.STREAM_DRAW', context);
      case 'TEXTURE0': return js.Syntax.code('{0}.TEXTURE0', context);
      case 'TEXTURE1': return js.Syntax.code('{0}.TEXTURE1', context);
      case 'TEXTURE2': return js.Syntax.code('{0}.TEXTURE2', context);
      case 'TEXTURE_2D': return js.Syntax.code('{0}.TEXTURE_2D', context);
      case 'TEXTURE_2D_ARRAY': return js.Syntax.code('{0}.TEXTURE_2D_ARRAY', context);
      case 'TEXTURE_3D': return js.Syntax.code('{0}.TEXTURE_3D', context);
      case 'TEXTURE_CUBE_MAP': return js.Syntax.code('{0}.TEXTURE_CUBE_MAP', context);
      case 'TEXTURE_CUBE_MAP_POSITIVE_X': return js.Syntax.code('{0}.TEXTURE_CUBE_MAP_POSITIVE_X', context);
      case 'TEXTURE_MAG_FILTER': return js.Syntax.code('{0}.TEXTURE_MAG_FILTER', context);
      case 'TEXTURE_MAX_LEVEL': return js.Syntax.code('{0}.TEXTURE_MAX_LEVEL', context);
      case 'TEXTURE_MIN_FILTER': return js.Syntax.code('{0}.TEXTURE_MIN_FILTER', context);
      case 'TEXTURE_WRAP_R': return js.Syntax.code('{0}.TEXTURE_WRAP_R', context);
      case 'TEXTURE_WRAP_S': return js.Syntax.code('{0}.TEXTURE_WRAP_S', context);
      case 'TEXTURE_WRAP_T': return js.Syntax.code('{0}.TEXTURE_WRAP_T', context);
      case 'TRIANGLES': return js.Syntax.code('{0}.TRIANGLES', context);
      case 'TRIANGLE_FAN': return js.Syntax.code('{0}.TRIANGLE_FAN', context);
      case 'TRIANGLE_STRIP': return js.Syntax.code('{0}.TRIANGLE_STRIP', context);
      case 'UNPACK_PREMULTIPLY_ALPHA_WEBGL': return js.Syntax.code('{0}.UNPACK_PREMULTIPLY_ALPHA_WEBGL', context);
      case 'UNSIGNED_BYTE': return js.Syntax.code('{0}.UNSIGNED_BYTE', context);
      case 'UNSIGNED_INT': return js.Syntax.code('{0}.UNSIGNED_INT', context);
      case 'UNSIGNED_INT_24_8': return js.Syntax.code('{0}.UNSIGNED_INT_24_8', context);
      case 'UNSIGNED_SHORT': return js.Syntax.code('{0}.UNSIGNED_SHORT', context);
      case 'VERTEX_SHADER': return js.Syntax.code('{0}.VERTEX_SHADER', context);
      case 'VIEWPORT': return js.Syntax.code('{0}.VIEWPORT', context);
      case 'ZERO': return js.Syntax.code('{0}.ZERO', context);
      default:
        throw 'WebGl2Backend: unmapped GL constant ' + name;
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
class WebGl2Backend {
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
