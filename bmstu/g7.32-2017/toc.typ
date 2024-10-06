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
#let собрать_содержание() = {mk_table_of_contents()}