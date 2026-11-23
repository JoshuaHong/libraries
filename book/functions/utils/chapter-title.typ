// The chapter title formatting.

#import "spacing.typ": chapter-spacing
#import "spacing.typ": get-margins

#let chapter-title(title, subtitle, offset) = {
    show heading: it => {
        smallcaps(lower(it))
    }

    v(chapter-spacing(page))
    align(center, [
        #if subtitle != none {
            [#heading(text(subtitle, weight: "light"), offset: offset + 1)
                #label("subtitle")]
        }
        #heading(title, offset: offset) #label("chapter")
    ])
    v(chapter-spacing(page))
    linebreak()
}
