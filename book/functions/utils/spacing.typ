// The spacing rules.

#let get-margins(page) = {
    if page.height == auto or page.width == auto {
        panic("Error: Cannot get margins if page height or width is auto.")
    }

    let default = 2.5 / 21 * calc.min(page.width, page.height)
    if page.margin == auto {
        ("top": default, "right": default, "bottom": default, "left": default)
    } else if type(page.margin) == relative {
        (
            "top": page.margin,
            "right": page.margin,
            "bottom": page.margin,
            "left": page.margin,
        )
    } else {
        (
            "top": if "top" in page.margin { page.margin.top } else { default },
            "right": if "right" in page.margin { page.margin.right } else {
                default
            },
            "bottom": if "bottom" in page.margin { page.margin.bottom } else {
                default
            },
            "left": if "left" in page.margin { page.margin.left } else {
                default
            },
        )
    }
}

#let spacing(page, percent) = {
    if page.height == auto {
        10mm
    } else {
        page.height * percent
    }
}

#let cover-spacing(page) = {
    spacing(page, 5%)
}

#let chapter-spacing(page) = {
    spacing(page, 10%)
}

#let part-spacing(page) = {
    spacing(page, 20%)
}
