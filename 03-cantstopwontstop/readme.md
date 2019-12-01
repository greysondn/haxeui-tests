Description
===========

Substates pause their parent classes by default. Haxeui doesn't listen to when
its parent class is paused due to a substate being opened.

This is built to demonstrate that. You can click add all day, even with the
substate open, and the counter will continue to increment.

haxelib versions from git...

`flixel`, `git 4d23ed84`  
`haxeui-core`, `haxelib 1.0.7`  
`haxeui-flixel`, `git 110fd2ac`

Test targets

```
air      - not tested
android  - not tested
electron - not tested
flash    - Has this bug.
html5    - Has this bug.
hashlink - not tested
neko     - not tested
windows  - not tested
```

I should uninstall some of those. Or leave what seems like a silly line to constantly remind myself to do it, anyway.

Postscript
==========

Thankful this one is tiny. The last one was so large I felt bad for submitting it.

Update (1 December 2019)
========================
The XML files were updated for current versions of HaxeUI-flixel.

Previously, this was against the following versions, if you'd like to roll back:

> `flixel`, `984124c4`
> `haxeui-core`, `f601c051`
> `haxeui-flixel`, `6cc3b3f4`

Also included my entire haxelib listing, which I've removed because that seems
excessive here.

We apparently still can't stop, won't stop.