# Stencil Library — Image Assets
This folder stores all image assets used for the Inkscape‑based stencil system. These images support BRDs, Functional Specs, UI Specs, Test Plans, and any diagramming artifacts in the portfolio.  

The folder is organized by diagram family, not by size class. Size classes are defined in the Visual Grammar and applied during stencil creation, not in the filesystem.  

## Folder Structure
Code
/Images
   /Stencils
      /Flowchart
      /DFD
      /UML
      /UIFlow
      /Swimlanes
      /CloudIcons
### Each subfolder contains:
- SVG source files exported from Draw.io or created in Inkscape
- PNG previews (optional) for embedding in Markdown
- Normalized stencil elements that follow the Visual Grammar rules

## Visual Grammar Reference (Summary)
All stencil assets must follow the system‑wide visual grammar:
- Stroke: 2 px
- Stroke Color: #333333
- Fill: White or #FAFAFA
- Corner Radius:
 - 6 px for M/L elements
 - 4 px for XS/S elements
 - Grid Snap: 8 px
 - Padding (containers): 16 px
 - Arrowhead Size: 8 px  

Full details are documented in the Stencil System — Visual Grammar Spec.  

## File Naming Convention
Use consistent, descriptive names:

- DiagramFamily-ElementName.svg  
- DiagramFamily-ElementName.png   (optional preview)  
  
### Examples:

- Flowchart-ProcessBox.svg
- Flowchart-DecisionDiamond.svg
- DFD-DataStore.svg
- UML-Class.svg
- UIFlow-ScreenFrame.svg
- CloudIcons-Database.svg
  
This ensures clarity, searchability, and clean diffs in version control.
  
  
## How These Assets Are Used
These images support:  
- BRD diagrams
- Data Flow Diagrams
- UML diagrams
- UI flows and wireflows
- Test Plan visuals
- Any diagram requiring standardized, reusable elements  

Each SVG is normalized in Inkscape and added to the master stencil file (MyDiagramStencils.svg) as a Symbol.  

## Contribution Rules
When adding new stencil assets:  
- Normalize the element in Inkscape
- Apply the correct size class
- Apply visual grammar rules
- Export as SVG
- (Optional) Export a PNG preview for Markdown
- Place the files in the correct diagram family folder
- Follow the naming convention