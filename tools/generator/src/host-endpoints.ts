import ts from 'typescript';

import type { IrHostEndpointBinding, IrWebGlComputedConstantDomain } from './model/ir.ts';

export type HostEndpointOperation = 'call' | 'read' | 'write';

interface HostReceiverContract {
  binding: IrHostEndpointBinding;
  dynamicFallback: boolean;
  receiverTypes: readonly string[];
  runtimePath: string;
}

export const hostReceiverContracts: readonly HostReceiverContract[] = [
  {
    binding: 'Canvas2dBackend',
    dynamicFallback: false,
    receiverTypes: ['CanvasRenderingContext2D'],
    runtimePath: 'src/flight/_internal/backend/Canvas2dBackend.hx',
  },
  {
    binding: 'CanvasElementBackend',
    dynamicFallback: true,
    receiverTypes: ['HTMLCanvasElement', 'OffscreenCanvas'],
    runtimePath: 'src/flight/_internal/backend/CanvasElementBackend.hx',
  },
  {
    binding: 'DomDocumentBackend',
    dynamicFallback: true,
    receiverTypes: ['Document'],
    runtimePath: 'src/flight/_internal/backend/DomDocumentBackend.hx',
  },
  {
    binding: 'DomNavigatorBackend',
    dynamicFallback: true,
    receiverTypes: ['Navigator'],
    runtimePath: 'src/flight/_internal/backend/DomNavigatorBackend.hx',
  },
  {
    binding: 'DomWindowBackend',
    dynamicFallback: true,
    receiverTypes: ['Window'],
    runtimePath: 'src/flight/_internal/backend/DomWindowBackend.hx',
  },
  {
    binding: 'WebGl2Backend',
    dynamicFallback: false,
    receiverTypes: ['GlContext', 'WebGL2RenderingContext'],
    runtimePath: 'src/flight/_internal/backend/WebGl2Backend.hx',
  },
  {
    binding: 'WebGpuCanvasContextBackend',
    dynamicFallback: true,
    receiverTypes: ['GPUCanvasContext'],
    runtimePath: 'src/flight/_internal/backend/WebGpuCanvasContextBackend.hx',
  },
  {
    binding: 'WebGpuDeviceBackend',
    dynamicFallback: true,
    receiverTypes: ['GPUDevice'],
    runtimePath: 'src/flight/_internal/backend/WebGpuDeviceBackend.hx',
  },
  {
    binding: 'WebGpuLimitsBackend',
    dynamicFallback: true,
    receiverTypes: ['GPUSupportedLimits'],
    runtimePath: 'src/flight/_internal/backend/WebGpuLimitsBackend.hx',
  },
  {
    binding: 'WebGpuQueueBackend',
    dynamicFallback: true,
    receiverTypes: ['GPUQueue'],
    runtimePath: 'src/flight/_internal/backend/WebGpuQueueBackend.hx',
  },
];

const canvas2dCalls = [
  'arc',
  'beginPath',
  'bezierCurveTo',
  'clearRect',
  'clip',
  'closePath',
  'createImageData',
  'createLinearGradient',
  'createPattern',
  'createRadialGradient',
  'drawImage',
  'ellipse',
  'fill',
  'fillRect',
  'fillText',
  'getContextAttributes',
  'getImageData',
  'isContextLost',
  'lineTo',
  'measureText',
  'moveTo',
  'putImageData',
  'quadraticCurveTo',
  'rect',
  'restore',
  'rotate',
  'roundRect',
  'save',
  'scale',
  'setTransform',
  'stroke',
  'strokeRect',
  'transform',
  'translate',
] as const;

const canvas2dReads = ['canvas', 'imageSmoothingEnabled', 'isContextLost', 'roundRect'] as const;

const canvas2dWrites = [
  'fillStyle',
  'filter',
  'font',
  'globalAlpha',
  'globalCompositeOperation',
  'imageSmoothingEnabled',
  'imageSmoothingQuality',
  'lineCap',
  'lineJoin',
  'lineWidth',
  'miterLimit',
  'strokeStyle',
  'textAlign',
  'textBaseline',
] as const;

