package ideal;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;

import haxe.ui.Toolkit;
import haxe.ui.events.UIEvent;
import haxe.ui.macros.ComponentMacros;
import haxe.ui.components.Button;

import ideal.IdealSubstate;

class IdealState extends FlxState
{
    public var uiGroup:FlxGroup = new FlxGroup();

    override public function create():Void
    {
        super.create();

        // init that toolkit and add its group to state so it draws
        Toolkit.init({ container : uiGroup });
        this.add(this.uiGroup);

        // now properly load the asset file and all
        var _ui = ComponentMacros.buildComponent("assets/xml/main.xml");
        this.uiGroup.add(_ui);

        // wire up buttons, I wrote them as oneliners
        _ui.findComponent("open-substate", Button).onClick = this.on_substate;
        _ui.findComponent("overlapped"   , Button).onClick = this.on_overlapped;
    }

    public function on_substate(e:UIEvent):Void
    {
        // log
        FlxG.log.add("Button: Open Substate!");
        trace("Button: Open Substate!");

        // open
        this.openSubState(new IdealSubstate(0x88888888));
    }

    public function on_overlapped(e:UIEvent):Void
    {
        // just log
        FlxG.log.add("Button: Overlapped (State)!");
        trace("Button: Overlapped (State)!");
    }
}