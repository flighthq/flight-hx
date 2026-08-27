import type { IrParameter, IrType } from '../model/ir.ts';

export interface FacadeFunctionExtra {
  condition?: string;
  name: string;
  parameters: IrParameter[];
  returns: IrType;
  target: string;
}

const limeWindow: IrType = { arguments: [], kind: 'named', name: 'lime.ui.Window' };
const canvasElement: IrType = {
  arguments: [],
  kind: 'named',
  name: 'flight._internal.dom.HTMLCanvasElement',
};

export const sdkFacadeFunctionExtras: readonly FacadeFunctionExtra[] = [
  {
    condition: 'lime',
    name: 'createCairoSurface',
    parameters: [{ name: 'window', optional: false, rest: false, type: limeWindow }],
    returns: canvasElement,
    target: 'flight._internal.scene2DCairo.CairoSurface.createCairoSurface',
  },
  {
    condition: 'lime',
    name: 'createGlSurface',
    parameters: [{ name: 'window', optional: false, rest: false, type: limeWindow }],
    returns: canvasElement,
    target: 'flight.hostLime.GlSurface.createGlSurface',
  },
];