const webGl2Calls = [
  'activeTexture',
  'attachShader',
  'bindBuffer',
  'bindFramebuffer',
  'bindRenderbuffer',
  'bindTexture',
  'bindVertexArray',
  'blendEquation',
  'blendEquationSeparate',
  'blendFunc',
  'blendFuncSeparate',
  'blitFramebuffer',
  'bufferData',
  'bufferSubData',
  'checkFramebufferStatus',
  'clear',
  'clearBufferfi',
  'clearBufferfv',
  'clearColor',
  'colorMask',
  'compileShader',
  'compressedTexImage2D',
  'compressedTexSubImage3D',
  'createBuffer',
  'createFramebuffer',
  'createProgram',
  'createRenderbuffer',
  'createShader',
  'createTexture',
  'createVertexArray',
  'cullFace',
  'deleteBuffer',
  'deleteFramebuffer',
  'deleteProgram',
  'deleteRenderbuffer',
  'deleteShader',
  'deleteTexture',
  'deleteVertexArray',
  'depthFunc',
  'depthMask',
  'disable',
  'disableVertexAttribArray',
  'drawArrays',
  'drawBuffers',
  'drawElements',
  'drawElementsInstanced',
  'enable',
  'enableVertexAttribArray',
  'flush',
  'framebufferRenderbuffer',
  'framebufferTexture2D',
  'frontFace',
  'generateMipmap',
  'getActiveUniform',
  'getAttribLocation',
  'getExtension',
  'getParameter',
  'getProgramInfoLog',
  'getProgramParameter',
  'getShaderInfoLog',
  'getShaderParameter',
  'getUniformLocation',
  'isEnabled',
  'linkProgram',
  'pixelStorei',
  'readBuffer',
  'readPixels',
  'renderbufferStorage',
  'renderbufferStorageMultisample',
  'scissor',
  'shaderSource',
  'stencilFunc',
  'stencilFuncSeparate',
  'stencilMask',
  'stencilMaskSeparate',
  'stencilOp',
  'stencilOpSeparate',
  'texImage2D',
  'texImage2DSource',
  'texImage3D',
  'texParameterf',
  'texParameteri',
  'texStorage3D',
  'texSubImage2D',
  'uniform1f',
  'uniform1fv',
  'uniform1i',
  'uniform2f',
  'uniform2fv',
  'uniform3f',
  'uniform3fv',
  'uniform4f',
  'uniform4fv',
  'uniformMatrix3fv',
  'uniformMatrix4fv',
  'useProgram',
  'vertexAttrib4f',
  'vertexAttribDivisor',
  'vertexAttribIPointer',
  'vertexAttribPointer',
  'viewport',
] as const;

