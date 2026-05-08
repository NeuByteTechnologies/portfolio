# UML— README
This folder contains the normalized stencil elements for the Cloud Icon diagram set.  
All elements in this folder follow the system‑wide Visual Grammar and Size Class standards defined in the Stencil System documentation.  

Each file represents a single diagram element, exported as an individual SVG and prepared for import into the Inkscape Symbols panel.  

## Contents
This folder includes:  
- SVG source files for each stencil element  
- (Optional) PNG previews for embedding in Markdown

Elements normalized to the correct size class (XS, S, M, L, XL)

Elements cleaned and prepared for use in MyDiagramStencils.svg

## Requirements for All Elements
All stencil elements in this folder must follow the Visual Grammar:  
- Stroke: 2 px
- Stroke Color: #333333
- Fill: White or #FAFAFA
- Corner Radius:
 - 6 px for M/L
 - 4 px for XS/S
 - Grid Snap: 8 px
 - Padding (containers): 16 px
 - Arrowhead Size: 8 px

Size classes are applied during element creation and normalization, not in the folder structure.  

## File Naming Convention
Use consistent, descriptive names:  

- UML-ElementName.svg
- UML-ElementName.png   (optional preview)

### Examples:

- Flowchart-ProcessBox.svg
- Flowchart-DecisionDiamond.svg
- DFD-DataStore.svg
- UML-Class.svg
- UIFlow-ScreenFrame.svg

This ensures clarity, searchability, and clean version control diffs.  

Workflow for Adding New Elements
Create or export the element (Draw.io → SVG or Inkscape).

Normalize size to the correct size class.

Apply Visual Grammar rules.

Save as SVG.

(Optional) Export a PNG preview.

Place files in the correct diagram family folder.

Add the element to the Inkscape Symbols panel.

Folder Purpose
This folder serves as the source of truth for all stencil elements in the <Diagram Family>.
These assets are used across:  
- BRDs
- Functional Specs
- UI Specs
- Test Plans

Any diagram requiring standardized, reusable elements  