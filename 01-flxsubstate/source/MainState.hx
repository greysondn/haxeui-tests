package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.ui.FlxButton;

// there is no haxeui code in this state

class MainState extends FlxState
{
    override public function create():Void
    {
        super.create();

        // button/desc for flxui example
        this.add(new FlxText(150, 50, 0, "Example of intended behavior in Flixel UI (not appearance, not haxeui)"));
        this.add(new FlxButton(50, 50, "Example", this.on_example));
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }

    public function on_example():Void
    {
        FlxG.log.add("Pressed!");
    }
}
