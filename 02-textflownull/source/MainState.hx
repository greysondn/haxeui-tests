package;

import openfl.Assets;
import flixel.FlxG;
import flixel.math.FlxRandom;
import flixel.text.FlxText.FlxTextFormat;
import flixel.FlxState;

// new version pieces
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import haxe.ui.Toolkit;
import haxe.ui.macros.ComponentMacros;
import haxe.ui.components.Button;
import haxe.ui.events.UIEvent;

import Registry;

class MainState extends FlxState
{
    public var uiGroup:FlxGroup;

    override public function create():Void
    {
        // parent
        super.create();

        // ... I've included the code from a parent class here...

        // make sure haxeui-flixel has been initialized
        var reg:Registry = Registry.create();

        if (!reg.initialized)
        {
            Toolkit.init({ container : this });
            reg.initialized = true;
        }

        // reimplement default behavior, which is to make this haxeui container
        Toolkit.screen.options = { container : this };

        // ... and that's the end of the parent's code...

        // set ui stuffs
        this.uiGroup = new FlxGroup();

        var bg:FlxSprite = new FlxSprite(0, 0, "assets/images/gui/classic/bg/title_faked.png");
        this.add(bg);

        // init ui loader
        Toolkit.screen.options = { container : this.uiGroup };
        this.add(this.uiGroup);
        var _ui = ComponentMacros.buildComponent("assets/main.xml");
        uiGroup.add(_ui);

        // wire up the buttons
        var faq =  _ui.findComponent("faq", Button);
        faq.onClick = this.onClick_faq;
    }

    public function onClick_faq(ignored:UIEvent):Void
    {
        var exSubstate:ExSubstate = new ExSubstate(0x80000000, this.uiGroup);
        openSubState(exSubstate);
    }
}