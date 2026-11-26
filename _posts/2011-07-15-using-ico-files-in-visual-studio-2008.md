---
layout: post
title: Using .ico files in Visual Studio 2008
excerpt: Fixing broken icon transparency in WinForms ErrorProvider controls
---

Today I was putting the finishing touches on my little Student RecordKeeper project when I ran into a very peculiar problem. I had set an `ErrorProvider` object to show a star icon for several textboxes and comboboxes on my New Student form to show that these fields are mandatory.

I wrote a function to set these `ErrorProvider`s within the form's constructor, and created `KeyUp`/`SelectedIndexChanged` event handlers to have them disappear if text was typed or selections chosen within the textboxes and comboboxes. If the text was deleted (only by keystrokes, however) or the selected index set to -1, the icons would reappear.

Well, when I created a new form, the icons would appear, but the stars would have white backgrounds instead of transparent backgrounds.

I was certain that the star `.ico` images had transparent backgrounds, so this was very weird. Even stranger, when text was entered into the textboxes, then deleted so that the star icon would disappear and reappear, they would reappear perfectly normal with transparent backgrounds! The white backgrounds would only be there when the form is first created.

I used a different `.ico` file and found that it did _not_ have the problem with white backgrounds. This was turning out to be quite a mystery! But as with most mysteries, this one had a mundane solution.

I had converted my star images from `.png` to `.ico` files using the website [convertico.com](http://www.convertico.com/). The different `.ico` file I used was downloaded directly as a `.ico` file. Something strange must have been going on in the conversion process. I used GIMP to simply save my `.png` file as a `.ico` file and it worked as I wanted it to.
