// Example book.

#import "book.typ" as book

#let title = "Example"
#let author = "Joshua Hong"
#show: it => book.init(it, title: title, author: author)

#book.cover(title, author: author)
#book.table-of-contents()

#set page(numbering: "i")
#book.chapter("Preface", lorem(777))
#book.chapter("Introduction", lorem(777))

#set page(numbering: "1")
#book.part(
    "Old Testament",
    subtitle: "The Pentateuch",
    book.chapter("Genesis", subtitle: "Book 1", lorem(777)),
    book.chapter("Exodus", subtitle: "Book 2", lorem(777), new-page: true),
    book.chapter("Leviticus", subtitle: "Book 3", lorem(777), new-page: true),
    book.chapter("Numbers", subtitle: "Book 4", lorem(777), new-page: true),
    book.chapter("Deuteronomy", subtitle: "Book 5", lorem(777), new-page: true),
)
#book.part(
    "New Testament",
    subtitle: "The Gospels",
    book.chapter("Matthew", subtitle: "Book 40", lorem(777)),
    book.chapter("Mark", subtitle: "Book 41", lorem(777), new-page: true),
    book.chapter("Luke", subtitle: "Book 42", lorem(777), new-page: true),
    book.chapter("John", subtitle: "Book 43", lorem(777), new-page: true),
)

#book.chapter("Conclusion", lorem(777))
#book.chapter("References", lorem(777))
