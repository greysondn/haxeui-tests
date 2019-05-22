package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.ui.FlxButton;

import example.ExampleState;
import ideal.IdealState;
import msghero.MsgheroState;
import proposal.ProposalState;

// there is no haxeui code in this state

class MainState extends FlxState
{
    override public function create():Void
    {
        super.create();

        // button/desc for flxui example
        this.add(new FlxText(150, 50, 0, "Example of intended behavior in Flixel UI (not appearance, not haxeui)"));
        this.add(new FlxButton(50, 50, "Example", this.on_example));

        // button/desc for ideal code example
        this.add(new FlxText(150, 100, 0, "Example of idealized code and how it runs"));
        this.add(new FlxButton(50, 100, "Ideal", this.on_ideal));

        // button/desc for MSGhero code example
        this.add(new FlxText(150, 150, 0, "Example of MSGhero's suggested method, I think"));
        this.add(new FlxButton(50, 150, "MSGhero", this.on_msghero));

        // button/desc for proposal code example
        this.add(new FlxText(150, 200, 0, "New class that would act as as shim is made use of here. Ideal meets FlxHaxeUiSubstate"));
        this.add(new FlxButton(50, 200, "Proposal", this.on_proposal));
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }

    public function on_example():Void
    {
        FlxG.switchState(new ExampleState());
    }

    public function on_ideal():Void
    {
        FlxG.switchState(new IdealState());
    }

    public function on_msghero():Void
    {
        FlxG.switchState(new MsgheroState());
    }

    public function on_proposal():Void
    {
        FlxG.switchState(new ProposalState());
    }
}
