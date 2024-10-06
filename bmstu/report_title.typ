#import "g7.32-2017.typ": гост732-2017

#let breakfirst = true

// Составляет титульный лист.
#let title(
  caf_name: "",
  faculty_name: "",
  id_study_field: "",
  study_field: "",
  work_type: "",
  work_num: "",
  discipline_name: "",
  theme: none,
  themecol2:"",
  author: (),
  adviser: (),
  city: "",
  date: datetime.today().display("[day].[month].[year]"),
  year: datetime.today().display("[year]"), 
) = {
    set document(title: theme)
    set page(margin: (bottom: 10mm))
    if (date == true) {
        date = datetime.today().display("[day].[month].[year repr:last_two]")
    }

    study_field = id_study_field + " " + study_field

    if (date == false) {
        date = ""
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
            #upper[faculty_name]
            *#upper(faculty_name)*
        ]

        #align(left)[
            #upper[caf_name]
            *#upper(caf_name)*
        ]

        #align(left)[
            
            #grid(
                columns: (auto, auto, auto),
                gutter: 2pt,
                upper[направление подготовки],
                text(weight: "bold")[#upper(study_field)],
            )
        ]
    ]

    v(-40pt)
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
                align(right)[
                    #align(top)[Название: #h(5pt)]
                    #(if themecol2 != ""{v(22pt)}) 
                ], 
                align(left)[
                    #set text(weight:"regular")
                    #par(first-line-indent: 0em)[#theme]
                    #v(-14pt)
                    #line(length: 400pt, stroke: 1pt)
                    #(if themecol2 != ""{
                            v(-6pt)
                            h(5pt)
                            themecol2
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
                #if (date != false) {align(right)[#date]}
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
                #if (date != false) {align(right)[#date]}
                #v(-14pt)
                #line(length: 90pt, stroke: 1pt)
                #v(-14pt)
                #text(size:10pt)[(Подпись, дата)]
            ],
            align(center)[
                #v(2pt)
                #par(leading: 0.3em)[#adviser.nwa]
                #v(-14pt)
                #line(length: 110pt, stroke: 1pt)
                #v(-14pt)
                #text(size:10pt)[(И. О. Фамилия)]
            ],
        )
    ) 

    v(20pt)
    
    set align(center)
    [#city #year г.]
}

// deprecated
#let mk_title_page(
  caf_name: "",
  faculty_name: "",
  study_field: "",
  work_type: "",
  work_num: "",
  discipline_name: "",
  theme: none,
  themecol2:"",
  author: (),
  adviser: (),
  city: "",
  date: datetime.today().display("[day].[month].[year]"),
  year: datetime.today().display("[year]"), 
) = {title(
  caf_name: caf_name,
  faculty_name: faculty_name,
  study_field: study_field,
  work_type: work_type,
  work_num: work_num,
  discipline_name: discipline_name,
  theme: theme,
  themecol2:themecol2,
  author: author,
  adviser: adviser,
  city: city,
  date: date,
  year: year, 
)}
// end-deprecated


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
    title(
        caf_name: факультет,
        faculty_name: кафедра,
        id_study_field: код_направления,
        study_field: направление,
        work_type: тип_работы,
        work_num: номер_работы,
        discipline_name: дисциплина,
        theme: название_работы,
        themecol2:название_работы_кол2,
        author: (nwa:автор.фио, group:автор.группа),
        adviser: (nwa:руководитель.фио),
        city: город,
        date: дата,
        year: год, 
    ) 
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