import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxMath;
import openfl.sensors.Accelerometer;

// Player class. Contains all relevant things to the player
class Player extends FlxSprite // game object
{
	// player properties (note: Static inline mean constants)
	private static inline var ACCELERATION:Int = 320;
	private static inline var DRAG:Int = 320;
	private static inline var GRAVITY:Int = 600;
	private static inline var JUMP_FORCE:Int = -270;
	private static inline var WALK_SPEED:Int = 80;
	private static inline var RUN_SPEED:Int = 140;
	private static inline var FALLING_SPEED:Int = 300;

	public var direction:Int = 1;

	public function new(x:Float, y:Float)
	{
		super(x, y);
		loadGraphic(AssetPaths.player__png, true, 16, 16);

		// set player animation
		animation.add("idle", [0]);
		animation.add("walk", [1, 2, 3, 2], 12);
		animation.add("skid", [4]);
		animation.add("jump", [5]);
		animation.add("fall", [5]);
		animation.add("dead", [12]);

		setSize(8, 12); // set hitbox
		offset.set(4, 4); // offset hitbox

		drag.x = DRAG;
		acceleration.y = GRAVITY;
		maxVelocity.set(WALK_SPEED, FALLING_SPEED);
	}

	override public function update(elapsed:Float):Void
	{
		move(); // player movement
		animate(); // animate the player
		super.update(elapsed);
	}

	private function move()
	{
		var key_left = FlxG.keys.pressed.LEFT;
		var key_right = FlxG.keys.pressed.RIGHT;
		var key_jump = FlxG.keys.pressed.SPACE;
		var key_jump_release = FlxG.keys.justReleased.SPACE;
		var key_toggle_run = FlxG.keys.pressed.X;
		acceleration.x = 0; // reset acceleration

		if (key_left)
		{
			flipX = true;
			direction = -1;
			acceleration.x -= ACCELERATION;
		}
		if (key_right)
		{
			flipX = false;
			direction = 1;
			acceleration.x += ACCELERATION;
		}

		if (velocity.y == 0)
		{
			if (key_jump && isTouching(FlxObject.FLOOR))
				velocity.y = JUMP_FORCE;
			if (key_toggle_run)
				maxVelocity.x = RUN_SPEED; // Player run
			else
				maxVelocity.x = WALK_SPEED; // player walk
		}

		// add a progressive jump "feel"
		if ((velocity.y < 0) && key_jump_release)
			velocity.y = velocity.y * 0.5;
	}

	private function animate()
	{
		if ((velocity.y <= 0 && (!isTouching(FlxObject.FLOOR))))
			animation.play("jump");
		else if (velocity.y > 0)
			animation.play("fall");
		else if (velocity.x == 0)
			animation.play("idle");
		else
		{
			if (FlxMath.signOf(velocity.x) != FlxMath.signOf(direction))
				animation.play("skid");
			else
				animation.play("walk");
		}
	}
}
