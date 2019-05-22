package msghero;

import flixel.FlxG;
import flixel.FlxSubState;

import haxe.ui.components.Button;
import haxe.ui.macros.ComponentMacros;
import haxe.ui.events.UIEvent;

class MsgheroSubState extends FlxSubState
{
    override public function create():Void
    {
        super.create();

        // load substate ui and add to substate
        var _ui = ComponentMacros.buildComponent("assets/xml/substate.xml");
        this.add(_ui);

        // wire up buttons, wrote them as one-liners
        _ui.findComponent("overlapped"    , Button).onClick = this.on_overlapped;
        _ui.findComponent("close-substate", Button).onClick = this.on_close;
    }

    public function on_overlapped(e:UIEvent):Void
    {
        // just log
        FlxG.log.add("Button: Overlapped (Sub)!");
        trace("Button: Overlapped (Sub)!");
    }

    public function on_close(e:UIEvent):Void
    {
        // log
        FlxG.log.add("Button: Close Substate!");
        trace("Button: Close Substate!");

        // close
        this.close();
    }
}