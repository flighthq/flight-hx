final runtime:GlRenderStateRuntime = getGlRenderStateRuntime(state);
final gl:GlContext = state.gl;

if (runtime.context.currentShader?.program != program.program) {
  flight._internal.backend.WebGl2Backend.useProgram(gl, program.program);
}
runtime.context.currentShader = { locations: null, program: program.program };

final destFramebuffer = dest?.framebuffer ?? null;
if (runtime.currentFramebuffer != destFramebuffer) {
  flight._internal.backend.WebGl2Backend.bindFramebuffer(
    gl,
    flight._internal.backend.WebGl2Backend.contextConstant(
      gl,
      'FRAMEBUFFER',
      flight._internal.backend.WebGl2Backend.FRAMEBUFFER
    ),
    destFramebuffer
  );
  runtime.currentFramebuffer = destFramebuffer;
}
final destWidth = dest?.width ?? flight._internal.backend.WebGl2Backend.drawingBufferWidth(gl);
final destHeight = dest?.height ?? flight._internal.backend.WebGl2Backend.drawingBufferHeight(gl);
flight._internal.backend.WebGl2Backend.viewport(gl, 0, 0, destWidth, destHeight);
runtime.renderTargetViewport = dest != null ? { height: destHeight, width: destWidth, x: 0, y: 0 } : null;

for (i in 0...inputs.length) {
  flight._internal.backend.WebGl2Backend.activeTexture(
    gl,
    flight._internal.backend.WebGl2Backend.contextConstant(
      gl,
      'TEXTURE0',
      flight._internal.backend.WebGl2Backend.TEXTURE0
    ) + i
  );
  flight._internal.backend.WebGl2Backend.bindTexture(
    gl,
    flight._internal.backend.WebGl2Backend.contextConstant(
      gl,
      'TEXTURE_2D',
      flight._internal.backend.WebGl2Backend.TEXTURE_2D
    ),
    inputs[i]
  );
  if (program.textures[i] != null) {
    flight._internal.backend.WebGl2Backend.uniform1i(gl, program.textures[i], i);
  }
}
flight._internal.backend.WebGl2Backend.activeTexture(
  gl,
  flight._internal.backend.WebGl2Backend.contextConstant(
    gl,
    'TEXTURE0',
    flight._internal.backend.WebGl2Backend.TEXTURE0
  )
);
runtime.context.currentTextureRealization = null;

runtime.context.currentBlendSignature = null;
applyGlBlendMode(state, null);

#if (lime && !js)
// WebGL discards the window depth buffer between presented frames. Lime's
// native GL context retains it, so a fullscreen present must not inherit the
// preceding 3D pass's depth test or write another persistent depth value.
final depthTest = flight._internal.backend.WebGl2Backend.isEnabled(
  gl,
  flight._internal.backend.WebGl2Backend.contextConstant(
    gl,
    'DEPTH_TEST',
    flight._internal.backend.WebGl2Backend.DEPTH_TEST
  )
);
final depthWrite = flight._internal.backend.WebGl2Backend.getParameter(
  gl,
  flight._internal.backend.WebGl2Backend.contextConstant(
    gl,
    'DEPTH_WRITEMASK',
    flight._internal.backend.WebGl2Backend.DEPTH_WRITEMASK
  )
) != false;
flight._internal.backend.WebGl2Backend.disable(
  gl,
  flight._internal.backend.WebGl2Backend.contextConstant(
    gl,
    'DEPTH_TEST',
    flight._internal.backend.WebGl2Backend.DEPTH_TEST
  )
);
flight._internal.backend.WebGl2Backend.depthMask(gl, false);
#end

setUniforms(gl, program);
drawGlFullscreenQuad__glFullscreenPass(state, program);

#if (lime && !js)
flight._internal.backend.WebGl2Backend.depthMask(gl, depthWrite);
if (depthTest) {
  flight._internal.backend.WebGl2Backend.enable(
    gl,
    flight._internal.backend.WebGl2Backend.contextConstant(
      gl,
      'DEPTH_TEST',
      flight._internal.backend.WebGl2Backend.DEPTH_TEST
    )
  );
}
#end

runtime.context.currentBlendSignature = null;
applyGlBlendMode(state, null);

for (i in 0...inputs.length) {
  flight._internal.backend.WebGl2Backend.activeTexture(
    gl,
    flight._internal.backend.WebGl2Backend.contextConstant(
      gl,
      'TEXTURE0',
      flight._internal.backend.WebGl2Backend.TEXTURE0
    ) + i
  );
  flight._internal.backend.WebGl2Backend.bindTexture(
    gl,
    flight._internal.backend.WebGl2Backend.contextConstant(
      gl,
      'TEXTURE_2D',
      flight._internal.backend.WebGl2Backend.TEXTURE_2D
    ),
    null
  );
}
flight._internal.backend.WebGl2Backend.activeTexture(
  gl,
  flight._internal.backend.WebGl2Backend.contextConstant(
    gl,
    'TEXTURE0',
    flight._internal.backend.WebGl2Backend.TEXTURE0
  )
);
