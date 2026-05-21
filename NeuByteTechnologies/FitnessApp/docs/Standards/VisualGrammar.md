# Visual Grammar Specification (NeuByte v2.0)
This document defines the standardized visual grammar for all NeuByte Technologies diagrams created using Inkscape, Draw.io, and similar tools. It is fully aligned with the NeuByte CSS design tokens defined in neubyte.css and serves as the **single source of truth** for diagram appearance across:

- BRDs
- Functional Specs
- UI flows
- UML diagrams
- DFDs
- Swimlane diagrams
- Architecture documents
- All diagrams must follow this specification.

## 0. Versioning
**Version**: 2.0
**Status**: Active
**Date**: 2026‑05‑20

**Summary of Changes from v1.x:**
- Unified all color, stroke, typography, and spacing rules with neubyte.css
- Updated stroke width to 2px and stroke color to #333333
- Integrated CSS design tokens directly into the spec
- Clarified spacing rules using rem‑based equivalents
- Standardized metadata text color and weights

## 1. Purpose
- The visual grammar establishes:
- A consistent stroke style
- A unified color palette
- Standardized spacing and alignment rules
- Reusable stencil conventions
- Cross‑diagram consistency for all assets under /Images/Stencils/
- Direct alignment with NeuByte’s web and resume styling via CSS tokens

This specification applies to a**all** diagram families in the repository.

## 2. Design Tokens Alignment
All diagram styling must align with the following CSS tokens from neubyte.css.

### 2.1 Core Color Tokens
| Purpose | CSS Token | Hex Value |
| --- | --- | --- |
| Primary Blue | ``--nb-blue`` | ``#0077cc`` |
| Primary Text | ``--nb-text`` | ``#1a1a1a`` |
| Secondary Text | ``--nb-text-muted`` | ``#666666`` |
| Metadata Text | ``--nb-text-meta`` | ``#808080`` |
| Neutral‑0 | ``--nb-gray-0`` | ``#ffffff`` |
| Neutral‑50 | ``--nb-gray-50`` | ``#f7f7f7`` |
| Neutral‑100 | ``--nb-gray-100`` | ``#e6e6e6`` |
| Neutral‑200 | ``--nb-gray-200`` | ``#cccccc`` |
| Neutral‑300 | ``--nb-gray-300`` | ``#b3b3b3`` |
| Neutral‑400 | ``--nb-gray-400`` | ``#999999`` |
| Neutral‑500 | ``--nb-gray-500`` | ``#808080`` |
| Neutral‑600 | ``--nb-gray-600`` | ``#666666`` |
| Neutral‑700 | ``--nb-gray-700`` | ``#4d4d4d`` |
| Neutral‑800 | ``--nb-gray-800`` | ``#333333`` |
| Neutral‑900 | ``--nb-gray-900`` | ``#1a1a1a`` |

## 2.2 Stroke and Arrow Tokens
| Purpose | CSS Token | Value |
| --- | --- | --- |
| Stroke Width | ``--nb-stroke-width`` | ``2px`` |
| Stroke Color | ``--nb-stroke-color`` | ``#333333`` |
| Arrow Stroke Width | ``--nb-arrow-stroke-width`` | ``2px`` |
| Arrow Stroke Color | ``--nb-arrow-stroke-color`` | ``#333333`` |
| Arrowhead Fill | ``--nb-arrowhead-fill`` | ``#333333`` |

## 2.3 Typography Tokens
| Purpose | CSS Token | Value |
| --- | --- | --- |
| Font Family | ``--nb-font`` | ``"Manrope", ``sans-serif`` |
| Regular Weight | ``--nb-font-weight-regular`` | ``400`` |
| Medium Weight | ``--nb-font-weight-medium`` | ``500`` |
| SemiBold Weight | ``--nb-font-weight-semibold`` | ``600`` |

## 2.4 Spacing Tokens
| Purpose | CSS Token | Value | Approx. Pixels |
| --- | --- | --- | --- |
| Space‑1 | ``--nb-space-1`` | ``0.25rem`` | 4px |
| Space‑2 | ``--nb-space-2`` | ``0.5rem`` | 8px |
| Space‑3 | ``--nb-space-3`` | ``0.75rem`` | 12px |
| Space‑4 | ``--nb-space-4`` | ``1rem`` | 16px |
| Space‑6 | ``--nb-space-6`` | ``1.5rem`` | 24px |
| Space‑8 | ``--nb-space-8`` | ``2rem`` | 32px |
| Shape Spacing | ``--nb-shape-spacing`` | ``1rem`` | 16px |
| Swimlane Padding | ``--nb-swimlane-padding`` | ``1.5rem`` | 24px |

