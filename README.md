<div align="center">

# Typst Libs

**Typst templates for BMSTU reports and GOST 7.32-2017**


</div>

A collection of Typst template packages for BMSTU student work: `typst-bmstu` for lab reports and coursework with auto-generated title pages, and `typst-g7.32-2017` for documents conforming to GOST 7.32-2017 (Russian standard for research reports). Includes examples and a config file for university-wide defaults.

## ■ Features

- ❖ **typst-bmstu** — lab report and coursework templates with BMSTU title page generation
- ❖ **typst-g7.32-2017** — GOST 7.32-2017 compliant document template
- ❖ **Config file** — shared configuration for faculty, department, and author fields
- ❖ **Bilingual API** — function names available in both Russian and English
- ❖ **Examples** — ready-to-compile example documents for each template

## ■ Stack

<div align="center">

| Component | Technology |
|-----------|------------|
| Typesetting | Typst |
| Standards | GOST 7.32-2017 |
| Install | Make, symlinks to `~/.config/typst` |

</div>

## ■ How It Works

```
1. Clone the repo and run `make` — installs templates via symlinks into `~/.config/typst`.
2. Fill in the shared config file with faculty, department, and author defaults.
3. Import the chosen template (`typst-bmstu` or `typst-g7.32-2017`) into your document.
4. Call the template function with document metadata — title page is generated automatically.
```

## ■ Screenshots

<div align="center">

![Screenshot](screenshots/main.png)

*Main template output showing a generated title page*

</div>

## ■ Usage

```bash
git clone https://github.com/pluttan/typst-bmstu
cd typst-bmstu && make
```

```typ
#import "../bmstu.typ": *
#title_report(
    study_field: "09.03.01",
    discipline_name: "Operating Systems",
    work_type: "lab",
    work_num: "1",
    theme: "Memory Hierarchy",
    author: (nwa: "Ivanov I.I.", group: "IU6-72B"),
    adviser: (nwa: "Petrov P.P."),
)
```

## ■ License

MIT © [pluttan](https://github.com/pluttan)
