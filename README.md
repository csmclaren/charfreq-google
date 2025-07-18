# Charfreq Google

The purpose of this project is to process [n-gram](https://en.wikipedia.org/wiki/N-gram) frequency (for orders 1, 2 and 3) from [Peter Norvig's analysis](https://norvig.com/mayzner.html) of [Google Books N-Grams](https://storage.googleapis.com/books/ngrams/books/datasetsv3.html)

This project downloads the data and processes it to produce the following nine tab-separated, LF-terminated, and UTF-8 encoded files, where {n} is 1, 2, and 3:

- `{n}-grams-all-uc.tsv`

  A table of all unique {n}-grams (uppercase) and their total number of occurrences by word length and position within word (the *counts*) as described in https://norvig.com/mayzner.html. Column 1 is the {n}-gram and the remaining columns are the counts. Rows are sorted in descending order of overall count (i.e., highest count first).

- `{n}-grams-uc.tsv`

  A table of all unique {n}-grams (uppercase) and their total number of occurrences (the *count*). Column 1 is the {n}-gram and column 2 is the count. Rows are sorted in descending order of count (i.e., highest count first).

- `{n}-grams-uc-with-c-and-p.tsv`

  {n}-grams-uc.tsv, but with three columns appended to each row, representing cumulative count, percentage count, and cumulative percentage count.

## Author and copyright

This project was written and copyrighted in 2025 by Chris McLaren ([@csmclaren](https://www.github.com/csmclaren)).

## License

Unless otherwise noted, all files in this project are licensed under the [MIT License](https://choosealicense.com/licenses/mit/). See the [LICENSE](LICENSE.txt) file for details.
