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
    public var uiGroup:FlxGroup = new FlxGroup();

    override public function create():Void
    {
        // parent
        super.create();

        // always nice to have a background, fellas
        var bg:FlxSprite = new FlxSprite(0, 0, "assets/images/title_faked.png");
        this.add(bg);

        // init and load ui
        Toolkit.init({ container : this.uiGroup });
        this.add(this.uiGroup);
        var _ui = ComponentMacros.buildComponent("assets/ui/titlestate.xml");
        uiGroup.add(_ui);

        // init counter
        this.counter = _ui.findComponent("counter", Label);
        this.counter.text = Std.string(this.count);

        // wire up the buttons
        _ui.findComponent("add", Button).onClick = this.onAdd;

        // which version you want? pick only one...
        
        // expected
        _ui.findComponent("substate", Button).onClick = this.onSub;
        
        // workaround
        // _ui.findComponent("substate", Button).onClick = this.onSubAlt;
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

    public function onSubAlt(ignored:UIEvent):Void
    {
        // this works by using haxeui's surface properties
        // and msghero's method of swapping in and out substates
        var _sub:ASubState = new ASubState(0x20000000);
        Toolkit.screen.options = {container : _sub};
        _sub.closeCallback = this.onSubAlt_close;
        this.openSubState(_sub);
    }

    public function onSubAlt_close():Void
    {
        Toolkit.screen.options = {container: this.uiGroup};
    }
}