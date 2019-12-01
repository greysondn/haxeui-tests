package net.darkglass.consume.substate;

import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.FlxSubState;

import haxe.ui.Toolkit;
import haxe.ui.macros.ComponentMacros;
import haxe.ui.components.Label;
import haxe.ui.containers.VBox;
import haxe.ui.components.Button;
import haxe.ui.events.UIEvent;

import openfl.utils.Assets;

class FAQSubstate extends FlxSubState
{
    override public function create():Void
    {
        // parent
        super.create();

        // ui infrastructure
        var _ui = ComponentMacros.buildComponent("assets/ui/faq.xml");
        this.add(_ui);

        // fake bg
        var bg_faked:FlxSprite = new FlxSprite(23, 23, "assets/images/faq_faked.png");

        // ui bits and bobs
        var cout:Label = _ui.findComponent("cout", Label);
        cout.width = 686;

        var but:Button = _ui.findComponent("close", Button);
        but.onClick = this.onClick_back;

        // ATTN: the next line is apparently critical to trigger the bug
        cout.text = Assets.getText("assets/lorem.txt");
    }

    private function onClick_back(ignored:UIEvent):Void
    {
        this.close();
    }
}