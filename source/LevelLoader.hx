import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.addons.editors.tiled.TiledLayer;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledObject;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.addons.editors.tiled.TiledTileLayer;
import flixel.group.FlxGroup;
import flixel.math.FlxPoint;
import flixel.tile.FlxTilemap;

class LevelLoader extends PlayState
{
	public static function loadLevel(state:PlayState, level:String)
	{
		// define the map we want to use
		var tiledMap = new TiledMap("assets/levels/" + level + ".tmx");
		var mainLayer:TiledTileLayer = cast tiledMap.getLayer("main");

		// back layer
		var backLayer:TiledTileLayer = cast tiledMap.getLayer("back");
		var backMap = new FlxTilemap();
		backMap.loadMapFromArray(backLayer.tileArray, tiledMap.width, tiledMap.height, AssetPaths.tiles__png, 16, 16, 1);
		backMap.solid = false;

		// load the map from tiled
		state.map = new FlxTilemap();
		state.map.loadMapFromArray(mainLayer.tileArray, tiledMap.width, tiledMap.height, AssetPaths.tiles__png, 16, 16, 1);
		state.add(state.map);

		// draw the map layers to the screen
		state.add(backMap); // draw the background first
		state.add(state.map); // draw the foreground
	}
}
