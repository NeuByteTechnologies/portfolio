# Color System Specification
# NeuByte Design System — Standards

## 1. Purpose
The Color System defines the palette, semantics, and usage rules for all NeuByte diagrams, documentation, UI specifications, and visual assets.
It ensures color is applied consistently, meaningfully, and accessibly across the entire design language.

This specification standardizes:
- brand colors
- neutral palette
- semantic colors
- diagram‑safe colors
- accessibility contrast rules
- export behavior

The Color System is a foundational dependency of the Visual Grammar, Typography, and Iconography specifications.

## 2. Design Principles
NeuByte’s color philosophy is:

- Minimal — avoid unnecessary color
- Semantic — color must communicate meaning
- Accessible — meet WCAG contrast requirements
- Consistent — same colors across diagrams, docs, and UI
- Neutral‑first — color is used sparingly to highlight, not decorate
- Color supports clarity, not decoration.

## 3. Core Palette Overview
NeuByte uses three color families:
- Brand Colors — identity and emphasis
- Neutral Palette — strokes, text, backgrounds
- Semantic Colors — meaning (success, warning, error, info)

This palette is intentionally minimal to maintain an enterprise‑grade aesthetic.

## 4. Brand Colors
NeuByte’s brand colors are used for:
- diagram titles
- key highlights
- callouts
- UI mockups
- branding elements

### 4.1 Primary Brand Color
NeuByte Blue
- HEX: #2D6CDF
- RGB: 45, 108, 223

Usage: primary emphasis, links, key highlights

### 4.2 Secondary Brand Color
NeuByte Indigo
- HEX: #1F3A93
- RGB: 31, 58, 147

Usage: secondary emphasis, headers, accents

### 4.3 Accent Color
NeuByte Teal
- HEX: #2AB3A6
- RGB: 42, 179, 166

Usage: optional accents, diagrams requiring differentiation
Brand colors must be used sparingly to avoid visual noise.

## 5. Neutral Palette
The neutral palette is the backbone of NeuByte diagrams and documentation.

### 5.1 Neutral Colors
- Name	HEX	Usage
- Neutral‑900	#1A1A1A	Primary text
- Neutral‑700	#4A4A4A	Secondary text, strokes
- Neutral‑500	#7A7A7A	Tertiary text, metadata
- Neutral‑300	#C4C4C4	Dividers, light strokes
- Neutral‑100	#F2F2F2	Light backgrounds
- Neutral‑0	#FFFFFF	Base background

### 5.2 Stroke Color
All diagram strokes use:
- Neutral‑700 (#4A4A4A)
- Stroke width defined in Visual Grammar

### 5.3 Backgrounds
Default diagram background: Neutral‑0
- Node backgrounds: Neutral‑0 or Neutral‑100
- Swimlane backgrounds: alternating Neutral‑0 / Neutral‑100

## 6. Semantic Colors
Semantic colors communicate meaning, not decoration.

### 6.1 Success
- HEX: #2E8B57

Usage: successful operations, valid states

### 6.2 Warning
- HEX: #E6A100

Usage: caution, potential issues

### 6.3 Error
- HEX: #D64545

Usage: failures, invalid states

### 6.4 Info
- HEX: #2D6CDF (same as brand blue)

Usage: informational callouts
Semantic colors must be used only when meaning is required.

## 7. Diagram Color Rules
These rules ensure diagrams remain clean, readable, and consistent.

### 7.1 Strokes
All strokes use Neutral‑700
No colored strokes except semantic callouts

### 7.2 Node Backgrounds
Default: Neutral‑0
Optional: Neutral‑100 for grouping

## 7.3 Text Color
Primary text: Neutral‑900
Secondary text: Neutral‑700
Metadata: Neutral‑500

### 7.4 Highlighting
Use NeuByte Blue sparingly
Never use more than one highlight color per diagram

### 7.5 Icons
Icons follow the same color rules as text
Semantic icons may use semantic colors

## 8. Accessibility Requirements
**NeuByte color usage must meet WCAG 2.1 AA:**
- Minimum contrast ratio: 4.5:1 for body text
- Minimum contrast ratio: 3:1 for large text
- Avoid color‑only meaning
- Avoid low‑contrast strokes
- Neutral‑700 on Neutral‑0 meets contrast requirements.

## 9. Export Considerations
## #9.1 SVG
Colors must be embedded as HEX
Avoid opacity below 0.85 for text

### 9.2 PDF
Ensure color profiles embed correctly
Avoid transparency flattening

### 9.3 PNG
Use brand colors sparingly to avoid oversaturation

## 10. Relationship to Other Specs
**Visual Grammar**
Defines structure
Color System defines palette

**Typography**
Defines text hierarchy
Color System defines text color

**Iconography**
Defines icon semantics

**Color System** 
Defines icon color rules

## 11. Summary
**NeuByte’s Color System is:**
- minimal
- semantic
- accessible
- enterprise‑grade

consistent across diagrams, documentation, and UI

Color supports meaning and clarity, not decoration.