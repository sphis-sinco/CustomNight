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

		monster = new Monster(FlxG.random.int(1, 8));
		add(monster);
		monster.roll_function_fail = rolled ->
		{
			if (((rolled / monster.ai_level) * 100) >= 75)
				FlxG.sound.play('assets/sounds/laugh.wav');
		};
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
