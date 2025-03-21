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
                    type: 'file'
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

export default function exportDirectoryTree(directoryPath, outputFile) {
    try {
        const directoryTree = getDirectoryTree(directoryPath);
        fs.writeFileSync(outputFile, JSON.stringify(directoryTree, null, 2));
        console.log("Directory tree exported successfully to", outputFile);
    } catch (err) {
        console.error("Error processing directory:", err);
    }
}