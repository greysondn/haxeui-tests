Description
===========

I had tried to use haxeui-flixel with flxsubstate. This didn't cooperate. This lead to some discussion in the community discord, and these test cases. I wanted to try this a few different ways (as seemed to be suggested) and just see what happens.

Ian wanted me to try it (I believe) both in a way that aligned with flixel and in a way that aligned with what was expected for haxeui. MSGhero seemed convinced that some toying around would fix it. I developed a couple ideas of where to go on my own after talking to them.

These try to be minimal cases. I never make any promises.

haxelib versions....

`flixel`, `git 4d23ed84`  
`haxeui-core`, `haxelib 1.0.7`  
`haxeui-flixel`, `git 110fd2ac`

Postscript
==========

When I set out to do this, I thought I'd have a broken mess on my hands. What I wound up with was four versions that go through what is desired, a working version, and making those meet. I'm submitting this both to be used as an example if someone needs it (point them to msghero folder if my class doesn't get folded in), and just to cover the bases of what went on with this.

I'm frankly surprised this went as well as it did.

Update (30 November 2019)
=========================
Originally, this was for older versions of flixel, haxeui-core, and haxeui-flixel.

Those were:

> `flixel`, `984124c4`
> `haxeui-core`, `f601c051`
> `haxeui-flixel`, `6cc3b3f4`

Changes to haxeui meant that loading didn't happen quite right, so it was
subsequently updated. I tried to bundle that all into one commit, so you should
be able to roll back to before that commit if you needed the older version
for some odd reason. Otherwise, this is current with the versions listed
up top, in the description.