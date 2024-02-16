// Составляет титульный лист.
#let mk_title_page(
  caf_name: "",
  faculty_name: "",
  work_type: "",
  work_num: "",
  discipline_name: "",
  theme: none,
  author: (),
  adviser: (),
  city: "",
  date: datetime.today().display("[day].[month].[year repr:last_two]"),
  year: datetime.today().display("[year]"), 
) = {
  // Указываем институт и кафедру.
  set align(center)
  set text(weight: "bold", size: 12pt)
  grid(
    columns: (18%, 85%),
    align(left)[
      #v(-10pt)
      #figure(
        placement: bottom,
        image("BmstuLogo.png", width: 110%),
      )
    ], 
    align(center)[
      "Министерство науки и высшего образования Российской Федерации\
      Федеральное государственное бюджетное образовательное учреждение\
      высшего образования\
      "Московский государственный технический университет\
      имени Н.Э. Баумана\
      (национальный исследовательский университет)"\
      (МГТУ им. Н.Э. Баумана)
  ]

  )
  
  line(length: 100%, stroke:2pt)
  v(-12pt)
  line(length: 100%, stroke:0.2pt)

  linebreak()

  set text(weight: "regular", size: 14pt)
  if(faculty_name != ""){
    grid(
      columns: (20%, 80%),
      align(left)[
        ФАКУЛЬТЕТ
      ], 
      align(center)[
        #v(-2pt)
        #upper(faculty_name)
        #v(-12pt)
        #line(length: 100%, stroke: 0.5pt)
      ]
    )
  }

  if(caf_name != ""){
    grid(
      columns: (20%, 80%),
      align(left)[
        КАФЕДРА
      ], 
      align(center)[
        #v(-2pt)
        #upper(caf_name)
        #v(-12pt)
        #line(length: 100%, stroke: 0.5pt)
      ]
    )
  }

  // По центру указываем тип работы, дисциплину и тему.
  set align(center + horizon)
  
  text(tracking: 5pt, weight: "bold", size: 16pt)[ОТЧЕТ]
  set text(tracking: 0pt, size:14pt, weight: "bold")

  if (work_type != "") and (work_num != "") {
    align(center)[
      #grid(
        columns: 2,
        align(right)[по #work_type № ], 
        align(center)[
          #v(2pt)
          #work_num
          #v(-14pt)
          #line(length: 40pt, stroke: 1pt)
          #h(0pt)
        ]
      ) 
    ]
  } else {
  }


  if discipline_name != "" {
    align(left)[
      #grid(
        columns: 2,
        align(right)[Дисциплина: #h(5pt)], 
        align(left)[
          #v(2pt)
          #h(5pt)
          #discipline_name
          #v(-14pt)
          #line(length: 380pt, stroke: 1pt)
        ]
      ) 
    ]
  }

  if theme != "" {
    align(left)[
      #grid(
        columns: 2,
        align(right)[Название: #h(5pt)], 
        align(left)[
          #set text(weight:"regular")
          #v(2pt)
          #h(5pt)
          #theme
          #v(-14pt)
          #line(length: 400pt, stroke: 1pt)
        ]
      ) 
    ]
  }

  set text(weight:"regular")
  set align(bottom)
  
  grid(
    columns: (40pt, 1fr, 2.5fr),
    gutter: 70pt,
    align(left)[Студент #v(12pt)], 
    align(center)[
      #v(2pt)
      #author.group
      #v(-14pt)
      #line(length: 90pt, stroke: 1pt)
      #v(-14pt)
      #text(size:10pt)[(Группа)]
    ],
    grid(
      columns:(3fr, 4fr),
      gutter:10pt,
      align(center)[
        #v(2pt)
        #align(right)[#date]
        #v(-14pt)
        #line(length: 90pt, stroke: 1pt)
        #v(-14pt)
        #text(size:10pt)[(Подпись, дата)]
      ],
      align(center)[
        #v(2pt)
        #author.nwa
        #v(-14pt)
        #line(length: 110pt, stroke: 1pt)
        #v(-14pt)
        #text(size:10pt)[(И. О. Фамилия)]
      ],
    )
  ) 
  
  v(12pt)

  grid(
    columns: (40pt, 1fr, 2.5fr),
    gutter: 70pt,
    align(left)[Преподаватель #v(12pt)], 
    align(center)[
        
    ],
    grid(
      columns:(3fr, 4fr),
      gutter:10pt,
      align(center)[
        #v(2pt)
        #align(right)[#date]
        #v(-14pt)
        #line(length: 90pt, stroke: 1pt)
        #v(-14pt)
        #text(size:10pt)[(Подпись, дата)]
      ],
      align(center)[
        #v(2pt)
        #adviser.nwa
        #v(-14pt)
        #line(length: 110pt, stroke: 1pt)
        #v(-14pt)
        #text(size:10pt)[(И. О. Фамилия)]
      ],
    )
  ) 

  v(40pt)
  
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
  caf_name: "",
  faculty_name: "",
  work_type: "",
  work_num:"",
  discipline_name: "",
  theme: "",
  author: (),
  adviser: (),
  city: "",
  date: datetime.today().display("[day].[month].[year repr:last_two]"),
  year: datetime.today().display("[year]"), 
  table_of_contents: false,
  links: (),
  content,
) = {
  set document(author: author.nwa, title: title)
  set page(
    paper: "a4",
    margin: (left: 30mm, right: 15mm, top: 20mm, bottom: 20mm),
  )
  set text(font: "Times New Roman", size: 14pt, lang: "ru")
  mk_title_page(
    caf_name: caf_name,
    faculty_name: faculty_name,
    work_type: work_type,
    work_num: work_num,
    discipline_name: discipline_name,
    theme: theme,
    author: author,
    adviser: adviser,
    city: city,
    date:date,
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
    set par(justify: true, first-line-indent: indent)
    set list(indent: indent)
    show list: it => {
      it
      par(text(size: 0.35em, h(0.0em)))
    }
    set enum(indent: indent)
    show enum: it => {
      it
      par(text(size: 0.35em, h(0.0em)))
    }
    content
  }
  if links.len() != 0 {
    pagebreak()
    show heading: set align(center)
    set heading(numbering: none)
    [= Истоgчники]
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
        [Издательство "]
        source.publisher
        [", ]
        source.year
        [ г.]
      }
      src_cntr.step()
      linebreak()
    }
  }
}
