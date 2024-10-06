#let imag = counter("image")

// Выводит изображение
#let img(data, lable, f:(i)=>{i.display()}) = {
    align(center)[
        #data
        #imag.step()
    ]
    align(center)[
        Рисунок #f(imag) #sym.bar.h _ #lable _
    ]
}

#let рис(данные, описание, ф:(i)=>{i.display()}) = {img(данные, описание, f:ф)}

// Инкрементирует номер рисунка
#let imgc() = {
    align(center)[
        #imag.step()
        #imag.display()
    ]
}

#let рисп() = {imgc()}