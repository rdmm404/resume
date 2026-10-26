# Resume

LaTeX sources live in `resumes/`. Generated PDFs are published as GitHub Release
assets rather than tracked in Git.

## Publishing

Push changes to the resume sources, website template, build script, or workflow
on `main` to build both PDFs and the website. After a successful build, GitHub
Actions creates a release tagged `resume-<commit SHA>` with `main.pdf` and
`backend.pdf`, marks it as latest, and deploys the HTML to GitHub Pages.
Rerunning the same commit updates its existing release assets.

Pull requests compile PDFs and HTML without publishing. Both outputs are
available as workflow artifacts. The workflow can also be run manually from the
Actions tab; only runs on `main` publish.

Stable download links:

- [General resume](https://github.com/rdmm404/resume/releases/latest/download/main.pdf)
- [Backend resume](https://github.com/rdmm404/resume/releases/latest/download/backend.pdf)

The first successful publishing run makes these links available. GitHub Pages
should remain configured to deploy from the `gh-pages` branch, as in the existing
setup. The workflow uses the built-in `GITHUB_TOKEN`; no additional secret is
needed.

## Local builds (optional)

Install TeX Live with the base, recommended, and extra LaTeX packages, then run:

```bash
mkdir -p build/pdf
for source in resumes/*.tex; do
  pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build/pdf "$source"
  pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build/pdf "$source"
done
```

To generate the website, install Pandoc and run `bash generate.sh`.
Build output and local PDFs are ignored by Git.