const webGl2Reads = [
  'ACTIVE_TEXTURE',
  'ACTIVE_UNIFORMS',
  'ALWAYS',
  'ARRAY_BUFFER',
  'BACK',
  'BLEND',
  'BLEND_DST_ALPHA',
  'BLEND_DST_RGB',
  'BLEND_EQUATION_ALPHA',
  'BLEND_EQUATION_RGB',
  'BLEND_SRC_ALPHA',
  'BLEND_SRC_RGB',
  'CCW',
  'CLAMP_TO_EDGE',
  'COLOR',
  'COLOR_ATTACHMENT0',
  'COLOR_BUFFER_BIT',
  'COLOR_CLEAR_VALUE',
  'COLOR_WRITEMASK',
  'COMPILE_STATUS',
  'CULL_FACE',
  'CULL_FACE_MODE',
  'CURRENT_PROGRAM',
  'CW',
  'DECR_WRAP',
  'DEPTH24_STENCIL8',
  'DEPTH_BUFFER_BIT',
  'DEPTH_FUNC',
  'DEPTH_STENCIL',
  'DEPTH_STENCIL_ATTACHMENT',
  'DEPTH_TEST',
  'DEPTH_WRITEMASK',
  'DRAW_FRAMEBUFFER',
  'drawingBufferHeight',
  'drawingBufferWidth',
  'DST_COLOR',
  'DYNAMIC_DRAW',
  'ELEMENT_ARRAY_BUFFER',
  'EQUAL',
  'FLOAT',
  'FLOAT_MAT2',
  'FLOAT_MAT3',
  'FLOAT_MAT4',
  'FLOAT_VEC2',
  'FLOAT_VEC3',
  'FLOAT_VEC4',
  'FRAGMENT_SHADER',
  'FRAMEBUFFER',
  'FRAMEBUFFER_BINDING',
  'FRAMEBUFFER_COMPLETE',
  'FRONT',
  'FRONT_FACE',
  'FUNC_ADD',
  'FUNC_REVERSE_SUBTRACT',
  'HALF_FLOAT',
  'INCR_WRAP',
  'INVERT',
  'KEEP',
  'LESS',
  'LINEAR',
  'LINEAR_MIPMAP_LINEAR',
  'LINEAR_MIPMAP_NEAREST',
  'LINES',
  'LINE_STRIP',
  'LINK_STATUS',
  'MAX',
  'MAX_SAMPLES',
  'MAX_TEXTURE_IMAGE_UNITS',
  'MIN',
  'MIRRORED_REPEAT',
  'NEAREST',
  'NEAREST_MIPMAP_LINEAR',
  'NEAREST_MIPMAP_NEAREST',
  'NONE',
  'NOTEQUAL',
  'ONE',
  'ONE_MINUS_SRC_ALPHA',
  'ONE_MINUS_SRC_COLOR',
  'POINTS',
  'READ_FRAMEBUFFER',
  'RENDERBUFFER',
  'REPEAT',
  'RGBA',
  'RGBA16F',
  'RGBA32F',
  'RGBA8',
  'SCISSOR_BOX',
  'SCISSOR_TEST',
  'SRGB8_ALPHA8',
  'SRC_ALPHA',
  'STATIC_DRAW',
  'STENCIL_BUFFER_BIT',
  'STENCIL_BACK_FAIL',
  'STENCIL_BACK_FUNC',
  'STENCIL_BACK_PASS_DEPTH_FAIL',
  'STENCIL_BACK_PASS_DEPTH_PASS',
  'STENCIL_BACK_REF',
  'STENCIL_BACK_VALUE_MASK',
  'STENCIL_BACK_WRITEMASK',
  'STENCIL_FAIL',
  'STENCIL_FUNC',
  'STENCIL_PASS_DEPTH_FAIL',
  'STENCIL_PASS_DEPTH_PASS',
  'STENCIL_REF',
  'STENCIL_TEST',
  'STENCIL_VALUE_MASK',
  'STENCIL_WRITEMASK',
  'STREAM_DRAW',
  'TEXTURE0',
  'TEXTURE1',
  'TEXTURE2',
  'TEXTURE3',
  'TEXTURE_2D',
  'TEXTURE_2D_ARRAY',
  'TEXTURE_3D',
  'TEXTURE_BINDING_2D',
  'TEXTURE_CUBE_MAP',
  'TEXTURE_CUBE_MAP_POSITIVE_X',
  'TEXTURE_MAG_FILTER',
  'TEXTURE_MAX_LEVEL',
  'TEXTURE_MIN_FILTER',
  'TEXTURE_WRAP_R',
  'TEXTURE_WRAP_S',
  'TEXTURE_WRAP_T',
  'TRIANGLES',
  'TRIANGLE_FAN',
  'TRIANGLE_STRIP',
  'UNPACK_PREMULTIPLY_ALPHA_WEBGL',
  'UNSIGNED_BYTE',
  'UNSIGNED_INT',
  'UNSIGNED_INT_24_8',
  'UNSIGNED_SHORT',
  'VERTEX_ARRAY_BINDING',
  'VERTEX_SHADER',
  'VIEWPORT',
  'ZERO',
] as const;

const webGl2ContextFieldReads = new Set<string>(['drawingBufferHeight', 'drawingBufferWidth']);

export function webGl2ReadUsesContextField(member: string): boolean {
  return webGl2ContextFieldReads.has(member);
}

const canvasElementCalls = [
  'addEventListener',
  'convertToBlob',
  'getBoundingClientRect',
  'getContext',
  'removeEventListener',
  'toDataURL',
] as const;

const domDocumentCalls = [
  'addEventListener',
  'createElement',
  'createTextNode',
  'exitFullscreen',
  'exitPointerLock',
  'getElementById',
  'hasFocus',
  'querySelector',
  'removeEventListener',
] as const;

const domDocumentReads = [
  'body',
  'createElement',
  'documentElement',
  'exitPointerLock',
  'fonts',
  'head',
  'hidden',
  'pointerLockElement',
  'title',
] as const;

