#import "g7.32-2017.typ": гост732-2017

#let титул(
  факультет: "",
  кафедра: "",
  код_направления: "",
  направление: "",
  дисциплина: "",
  тип_работы: "",
  номер_работы: "",
  название_работы: "",
  название_работы_кол2:"",
  автор: (),
  руководитель: (),
  город: "",
  дата: false,
  год: datetime.today().display("[year]"),
) = {
  set document(title: название_работы)
  set page(margin: (bottom: 10mm))
  if (дата == true) {
    дата = datetime.today().display("[day].[month].[year repr:last_two]")
  }

  set align(center)
  set text(size: 10pt)
  grid(
    columns: (18%, 85%),
    align(left)[
      #v(-10pt)
      #figure(
        placement: bottom,
        image("bmstu_logo.jpg", width: 70%),
      )
    ],
    par(leading: 0.5em)[#align(center)[
      *Министерство науки и высшего образования Российской Федерации\
      Федеральное государственное бюджетное образовательное учреждение\
      высшего образования\
      «Московский государственный технический университет\
      имени Н.Э. Баумана\
      (национальный исследовательский университет)»\
      (МГТУ им. Н.Э. Баумана)*
    ]]
  )

  line(length: 100%, stroke:3pt)
  v(-10pt)
  line(length: 100%, stroke:0.5pt)

  v(10pt)

  set text(weight: "regular", size: 11pt)

  par(first-line-indent: 0em)[
    #align(left)[
      #upper[факультет]
      *#upper(факультет)*
    ]

    #align(left)[
      #upper[кафедра]
      *#upper(кафедра)*
    ]

    #align(left)[
      
      #grid(
        columns: (auto, auto, auto),
        gutter: 2pt,
        upper[направление подготовки],
        text(weight: "bold")[#upper(код_направления)],
        text(weight: "bold")[#upper(направление)],
      )
    ]
  ]

  v(-40pt)
  set align(center + horizon)
  
  text(tracking: 5pt, weight: "bold", size: 16pt)[ОТЧЕТ]
  set text(tracking: 0pt, size:14pt, weight: "bold")

  if (тип_работы != "") and (номер_работы != "") {
    align(center)[
      #grid(
        columns: 2,
        align(right)[по #тип_работы № ], 
        align(center)[
          #v(2pt)
          #номер_работы
          #v(-14pt)
          #line(length: 40pt, stroke: 1pt)
          #h(0pt)
        ]
      ) 
    ]
  } else {
  }

  if дисциплина != "" {
    align(left)[
      #grid(
        columns: 2,
        align(right)[Дисциплина: #h(5pt)], 
        align(left)[
          #v(2pt)
          #h(5pt)
          #дисциплина
          #v(-14pt)
          #line(length: 380pt, stroke: 1pt)
        ]
      ) 
    ]
  }

  if название_работы != "" {
    align(left)[
      #grid(
        columns: 2,
        align(right)[
          #align(top)[Название: #h(5pt)]
          #(if название_работы_кол2 != ""{v(22pt)}) 
        ], 
        align(left)[
          #set text(weight:"regular")
          #par(first-line-indent: 0em)[#название_работы]
          #v(-14pt)
          #line(length: 400pt, stroke: 1pt)
          #(if название_работы_кол2 != ""{
              v(-6pt)
              h(5pt)
              название_работы_кол2
              v(-14pt)
              line(length: 400pt, stroke: 1pt)
          })
        ]
      )
    ]
  }

  set text(weight:"regular")
  set align(bottom)
  
  grid(
    columns: (60pt, 100pt, 2.5fr),
    gutter: 50pt,
    align(left)[Студент #v(12pt)], 
    align(center)[
      #v(2pt)
      #автор.группа
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
        #if (дата != false) {align(right)[#дата]}
        #v(-14pt)
        #line(length: 90pt, stroke: 1pt)
        #v(-14pt)
        #text(size:10pt)[(Подпись, дата)]
      ],
      align(center)[
        #v(2pt)
        #автор.фио
        #v(-14pt)
        #line(length: 110pt, stroke: 1pt)
        #v(-14pt)
        #text(size:10pt)[(И. О. Фамилия)]
      ],
    )
  ) 

  grid(
    columns: (100pt, 1fr, 2.5fr),
    gutter: 40pt,
    align(left)[Преподаватель #v(12pt)], 
    align(center)[
        
    ],
    grid(
      columns:(3fr, 4fr),
      gutter:10pt,
      align(center)[
        #v(2pt)
        #if (дата != false) {align(right)[#дата]}
        #v(-14pt)
        #line(length: 90pt, stroke: 1pt)
        #v(-14pt)
        #text(size:10pt)[(Подпись, дата)]
      ],
      align(center)[
        #v(2pt)
        #par(leading: 0.3em)[#руководитель.фио]
        #v(-14pt)
        #line(length: 110pt, stroke: 1pt)
        #v(-14pt)
        #text(size:10pt)[(И. О. Фамилия)]
      ],
    )
  ) 

  v(20pt)
  
  set align(center)
  [#город #год г.]
}

#let титул_иу6(
  код_направления: "",
  направление: "",
  дисциплина: "",
  тип_работы: "",
  номер_работы: "",
  название_работы: "",
  название_работы_кол2:"",
  автор: (),
  руководитель: (),
  город: "",
  дата: false,
  год: datetime.today().display("[year]"),
) = титул(
  факультет: "Информатика и системы управления",
  кафедра: "Компьютерные системы и сети",
  код_направления: код_направления,
  направление: направление,
  дисциплина: дисциплина,
  тип_работы: тип_работы,
  номер_работы: номер_работы,
  название_работы: название_работы,
  название_работы_кол2: название_работы_кол2,
  автор: автор,
  руководитель: руководитель,
  город: город,
  дата: дата,
  год: год,
)

#let титул_иу6_ивт(
  дисциплина: "",
  тип_работы: "",
  номер_работы: "",
  название_работы: "",
  название_работы_кол2:"",
  автор: (),
  руководитель: (),
  город: "",
  дата: false,
  год: datetime.today().display("[year]"), 
) = титул_иу6(
  код_направления: "09.03.01/03",
  направление: "Вычислительные машины, комплексы, системы и сети",
  дисциплина: дисциплина,
  тип_работы: тип_работы,
  номер_работы: номер_работы,
  название_работы: название_работы,
  название_работы_кол2: название_работы_кол2,
  автор: автор,
  руководитель: руководитель,
  город: город,
  дата: дата,
  год: год,
)