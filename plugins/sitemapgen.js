import fs from 'fs';
import path from 'path';

function getDirectoryTree(directoryPath) {
    function buildTree(currentPath) {
        const items = fs.readdirSync(currentPath, { withFileTypes: true });
        return items.map(item => {
            const fullPath = path.join(currentPath, item.name);
            if (item.isDirectory()) {
                return {
                    name: item.name,
                    type: 'directory',
                    children: buildTree(fullPath)
                };
            } else {
                return {
                    name: item.name,
                    type: 'file',
                    path: fullPath
                };
            }
        });
    }
    return {
        name: path.basename(directoryPath),
        type: 'directory',
        children: buildTree(directoryPath)
    };
}

/*
export default function exportDirectoryTree(directoryPath, outputFile) {
    try {
        const directoryTree = getDirectoryTree(directoryPath);
        fs.writeFileSync(outputFile, JSON.stringify(directoryTree, null, 2));
        console.log("Directory tree exported successfully to", outputFile);
    } catch (err) {
        console.error("Error processing directory:", err);
    }
}*/

export default function generateHTML(directoryPath) {
    try {        
        const directoryTree = getDirectoryTree(directoryPath);

        let navHtml = `
        <ul class="tree">
            ${directoryTree.children.map(it => renderTree(it, "features")).join('')}
        </ul>
        `;        

        //fs.writeFileSync(outputFile, navHtml);
        //console.log("Directory tree exported successfully to", outputFile);
        return navHtml;
    } catch (err) {
        console.error("Error processing directory:", err);
    }
}

function renderTree(node, parentPath) {
    if (!node) return '';

    if (node.type === 'file') {
        let featureName = formatFilename(node.name);
        //return `<li>${featureName}</li>`;
        return `
        <li>
            <a class="content-link" hx-get="${parentPath + "/" + node.name}" hx-target="#response-div" href="#">
                ${featureName}      
            </a>
        </li>`;
    }

    if (node.type === 'directory') {
        return `
        <li>
            <details>
                <summary>${node.name}</summary>
                <ul>
                    ${node.children.map(it => renderTree(it, parentPath + "/" + node.name)).join('')}
                </ul>
            </details>
        </li>
    `;
    }
    return '';
}

function formatFilename(filename) {
    return filename.replace(/\.[^/.]+$/, '').replace(/-/g, ' ');
}   