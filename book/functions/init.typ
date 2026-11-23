// The init rules.

#import "utils/footer.typ": footer
#import "utils/header.typ": header
#import "utils/new-page.typ": newpage

#let init(it, title, author, width, height, font, size, columns, margins) = {
    set document(title: title, author: author)
    set page(
        width: width,
        height: height,
        numbering: "1",
        header: header(),
        footer: footer(),
        columns: columns,
        margin: margins,
    )
    set text(font: font, size: size)
    set par(justify: true, first-line-indent: (amount: 1em, all: false))

    it
    newpage("odd")
}
