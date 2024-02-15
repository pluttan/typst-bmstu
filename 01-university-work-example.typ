#import "00-university-template.typ": *

#show: student_work.with(
  title: "Пример",
  header: "unitech-2023-header.png",
  department_name: "Кафедра информационной безопасности",
  institute_name: "Институт инфокоммуникационных систем и технологий",
  work_type: "контрольная работа",
  discipline_name: "Теория графов",
  theme: "Вариант 1. Алгоритм обхода графов в глубину",
  author: (name: "Климентий Титов", sex: "male", degree: "студент", group: "ИБО-ТС-22", nwa: "Титов К.А."),
  adviser: (name: "Сухотерин Александр", sex: "male", degree: "доцент кафедры информационной безопасности", nwa: "Сухотерин А.В."),
  city: "Королёв",
  year: "2023",
  table_of_contents: true,
  links: (
    (type: "doc", title: "Доктрина информационной безопасности Российской Федерации (от 5 декабря 2016 г.)"),
    (type: "book", author: "Титов Климентий", title: "Севейна", publisher: "Литрес.Самиздат", year: "2019"),
    (type: "web", title: "Writing In Typst Tutorial", link: "https://typst.app/docs/tutorial/writing-in-typst", access_date: "22.09.2023"),
  ),
)

= Начнём!

В Typst есть поддержка крутых фишек. Например, в нём легко создавать списки:

+ The climate
  - Temperature
  - Precipitation
+ The topography
+ The geology

А также добавлять изображения... но, разумеется, комментарии не будут выполнены.

// и, соответственно, комментарии
// #image("filename.jpg", width: 70%)

Если начистоту, то #link("https://typst.app/docs/tutorial/writing-in-typst/")[здесь (тыкните мышкой!)] всё есть.

= Продолжаем?

Всегда может быть.
