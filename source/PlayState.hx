/*
	This is the first game "scene" (what FlxState's are)
 */

package;

import flixel.FlxG;
import flixel.FlxObject; // Contains some collision logic
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tile.FlxTilemap; // allow us to build a level
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var map:FlxTilemap;
	var player:FlxSprite;
	var mapData:Array<Int> = [
		1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
		1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
		1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
		1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1,
		1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	];

	//---------------------------------------------------------------------------------------------------------------------
	override public function create()
	{
		// create a map
		map = new FlxTilemap();
		map.loadMapFromArray(mapData, 20, 12, AssetPaths.tiles__png, 16, 16);
		add(map); // add the tilemap to the scene

		// Create the player object (FlxSprite)
		player = new Player(64, 16);
		add(player); // Add player object to the scene

		// Debug message
		FlxG.log.add("Game Started");
	};

	//---------------------------------------------------------------------------------------------------------------------
	// Update function - called every frame
	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		// check for player collision with map
		FlxG.collide(map, player);

		// Ability to move the player
		movePlayer();
	}

	//---------------------------------------------------------------------------------------------------------------------
	// Player control function
	private function movePlayer():Void
	{
		player.velocity.x = 0;
		var playerSpeed = 80;
		var playerJumpHeight = 200;

		// Input keys
		var key_left = FlxG.keys.pressed.LEFT;
		var key_right = FlxG.keys.pressed.RIGHT;
		var key_jump = FlxG.keys.pressed.SPACE;

		// Check input
		if (key_left)
			player.velocity.x -= playerSpeed;
		if (key_right)
			player.velocity.x += playerSpeed;
		if (key_jump && player.isTouching(FlxObject.FLOOR))
			player.velocity.y -= playerJumpHeight;
	}
}
//---------------------------------------------------------------------------------------------------------------------
