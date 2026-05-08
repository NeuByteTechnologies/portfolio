# Visual Grammar Specification
This document defines the standardized visual grammar for all NeuByte Technologies diagrams created using Inkscape and Draw.io. It ensures consistency, reviewer‑safe clarity, and a unified aesthetic across BRDs, FS documents, UI flows, UML diagrams, DFDs, and Swimlane diagrams.  

## 1. Purpose
The visual grammar establishes:
- A consistent stroke style
- A unified color palette
- Standardized spacing and alignment rules
- Reusable stencil conventions
- Cross‑diagram consistency for all assets under /Images/Stencils/
- This specification applies to all diagram families in the repository.  

## 2. Stroke and Line Standards

All lines, borders, connectors, lifelines, and arrows use:

- Stroke Color: rgba(0, 0, 0, 0.85)
- Hex Equivalent: #000000D9
- Stroke Width: 1.0 px
- Line Join: Miter
- Line Cap: Square
- Arrowheads: Filled, 1.0 px stroke, matching line color

This stroke style is the global default across all stencil families.

## 3. Fill and Offset Colors

### 3.1 Primary UI/Emphasis Fill

- Used for buttons, modals, highlighted UI elements, and emphasis boxes.
- Color: rgba(0, 122, 255, 0.10)
- Hex Equivalent: #007AFF1A

### 3.2 Neutral Background / Grouping Fill

- Used for grouping containers, optional steps, and low‑priority UI elements.
- Color: rgba(0, 0, 0, 0.05)
- Hex Equivalent: #0000000D

### 3.3 No‑Fill Standard

- Most UML, Flowchart, and DFD shapes remain unfilled unless explicitly required.

### 3.4 Typography

- All diagrams use the following text standards:
- Font: Inter, Segoe UI, or system sans‑serif
- Font Color: rgba(0, 0, 0, 0.85)

- **Font Sizes:**
  - Titles: 18–20 pt
  - Shape Labels: 12–14 pt
  - Connector Labels: 10–12 pt
  - Metadata Tables: 10–12 pt

Text is always left‑aligned inside shapes unless the stencil family specifies otherwise.

### 3.5 Spacing and Alignment Rules

- Internal Padding: 8 px inside all shapes
- Grid Alignment: 8 px grid for all diagrams
- Connector Routing: Straight lines preferred; avoid unnecessary bends
- Shape Spacing: Minimum 16 px between shapes
- Swimlane Padding: 24 px internal padding

These rules ensure clean, readable diagrams.

## 3.6 Stencil Family Standards

Each stencil family under /Images/Stencils/ follows these rules:

### 3.6.1 Flowchart

- Standard ANSI shapes
- Rounded rectangles for actions
- Diamonds for decisions
- Terminators with 12 px corner radius

### 3.6.2 Data Flow Diagrams (DFD)

- Processes: Rounded rectangles
- Data Stores: Open‑ended rectangles
- External Entities: Squares
- Data Flows: Straight arrows with labels

### 3.6.3 UML Diagrams

- Sequence Diagrams
  - Lifelines: Dashed vertical line, 1.0 px stroke
  - Activation Bars: 12 px width, stroke‑aligned
- Messages: Straight arrows with labels above
- Activity Diagrams
- Initial Node: Filled black circle
- Final Node: Bullseye
- Decision/Merge: Diamond
- Fork/Join: Thick horizontal bar

### 3.6.4 UI Flow / Wireflow

- Screens: Rounded rectangles
- Buttons: Filled using primary offset color
- Modals: Larger rounded rectangles with header text

## 3.6.5 Swimlanes

- Horizontal and Vertical variants
- Lane headers: 20–24 pt bold
- Lane borders: 1.0 px stroke

## 3.7 File Organization

- All stencils are stored under:  
  /Images/Stencils/

- Each diagram family has its own folder:  

      Flowchart/
      DFD/
      UML/
      UIFlow/
      Swimlanes/
      CloudIcons/

Documentation references these assets but does not store them.

## 3.8 Versioning and Updates

Any changes to the visual grammar must:
- Be documented in this file
- Update corresponding stencils
- Maintain backward compatibility when possible

## 3.9 Compliance

All diagrams in the repository must follow this visual grammar to ensure:

- Consistency
- Professional presentation
- Reviewer clarity
- Brand alignment with NeuByte Technologies