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

	public var ai_level(default, set):Int = 0;

	function set_ai_level(value:Int):Int
	{
		var new_ai_level = value;

		if (new_ai_level > MAX_AI_LEVEL)
			new_ai_level = MAX_AI_LEVEL;
        
		return new_ai_level;
	}

	public static var MAX_AI_LEVEL:Int = 20;

	public function roll():Bool
	{
		return FlxG.random.int(0, MAX_AI_LEVEL) <= ai_level;
	}

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
