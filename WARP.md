# anti-chinese-discrimination
**Project title.** The China Penalty: Measuring and Understanding a Blanket Bias Against Chinese Immigrants Across 22 Nations
**Status.** Draft
**One-line description.** Reveal.js slide deck summarizing the Memo 2-10 manuscript on a cross-national conjoint measuring anti-Chinese immigration bias, styled to match `ai-agents-workshop/slides_UNM.html` and deployed as an encrypted GitHub Pages site.
**Authors.** Charles D. Crabtree (Monash), John B. Holbein (UVA), Maya Lu (UC Berkeley), Cecilia H. Mo (UC Berkeley), Kiyoteru Tsutsui (Stanford), Andreas Wimmer (Columbia).
**Last Updated.** 2026-04-17
## Layout
- `slides.html` — self-contained reveal.js deck (24 slides). **Gitignored** — local source only.
- `images/` — 11 PNG figures extracted from `Memo 2-10.docx`. **Gitignored**.
- `templates/password_template.html` — themed staticrypt gate (art-aurora background, Space Grotesk + IBM Plex Mono, gradient unlock button).
- `build.sh` — inlines every PNG into `slides.html` as base64, then AES-encrypts the bundle with staticrypt into `docs/index.html`.
- `docs/index.html` — the only deployed artifact; served by GitHub Pages from `/docs` on `main`. Committed (encrypted).
- `.staticrypt.json` — salt file. **Gitignored**; regenerate if lost.
- `README.md` — human-facing overview and view instructions.
## Tech stack
- Reveal.js 4.5.0 from unpkg
- Space Grotesk + IBM Plex Mono from Google Fonts
- [staticrypt](https://github.com/robinmoisson/staticrypt) for the AES password gate
- GitHub Pages, `/docs` folder on `main`
## Style contract
- Palette: `--accent: #0c7592` (teal), `--crimson: #b91c3c`, `--green: #059669`
- Slide variants: default pale, `cinema`, `art-aurora` (open/close), `art-warm` (conclusion), `section-bg`
- Figures live in `.fig-card` white panels with hover zoom; captions fade out on hover to avoid overlap
- 1920×1080 canvas, fade transitions
- Password gate reuses the `art-aurora` gradient verbatim so the unlock screen matches the title slide
## Editing conventions
- Hypotheses are **named** (Ethnonationalism · Rivalry · Economic threat · Attribute moderation) — never numbered
- Results phrased as "supports" / "does not support" — never "proves"
- Claims trace back to `/Users/f00421k/Downloads/Memo Feb 10.md` (the text mirror of the docx)
- Do not modify figures; they reproduce the memo's plots as-is
## Build & deploy
```sh
PASSWORD='your-password' ./build.sh
git add docs/index.html && git commit -m "Update deck" && git push
```
After any change to `slides.html`, `images/`, or `templates/password_template.html`, rerun `build.sh` and push. `build.sh` passes `--template-title`, `--template-instructions`, `--template-button`, and `--template-color-primary` to keep the gate branded.
