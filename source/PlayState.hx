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

		monster = new Monster(FlxG.random.int(1, 4));
		add(monster);
		monster.roll_function_fail = (rolled, percentage) ->
		{
			if (percentage <= 25)
				FlxG.sound.play('assets/sounds/laugh.wav');
		};
		monster.roll_function_success = (rolled, percentage) ->
		{
			if (percentage <= 15)
				FlxG.sound.play('assets/sounds/footsteps-slow.wav');

			if (percentage >= 75)
				FlxG.sound.play('assets/sounds/footsteps-fast.wav');
		};
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justReleased.R)
			monster.roll();
	}
}
