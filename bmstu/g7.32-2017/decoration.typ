#let гост732-2017(content) = {
    set page(
        footer: context [
            #text(size: 14pt)[
            #let (num,) = counter(page).get()
            #if (num != 1) {
                align(center)[#num]
            }]
        ],
        paper: "a4",
        margin: (left: 30mm, right: 15mm, top: 20mm, bottom: 20mm),
    )
    set text(font: "Times New Roman", size: 14pt, lang: "ru")
    set heading(numbering: "1.1")
    set align(top)

    show heading.where(level:1): it => {
        pagebreak()
        set text(14pt, hyphenate: false)
        upper[#align(center)[#it]]
        par(text(size: 0.35em, h(0.0em)))
    }

    show heading.where(level:2): it => {
        set text(16pt, hyphenate: false)
        it
        par(text(size: 0.35em, h(0.0em)))
    }

    show heading.where(level:3): it => {
        set text(14pt, hyphenate: false)
        it
        par(text(size: 0.35em, h(0.0em)))
    }

    set par(justify: true, first-line-indent: 1.25cm)
    set list(indent: 1.25cm)
    show list: it => {
        it
        par(text(size: 0.35em, h(0.0em)))
    }
    set enum(indent: 1.25cm)
    show enum: it => {
        it
        par(text(size: 0.35em, h(0.0em)))
    }

    show raw: it => {
        box(
            fill: luma(240),
            inset: (x:6pt, y:0pt),
            outset: (y:3pt),
            radius: 4pt,
            align(left)[it]
        )
    }

    content
}
