package custig;

import flixel.FlxG;
import flixel.FlxSprite;

class Monster extends FlxSprite
{
	override public function new(ai_level:Int, ?X:Float, ?Y:Float)
	{
		super(X, Y);

		this.ai_level = ai_level;
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		if (this.ai_level > MAX_AI_LEVEL)
			this.ai_level = MAX_AI_LEVEL;
	}

	public var ai_level:Int = 0;

	public static var MAX_AI_LEVEL:Int = 20;

	public function roll()
	{
		var rolled:Int = FlxG.random.int(0, MAX_AI_LEVEL);
		var roll_value:Bool = rolled <= ai_level;

		var percentage = ((rolled / ai_level) * 100);

		#if debug
		if (roll_value)
			trace('roll_function_success');
		else
			trace('roll_function_fail');

		trace('rolled: ' + rolled);
		trace('ai_level: ' + ai_level);
		trace('percentage: ' + percentage);
		#else
		trace('no cheating');
		#end

		if (roll_value)
			roll_function_success(rolled, percentage);
		else
			roll_function_fail(rolled, percentage);
	}

	public var roll_function_success:(Int, Float)->Void;
	public var roll_function_fail:(Int, Float)->Void;

	public var state_data:Dynamic = {};

	public function setStateData(field:String, value:Dynamic)
	{
		Reflect.setField(state_data, field, value);
	}

	public function getStateData(field:String):Dynamic
	{
		return Reflect.field(state_data, field);
	}
}
