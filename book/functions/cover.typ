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

#let cover(
    title,
    subtitle,
    title-position,
    author,
    author-position,
    image-path,
    new-page,
) = context {
    if image-path != none and type(image-path) != path {
        panic("Error: Invalid path \"" + image-path + "\".")
    }

    newpage(new-page, always-new-page: true)
    set page(header: none, footer: none, columns: 1, background: if image-path
        == none { none } else {
        image(
            image-path,
            width: 100%,
            height: 100%,
        )
    })
    block(width: 100%, height: 100%, breakable: false)[
        #set par(justify: false, leading: 0.5em, spacing: 0.50em)
        #place(
            title-position,
            v(cover-spacing(page))
                + text(title, size: 5em, hyphenate: false)
                + if subtitle != none {
                    set par(justify: false, leading: 0.5em)
                    text(
                        subtitle,
                        style: "italic",
                        hyphenate: false,
                        size: 2em,
                    )
                }
                + v(cover-spacing(page)),
        )
        #place(
            author-position,
            v(cover-spacing(page))
                + text(get-authors(author), size: 3em)
                + v(cover-spacing(page)),
        )]
}
