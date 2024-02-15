// Составляет титульный лист.
#let mk_title_page(
  header: "",
  department_name: "",
  institute_name: "",
  work_type: "",
  discipline_name: "",
  theme: none,
  author: (),
  adviser: (),
  city: "",
  year: "",
) = {
  // Указываем институт и кафедру.
  set align(center)
  set text(weight: "bold")
  image(header, width: 100%)
  linebreak()
  upper(institute_name)
  linebreak()
  linebreak()
  upper(department_name)
  // По центру указываем тип работы, дисциплину и тему.
  set align(center + horizon)
  upper(work_type)
  linebreak()
  [
    по дисциплине "#discipline_name"
  ]
  if theme != none {
    linebreak()
    linebreak()
    set text(weight: "regular")
    theme
  }
  set align(bottom)
  set align(right)
  set text(weight: "bold")
  if author.sex == "male" [
    Выполнил:
  ] else [
    Выполнила:
  ]
  linebreak()
  set text(weight: "regular")
  [#author.degree группы #author.group]
  linebreak()
  author.nwa
  linebreak()
  linebreak()
  set text(weight: "bold")
  if adviser.sex == "male" [
    Проверил:
  ] else [
    Проверила:
  ]
  linebreak()
  set text(weight: "regular")
  adviser.degree
  linebreak()
  adviser.nwa
  linebreak()
  linebreak()
  linebreak()
  set align(center)
  [#city #year г.]
}

// Составляет содержание работы.
#let mk_table_of_contents() = {
  {
    set align(center)
    set text(16pt, weight: "bold")
    [Содержание]
  }
  set align(left)
  outline(
    title: [],
    indent: auto,
  )
}

// Составляет полноценную работу.
#let student_work(
  title: "",
  header: "",
  department_name: "",
  institute_name: "",
  work_type: "",
  discipline_name: "",
  theme: "",
  author: (),
  adviser: (),
  city: "",
  year: "",
  table_of_contents: false,
  links: (),
  content,
) = {
  set document(author: author.name, title: title)
  set page(
    paper: "a4",
    margin: (left: 30mm, right: 15mm, top: 15mm, bottom: 15mm),
  )
  set text(font: "Times New Roman", size: 14pt, lang: "ru")
  mk_title_page(
    header: header,
    department_name: department_name,
    institute_name: institute_name,
    work_type: work_type,
    discipline_name: discipline_name,
    theme: theme,
    author: author,
    adviser: adviser,
    city: city,
    year: year,
  )
  set page(numbering: "1")
  if table_of_contents == true {
    mk_table_of_contents()
  }
  // Покажем основное содержимое работы.
  {
    let indent = 1.25cm
    show heading: it => {
      pagebreak()
      set align(center)
      set text(16pt, hyphenate: false)
      it
      par(text(size: 0.35em, h(0.0em)))
    }
    set list(indent: indent)
    show list: it => {
      it
      par(text(size: 0.35em, h(0.0em)))
    }
    set enum(indent: indent)
    show enum: it => {
      it
      par(text(size: 0.0em, h(0.0em)))
    }
    set par(justify: true, first-line-indent: indent)
    content
  }
  if links.len() != 0 {
    pagebreak()
    show heading: set align(center)
    set heading(numbering: none)
    [= Источники]
    linebreak()
    let src_cntr = counter("source_counter")
    src_cntr.step()
    for source in links {
      src_cntr.display()
      [. ]
      if source.type == "book" {
        [#source.author - ]
      }
      source.title
      [. ]
      if source.type == "web" {
        [Электронный ресурс. Режим доступа: ]
        link(source.link)[#source.link]
        [ (дата обращения: ]
        source.access_date
        [).]
      } else if source.type == "book" {
        [Издательство ]
        source.publisher
        [, ]
        source.year
        [ г.]
      }
      src_cntr.step()
      linebreak()
    }
  }
}
