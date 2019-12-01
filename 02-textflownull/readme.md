Description
===========

For some odd reason, text reflow in haxeui-flixel just breaks in flash. So this
is an attempt at a minimal case for that.

Open the substate and close it. It should fail for sure in Flash and HTML5 if I did my job right.

Yes, this is just copy+paste my current setup, with much of the cruft cut away. The classpaths were left in place.

haxelib versions from git...

`flixel`, `git 4d23ed84`  
`haxeui-core`, `haxelib 1.0.7`  
`haxeui-flixel`, `git 110fd2ac`

Tested targets

```
air      - not tested
android  - not tested
electron - not tested
flash    - crashes (this bug)
html5    - crashes (this bug)
hashlink - not tested
neko     - not tested
windows  - not tested
```

Postscript
==========

This does, in fact, break just fine. Which it's weird to celebrate but that's a good thing, I guess.

Update (1 December 2019)
========================
This has been updated for the current version of HaxeUI-flixel. Past versions
are going to be easiest to locate by rolling back this readme - I apparently
felt the need to include my entire haxelib listing before and that's a bit
much.

The previous versions of the main relevant libs, however, are:
> `flixel`, `984124c4`  
> `haxeui-core`, `f601c051`  
> `haxeui-flixel`, `6cc3b3f4`

I also changed the way that the substate loads. MSGhero had previously offered
an intended/preferred way. This now observes that way of loading (and unloading)
the substate.

This also means this example actually got smaller - by three classes, at least.
perhaps in future versions I can work it to be progressively smaller. (Or maybe
a fix will arise.)