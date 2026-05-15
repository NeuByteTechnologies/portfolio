# Typography Specification
## NeuByte Design System — Standards

### 1. Purpose
Typography defines the voice of the NeuByte design language.
It ensures all diagrams, documentation, UI specifications, and written materials use a consistent, readable, and professional typographic system.

**This specification standardizes:**

- font family
- font weights
- hierarchy
- usage rules
- accessibility considerations
- export behavior

Typography is a foundational dependency of the Visual Grammar, Color System, and Iconography specifications.  

### 2. Font Family
NeuByte uses a single, modern, open‑source typeface:

**Primary Typeface**
*Manrope (SIL Open Font License)*

Installed Weights
- ExtraLight
- Light
- Regular
- Medium
- SemiBold
- Bold
- ExtraBold

**Approved Weights for Use**
To maintain clarity and hierarchy, only the following weights are permitted in diagrams and documentation:

- Regular — body text, labels, descriptions
- Medium — node titles, UI labels, emphasis
- SemiBold — section headers, diagram titles, major emphasis

*All other weights are reserved for marketing or non‑technical materials.*

### 3. Typographic Hierarchy
NeuByte uses a three‑tier hierarchy across diagrams and documentation.

**3.1 Diagram Titles**
Manrope SemiBold
- Largest size in the diagram
- Used only once per diagram

**3.2 Section Headers / Swimlane Labels**
Manrope SemiBold
- Medium‑large size
- Used for structural grouping

**3.3 Node Titles / Object Names**
Manrope Medium
- Medium size
- Used for class names, component names, UI element names

**3.4 Body Text / Descriptions**
Manrope Regular
- Standard size
- Used for labels, notes, connector text, annotations

**3.5 Footnotes / Metadata**
Manrope Regular
- Small size
- Used sparingly

### 4. Diagram Typography Rules
Typography inside diagrams must follow the NeuByte Visual Grammar.

**4.1 Alignment**
Text must be left‑aligned unless the shape semantics require center alignment
- No justified text
- No right‑aligned text except in metadata blocks

**4.2 Line Spacing**
- Default line height: 1.2× font size
- Multi‑line text must maintain consistent spacing

**4.3 Text Placement**
- Text must not touch shape edges
- Minimum padding: 8px inside shapes
- Connector labels must sit above or beside lines, never intersecting strokes

**4.4 Icon Interaction**
- When icons appear next to text:
- Icon height must match the cap height of the text
-  Minimum spacing: 4px between icon and label
- Icons must not overpower text

### 5. Markdown Typography Rules
Markdown does not control fonts; the renderer does.
This spec defines the intended typographic behavior, not the rendering engine.

**5.1 Markdown Hierarchy**
# → SemiBold equivalent

## → SemiBold

### → Medium

Body text → Regular

Code blocks → monospace (Consolas recommended)

**5.2 Local Rendering (VS Code)**
When previewed locally:
- Markdown should render using Manrope via custom CSS
- Code blocks remain monospace

**5.3 GitHub Rendering**
GitHub uses its own font stack.
Typography.md defines the intended hierarchy, not GitHub’s rendering.

### 6. Web/UI Typography Rules
For UI mockups or web prototypes:

**6.1 CSS Font Stack**
Code
font-family: "Manrope", -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
6.2 Web Weights
Regular

Medium

SemiBold

**6.3 Accessibility**
Minimum body size: 14px

Minimum contrast ratio: 4.5:1

### 7. Accessibility Requirements
NeuByte typography must meet WCAG 2.1 AA:

Minimum contrast ratio: 4.5:1 for body text

Minimum size: 14px for body text

Avoid using color alone to convey meaning

Avoid ExtraLight and Light weights for readability

### 8. Export Considerations
**8.1 SVG**
Embed text as text (not paths)

Use system‑installed Manrope fonts

**8.2 PDF**
Ensure fonts are embedded during export

Avoid ExtraLight/Light weights

**8.3 PNG**
Use Medium or SemiBold for small text to avoid raster loss

### 9. Relationship to Other Specs
Typography is a referenced dependency of:

- Visual Grammar
Defines where text appears

- Typography defines how text behaves
Color System
Defines text color rules

- Typography defines weight and hierarchy

Iconography
Defines icon size relative to text

- Typography defines cap height and spacing

### 10. Summary
NeuByte typography is:

- modern
- readable
- minimal
- enterprise‑grade

consistent across diagrams, documentation, and UI

Typography defines the voice of the NeuByte design system.