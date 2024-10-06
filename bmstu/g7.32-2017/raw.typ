#let theme = ""
// #let theme = "themes/Catppuccin Latte.tmTheme"
// #set raw(theme:theme)
#let lst = counter("listing")

// Функция разбивающая файл на подстроки по пробелам в начале строки
// [@example 
// ```cpp
// int qu(){
//     return 1;
// }
// 
// int main(){
//     return 0;
// }
// ``` => ```typst ('int qu(){\n    return 1;\n', '}', 'int main(){    return 0;\n', '}')```
// ]
#let parse(lst) = {
    let carr = ()
    let i = 0
    let fnc = ""
    let nocol = 1
    lst = lst.split("")
    let func = 0
    while (i < lst.len()) {
        let dict = (
            text: "",
            tab : 0,
            func: func,
            nocol: nocol,
            len: 0,
        )
        let predi = i
        let tab = true
        while (i < lst.len() and lst.at(i)!="\n"){
            if (tab and lst.at(i)==" "){
                dict.tab+=1
            }
            if (tab and lst.at(i) != " "){
                if (dict.tab == 0){
                    func = nocol
                }
                tab = false
            }
            dict.text += lst.at(i)
            i += 1
        }
        dict.len = i - predi
        dict.func = func
        carr.push(dict)
        nocol += 1
        i += 1
    }
    return carr
}

// deprecated
#let parsecpp(lst) = {parse(lst)}
#let parseasm(lst) = {parse(lst)}
// end-deprecated

#let разбор(лист) = {parse(лист)}

// Функция, выводящая переданное значение от f-той строки до t-той
#let writeft(lst, f, t) = {
    let fi = 0
    let i = 0
    let fo = 0
    let out = ""
    let nlst = ()
    lst = lst.split("\n")
    while (i < lst.len()) {
        i += 1
        if (i >= f and i <= t) {
            nlst.push(lst.at(i))
        }
    }
    return nlst.join("\n")
}

#let вывединк(лист, нач, кон) = {writeft(лист, нач, кон)}

// Функция, выводящая код по ГОСТу
#let code(data, lang, lable, num: false, num_splitter: "|", size: 14pt) = {
    [
        #set text(size)
        #if (num){
            show raw.line: it => {
                if (it.number < 10){h(0.6em)}
                text(fill: gray)[#it.number]
                h(0.2em)
                text(fill: gray)[num_splitter]
                h(0.5em)
                it.body
            }
            align(center)[
                #if(theme!=""){raw(data, lang:lang, theme:theme)}
                #if(theme==""){raw(data, lang:lang)}
                #lst.step()
            ]
        } else {
            align(center)[
                #if(theme!=""){raw(data, lang:lang, theme:theme)}
                #if(theme==""){raw(data, lang:lang)}
                #lst.step()
            ]
        }
    ]
    align(center)[ 
        Листинг #lst.display() #sym.bar.h _ #lable _
    ]
}
#let код(данные, язык, описание, нумерация: false, разделитель: "|", размер: 14pt) = {code(данные, язык, описание, num: нумерация, num_splitter: разделитель, size: размер)}

