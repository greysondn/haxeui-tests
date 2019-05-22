package msghero;

import flixel.FlxSubState;
import flixel.FlxState;
import flixel.FlxG;
import flixel.group.FlxGroup;

import haxe.ui.Toolkit;
import haxe.ui.events.UIEvent;
import haxe.ui.macros.ComponentMacros;
import haxe.ui.components.Button;

import msghero.MsgheroSubState;

// MSGhero offered this in the discord:
//
// '''
// ...
// Or, and this probably works but maybe is buggy, you set the HaxeUI/flixel
// container to your substate instead
// ..
// Mm no you set options = { container : mySubState }
// ...
// '''
//
// This is an attempt at what he indicated. It appears to work.
//
// this code could be mostly copy-pasted from the idealized version for the
// main state, I think, so I did.
//
class MsgheroState extends FlxState
{
    public var uiGroup:FlxGroup = new FlxGroup();

    override public function create():Void
    {
        super.create();

        Toolkit.init({ container : this.uiGroup });
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

        // the only real change seems to be here, and in the related functions
        var _sub:FlxSubState = new MsgheroSubState(0x88888888);

        // set toolkit container to substate
        Toolkit.screen.options = { container : _sub };

        // register on close so it will fire
        _sub.closeCallback = this.on_substate_close;

        // now open substate
        this.openSubState(_sub);
    }

    public function on_overlapped(e:UIEvent):Void
    {
        FlxG.log.add("Button: Overlapped (State)!");
        trace("Button: Overlapped (State)!");
    }

    public function on_substate_close():Void
    {
        // set toolkit container to this state's uigroup
        Toolkit.screen.options = { container : this.uiGroup };
    }
}