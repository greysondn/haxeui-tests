package example;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

import example.ExampleSubstate;

class ExampleState extends FlxState
{
    override public function create():Void
    {
        super.create();

        this.add(new FlxText(100, 100, 0, "Example (Main State)\n\nThis will tell you which button was pressed in flixel's log and in standard traces.\n\n(Tilde in debug builds)\n\nThe overlapped button exists in both state and substate."));
        this.add(new FlxButton(100, 400, "Open Substate", this.on_substate));
        this.add(new FlxButton(200, 400, "Overlapped", this.on_overlapped));
    }

    public function on_substate():Void
    {
        // log
        FlxG.log.add("Button: Open Substate!");
        trace("Button: Open Substate!");

        // open
        this.openSubState(new ExampleSubstate(0x88888888));
    }

    public function on_overlapped():Void
    {
        // just log
        FlxG.log.add("Button: Overlapped (State)!");
        trace("Button: Overlapped (State)!");
    }
}