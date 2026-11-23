// The cover formatting.

#import "utils/new-page.typ": newpage
#import "utils/spacing.typ": cover-spacing

#let get-authors(author) = {
    if type(author) == str {
        author
    } else if type(author) == array {
        author.join(linebreak())
    } else {
        panic("Error: Invalid author \"" + author + "\".")
    }
}

#let cover(title, subtitle, author, image-path, blank-page) = context {
    if image-path != none and type(image-path) != path {
        panic("Error: Invalid path \"" + image-path + "\".")
    }

    newpage(blank-page, always-new-page: true)
    set page(header: none, footer: none, columns: 1, background: if image-path
        == none { none } else {
        image(
            image-path,
            width: 100%,
            height: 100%,
        )
    })
    set par(justify: false)
    v(cover-spacing(page))
    align(center, [
        #text(title, size: 5em, hyphenate: false)
        #if subtitle != none {
            linebreak()
            linebreak()
            text(subtitle, style: "italic", hyphenate: false, size: 2em)
        }
    ])
    align(center + bottom, text(get-authors(author), size: 3em))
    v(cover-spacing(page))
}
