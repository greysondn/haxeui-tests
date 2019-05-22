package example;

import flixel.FlxG;
import flixel.FlxSubState;
import flixel.ui.FlxButton;
import flixel.text.FlxText;

class ExampleSubstate extends FlxSubState
{
    override public function create():Void
    {
        super.create();

        this.add(new FlxText(100, 200, 0, "The substate is now opened.\n\nYou can close it with the close button below."));
        this.add(new FlxButton(200, 400, "Overlapped", this.on_overlapped));
        this.add(new FlxButton(300, 400, "Close", this.on_close));
    }

    public function on_overlapped():Void
    {
        // just log
        FlxG.log.add("Button: Overlapped (Sub)!");
        trace("Button: Overlapped (Sub)!");
    }

    public function on_close():Void
    {
        // log
        FlxG.log.add("Button: Close Substate!");
        trace("Button: Close Substate!");

        // close
        this.close();
    }
}