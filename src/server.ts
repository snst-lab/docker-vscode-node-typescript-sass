'use strict';
import * as root from 'app-root-path';
import * as express from 'express';
express.static.mime.define({'application/wasm': ['wasm']});

/**
 * Configure Web Server
 */
const app = express();
app.use(express.static('.'));
app.get('/', (req: express.Request, res: express.Response) => {
    res.sendFile(root as string + '/index.html');
    return [req, res];
});
app.post('/api',  (req: express.Request, res: express.Response) => {
    res.send('POST request received.');
    return [req, res];
});

const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Server running on ${port}`));

export default app;
