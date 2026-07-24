package flighthq._internal.backend;

/**
 * Stable target boundary for the WebGPU flag-enum namespaces
 * (`GPUBufferUsage`, `GPUTextureUsage`, `GPUShaderStage`, `GPUColorWrite`,
 * `GPUMapMode`).
 *
 * Generated code reads these as `field(globalValue('GPUBufferUsage'), 'COPY_DST')`.
 * The members are bitflags fixed by the WebGPU specification, so — unlike a live
 * device or context — they carry no per-target behavior: the value of
 * `GPUBufferUsage.COPY_DST` is `8` on every target. This binding returns those
 * spec constants directly, which removes the reflection and works identically on
 * the browser, on native, and in the bridge without any typed WebGPU extern.
 *
 * Builder emits `WebGpuConstantsBackend.value('<namespace>', '<member>')`.
 */
class WebGpuConstantsBackend {
  public static function value(namespace:String, member:String):Int {
    switch (namespace) {
      case 'GPUBufferUsage':
        switch (member) {
          case 'MAP_READ': return 0x0001;
          case 'MAP_WRITE': return 0x0002;
          case 'COPY_SRC': return 0x0004;
          case 'COPY_DST': return 0x0008;
          case 'INDEX': return 0x0010;
          case 'VERTEX': return 0x0020;
          case 'UNIFORM': return 0x0040;
          case 'STORAGE': return 0x0080;
          case 'INDIRECT': return 0x0100;
          case 'QUERY_RESOLVE': return 0x0200;
        }
      case 'GPUTextureUsage':
        switch (member) {
          case 'COPY_SRC': return 0x01;
          case 'COPY_DST': return 0x02;
          case 'TEXTURE_BINDING': return 0x04;
          case 'STORAGE_BINDING': return 0x08;
          case 'RENDER_ATTACHMENT': return 0x10;
        }
      case 'GPUShaderStage':
        switch (member) {
          case 'VERTEX': return 0x1;
          case 'FRAGMENT': return 0x2;
          case 'COMPUTE': return 0x4;
        }
      case 'GPUColorWrite':
        switch (member) {
          case 'RED': return 0x1;
          case 'GREEN': return 0x2;
          case 'BLUE': return 0x4;
          case 'ALPHA': return 0x8;
          case 'ALL': return 0xF;
        }
      case 'GPUMapMode':
        switch (member) {
          case 'READ': return 0x1;
          case 'WRITE': return 0x2;
        }
    }
    throw 'WebGpuConstantsBackend: unmapped constant ' + namespace + '.' + member;
  }
}
