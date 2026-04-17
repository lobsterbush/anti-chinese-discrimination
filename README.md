# The China Penalty — Slide Deck
Measuring and understanding a blanket bias against Chinese immigrants across 22 nations.
## Authors
- Charles D. Crabtree, *Monash University* — Senior Lecturer, School of Social Sciences; K-Club Professor, University College, Korea University
- John B. Holbein, *University of Virginia*
- Maya Lu, *UC Berkeley*
- Cecilia H. Mo, *UC Berkeley*
- Kiyoteru Tsutsui, *Stanford University*
- Andreas Wimmer, *Columbia University*
## Overview
A reveal.js presentation summarizing Memo 2-10 (working paper draft, ~8,869 words). The deck walks through the research questions, the cross-national conjoint design (N ≈ 47,000 across 22 countries), the main AMCE result, the four hypothesis tests (Ethnonationalism, Rivalry, Economic threat, Attribute moderation), and the discussion/limitations.
The visual language matches the companion `slides_UNM.html` deck from the `ai-agents-workshop` project — subtle mesh gradients, Space Grotesk + IBM Plex Mono, teal/crimson accent, glass-card and cinema slide variants.
## Contents
- `slides.html` — self-contained reveal.js deck (loads reveal.js and fonts from CDN)
- `images/image1.png` … `image11.png` — the 11 figures extracted from Memo 2-10.docx
- `WARP.md` — project context file
## Requirements
- Any modern browser (Chrome, Firefox, Safari, Edge)
- Internet connection on first open (reveal.js and Google Fonts load from CDN)
## View the slides
The deck is published on GitHub Pages with a password. The source `slides.html` and raw `images/` are kept locally (gitignored); only the encrypted `docs/index.html` is committed and served.
Locally, from this directory:
```sh
open slides.html
```
## Rebuild the encrypted deploy
Requires `python3` and [staticrypt](https://github.com/robinmoisson/staticrypt) (`npm i -g staticrypt`).
```sh
PASSWORD='your-password' ./build.sh
```
This inlines every PNG into the HTML as a base64 data URI, AES-encrypts the whole file with the password, and writes the result to `docs/index.html`.
## Keyboard
- `→` / `←` — navigate
- `ESC` — slide overview
- `F` — fullscreen
- `S` — speaker-notes view
## Source
Figures were extracted from `Memo 2-10.docx` (the six-author manuscript draft). No analysis was re-run; the plots are reproduced as they appear in the memo.