const domNavigatorCalls = ['getBattery', 'getGamepads', 'share', 'vibrate'] as const;

const domNavigatorReads = [
  'clipboard',
  'connection',
  'geolocation',
  'getBattery',
  'getGamepads',
  'gpu',
  'language',
  'languages',
  'maxTouchPoints',
  'mediaDevices',
  'mediaSession',
  'permissions',
  'platform',
  'share',
  'storage',
  'vibrate',
  'virtualKeyboard',
  'wakeLock',
] as const;

const domWindowCalls = [
  'addEventListener',
  'alert',
  'close',
  'confirm',
  'focus',
  'getScreenDetails',
  'matchMedia',
  'moveTo',
  'open',
  'prompt',
  'removeEventListener',
  'resizeTo',
  'showDirectoryPicker',
  'showOpenFilePicker',
  'showSaveFilePicker',
] as const;

const domWindowReads = [
  'alert',
  'close',
  'confirm',
  'devicePixelRatio',
  'focus',
  'getScreenDetails',
  'innerHeight',
  'innerWidth',
  'isSecureContext',
  'localStorage',
  'matchMedia',
  'moveTo',
  'open',
  'prompt',
  'resizeTo',
  'screen',
  'screenX',
  'screenY',
  'showDirectoryPicker',
  'showOpenFilePicker',
  'showSaveFilePicker',
  'visualViewport',
] as const;

const webGpuDeviceCalls = [
  'createBindGroup',
  'createBindGroupLayout',
  'createBuffer',
  'createCommandEncoder',
  'createPipelineLayout',
  'createRenderPipeline',
  'createSampler',
  'createShaderModule',
  'createTexture',
] as const;

const webGpuQueueCalls = ['copyExternalImageToTexture', 'submit', 'writeBuffer', 'writeTexture'] as const;

export const hostEndpointContract = {
  Canvas2dBackend: {
    call: new Set<string>(canvas2dCalls),
    read: new Set<string>(canvas2dReads),
    write: new Set<string>(canvas2dWrites),
  },
  CanvasElementBackend: {
    call: new Set<string>(canvasElementCalls),
    read: new Set<string>(['height', 'width']),
    write: new Set<string>(['height', 'width']),
  },
  DomDocumentBackend: {
    call: new Set<string>(domDocumentCalls),
    read: new Set<string>(domDocumentReads),
    write: new Set<string>(['title']),
  },
  DomNavigatorBackend: {
    call: new Set<string>(domNavigatorCalls),
    read: new Set<string>(domNavigatorReads),
    write: new Set<string>(),
  },
  DomWindowBackend: {
    call: new Set<string>(domWindowCalls),
    read: new Set<string>(domWindowReads),
    write: new Set<string>(),
  },
  WebGl2Backend: {
    call: new Set<string>(webGl2Calls),
    read: new Set<string>(webGl2Reads),
    write: new Set<string>(),
  },
  WebGpuCanvasContextBackend: {
    call: new Set<string>(['configure', 'getCurrentTexture']),
    read: new Set<string>(),
    write: new Set<string>(),
  },
  WebGpuDeviceBackend: {
    call: new Set<string>(webGpuDeviceCalls),
    read: new Set<string>(['limits', 'queue']),
    write: new Set<string>(),
  },
  WebGpuLimitsBackend: {
    call: new Set<string>(),
    read: new Set<string>(['maxBindGroups', 'maxTextureDimension2D', 'minUniformBufferOffsetAlignment']),
    write: new Set<string>(),
  },
  WebGpuQueueBackend: {
    call: new Set<string>(webGpuQueueCalls),
    read: new Set<string>(),
    write: new Set<string>(),
  },
} as const satisfies Record<IrHostEndpointBinding, Record<HostEndpointOperation, ReadonlySet<string>>>;

export function hostEndpointIsCovered(
  binding: IrHostEndpointBinding,
  operation: HostEndpointOperation,
  member: string,
): boolean {
  return hostEndpointContract[binding][operation].has(member);
}

