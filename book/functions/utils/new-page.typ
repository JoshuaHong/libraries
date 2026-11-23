// The new page formatting.

#let newpage(to, always-new-page: false) = {
    if always-new-page {
        assert(
            to != true and to != false,
            message: "Error: Invalid parameter \"" + repr(to) + "\".",
        )
    }

    if to == false {
        return
    }

    set page(header: none, footer: none)
    if to == true {
        pagebreak(weak: true)
    } else if to == "odd" or to == "even" {
        pagebreak(to: to, weak: true)
    } else {
        panic("Error: Invalid parameter \"" + to + "\".")
    }
}
