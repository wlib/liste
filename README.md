# Liste - Helpful reminders in the comfort of your terminal

## What's this?

Liste is for those who have short-term memory and 
those who need constant reminders. It provides a simple interface 
for your own system of notes and reminders.

## Installation

It doesn't get that much easier than this:

+ `sudo gem install liste`
+ `printf "\nliste login" >> ~/.bashrc`

## Usage

Liste is not hard to use either, running `liste` by itself will 
display your todo list. `liste do "Anything I need to do"` adds 
to your todo list. Add to your terminal login messages list with 
`liste add login "My Reminder"`.

Copied straight from `liste help`:

do task            :  add 'task' to the todo list

add list task      :  add 'task' to 'list'

disp list          :  display content of 'list'

login              :  show your login list

mark list done 1   :  remove line 1 from list

edit list          :  open list in editor

rmi                :  interactively remove lists

rm list1 list2 etc :  remove lists list1, list2, etc

### Contribute

The feature you want isn't going to come out of nowhere

1. [Fork the project](https://github.com/wlib/liste/fork)
2. Create your feature branch `git checkout -b my-new-feature`
3. Commit your changes `git commit -am 'I added an awesome feature'`
4. Push to the branch `git push origin my-new-feature`
5. Create a new Pull Request on github

+ [Daniel Ethridge](https://wlib.github.io) - author
+ [You](https://yourwebsite.com) - helped add...
