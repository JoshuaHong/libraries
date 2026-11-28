// The part rules.

#import "utils/new-page.typ": newpage
#import "utils/part-page.typ": part-page

#let offset = state("offset", 0)

#let part(title, subtitle, ..content, new-page) = context {
    newpage(new-page, always-new-page: true)
    part-page(title, subtitle, offset.get())

    offset.update(x => x + 1)
    content.pos().join()
    offset.update(x => x - 1)
}
