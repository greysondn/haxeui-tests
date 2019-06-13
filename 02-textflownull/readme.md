Description
===========

For some odd reason, text reflow in haxeui-flixel just breaks in flash. So this
is an attempt at a minimal case for that.

Open the substate and close it. It should fail for sure in Flash if I did my job right.

Late insert: And HTML5, and Neko.

Yes, this is just copy+paste my current setup, with much of the cruft cut away. The classpaths were left in place.

haxelib versions from git...

`flixel`, `984124c4`  
`haxeui-core`, `f601c051`  
`haxeui-flixel`, `6cc3b3f4`

Tested targets

```
air      - SDK not installed
android  - SDK not installed
electron - haxelib not installed
flash    - crashes (this bug)
html5    - crashes (this bug)
hashlink - build fails (probably different error)
neko     - crashes (this bug)
windows  - MSVC not installed
```

haxelib list...

```
dox: [1.1.0]
flixel-addons: 2.7.1 2.7.3 [2.7.5]
flixel-demos: 2.6.1 2.7.0 [2.7.1]
flixel-templates: 2.5.3 2.5.4 2.5.5 [2.6.2]
flixel-tools: 1.4.2 1.4.3 [1.4.4]
flixel-ui: 2.3.1 [2.3.2]
flixel: 4.5.1 4.6.0 [git]
flxscrollablearea: [0.4.0]
formatter: 1.5.1 [1.6.0]
haxeui-core: [git] old
haxeui-flixel: 0.0.0 [git]
haxeui-openfl: [0.0.2]
hscript: [2.3.0]
hxColorToolkit: [1.6.1]
hxcpp-debug-server: [dev:c:\Users\Dorian Greyson\.vscode\extensions\vshaxe.hxcpp-debugger-1.2.4\hxcpp-debug-server]
hxcpp: 4.0.4 [4.0.8]
lime-samples: [7.0.0]
lime: 7.2.0 7.2.1 7.3.0 [7.5.0]
openfl: 8.7.0 8.8.0 [8.9.1]
thx.color: [0.19.1]
thx.core: [0.43.0]
yaml: 1.3.0 [fix-your-lib] git
```

I should uninstall some of those. Or leave what seems like a silly line to constantly remind myself to do it, anyway.

Postscript
==========

This does, in fact, break just fine. Which it's weird to celebrate but that's a good thing, I guess.