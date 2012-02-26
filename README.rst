==============================
 Dropbox + CLI alternative to Delicious for saving links.
==============================
:Version: 1.0


Usage examples
==============

add new link:
::
    $ dl http://stackoverflow.com/questions/2070010/how-to-output-my-ruby-commandline-text-in-different-colours
    desc? How to output my ruby commandline text in different colours
    tags (example: ruby, programming, book)? ruby, example, stackoverflow


search by tag:
::
    $ dl ruby
    [0] Tue Feb 21 16:56:06 2012 http://www.informit.com/articles/article.aspx?p=26943 Manipulating Structured Data in Ruby ["ruby", "arrays", "examples"]
    [1] Tue Feb 21 16:58:00 2012 http://blog.c42.in/starter-reading-list Starter reading list ["read", "books", "ruby", "programming"]
    [2] Tue Feb 21 17:19:42 2012 http://stackoverflow.com/questions/2070010/how-to-output-my-ruby-commandline-text-in-different-colours How to output my ruby commandline text in different colours ["ruby", "example", "stackoverflow"]
    [8] Tue Feb 21 22:49:18 2012 http://programmingzen.com/2011/06/02/10-ruby-one-liners-to-impress-your-friends/ 10 Ruby One Liners to Impress Your Friends ["ruby", "tricks", "tips"]
    [11] Thu Feb 23 13:28:52 2012 http://majesticseacreature.com/rbp-book/pdfs/rbp_1-0.pdf Ruby Best Practices ["book", "mustread", "ruby"]

open in current browser:
::
    $ dl open [index]