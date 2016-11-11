# Liste - Helpful reminders in the comfort of your terminal

## What's this?

Liste is for those who have short-term memory and 
those who need constant reminders. It provides a simple interface 
for your own system of notes and reminders.

## Installation

It doesn't get that much easier than this:

+ `sudo gem install liste` Download & install via RubyGems
+ `printf "\nliste login" >> ~/.bashrc` If you want the custom login messages option
+ `liste` Do this on first run to initialize the list file

## Usage

Liste is not hard to use either, running `liste` by itself will 
display your todo list.

### Add to your todo list
`liste "Any content goes here"` 

Pretty simple huh? That will add "Any content goes here" to your todo list.

Important: *Be sure to have some sort of whitespace in the content, or it will not be added correctly.*

### Have custom login messages
Add to your terminal login messages list with:

`liste .login "My login reminder"`

As soon as you login (open a new terminal window), you will see this :

```
Your tasks...

 • My login reminder

you@host:~$ 
```

### Create and add to any other list
If you think that a 'login' and 'todo' list isn't enough, you can make a new list:

`liste .anylistname "Content to add to your custom list"`

To view this new list (this is sort of important), you can use `disp` like so:

`liste .anylistname disp`

Note: Although it's possible to have spaces in your list name (`liste ".spaces in this list name" "This list has spaces"`), 
you would have to put quotes around the name, so it's clumsy and not recommended.

### Other usage help
Run `liste help` for more complete usage instructions.

## Contribute

The feature you want isn't going to come out of nowhere

1. [Fork the project](https://github.com/wlib/liste/fork)
2. Create your feature branch `git checkout -b my-new-feature`
3. Commit your changes `git commit -am 'I added an awesome feature'`
4. Push to the branch `git push origin my-new-feature`
5. Create a new Pull Request on github

+ [Daniel Ethridge](https://wlib.github.io) - author
+ [You](https://yourwebsite.com) - helped add...
