Description
===========

Substates pause their parent classes by default. Haxeui doesn't listen to when
its parent class is paused due to a substate being opened.

This is built to demonstrate that. You can click add all day, even with the
substate open, and the counter will continue to increment.

haxelib versions from git...

`flixel`, `984124c4`  
`haxeui-core`, `f601c051`  
`haxeui-flixel`, `6cc3b3f4`

Tested targets

```
air      - SDK not installed
android  - SDK not installed
electron - haxelib not installed
flash    - has this bug.
html5    - has this bug.
hashlink - build fails (probably different error)
neko     - has this bug
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

Thankful this one is tiny. The last one was so large I felt bad for submitting it.