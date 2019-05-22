package proposal;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;

import haxe.ui.Toolkit;
import haxe.ui.events.UIEvent;
import haxe.ui.macros.ComponentMacros;
import haxe.ui.components.Button;

import proposal.ProposalSubstate;

// revisit the ideal with a new substate class
class ProposalState extends FlxState
{
    public var uiGroup:FlxGroup = new FlxGroup();

    override public function create():Void
    {
        super.create();

        Toolkit.init({ container : uiGroup });
        this.add(this.uiGroup);

        var _ui = ComponentMacros.buildComponent("assets/xml/main.xml");
        this.uiGroup.add(_ui);

        _ui.findComponent("open-substate", Button).onClick = this.on_substate;
        _ui.findComponent("overlapped"   , Button).onClick = this.on_overlapped;
    }

    public function on_substate(e:UIEvent):Void
    {
        FlxG.log.add("Button: Open Substate!");
        trace("Button: Open Substate!");

        // the only change happens here, the extra argument.
        this.openSubState(new ProposalSubstate(0x88888888, this.uiGroup));
    }

    public function on_overlapped(e:UIEvent):Void
    {
        FlxG.log.add("Button: Overlapped (State)!");
        trace("Button: Overlapped (State)!");
    }
}