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

PDFs are compiled with Tectonic 0.17.0, which downloads the required LaTeX
packages automatically and handles repeat passes. Actions caches its verified
binary and downloaded packages between builds. Pandoc is installed through APT.
New pushes to a PR cancel its outdated runs; publishing runs on `main` are not
interrupted by newer pushes.

Stable download links:

- [General resume](https://github.com/rdmm404/resume/releases/latest/download/main.pdf)
- [Backend resume](https://github.com/rdmm404/resume/releases/latest/download/backend.pdf)

The first successful publishing run makes these links available. GitHub Pages
should remain configured to deploy from the `gh-pages` branch, as in the existing
setup. The workflow uses the built-in `GITHUB_TOKEN`; no additional secret is
needed.

## Local builds (optional)

Install Tectonic (0.17.0 to match CI), then run:

```bash
mkdir -p build/pdf
for source in resumes/*.tex; do
  tectonic --outdir build/pdf "$source"
done
```

To generate the website, install Pandoc and run `bash generate.sh`.
The first Tectonic build needs internet access to download LaTeX packages.
Build output and local PDFs are ignored by Git.
