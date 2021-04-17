/*
	This is the first game "scene" (what FlxState's are)
 */

package;

import flixel.FlxG;
import flixel.FlxObject; // Contains some collision logic
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxMath;
import flixel.system.macros.FlxAssetPaths;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap; // allow us to build a level
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

// import flixel.system.macros.FlxAssetPaths;
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

	// Create function - called once at beginning of scene
	override public function create()
	{
		// create a map
		map = new FlxTilemap();
		map.loadMapFromArray(mapData, 20, 12, AssetPaths.tiles__png, 16, 16);
		add(map); // add the tilemap to the scene

		// Create the player object (FlxSprite)
		player = new FlxSprite(64, 0);
		player.makeGraphic(16, 16, FlxColor.RED);
		player.acceleration.y = 420;
		add(player); // Add player object to the scene
	};

	// Update function - called every frame
	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
