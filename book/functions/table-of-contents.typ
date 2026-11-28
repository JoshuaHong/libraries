// The table of contents rules.

#import "utils/new-page.typ": newpage
#import "utils/spacing.typ": chapter-spacing

#let table-of-contents(new-page) = context {
    show outline: it => {
        show heading: it => {
            align(center, smallcaps(lower(it.body)))
        }
        it
    }

    show outline.entry: it => {
        let label = it.element.at("label", default: none)

        if it.level == 1 and (label == <part> or label == <chapter>) {
            linebreak()
        }

        if label == <part> {
            link(
                it.element.location(),
                it.indented(none, it.body()),
            )
        } else if label == <chapter> {
            link(
                it.element.location(),
                it.indented(none, it.inner()),
            )
        }
    }

    newpage(new-page, always-new-page: true)
    set page(header: none, footer: none, columns: 1)
    v(chapter-spacing(page))
    outline()
}
