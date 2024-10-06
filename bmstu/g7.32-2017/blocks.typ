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

#let lst = counter("listing")
#let imag = counter("image")
#let tabl = counter("table")

#let code(data, lang, lable) = {
  align(center)[
    #raw(data, lang:lang)
    #lst.step()
  ]
  align(center)[ 
    Листинг #lst.display() #sym.bar.h _ #lable _
  ]
}

#let img(data, lable, f:(i)=>{i.display()}) = {
  align(center)[
    #data
    #imag.step()
  ]
  align(center)[
    Рисунок #f(imag) #sym.bar.h _ #lable _
  ]
}

#let imgc() = {
  align(center)[
    #imag.step()
    #imag.display()
  ]
}