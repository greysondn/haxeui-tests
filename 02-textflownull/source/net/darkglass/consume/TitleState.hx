package net.darkglass.consume;

import openfl.Assets;

import flixel.FlxG;
import flixel.math.FlxRandom;
import flixel.text.FlxText.FlxTextFormat;

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

        var bg:FlxSprite = new FlxSprite(0, 0, "assets/images/gui/classic/bg/title_faked.png");
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

/**
class TitleState extends FlxUIState
{
    override public function create():Void
    {
        // paint it black
        var fntcol:FlxTextFormat = new FlxTextFormat(0xFF000000);

        // get this out of the way
        super.create();

        // handle to the registry please
        var registry:Registry = Registry.create();

        // now ui
        
        // background
        // ----------
        var titlebg:FlxUISprite = new FlxUISprite(0, 0);
        //                              AARRGGBB   For alpha, FF is opaque and 00 is transparent
        titlebg.makeGraphic(850, 640, 0xFFFFFFFF);
        this.add(titlebg);

        // Logo
        // ----
        var logo:FlxUISprite = new FlxUISprite(190, 34, registry.logo);
        this.add(logo);

        // version
        // pos 489x42
        // sz 162x97
        var verText:FlxUIText = new FlxUIText(551, 227, 162, registry.release);
        verText.alignment = "center";
        verText.addFormat(fntcol);
        this.add(verText);
        
        // creators
        // pos 190x293
        // sz  469x25
        var creatorStr = "By copb_phoenix. Based upon an original work by GenkoKitsu.";
        
        var titleCreate:FlxUIText = new FlxUIText(190, 305, 469, creatorStr);
        titleCreate.alignment = "center";
        titleCreate.addFormat(fntcol);
        this.add(titleCreate);

        // quote
        // pos 190x318
        // sz  469x36
        // -----
        // ... this is a bit of a doozy
        // load quotes
        // TODO: Make this capable of loading other locales
        var _yamlFile:String = Assets.getText("assets/data/en-us/welcome_messages.yaml");
        var msgs:Array<String> = Yaml.parse(_yamlFile);
        var rng:FlxRandom = new FlxRandom();

        // get random quotes
        // there were some for random dates that we didn't add in yet, I'll have
        // to redesign the file to do that.
        //
        // TODO: redesign the file to do that.
        //
        // Jan 01 - New Year's - "Happy New Year!"
        // Aug 08 - Kyra's BD  - "Happy Birthday Kyra!"
        // Oct 31 - Halloween  - "Happy Halloween!"
        // Nov 25 - Greyson BD - "Happy Birthday greysondn!"
        // Dec 25 - Christmas  - "Merry Christmas!"
        var rngRoll:Int = rng.int(0, (msgs.length - 1));
        var quoteStr:String = msgs[rngRoll];

        var titleQuote:FlxUIText = new FlxUIText(190, 318, 469, quoteStr);
        titleQuote.alignment = "center";
        titleQuote.addFormat(fntcol);
        this.add(titleQuote);
        
        // menu space
        // pos 190x356
        // sz  469 x 250
        // height each: 42
        // space between: 10
        // New, Load, Options, Faq, Credits
        // --------------------------------
        var buttonEnabledGFX:Array<String>  = registry.gfxset_buttonEnabled;
        var buttonDisabledGFX:Array<String> = registry.gfxset_buttonDisabled;

        var slicecoords:Array<Array<Int>> = registry.gfxset_buttonEnabled_slice;

        var newButton:FlxUIButton = new FlxUIButton(190, 356, "New Game", onClick_play);
        newButton.loadGraphicSlice9(buttonEnabledGFX, 469, 42, slicecoords, 0, -1);
        this.add(newButton);

        var loadButton:FlxUIButton = new FlxUIButton(190, 408, "Load");
        loadButton.loadGraphicSlice9(buttonDisabledGFX, 469, 42, slicecoords, 0, -1);
        this.add(loadButton);

        var optionsButton:FlxUIButton = new FlxUIButton(190, 460, "Options", onClick_options);
        optionsButton.loadGraphicSlice9(buttonEnabledGFX, 469, 42, slicecoords, 0, -1);
        this.add(optionsButton);

        var faqButton:FlxUIButton = new FlxUIButton(190, 512, "FAQ", onClick_faq);

        var creditsButton:FlxUIButton = new FlxUIButton(190, 564, "Credits", onClick_credits);
        creditsButton.loadGraphicSlice9(buttonEnabledGFX, 469, 42, slicecoords, 0, -1);
        this.add(creditsButton);

        // warning!
        var prewarnSubstate:PreWarnSubstate = new PreWarnSubstate(0x80000000);
        openSubState(prewarnSubstate);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }

    public function onClick_options():Void
    {
        var optionSubstate:OptionSubstate = new OptionSubstate(0x80000000);
        openSubState(optionSubstate);
    }

    public function onClick_play():Void
    {
        FlxG.switchState(new PlayState());
    }

    public function onClick_credits():Void
    {
        var creditsSubstate:CreditsSubstate = new CreditsSubstate(0x80000000);
        openSubState(creditsSubstate);
    }
}
*/