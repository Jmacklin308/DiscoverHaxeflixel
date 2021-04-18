package;

import flixel.FlxG;
import flixel.FlxObject; // Contains some collision logic
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tile.FlxTilemap; // allow us to build a level
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	public var map:FlxTilemap;
	public var player:FlxSprite;

	// * ---------------------------------------------------------------------------------------------------------------------
	override public function create():Void
	{
		// Create the player object (FlxSprite)
		player = new Player(FlxG.width * 0.5, 10);

		// create the map using level loader
		LevelLoader.loadLevel(this, "playground");

		// Add player object to the scene
		add(player);

		// Debug message
		FlxG.log.add("Game Started");
		super.create();
	};

	//---------------------------------------------------------------------------------------------------------------------
	// Update function - called every frame
	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		// check for player collision with map
		FlxG.collide(map, player);
	}
}
//---------------------------------------------------------------------------------------------------------------------
