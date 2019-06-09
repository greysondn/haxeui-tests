package net.darkglass.consume.substate;

import flixel.group.FlxGroup;
import flixel.FlxSprite;

import net.darkglass.util.flixel.FlxHaxeUiSubstate;

import haxe.ui.Toolkit;
import haxe.ui.macros.ComponentMacros;
import haxe.ui.components.Label;
import haxe.ui.containers.VBox;
import haxe.ui.components.Button;
import haxe.ui.events.UIEvent;

import openfl.utils.Assets;

class FAQSubstate extends FlxHaxeUiSubstate
{
    override public function create():Void
    {
        // parent
        super.create();

        // instance vars
        var uiGroup = new FlxGroup();

        // fake bg
        var bg_faked:FlxSprite = new FlxSprite(23, 23, "assets/images/gui/classic/bg/faq_faked.png");
        this.add(bg_faked);

        // ui toolkit
        Toolkit.screen.options = { container : uiGroup };
        this.add(uiGroup);
        
        var _ui = ComponentMacros.buildComponent("assets/ui/substate/faq.xml");
        uiGroup.add(_ui);

        var cout:Label = _ui.findComponent("cout", Label);
        cout.width = 686;

        var but:Button = _ui.findComponent("close", Button);
        but.onClick = this.onClick_back;

        // load text from YAML
        this.loadText(cout);
    }

    private function loadText(cout:Label):Void
    {
        // I've modified this, hoping that lorem ipsum text is plenty enough
        // doing so eliminated the entire YAML library from inclusion.

        // load source
        var outTxt:String = Assets.getText("assets/lorem.txt");

        // set it, finally
        cout.text = outTxt;
    }

    private function onClick_back(ignored:UIEvent):Void
    {
        this.close();
    }
}