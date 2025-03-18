import fs from 'fs-extra';
import path from 'path';
import glob from 'glob';

const FEATURES_DIR = path.resolve(__dirname, '../src/features');

/**
 * Parses feature files and builds a Mermaid diagram.
 */
function generateMermaidDiagram() {
    const featureFiles = glob.sync(`${FEATURES_DIR}/*.feature`);

    const featureConnections: string[] = [];
    const featureNodes: Set<string> = new Set();

    featureFiles.forEach((file) => {
        const content = fs.readFileSync(file, 'utf8');
        const featureNameMatch = content.match(/Feature:\s+(.+)/);

        if (featureNameMatch) {
            const featureName = featureNameMatch[1].trim();
            featureNodes.add(featureName);

            // Detect scenarios that reference previous steps
            const steps = content.match(/(Given|When|Then)\s+.+/g) || [];
            steps.forEach((step) => {
                if (/logged in|login/.test(step)) {
                    featureConnections.push(`"Login" --> "${featureName}"`);
                } else if (/search/.test(step)) {
                    featureConnections.push(`"SearchProduct" --> "${featureName}"`);
                } else if (/add to cart/.test(step)) {
                    featureConnections.push(`"AddItemToCart" --> "${featureName}"`);
                }
            });
        }
    });

    const mermaidDiagram = `graph TD;
    ${Array.from(featureNodes)
        .map((node) => `"${node}"`)
        .join('\n    ')}
    ${featureConnections.join('\n    ')}
    `;

    // Save to a file
    fs.writeFileSync(path.join(__dirname, '../docs/feature-flow.mmd'), mermaidDiagram);
    console.log('✅ Mermaid flowchart generated: docs/feature-flow.mmd');
}

// Run script
generateMermaidDiagram();