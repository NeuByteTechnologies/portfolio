# PNG → SVG Workflow

This workflow describes the process for converting PNG assets into clean, minimal‑node SVG files suitable for use in the NeuByte stencil system. It standardizes the conversion pipeline to ensure consistent vector quality, predictable structure, and alignment with NeuByte visual grammar.  

## Purpose

Convert raster PNG images into optimized SVG vectors for use in:

## Diagram stencils
- UI elements
- Icons
- Documentation assets
- This workflow ensures all SVGs meet NeuByte standards for cleanliness, editability, and visual consistency.
- Tools Used: 
 - Vectorizer.AI (Free Tier) for initial raster → vector conversion
 - Inkscape for cleanup, normalization, and symbol creation

## Workflow Overview
- Prepare PNG asset
- Convert PNG → SVG using Vectorizer.AI
- Import SVG into Inkscape
- Normalize stroke, fill, and colors
- Clean paths and reduce nodes
- Save as Plain SVG
- Add to stencil library (optional)

### Step 1: Prepare the PNG
- Before conversion, ensure the PNG:
- Has a transparent background (preferred)
- Is high enough resolution for clean tracing
- Contains clear edges and shapes
- If needed, preprocess the PNG in an image editor to remove noise or artifacts.

### Step 2: Convert PNG → SVG (Vectorizer.AI)
- Open Vectorizer.AI
- Upload the PNG file
- Allow the tool to auto‑vectorize
- Review the preview for:
 - Smooth curves
 - Accurate shape reconstruction
 - Minimal noise
 - Download the resulting SVG

**Notes:**
- Free tier supports images up to ~2 megapixels
- Output is suitable for icons, logos, and UI elements

### Step 3: Import SVG into Inkscape
- Open Inkscape
- Use File → Open or drag the SVG into the canvas
- Confirm the vector paths are editable

### Step 4: Normalize Stroke and Fill
- Apply NeuByte visual grammar:
- Stroke width: 1.5 px (default)
- Stroke color: NeuByte palette
- Fill: none (for icons) or brand color as needed
- Use the Fill and Stroke panel to adjust values.

## Step 5: Clean Paths
- Select all paths
- Use Path → Simplify sparingly (1–2 passes)
- Remove unnecessary nodes manually if needed
- Ensure shapes remain accurate after simplification

## Step 6: Save as Plain SVG

- Export using:
- File → Save As → Plain SVG
- This ensures compatibility with:
- Draw.io
- Inkscape stencil libraries
- Web rendering
- Documentation pipelines

## Step 7: Add to Stencil Library (Optional)
- If the SVG is part of the NeuByte stencil system:
- Open the Symbols panel (Object → Symbols)
- Add the cleaned SVG as a new symbol
- Save into the stencil file (e.g., MyDiagramStencils.svg)

## Quality Checklist

- Before finalizing the SVG, verify:
- No embedded raster images
- Clean, minimal node count
- Consistent stroke width
- Correct NeuByte colors
- No stray paths or artifacts
- Saved as Plain SVG

## Related Documentation

- Visual Grammar Specification
- Stencil System Overview
- Diagram Export Workflow

## Version

v1.0 — Initial creation of PNG → SVG workflow