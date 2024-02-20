#let parserasm(lst) = {
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

#let funcno(carr, no) = {
  let out = ""
  for i in carr {
    if (i.func == no){
      out += i.text + "\n"
    }
  }
  return out
}

#let funcstr(carr, func) = {
  let out = ""
  for i in carr {
    if (i.text == func){
      return funcno(carr, i.func)
    }
  }
  return ""
}


