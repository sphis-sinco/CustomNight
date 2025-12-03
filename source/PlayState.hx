package;

import flixel.sound.FlxSound;
import flixel.FlxG;
import custig.Monster;
import flixel.FlxState;

class PlayState extends FlxState
{
	public var sprite_monster:Monster;

	var sound_laugh:FlxSound;
	var sound_footsteps_slow:FlxSound;
	var sound_footsteps_fast:FlxSound;

	override public function create()
	{
		super.create();
		sound_laugh = new FlxSound().loadStream('assets/sounds/laugh.wav');
		sound_footsteps_slow = new FlxSound().loadStream('assets/sounds/footsteps-slow.wav');
		sound_footsteps_fast = new FlxSound().loadStream('assets/sounds/footsteps-flow.wav');

		sprite_monster = new Monster(FlxG.random.int(1, 4));
		add(sprite_monster);
		sprite_monster.roll_function_fail = (rolled, percentage) ->
		{
			if (rolled <= sprite_monster.ai_level + 2)
				if (!sound_laugh.playing)
					sound_laugh.play();
		};
		sprite_monster.roll_function_success = (rolled, percentage) ->
		{
			if (percentage <= 15)
				sound_footsteps_slow.play();

			if (percentage >= 75)
				sound_footsteps_fast.play();
		};
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justReleased.R)
			sprite_monster.roll();
	}
}
