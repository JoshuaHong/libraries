// Create a book.
//
// Functions:
//     init(it, title, author, width, height, font) - Initialize the book.
//             Always ends on an even page and add a blank page at the end if
//             necessary. For more information see: https://typst.app/docs.
//         it (content) - The content to which to apply the rules.
//         title? (none, content) - The title of the book. Default: none.
//         author? (str, array) - The author(s) of the book. Default: ().
//         width? (auto, length) - The width of the book. Default: 148mm.
//         height? (auto, length) - The height of the book. Default: 210mm.
//         font? (str, arr, dictionary) - The font to apply to the text.
//                 Default: "Libertinus Serif"
//         size? (length) - The size of the font to apply to the text. Default:
//                 10pt.
//         columns? (int) - The number of columns of text per page. Default: 1.
//         margins? (auto, relative, dictionary) - The margins of the page.
//                 Default: auto (2.5/21 * min(width, height)).
//
//     cover(title, subtitle, title-position, author, author-position, image,
//             new-page) - Create the cover. Always starts on a new page.
//         title (content) - The title of the book.
//         subtitle? (none, content) - The subtitle of the book. Default: none.
//         title-position? (alignment) - The position of the title. Default:
//                 center + top.
//         author? (str, array) - The author(s) of the book. Default: ()
//         author-position? (alignment) - The position of the author. Default:
//                 center + bottom.
//         image? (none, path) - The image of the cover. Default: none.
//         new-page? (str) - Whether to add a blank page before the cover.
//                 Default: "odd"
//             odd - Start the cover on an odd page and add a blank page before
//                     the cover if necessary.
//             even - Start the cover on an even page and add a blank page
//                     before the cover if necessary.
//
//     table-of-contents(new-page) - Create the table of contents. Always starts
//             on a new page.
//         new-page? (str) - Whether to add a blank page before the table of
//                 contents. Default: "odd"
//             odd - Start the table of contents on an odd page and add a blank
//                     page before the table of contents if necessary.
//             even - Start the table of contents on an even page and add a
//                     blank page before the table of contents if necessary.
//
//     part(title, subtitle, ..content, new-page) - Create a new part. Prints
//             the title and subtitle followed by the contents. Always starts on
//             a new page.
//         title (content) - The title of the part.
//         subtitle? (none, content) - The subtitle of the part. Displayed
//                 before the title but not shown in the header nor the table of
//                 contents.
//         content (none, content) - The content belonging to the part.
//         new-page? (str) - Whether to add a blank page before the part.
//                 Default: "odd"
//             odd - Start the part on an odd page and add a blank page before
//                     the part if necessary.
//             even - Start the part on an even page and add a blank page before
//                     the part if necessary.
//
//     chapter(title, subtitle, content, new-page) - Create a new chapter.
//             Prints the title and subtitle followed by the content.
//         title (content) - The title of the chapter.
//         subtitle? (none, content) - The subtitle of the chapter. Displayed
//                 before the title but not shown in the header nor the table of
//                 contents.
//         content (none, content) - The content of the chapter.
//         new-page? (bool, str) - Whether to start the chapter on a new page.
//                 Default: "odd"
//             bool - Whether to start the chapter on a new page.
//             odd - Start the chapter on an odd page and add a blank page
//                     before the chapter if necessary.
//             even - Start the chapter on an even page and add a blank page
//                     before the chapter if necessary.

#import "functions/chapter.typ" as chapter-impl
#import "functions/cover.typ" as cover-impl
#import "functions/init.typ" as init-impl
#import "functions/part.typ" as part-impl
#import "functions/table-of-contents.typ" as table-of-contents-impl

// Initialize the book formatting.
#let init(
    it,
    title: none,
    author: (),
    width: 148mm,
    height: 210mm,
    font: "Libertinus Serif",
    size: 10pt,
    columns: 1,
    margins: auto,
) = init-impl.init(
    it,
    title,
    author,
    width,
    height,
    font,
    size,
    columns,
    margins,
)

// Create the cover.
#let cover(
    title,
    subtitle: none,
    title-position: center + top,
    author: (),
    author-position: center + bottom,
    image: none,
    new-page: "odd",
) = cover-impl.cover(
    title,
    subtitle,
    title-position,
    author,
    author-position,
    image,
    new-page,
)

// Create the table of contents.
#let table-of-contents(
    new-page: "odd",
) = table-of-contents-impl.table-of-contents(new-page)

// Create a new part.
#let part(
    title,
    subtitle: none,
    ..content,
    new-page: "odd",
) = part-impl.part(title, subtitle, ..content, new-page)

// Create a new chapter.
#let chapter(
    title,
    subtitle: none,
    content,
    new-page: "odd",
) = chapter-impl.chapter(title, subtitle, content, new-page)
