// The header formatting.

#import "spacing.typ": chapter-spacing
#import "spacing.typ": get-margins

#let is-heading-on-top() = {
    let current-page = here().page()
    let headings = query(
        selector(label("chapter")).or(label("subtitle")),
    ).filter(heading => heading.location().page() == current-page)
    headings.any(heading => (
        (page.height == auto or page.width == auto)
            or heading.location().position().y
                <= chapter-spacing(page) + get-margins(page).top
    ))
}

#let get-heading() = {
    let headings = query(
        selector(label("chapter")).or(label("part")).before(here()),
    )
    if headings.len() == 0 {
        return document.author.join(", ")
    }
    headings.last().body
}

#let header() = context {
    if is-heading-on-top() {
        return
    }

    if calc.even(here().page()) {
        align(center, smallcaps(lower(document.title)))
    } else {
        align(center, smallcaps(lower(get-heading())))
    }
}
