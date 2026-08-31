package;

import flight._internal._Float32Array;
import flight._internal._Int16Array;
import flight._internal._LimeTypedArray;
import flight._internal._Runtime;
import flight._internal._StaticIndex;
import flight._internal._UInt16Array;
import flight._internal._UInt8Array;
import flight._internal.backend.WebGl2Backend;

class LimeTypedArraySmoke {
  static function main():Void {
    final floats = new _Float32Array([1.0, 2.0, 3.0]);
    _Runtime.setIndex(floats, 1, 4.5);
    if (_Runtime.getIndex(floats, 1) != 4.5) throw 'float index';
    if (_Runtime.field(floats, 'length') != 3) throw 'float length';
    if (_Runtime.iterable(floats).join(',') != '1,4.5,3') throw 'float iterable';
    if (_StaticIndex.readFloat32ArrayTyped(floats, 1) != 4.5) throw 'typed float read';
    if (_StaticIndex.writeFloat32ArrayTyped(floats, 1, 2.5) != 2.5 || floats[1] != 2.5) {
      throw 'typed float write';
    }
    _StaticIndex.writeFloat32ArrayTyped(floats, 1, 4.5);
    final copied = new _Float32Array(4);
    _Runtime.callProperty(copied, 'set', [floats, 1]);
    if (copied[1] != 1 || copied[2] != 4.5 || copied[3] != 3) throw 'float set';
    final sliced = (cast (floats : Dynamic) : _Float32Array).subarray(1, 3);
    if (sliced.length != 2 || sliced[0] != 4.5 || sliced[1] != 3) throw 'float subarray';

    final signed = new _Int16Array([0x8000, 0xffff]);
    if (signed[0] != -32768 || signed[1] != -1) throw 'signed conversion';

    final unsigned = new _UInt16Array([-1, 0x10000]);
    _Runtime.fill(unsigned, 7, 0, 1, 4);
    if (unsigned[0] != 7 || unsigned[1] != 0) throw 'unsigned conversion';

    final bytes = new _UInt8Array([-1, 256, 257]);
    if (bytes[0] != 255 || bytes[1] != 0 || bytes[2] != 1) throw 'byte conversion';

    final storage:_LimeTypedArray = cast floats;
    if (!Std.isOfType(_LimeTypedArray.unwrap(storage), Array)) throw 'native unwrap';

    final gl = new FakeGl();
    WebGl2Backend.bufferData(gl, 1, floats, 2);
    if (!Std.isOfType(gl.upload, Array)) throw 'GL upload did not receive native storage';
    WebGl2Backend.shaderSource(gl, null,
      '#version 300 es\nprecision highp float;\n// Sébastien — shader comment\nuniform highp sampler2D texture;\nvoid main() {}');
    if (!StringTools.startsWith(gl.shader, '#version 330 core\n')) throw 'desktop shader version';
    if (gl.shader.indexOf('precision') >= 0 || gl.shader.indexOf('highp') >= 0) throw 'desktop shader precision';
    for (index in 0...gl.shader.length) {
      if (gl.shader.charCodeAt(index) > 0x7f) throw 'native shader source was not narrowed to ASCII';
    }
    if (gl.shader.indexOf('void main() {}') < 0) throw 'native shader source lost GLSL';

    final extension = WebGl2Backend.getExtension(gl, 'EXT_color_buffer_float');
    if (extension == null) throw 'complete RGBA16F framebuffer was not exposed';
    if (WebGl2Backend.getExtension(gl, 'EXT_color_buffer_float') != extension) throw 'float extension marker identity';
    if (gl.createdFramebuffers != 1) throw 'float framebuffer support was not cached';
    if (gl.drawFramebuffer != gl.originalDrawFramebuffer) throw 'float probe changed framebuffer binding';
    if (gl.texture != gl.originalTexture) throw 'float probe changed texture binding';

    final incompleteGl = new FakeGl();
    incompleteGl.framebufferStatus = 36054;
    if (WebGl2Backend.getExtension(incompleteGl, 'EXT_color_buffer_float') != null) {
      throw 'incomplete RGBA16F framebuffer was exposed';
    }
    if (WebGl2Backend.getExtension(incompleteGl, 'EXT_color_buffer_float') != null || incompleteGl.createdFramebuffers != 1) {
      throw 'negative float framebuffer support was not cached';
    }

    final esGl = new FakeGl();
    esGl.type = 'opengles';
    if (WebGl2Backend.getExtension(esGl, 'EXT_color_buffer_float') != null || esGl.createdFramebuffers != 0) {
      throw 'OpenGL ES bypassed its real extension result';
    }

    final extensionGl = new FakeGl();
    extensionGl.extension = {name: 'real extension'};
    if (WebGl2Backend.getExtension(extensionGl, 'EXT_color_buffer_float') != extensionGl.extension
      || extensionGl.createdFramebuffers != 0) {
      throw 'real float extension was replaced by a probe';
    }

    gl.type = 'opengles';
    WebGl2Backend.shaderSource(gl, null, '#version 300 es\nprecision highp float;');
    if (!StringTools.startsWith(gl.shader, '#version 300 es\n')) throw 'ES shader changed';
  }
}

class FakeGl {
  public final originalDrawFramebuffer:Dynamic = {name: 'draw'};
  public final originalReadFramebuffer:Dynamic = {name: 'read'};
  public final originalTexture:Dynamic = {name: 'texture'};
  public var createdFramebuffers = 0;
  public var drawFramebuffer:Dynamic;
  public var extension:Dynamic;
  public var framebufferStatus = 36053;
  public var readFramebuffer:Dynamic;
  public var type = 'opengl';
  public var texture:Dynamic;
  public var upload:Dynamic;
  public var shader:String;

  public function new() {
    drawFramebuffer = originalDrawFramebuffer;
    readFramebuffer = originalReadFramebuffer;
    texture = originalTexture;
  }

  public function bindFramebuffer(target:Int, framebuffer:Dynamic):Void {
    if (target == 36160 || target == 36009) drawFramebuffer = framebuffer;
    if (target == 36160 || target == 36008) readFramebuffer = framebuffer;
  }

  public function bindTexture(_target:Int, texture:Dynamic):Void {
    this.texture = texture;
  }

  public function bufferData(target:Dynamic, data:Dynamic, usage:Dynamic):Void {
    upload = data;
  }

  public function checkFramebufferStatus(_target:Int):Int {
    return framebufferStatus;
  }

  public function createFramebuffer():Dynamic {
    createdFramebuffers++;
    return {name: 'probe framebuffer'};
  }

  public function createTexture():Dynamic {
    return {name: 'probe texture'};
  }

  public function deleteFramebuffer(_framebuffer:Dynamic):Void {}

  public function deleteTexture(_texture:Dynamic):Void {}

  public function framebufferTexture2D(_target:Int, _attachment:Int, _textarget:Int, _texture:Dynamic, _level:Int):Void {}

  public function getExtension(_name:String):Dynamic {
    return extension;
  }

  public function getParameter(parameter:Int):Dynamic {
    return switch (parameter) {
      case 36006: drawFramebuffer;
      case 36010: readFramebuffer;
      case 32873: texture;
      default: null;
    }
  }

  public function shaderSource(shader:Dynamic, source:String):Void {
    this.shader = source;
  }

  public function texImage2D(_target:Int, _level:Int, _internalformat:Int, _width:Int, _height:Int, _border:Int,
      _format:Int, _type:Int, _pixels:Dynamic):Void {}

  public function texParameteri(_target:Int, _pname:Int, _param:Int):Void {}
}
