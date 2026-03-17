---
description: "Analyze writing samples and build a 24-dimension style profile. Outputs JSON profile + interactive HTML report."
---

Invoke the ghost-writer skill in ANALYZE mode.

Ask the user for writing samples (pasted text, file paths, or URLs). Minimum 2 samples, ideal 3–5.

Analyze all samples across the 24 dimensions defined in the skill:
- A. Rhythm & Structure (6 dimensions)
- B. Word Choice & Vocabulary (6 dimensions)
- C. Tone & Emotional Register (5 dimensions)
- D. Rhetorical Devices (4 dimensions)
- E. Mechanics & Formatting (3 dimensions)

Output two files:
1. `{author-name}-style-profile.json` — machine-readable style profile
2. `{author-name}-style-report.html` — interactive visual report with radar chart, rhythm visualization, signature phrases, and do/don't reference
