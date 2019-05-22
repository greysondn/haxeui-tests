package ideal;

import flixel.FlxG;
import flixel.FlxSubState;

import haxe.ui.components.Button;
import haxe.ui.macros.ComponentMacros;
import haxe.ui.events.UIEvent;

class IdealSubstate extends FlxSubState
{
    // logic: haxe-ui is already inited...

    // we can just load the new components since our execution context is now
    // here and it will handle itself and swapping context, right?

    // ideally, this is the case - we want that sort of magic where we aren't
    // writing the boilerplate every time to do it

    // realistically, for reasons already explained in the discord, this doesn't
    // work. haxe-ui keeps its own context, which leads to unexpected results

    // notably, a substate should suspend behavior in the underlying state.
    // it doesn't here.

    // what follows is what we'd probably like the code to look like.

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