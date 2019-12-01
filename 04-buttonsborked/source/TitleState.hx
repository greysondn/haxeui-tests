package;

import flixel.FlxState;
import haxe.ui.Toolkit;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import haxe.ui.macros.ComponentMacros;
import haxe.ui.events.UIEvent;
import haxe.ui.components.Label;
import haxe.ui.components.Button;

class TitleState extends FlxState
{
    public var uiGroup:FlxGroup = new FlxGroup();

    override public function create():Void
    {
        // parent
        super.create();

        // set background color so we can see the buttons a bit better
        this.bgColor = 0xFF222222;

        // init and load ui
        Toolkit.init({ container : this.uiGroup });
        this.add(this.uiGroup);
        var _ui = ComponentMacros.buildComponent("assets/ui/titlestate.xml");
        uiGroup.add(_ui);
    }
}