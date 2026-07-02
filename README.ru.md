![Header](header.png)

<div align="center">

# Typst Libs

**Typst-шаблоны для отчётов МГТУ и ГОСТ 7.32-2017**

[![License](https://img.shields.io/badge/license-MIT-2C2C2C?style=for-the-badge&labelColor=1E1E1E)](LICENSE)
[![Typst](https://img.shields.io/badge/typst-templates-2C2C2C?style=for-the-badge&logo=typst&labelColor=1E1E1E)]()

</div>

Набор пакетов Typst-шаблонов для учебных работ МГТУ: `typst-bmstu` для лабораторных работ и курсовых с автогенерацией титульного листа, и `typst-g7.32-2017` для документов, соответствующих ГОСТ 7.32-2017 (российский стандарт на отчёты о научно-исследовательских работах). Включает примеры и файл конфигурации с общими значениями для всего университета.

## ■ Возможности

- ❖ **typst-bmstu** — шаблоны лабораторных работ и курсовых с генерацией титульного листа МГТУ
- ❖ **typst-g7.32-2017** — шаблон документа, соответствующий ГОСТ 7.32-2017
- ❖ **Файл конфигурации** — общие настройки факультета, кафедры и полей автора
- ❖ **Двуязычный API** — имена функций доступны как на русском, так и на английском
- ❖ **Примеры** — готовые к компиляции примеры документов для каждого шаблона

## ■ Стек

<div align="center">

| Компонент | Технология |
|-----------|------------|
| Вёрстка | Typst |
| Стандарты | GOST 7.32-2017 |
| Установка | Make, symlinks to `~/.config/typst` |

</div>

## ■ Как работает

## ■ Скриншоты

<div align="center">

![Screenshot](screenshots/main.png)

*Результат работы основного шаблона — сгенерированный титульный лист*

</div>

## ■ Запуск

```bash
git clone https://github.com/pluttan/typst-bmstu
cd typst-bmstu && make
```

```typ
#import "../bmstu.typ": *
#title_report(
    study_field: "09.03.01",
    discipline_name: "Operating Systems",
    work_type: "lab",
    work_num: "1",
    theme: "Memory Hierarchy",
    author: (nwa: "Ivanov I.I.", group: "IU6-72B"),
    adviser: (nwa: "Petrov P.P."),
)
```

## ■ License

MIT © [pluttan](https://github.com/pluttan)
