package;

import flixel.FlxG;
import custig.Monster;
import flixel.FlxState;

class PlayState extends FlxState
{
	public var monster:Monster;

	override public function create()
	{
		super.create();

		monster = new Monster(FlxG.random.int(1,4));
		add(monster);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
