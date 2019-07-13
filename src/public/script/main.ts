import { default as init } from '../wasm/pkg/wasm.js';

(async() => {

    await init('./src/public/wasm/pkg/wasm_bg.wasm');

})().catch(() => 'Failed to load wasm.');
