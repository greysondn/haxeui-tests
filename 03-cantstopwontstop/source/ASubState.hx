package;

import flixel.FlxSubState;
import flixel.ui.FlxButton;

class ASubState extends FlxSubState
{
    override public function create()
    {
        super.create();

        var closeButton:FlxButton = new FlxButton(200, 450, "Close substate", this.close);
        this.add(closeButton);
    }
}