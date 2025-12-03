package custig;

import flixel.FlxG;
import flixel.FlxSprite;

class Monster extends FlxSprite
{
	public var ai_level:Int = 0;

	public static var MAX_AI_LEVEL:Int = 20;

	public var state_data:Dynamic = {};

	public function setStateData(field:String, value:Dynamic)
	{
		Reflect.setField(state_data, field, value);
	}

	public function getStateData(field:String):Dynamic
	{
		return Reflect.field(state_data, field);
	}

	override public function new(?X:Float, ?Y:Float)
	{
		super(X, Y);
	}

    public function roll():Bool
    {
        return FlxG.random.int(0, MAX_AI_LEVEL) <= ai_level;
    }
}
