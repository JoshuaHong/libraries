// The part page formatting.

#import "spacing.typ": part-spacing

#let part-page(title, subtitle, offset) = {
    show heading: it => {
        upper(it)
    }

    set page(header: none, footer: none, columns: 1)
    v(part-spacing(page))
    align(center, [
        #if subtitle != none {
            heading(text(subtitle, weight: "light"), offset: offset + 1)
        }
        #heading(title, offset: offset) #label("part")
    ])
}