export function requireHostEndpoint(
  binding: IrHostEndpointBinding,
  operation: HostEndpointOperation,
  member: string,
): string {
  if (!hostEndpointContract[binding][operation].has(member)) {
    const surface =
      binding === 'WebGl2Backend'
        ? 'WebGL2'
        : binding === 'Canvas2dBackend'
          ? 'Canvas2D'
          : (hostReceiverContracts.find((contract) => contract.binding === binding)?.receiverTypes.join('/') ??
            binding);
    const kind =
      operation === 'call'
        ? 'method'
        : operation === 'read'
          ? binding === 'WebGl2Backend'
            ? webGl2ReadUsesContextField(member)
              ? 'field'
              : 'constant'
            : 'field'
          : 'property';
    throw new Error(`${surface} ${kind} is not in the host endpoint contract: ${member}`);
  }
  return member;
}

export function hostEndpointBindingForUse(
  binding: IrHostEndpointBinding,
  operation: HostEndpointOperation,
  member: string,
): IrHostEndpointBinding | undefined {
  if (hostEndpointIsCovered(binding, operation, member)) return binding;
  const receiver = hostReceiverContracts.find((contract) => contract.binding === binding);
  return receiver?.dynamicFallback === false ? binding : undefined;
}

export function hostEndpointUsesDynamicFallback(
  binding: IrHostEndpointBinding,
  operation: HostEndpointOperation,
  member: string,
): boolean {
  const receiver = hostReceiverContracts.find((contract) => contract.binding === binding);
  return receiver?.dynamicFallback === true && !hostEndpointIsCovered(binding, operation, member);
}

export function hostPropertyOperation(node: ts.PropertyAccessExpression): HostEndpointOperation {
  const parent = node.parent;
  if (ts.isCallExpression(parent) && parent.expression === node) return 'call';
  if (
    (ts.isBinaryExpression(parent) &&
      parent.left === node &&
      parent.operatorToken.kind >= ts.SyntaxKind.FirstAssignment &&
      parent.operatorToken.kind <= ts.SyntaxKind.LastAssignment) ||
    ((ts.isPrefixUnaryExpression(parent) || ts.isPostfixUnaryExpression(parent)) &&
      (parent.operator === ts.SyntaxKind.PlusPlusToken || parent.operator === ts.SyntaxKind.MinusMinusToken))
  ) {
    return 'write';
  }
  return 'read';
}

export function hostEndpointBinding(
  type: ts.Type | undefined,
  checker: ts.TypeChecker | undefined,
): IrHostEndpointBinding | undefined {
  if (!type || !checker) return undefined;
  return hostReceiverContracts.find((contract) => typeIncludesNamed(type, checker, new Set(contract.receiverTypes)))
    ?.binding;
}

export function webGlComputedConstantDomain(
  type: ts.Type | undefined,
  checker: ts.TypeChecker | undefined,
): IrWebGlComputedConstantDomain | undefined {
  if (!type || !checker) return undefined;
  const members = type.isUnion() ? type.types : [type];
  const values = members.flatMap((member) =>
    (member.flags & ts.TypeFlags.StringLiteral) !== 0 ? [(member as ts.StringLiteralType).value] : [],
  );
  if (values.length !== members.length || values.length === 0) return undefined;
  const name = type.aliasSymbol?.getName() ?? checker.typeToString(type);
  return { name, values: [...new Set(values)].sort() };
}

function typeIncludesNamed(
  type: ts.Type,
  checker: ts.TypeChecker,
  names: ReadonlySet<string>,
  seen = new Set<ts.Type>(),
): boolean {
  if (seen.has(type)) return false;
  seen.add(type);
  if (type.isUnionOrIntersection() && type.types.some((item) => typeIncludesNamed(item, checker, names, seen))) {
    return true;
  }
  const symbols = [type.aliasSymbol, type.getSymbol()];
  if (symbols.some((symbol) => symbol && names.has(symbol.getName()))) return true;
  if (symbols.some((symbol) => symbol?.getName() === 'Readonly')) {
    const arguments_ = type.aliasTypeArguments ?? checker.getTypeArguments(type as ts.TypeReference);
    if (arguments_[0] && typeIncludesNamed(arguments_[0], checker, names, seen)) return true;
  }
  const constraint = checker.getBaseConstraintOfType(type);
  return constraint !== undefined && constraint !== type && typeIncludesNamed(constraint, checker, names, seen);
}
