// The chapter rules.

#import "utils/chapter-title.typ": chapter-title
#import "utils/header.typ": header
#import "utils/new-page.typ": newpage

#let offset = state("offset", 0)

#let chapter(title, subtitle, content, new-page) = context {
    newpage(new-page)
    chapter-title(title, subtitle, offset.get())

    offset.update(x => x + 1)
    content
    offset.update(x => x - 1)
}
