import { readFileSync } from 'node:fs';
import path from 'node:path';

import {
  auditHostEndpoints,
  hostEndpointCoverageIssues,
  validateHostEndpointCoverage,
} from '../../tools/generator/src/analyze/host-endpoints.ts';
import { hostEndpointSummary } from '../../tools/generator/src/emit/reports.ts';
import { hostEndpointContract } from '../../tools/generator/src/host-endpoints.ts';

const workspace = path.resolve('.');

describe('checker-derived host endpoint contract', () => {
  it('covers the complete translated host usage census with maintained runtimes', () => {
    const audit = auditHostEndpoints(workspace, 'fixture');
    const operationAccesses = (operation: 'call' | 'read' | 'write'): number =>
      audit.endpoints
        .filter((endpoint) => endpoint.operation === operation)
        .reduce((total, endpoint) => total + endpoint.accesses, 0);
    const backendContractEndpoints = Object.values(hostEndpointContract).reduce(
      (total, contract) => total + contract.call.size + contract.read.size + contract.write.size,
      0,
    );

    expect(audit.summary).toEqual({
      accesses: audit.endpoints.reduce((total, endpoint) => total + endpoint.accesses, 0),
      backendContractEndpoints,
      bindings: new Set(audit.endpoints.map((endpoint) => endpoint.binding)).size,
      calls: operationAccesses('call'),
      dynamicFallbackEndpoints: audit.endpoints.filter((endpoint) => endpoint.contract === 'dynamic-fallback').length,
      endpoints: audit.endpoints.length,
      reads: operationAccesses('read'),
      writes: operationAccesses('write'),
    });
    expect(audit.coverageIssues).toEqual([]);
    expect(() => validateHostEndpointCoverage(audit)).not.toThrow();
    expect(hostEndpointSummary(audit)).toContain('| Coverage issues | 0 |');
  });

  it('discovers the WebGL additions through Flight GlContext and current dynamic host fallbacks', () => {
    const audit = auditHostEndpoints(workspace, 'fixture');
    const keys = new Set(audit.endpoints.map((endpoint) => `${endpoint.binding}:${endpoint.member}`));
    const newWebGlEndpoints = [
      'ACTIVE_TEXTURE',
      'BLEND_DST_ALPHA',
      'BLEND_DST_RGB',
      'BLEND_EQUATION_ALPHA',
      'BLEND_EQUATION_RGB',
      'BLEND_SRC_ALPHA',
      'BLEND_SRC_RGB',
      'CCW',
      'COLOR_CLEAR_VALUE',
      'COLOR_WRITEMASK',
      'CULL_FACE_MODE',
      'CURRENT_PROGRAM',
      'CW',
      'DEPTH_FUNC',
      'DEPTH_WRITEMASK',
      'drawingBufferHeight',
      'drawingBufferWidth',
      'FRONT_FACE',
      'MAX_TEXTURE_IMAGE_UNITS',
      'SCISSOR_BOX',
      'SRGB8_ALPHA8',
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
      'STENCIL_VALUE_MASK',
      'STENCIL_WRITEMASK',
      'TEXTURE3',
      'TEXTURE_BINDING_2D',
      'VERTEX_ARRAY_BINDING',
      'blendEquationSeparate',
      'blendFuncSeparate',
      'frontFace',
      'isEnabled',
      'stencilFuncSeparate',
      'stencilMaskSeparate',
    ];

    expect(newWebGlEndpoints).toHaveLength(44);
    expect(newWebGlEndpoints.every((member) => keys.has(`WebGl2Backend:${member}`))).toBe(true);
    expect(audit.endpoints).toEqual(
      expect.arrayContaining([
        expect.objectContaining({
          binding: 'Canvas2dBackend',
          member: 'createImageData',
          operation: 'call',
        }),
        expect.objectContaining({
          binding: 'Canvas2dBackend',
          member: 'roundRect',
          operation: 'read',
        }),
        expect.objectContaining({
          binding: 'CanvasElementBackend',
          contract: 'dynamic-fallback',
          member: 'style',
          operation: 'read',
          runtimePath: 'src/flight/_internal/_Runtime.hx',
        }),
        expect.objectContaining({
          binding: 'DomDocumentBackend',
          contract: 'dynamic-fallback',
          member: 'activeElement',
          operation: 'read',
        }),
        expect.objectContaining({
          binding: 'DomNavigatorBackend',
          contract: 'dynamic-fallback',
          member: 'onLine',
          operation: 'read',
        }),
        expect.objectContaining({
          binding: 'WebGpuDeviceBackend',
          contract: 'dynamic-fallback',
          member: 'features',
          operation: 'read',
        }),
      ]),
    );
    expect(keys.has('Canvas2dBackend:createImageData')).toBe(true);
    expect(keys.has('WebGl2Backend:finish')).toBe(false);
    const runtime = readFileSync(path.join(workspace, 'src/flight/_internal/backend/WebGl2Backend.hx'), 'utf8');
    expect(runtime).toContain('public static inline function drawingBufferWidth(');
    expect([...keys].some((key) => key.includes('__ft'))).toBe(false);
  });

  it('fails loudly when the shared contract outruns a maintained runtime implementation', () => {
    const audit = auditHostEndpoints(workspace, 'fixture');
    const runtimePath = path.join(workspace, 'src/flight/_internal/backend/WebGl2Backend.hx');
    const runtime = readFileSync(runtimePath, 'utf8').replace(
      'public static inline function blendFuncSeparate(',
      'public static inline function removedBlendFuncSeparate(',
    );
    const issues = hostEndpointCoverageIssues(workspace, audit.endpoints, { WebGl2Backend: runtime });

    expect(issues).toContainEqual({
      binding: 'WebGl2Backend',
      kind: 'contract-runtime-gap',
      member: 'blendFuncSeparate',
      operation: 'call',
      runtimePath: 'src/flight/_internal/backend/WebGl2Backend.hx',
    });
  });

  it('fails loudly when typed-only receiver use outruns the shared contract', () => {
    const audit = auditHostEndpoints(workspace, 'fixture');
    const issues = hostEndpointCoverageIssues(workspace, [
      ...audit.endpoints,
      {
        accesses: 1,
        binding: 'WebGl2Backend',
        contract: 'backend',
        member: 'futureMethod',
        operation: 'call',
        receiverTypes: ['GlContext', 'WebGL2RenderingContext'],
        runtimeEndpoint: 'futureMethod',
        runtimePath: 'src/flight/_internal/backend/WebGl2Backend.hx',
        sites: [],
      },
    ]);

    expect(issues).toContainEqual({
      binding: 'WebGl2Backend',
      kind: 'usage-contract-gap',
      member: 'futureMethod',
      operation: 'call',
      runtimePath: 'src/flight/_internal/backend/WebGl2Backend.hx',
    });
  });

  it('keeps TextureSource dispatch above the unchanged bytes-or-host-source GL upload boundary', () => {
    const audit = auditHostEndpoints(workspace, 'fixture');
    const sourceUpload = audit.endpoints.find(
      (endpoint) =>
        endpoint.binding === 'WebGl2Backend' &&
        endpoint.member === 'texImage2D' &&
        endpoint.runtimeEndpoint === 'texImage2DSource',
    );
    const uploadSource = readFileSync(
      path.join(workspace, 'upstream/packages/render-gl/src/glTextureUpload.ts'),
      'utf8',
    );
    const runtime = readFileSync(path.join(workspace, 'src/flight/_internal/backend/WebGl2Backend.hx'), 'utf8');

    expect(sourceUpload?.sites).toEqual(
      expect.arrayContaining([
        expect.objectContaining({ source: 'upstream/packages/render-gl/src/glTextureUpload.ts' }),
      ]),
    );
    expect(uploadSource).toContain('image.source as TexImageSource');
    expect(runtime).toContain('format:Float, type:Float, source:Dynamic):Void');
    expect(runtime).not.toContain('TextureSource');
  });
});
