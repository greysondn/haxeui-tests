package net.darkglass.consume;

import net.darkglass.consume.substate.FAQSubstate;

import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;

import haxe.ui.Toolkit;
import haxe.ui.macros.ComponentMacros;
import haxe.ui.components.Button;
import haxe.ui.events.UIEvent;

class TitleState extends FlxState
{
    public var uiGroup:FlxGroup = new FlxGroup();

    override public function create():Void
    {
        // parent
        super.create();

        var bg:FlxSprite = new FlxSprite(0, 0, "assets/images/title_faked.png");
        this.add(bg);

        // init ui loader
        Toolkit.init({container: this.uiGroup});
        this.add(this.uiGroup);

        var _ui = ComponentMacros.buildComponent("assets/ui/titlestate.xml");
        uiGroup.add(_ui);

        // wire up the buttons
        var faq =  _ui.findComponent("faq", Button);
        faq.onClick = this.onClick_faq;
    }

    public function onClick_faq(ignored:UIEvent):Void
    {
        var faqSubstate:FAQSubstate = new FAQSubstate(0x80000000);

        // set toolkit container to substate
        Toolkit.screen.options = {container: faqSubstate};

        // register on close so it will fire
        faqSubstate.closeCallback = this.on_substate_close;

        openSubState(faqSubstate);
    }

    public function on_substate_close():Void
    {
        // set toolkit container to this state's uigroup
        Toolkit.screen.options = {container: this.uiGroup};
    }
}