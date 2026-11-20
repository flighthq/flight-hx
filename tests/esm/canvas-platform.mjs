// The consumer also supports real DOM Canvas and checks an RGBA pixel there.
// Node supplies only the platform calls used by the real Flight render path.
const operations = [];
globalThis.flightTestCanvasOperations = operations;
globalThis.HTMLCanvasElement = class {
  style = {};
  context = {
    canvas: this,
    setTransform() {},
    save() {},
    restore() {},
    beginPath() {},
    closePath() {},
    rect(...bounds) { operations.push(['rect', ...bounds]); },
    fill() { operations.push(['fill', this.fillStyle]); },
  };

  getContext(kind) {
    return kind === '2d' ? this.context : null;
  }
};

globalThis.document = {
  createElement(tag) {
    if (tag !== 'canvas') throw new Error(`Unexpected DOM element ${tag}`);
    return new HTMLCanvasElement();
  },
};
await import('./bundle.mjs');