## 3. Stroke and Line Standards
All lines, borders, connectors, lifelines, and arrows use:
- **Stroke Color**: --nb-stroke-color (#333333)
- **Stroke Width**: --nb-stroke-width (2px)
- **Line Join: Miter**
- **Line Cap**: Square or Butt (no rounded caps)
**Arrowheads**:
- Filled
- Stroke width = --nb-arrow-stroke-width (2px)
- Fill = --nb-arrowhead-fill (#333333)
- Color matches stroke

This stroke style is the **global default** across all stencil families.

## 4. Fill and Background Colors
### 4.1 Primary Emphasis Fill
- Used for emphasis boxes, highlighted regions, and key callouts.
- Color: --nb-blue (#0077cc)
- Opacity: 10–15%
- Do not use fully opaque fills for emphasis unless explicitly required.

### 4.2 Neutral Background / Grouping Fill
- Used for grouping containers, optional steps, and low‑priority UI elements.
- Color: --nb-gray-100 (#e6e6e6) or --nb-gray-50 (#f7f7f7) depending on contrast needs.
- Grouping containers should remain subtle and not overpower primary content.

## 4.3 No‑Fill Standard
- Most UML, Flowchart, and DFD shapes remain unfilled by default.
- Fill is applied only when:
 - Emphasizing a region
 - Indicating optional or alternate flows
 - Highlighting a specific UI state

## 5. Typography
All diagrams use the NeuByte typography system aligned with CSS.

### 5.1 Font Family
- **Font**: Manrope  
- **Weights**: Regular (400), Medium (500), SemiBold (600)  

### 5.2 Text Colors  
- **Primary Text**: --nb-text (#1a1a1a)  
- **Secondary Text**: --nb-text-muted (#666666)  
- **Metadata / Subtle Labels**: --nb-text-meta (#808080)  

### 5.3 Usage Guidelines
-**Node labels, step names, screen titles**:
 - Weight: Medium (500) or SemiBold (600)
 - Color: Primary text
- **Descriptions, annotations, notes**:
 - Weight: Regular (400)
 -Color: Secondary text
- **Timestamps, IDs, version tags, minor metadata**:
 - Weight: Regular (400)
 - Color: Metadata text

## 6. Spacing and Alignment Rules
All spacing is based on the rem‑aligned system used in CSS.  
###  6.1 Internal Padding
- **Inside shapes**:
 - Minimum internal padding: --nb-space-2 (0.5rem, ~8px)
 - Applies to rectangles, rounded rectangles, containers, and swimlanes.
### 6.2 Grid Alignment
- Use an 8px grid (0.5rem) for all diagrams.
- All shapes, connectors, and labels should snap to this grid.
### 6.3 Shape Spacing
- Minimum spacing between shapes: --nb-shape-spacing (1rem, ~16px).
- Do not crowd nodes; maintain consistent whitespace between elements.
### 6.4 Swimlane Padding
- Internal padding for swimlanes: --nb-swimlane-padding (1.5rem, ~24px).
- Lane headers should have sufficient breathing room above and below text.
### 6.5 Connector Routing
- Prefer straight lines.
- Avoid unnecessary bends and zig‑zags.
- Maintain clear separation between parallel connectors.
- Do not route connectors directly through shapes unless explicitly modeling that behavior.

## 7. Stencil Family Standards
All stencils under /Images/Stencils/ must conform to the following rules and use the design tokens defined above.    
- 7.1 Flowchart
 - **Shapes**:
 -  Actions: Rounded rectangles
 - Decisions: Diamonds
 - Terminators: Rounded rectangles with larger corner radius
- **Stroke**:
 - Width: 2px
 - Color: #333333
- **Text**:
 - Action labels: Medium (500)
 - Decision text: Medium (500)
 - Notes: Regular (400)
- **Spacing**:
 - Minimum 1rem between shapes
 - Align to 8px grid

### 7.2 Data Flow Diagrams (DFD)
- **Shapes**:
 - Processes: Rounded rectangles
 - Data Stores: Open‑ended rectangles
 - External Entities: Squares
- **Data Flows**:
 - Straight arrows with labels above or beside the line
 - Arrowheads filled, 2px stroke
- **Text**:
 - Process names: Medium (500)
 -Data flow labels: Regular (400)
- **Fill**:
 - Processes: Typically no fill
 - Grouping regions: Neutral background fill

## 7.3 UML Diagrams
### 7.3.1 Sequence Diagrams
- **Lifelines**:
 - Dashed vertical line
 - Stroke width: 2px
 - Stroke color: #333333
- **Activation Bars**:
 -Rectangles aligned to lifelines
 - Width: ~12px
 - Stroke aligned with lifeline
- **Messages**:
 - Straight arrows with labels above
 - Arrowheads filled, 2px stroke

### 7.3.2 Activity Diagrams
- **Initial Node**: Filled black circle
- **Final Node**: Bullseye (outer circle + inner filled circle)
- **Decision/Merge**: Diamond
 - **Fork/Join**: Thick horizontal or vertical bar
All strokes follow the global stroke rules.

### 7.4 UI Flow / Wireflow
- **Screens**: Rounded rectangles
- **Buttons**: Filled using primary blue (--nb-blue) at full opacity
- **Modals**: Larger rounded rectangles with header text in Medium or SemiBold
- **Annotations**:
 - Use metadata color for subtle notes
 - Use primary text for key labels

### 7.5 Swimlanes
- Orientation: Horizontal or vertical variants allowed
- **Lane Headers**:
 - Font: Manrope
 - Weight: SemiBold (600)
- Size: Larger than body text (tool‑dependent)
- **Borders**:
 - Stroke width: 2px
 - Stroke color: #333333
- **Padding**:
 - Internal padding: --nb-swimlane-padding (1.5rem)

### 8. File Organization
- All stencils are stored under:
/Images/Stencils/
- Each diagram family has its own folder:
 - CloudIcons/
 - Flowcharts/
 - DFD/
 - UML/
 - UIFlow/
 - Swimlanes/

Documentation references these assets but does not store them inline.

### 9. Versioning and Updates
- Any changes to the visual grammar must:
- Be documented in this file
-  Maintain alignment with neubyte.css design tokens
- Update corresponding stencils under /Images/Stencils/
- Preserve readability and a single source of truth
- When making changes:
- Increment the version number
- Add a brief summary to the version section
- Ensure diagrams are updated as needed

### 10. Compliance
All diagrams in the repository must follow this visual grammar to ensure:
- Consistency across documents and tools
- Professional, reviewer‑friendly presentation
- lear, readable diagrams
- Brand alignment with NeuByte Technologies’ web and resume styling
- This document is the authoritative standard for NeuByte diagrams.