package proposal;

import flixel.FlxSubState;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;

import haxe.ui.Toolkit;

/**
 * Variation on FlxSubstate which manages context switching for HaxeUi. This
 * assumes that the entire substate is a HaxeUI surface by default, and that you
 * wish to revert to `nextSurface` on close. It is not made for persistent
 * substates. It assumes HaxeUI is already initialized.
 * 
 * TODO: Fix terminology, maybe tweak names.
 * 
 * @see flixel.FlxSubState
 * 
 * @author greysondn
 */
class FlxHaxeUiSubstate extends FlxSubState
{
    /**
     * Next surface to have HaxeUI target for drawing/etc
     */
    public var nextSurface:FlxGroup = new FlxGroup();

    /**
     * @param BGColor       Background color for Substate (defaults to transparent)
     * @param nextUiSurface Next surface to use for HaxeUI
     */
    public function new(BGColor:FlxColor = FlxColor.TRANSPARENT, nextUiSurface:FlxGroup)
    {
        super(BGColor);
        this.nextSurface = nextUiSurface;
    }

    override public function create():Void
    {
        // parent
        super.create();

        // switch haxeui context
        Toolkit.screen.options = { container : this };
    }

    override public function close():Void
    {
        // parent
        super.close();

        // switch haxeui context
        Toolkit.screen.options = { container : this.nextSurface };
    }
}