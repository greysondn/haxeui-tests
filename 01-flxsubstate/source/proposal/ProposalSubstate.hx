package proposal;

import flixel.FlxG;
import proposal.FlxHaxeUiSubstate;

import haxe.ui.components.Button;
import haxe.ui.macros.ComponentMacros;
import haxe.ui.events.UIEvent;

// this is a copy/paste of the ideal, with the parent class changed
class ProposalSubstate extends FlxHaxeUiSubstate
{
    override public function create():Void
    {
        super.create();

        var _ui = ComponentMacros.buildComponent("assets/xml/substate.xml");
        this.add(_ui);

        _ui.findComponent("overlapped"    , Button).onClick = this.on_overlapped;
        _ui.findComponent("close-substate", Button).onClick = this.on_close;
    }

    public function on_overlapped(e:UIEvent):Void
    {
        FlxG.log.add("Button: Overlapped (Sub)!");
        trace("Button: Overlapped (Sub)!");
    }

    public function on_close(e:UIEvent):Void
    {
        FlxG.log.add("Button: Close Substate!");
        trace("Button: Close Substate!");

        this.close();
    }
}