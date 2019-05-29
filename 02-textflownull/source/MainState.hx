package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

import ExSubstate;

// there is no haxeui code in this state
// I'm aware that I didn't init haxeui here. Half the point.
class MainState extends FlxState
{
    override public function create():Void
    {
        super.create();

        this.add(new FlxText(150, 50, 0, "Click to open substate"));
        this.add(new FlxButton(50, 50, "Button", this.on_button));
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }

    public function on_button():Void
    {
        openSubState(new ExSubstate(0x80000000, this));
    }
}
