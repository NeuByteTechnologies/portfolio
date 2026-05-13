# NeuByte Documentation Versioning Policy

Version: 1.0

## Revision History

| Version | Last Updated | Description |
|---------|--------------|-------------|
| 1.0     | 2026‑05‑13   | Initial release |

## Purpose:  
Establish a unified versioning standard across all documentation artifacts in the FitnessApp portfolio, including Markdown (*.md), Word (*.docx), Excel (*.xlsx), and diagram assets (*.png, *.svg, *.drawio).

This policy ensures consistency, clarity, and professional presentation across all NeuByte deliverables.

### 1. Versioning Philosophy
NeuByte documentation uses a release‑based versioning model:

Version numbers apply to deliverables, not internal components.

Git tracks granular changes; version numbers track published states.

Version numbers appear only on documents intended for external review, portfolio presentation, or formal delivery.

### 2. Version Number Format
All version numbers follow:

**Code**
Version: X.Y
Where:

X = Major version

Y = Minor version

**Examples:**

Version: 1.0 — Initial release

Version: 1.1 — Minor updates

Version: 2.0 — Major structural or functional changes

No “v” prefix is used.

### 3. Where Version Numbers MUST Appear
#### 3.1 Markdown Files (*.md)
**Version numbers are required on:**

- Root README.md

/docs/README.md

- Module‑level READMEs
- BRD (brd.md)
- Functional Specification (fs.md)
- UI Specification (ui-spec.md)
- Architecture Overview
- Test Strategy / Test Plan
- Any Markdown intended as a final deliverable

**Version numbers are not required on:**

- Individual Use Case files
- Individual Test Case files
- Internal notes
- Scratch or working Markdown

#### 3.2 Word Documents (*.docx)
**Version numbers must appear in:**
- Footer
- Title page (if applicable)
- Document metadata (optional but recommended)

**Applies to:**
- BRD
- UI Specification
- Legal documents (Privacy Policy, Terms & Conditions)
- Any exported PDF derived from Word

**Footer format:**

**Code**
© 2026 NeuByte Technologies | Version: 1.0
3.3 Excel Documents (*.xlsx)
Version numbers must appear in:

- Footer (Left, Center, or Right)
- A metadata sheet (optional)
- Named cell AppVersion (if used for automation)

**Applies to:**
- RTM
- Data dictionaries
- UI mapping sheets
- Any Excel artifact included in the deliverable set

Footer format:

**Code**
© 2026 NeuByte Technologies — Version: 1.0

#### 3.4 Diagrams (*.png, *.svg, *.drawio)
**Version numbers must appear in:**
- Footer bar
- Bottom‑right corner
- Using NeuByte stencil grammar (flat blue, 8‑pt grid)

**Footer format:**

**Code**
© 2026 NeuByte Systems | Version: 1.0
### 4. Version Increment Rules
#### 4.1 Major Version (X.0)

**Increment when:**
- Requirements change significantly
- Architecture changes
- UI redesign
- New modules added
- Breaking changes introduced

#### 4.2 Minor Version (X.Y)
**Increment when:**
- Textual updates
- Clarifications
- Diagram refinements
- Non‑breaking updates
- Additional examples or notes

### 5. Version Placement Standards
- Markdown
- Placed at the top:

**Code**
Version: 1.0  
Last Updated: 2026‑05‑13
Word
Footer:

**Code**
© 2026 NeuByte Technologies | Version: 1.0
Excel
Footer:

**Code**
© 2026 NeuByte Technologies — Version: 1.0
Diagrams
Footer bar:

**Code**
© 2026 NeuByte Systems | Version: 1.0
6. Version Control & Git Integration
Git tracks changes

Version numbers track releases

Each version bump should correspond to a Git tag:

**Code**
1.0
1.1
2.0
(Still no “v” prefix.)

### 7. Automation (Optional but Recommended)
Excel
Named cell AppVersion

VBA auto‑injects footer version

Diagrams
Template layer includes version placeholder

Updated manually or via Draw.io variables

Markdown
Version updated manually

GitHub Actions (optional) can enforce version presence

## 8. Revision History Requirements
- Required for all versioned deliverables
- Not required for component‑level Markdown
- Must match the Version displayed at the top (Markdown) or in the footer (Word/Excel)
- Must follow a consistent table format

**Code**
## Revision History

| Version | Last Updated | Description |
|---------|--------------|-------------|
| 1.0     | 2026‑05‑13   | Initial release |
