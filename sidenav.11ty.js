import generateHTML from './plugins/sitemapgen.js';
import path from 'path';

export default function() {
    const dirPath = path.join(process.cwd(), 'features');
    return generateHTML(dirPath);
}