vim-fountain - A VIM plugin for the fountain markup language
============================================================

A bundlified version of Carson Fire's [vim-fountain](http://www.vim.org/scripts/script.php?script_id=3880).


Original description
--------------------

Fountain is a plain text markup language for screenwriting.

Previously SPMD (screenplay markdown), Fountain is very official, now, and getting to be something of a Big Deal, as it merges two similar screenwriting projects into one. The format can be converted into Final Draft files (FDX) and HTML, and can be imported by Final Draft and Movie Magic. Scrippets (less powerful conversion) is available for WordPress, BBEdit, and other web standards.

http://fountain.io/

Fountain is much like SPMD, with some important changes. Atx headers are now supported in order to create sections, and this makes Fountain compatible with the Voom outliner (vimscript #2657) in Markdown mode.

Commenting has been changed; and an important feature called Boneyard is introduced, allowing for flexible striking of deleted material.

Known issues in the current version: text emphasis only renders in 'normal' text (action, not dialogue), and adding eol double-spaces does not have the intended corrective effect (this should be fixed in an update).

The official Fountain site contains a great deal of helpful material, including sample scripts and apps. In brief, Fountain allows you to type a screenplay in plain text. Here is an excerpt from Big Fish by John August, one of the screenwriters behind Fountain, and note that the text can be flush or tabbed as desired.

```
EDWARD
(whispering)
Turn off your flashlights!  She'll see 'em.

MOVING UP behind the kids, we find ourselves at the gates of...

EXT.  A CREEPY OLD HOUSE - NIGHT

ADULT EDWARD (V.O.)
Now, it's common knowledge that most towns of a certain size have a witch, if only to eat misbehaving children and the occasional puppy who wanders into her yard.  Witches use those bones to cast spells and curses that make the land infertile.
```

Happy screenwriting!

Installing and using
--------------------

If you're using vim-plug, simplty add

```
Plug 'kblin/vim-fountain'
```

to your `.vimrc` file.

