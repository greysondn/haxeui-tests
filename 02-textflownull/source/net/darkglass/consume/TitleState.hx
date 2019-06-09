package net.darkglass.consume;

import net.darkglass.consume.substate.FAQSubstate;

// new version pieces
import net.darkglass.util.flixel.FlxHaxeUiState;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import haxe.ui.Toolkit;
import haxe.ui.macros.ComponentMacros;
import haxe.ui.components.Button;
import haxe.ui.events.UIEvent;

class TitleState extends FlxHaxeUiState
{
    public var uiGroup:FlxGroup;

    override public function create():Void
    {
        // parent
        super.create();

        // set ui stuffs
        this.uiGroup = new FlxGroup();

        var bg:FlxSprite = new FlxSprite(0, 0, "assets/images/title_faked.png");
        this.add(bg);

        // init ui loader
        Toolkit.screen.options = { container : this.uiGroup };
        this.add(this.uiGroup);
        var _ui = ComponentMacros.buildComponent("assets/ui/titlestate.xml");
        uiGroup.add(_ui);

        // wire up the buttons
        var faq =  _ui.findComponent("faq", Button);
        faq.onClick = this.onClick_faq;
    }

    public function onClick_faq(ignored:UIEvent):Void
    {
        var faqSubstate:FAQSubstate = new FAQSubstate(0x80000000, this.uiGroup);
        openSubState(faqSubstate);
    }
}