import { readFileSync } from 'node:fs';
import path from 'node:path';

import {
  auditHostEndpoints,
  hostEndpointCoverageIssues,
  validateHostEndpointCoverage,
} from '../../tools/generator/src/analyze/host-endpoints.ts';
import { hostEndpointSummary } from '../../tools/generator/src/emit/reports.ts';

const workspace = path.resolve('.');

describe('checker-derived host endpoint contract', () => {
  it('covers the complete translated host usage census with maintained runtimes', () => {
    const audit = auditHostEndpoints(workspace, 'fixture');

    expect(audit.summary).toEqual({
      accesses: 3_474,
      backendContractEndpoints: 378,
      bindings: 9,
      calls: 2_201,
      dynamicFallbackEndpoints: 11,
      endpoints: 373,
      reads: 1_026,
      writes: 247,
    });
    expect(audit.coverageIssues).toEqual([]);
    expect(() => validateHostEndpointCoverage(audit)).not.toThrow();
    expect(hostEndpointSummary(audit)).toContain('| Coverage issues | 0 |');
  });

  it('discovers the 26 WebGL additions, Canvas loss probe, and dynamic host fallbacks from checker facts', () => {
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
      'CULL_FACE_MODE',
      'CURRENT_PROGRAM',
      'DEPTH_FUNC',
      'DEPTH_WRITEMASK',
      'MAX_TEXTURE_IMAGE_UNITS',
      'SCISSOR_BOX',
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
      'isEnabled',
    ];

    expect(newWebGlEndpoints).toHaveLength(26);
    expect(newWebGlEndpoints.every((member) => keys.has(`WebGl2Backend:${member}`))).toBe(true);
    expect(audit.endpoints).toEqual(
      expect.arrayContaining([
        expect.objectContaining({
          binding: 'Canvas2dBackend',
          member: 'isContextLost',
          operation: 'call',
        }),
        expect.objectContaining({
          binding: 'Canvas2dBackend',
          member: 'isContextLost',
          operation: 'read',
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
          runtimePath: 'src/flighthq/_internal/_Runtime.hx',
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
    expect(keys.has('Canvas2dBackend:createImageData')).toBe(false);
    expect(keys.has('WebGl2Backend:finish')).toBe(false);
    expect([...keys].some((key) => key.includes('__ft'))).toBe(false);
  });

  it('fails loudly when the shared contract outruns a maintained runtime implementation', () => {
    const audit = auditHostEndpoints(workspace, 'fixture');
    const runtimePath = path.join(workspace, 'src/flighthq/_internal/backend/WebGl2Backend.hx');
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
      runtimePath: 'src/flighthq/_internal/backend/WebGl2Backend.hx',
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
        receiverTypes: ['WebGL2RenderingContext'],
        runtimeEndpoint: 'futureMethod',
        runtimePath: 'src/flighthq/_internal/backend/WebGl2Backend.hx',
        sites: [],
      },
    ]);

    expect(issues).toContainEqual({
      binding: 'WebGl2Backend',
      kind: 'usage-contract-gap',
      member: 'futureMethod',
      operation: 'call',
      runtimePath: 'src/flighthq/_internal/backend/WebGl2Backend.hx',
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
    const runtime = readFileSync(path.join(workspace, 'src/flighthq/_internal/backend/WebGl2Backend.hx'), 'utf8');

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
