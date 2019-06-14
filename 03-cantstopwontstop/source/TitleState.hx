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
    public var count:Int = 0;
    public var counter:Label;


    override public function create():Void
    {
        // parent
        super.create();

        // always nice to have a background, fellas
        var bg:FlxSprite = new FlxSprite(0, 0, "assets/images/title_faked.png");
        this.add(bg);

        // init and load ui
        var uiGroup:FlxGroup = new FlxGroup();
        Toolkit.init({ container : uiGroup });
        this.add(uiGroup);
        var _ui = ComponentMacros.buildComponent("assets/ui/titlestate.xml");
        uiGroup.add(_ui);

        // init counter
        this.counter = _ui.findComponent("counter", Label);
        this.counter.text = Std.string(this.count);

        // wire up the buttons
        _ui.findComponent("add", Button).onClick = this.onAdd;
        _ui.findComponent("substate", Button).onClick = this.onSub;
    }

    public function onAdd(ignored:UIEvent):Void
    {
        this.count = this.count + 1;
        this.counter.text = Std.string(this.count);
    }

    public function onSub(ignored:UIEvent):Void
    {
        this.openSubState(new ASubState(0x20000000));
    }
}