package;


import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_data_pixel_font_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy34:assets%2Fdata%2Fdata-goes-here.txty4:sizezy4:typey4:TEXTy2:idR1y7:preloadtgoR0y26:assets%2Fdata%2Flevel1.tmxR2i40659R3R4R5R7R6tgoR0y26:assets%2Fdata%2Flevel2.tmxR2i39556R3R4R5R8R6tgoR0y26:assets%2Fdata%2Flevel3.tmxR2i41665R3R4R5R9R6tgoR2i10616R3y4:FONTy9:classNamey35:__ASSET__assets_data_pixel_font_ttfR5y30:assets%2Fdata%2Fpixel-font.ttfR6tgoR0y39:assets%2Ficons%2Fandroid%2Ficon_144.pngR2i5204R3y5:IMAGER5R14R6tgoR0y39:assets%2Ficons%2Fandroid%2Ficon_192.pngR2i6407R3R15R5R16R6tgoR0y38:assets%2Ficons%2Fandroid%2Ficon_48.pngR2i2297R3R15R5R17R6tgoR0y38:assets%2Ficons%2Fandroid%2Ficon_72.pngR2i3631R3R15R5R18R6tgoR0y38:assets%2Ficons%2Fandroid%2Ficon_96.pngR2i3879R3R15R5R19R6tgoR0y63:assets%2Ficons%2Fios%2Fapple-touch-icon-114x114-precomposed.pngR2i2836R3R15R5R20R6tgoR0y63:assets%2Ficons%2Fios%2Fapple-touch-icon-144x144-precomposed.pngR2i2154R3R15R5R21R6tgoR0y61:assets%2Ficons%2Fios%2Fapple-touch-icon-72x72-precomposed.pngR2i1962R3R15R5R22R6tgoR0y55:assets%2Ficons%2Fios%2Fapple-touch-icon-precomposed.pngR2i2302R3R15R5R23R6tgoR0y53:assets%2Ficons%2Fios%2FDefault-568h%402x%7Eiphone.pngR2i104351R3R15R5R24R6tgoR0y56:assets%2Ficons%2Fios%2FDefault-Landscape%402x%7Eipad.pngR2i76899R3R15R5R25R6tgoR0y51:assets%2Ficons%2Fios%2FDefault-Landscape%7Eipad.pngR2i64588R3R15R5R26R6tgoR0y55:assets%2Ficons%2Fios%2FDefault-Portrait%402x%7Eipad.pngR2i112563R3R15R5R27R6tgoR0y50:assets%2Ficons%2Fios%2FDefault-Portrait%7Eipad.pngR2i64015R3R15R5R28R6tgoR0y48:assets%2Ficons%2Fios%2FDefault%402x%7Eiphone.pngR2i92254R3R15R5R29R6tgoR0y43:assets%2Ficons%2Fios%2FDefault%7Eiphone.pngR2i42050R3R15R5R30R6tgoR0y34:assets%2Ficons%2Fios%2FIcon-72.pngR2i1962R3R15R5R31R6tgoR0y39:assets%2Ficons%2Fios%2FIcon-72%402x.pngR2i2154R3R15R5R32R6tgoR0y40:assets%2Ficons%2Fios%2FIcon-Small-20.pngR2i661R3R15R5R33R6tgoR0y45:assets%2Ficons%2Fios%2FIcon-Small-20%402x.pngR2i1324R3R15R5R34R6tgoR0y40:assets%2Ficons%2Fios%2FIcon-Small-30.pngR2i1212R3R15R5R35R6tgoR0y45:assets%2Ficons%2Fios%2FIcon-Small-30%402x.pngR2i2097R3R15R5R36R6tgoR0y40:assets%2Ficons%2Fios%2FIcon-Small-50.pngR2i1820R3R15R5R37R6tgoR0y45:assets%2Ficons%2Fios%2FIcon-Small-50%402x.pngR2i2494R3R15R5R38R6tgoR0y37:assets%2Ficons%2Fios%2FIcon-Small.pngR2i1259R3R15R5R39R6tgoR0y42:assets%2Ficons%2Fios%2FIcon-Small%402x.pngR2i2163R3R15R5R40R6tgoR0y31:assets%2Ficons%2Fios%2FIcon.pngR2i2302R3R15R5R41R6tgoR0y36:assets%2Ficons%2Fios%2FIcon%402x.pngR2i2836R3R15R5R42R6tgoR0y40:assets%2Ficons%2Fios%2FiTunesArtwork.pngR2i4367R3R15R5R43R6tgoR0y45:assets%2Ficons%2Fios%2FiTunesArtwork%402x.pngR2i13446R3R15R5R44R6tgoR0y28:assets%2Fimages%2FenemyA.pngR2i533R3R15R5R45R6tgoR0y28:assets%2Fimages%2FenemyB.pngR2i535R3R15R5R46R6tgoR0y28:assets%2Fimages%2FenemyC.pngR2i543R3R15R5R47R6tgoR0y30:assets%2Fimages%2Ffireball.pngR2i266R3R15R5R48R6tgoR0y25:assets%2Fimages%2Fhud.pngR2i348R3R15R5R49R6tgoR0y36:assets%2Fimages%2Fimages-go-here.txtR2zR3R4R5R50R6tgoR0y27:assets%2Fimages%2Fitems.pngR2i1276R3R15R5R51R6tgoR0y32:assets%2Fimages%2Fplayer-all.pngR2i2211R3R15R5R52R6tgoR0y33:assets%2Fimages%2Fplayer-both.pngR2i1341R3R15R5R53R6tgoR0y28:assets%2Fimages%2Fplayer.pngR2i674R3R15R5R54R6tgoR0y27:assets%2Fimages%2Ftiles.pngR2i2277R3R15R5R55R6tgoR0y27:assets%2Fimages%2Ftitle.pngR2i5798R3R15R5R56R6tgoR0y36:assets%2Fmusic%2Fmusic-goes-here.txtR2zR3R4R5R57R6tgoR2i7483713R3y5:MUSICR5y30:assets%2Fmusic%2FPixelland.mp3y9:pathGroupaR59hR6tgoR2i4109635R3R58R5y30:assets%2Fmusic%2Fpixelland.oggR60aR61hR6tgoR2i182974R3R58R5y28:assets%2Fmusic%2Fvictory.mp3R60aR62y28:assets%2Fmusic%2Fvictory.ogghR6tgoR2i87896R3y5:SOUNDR5R63R60aR62R63hgoR2i10188R3R64R5y27:assets%2Fsounds%2Fblock.wavR60aR65hR6tgoR2i10188R3R64R5y27:assets%2Fsounds%2Fbrick.wavR60aR66hR6tgoR2i30460R3R64R5y26:assets%2Fsounds%2Fcoin.wavR60aR67hR6tgoR2i121700R3R64R5y28:assets%2Fsounds%2Fdamage.wavR60aR68hR6tgoR2i21454R3R64R5y27:assets%2Fsounds%2Fdeath.wavR60aR69hR6tgoR2i15720R3R64R5y28:assets%2Fsounds%2Fdefeat.wavR60aR70hR6tgoR2i852012R3R64R5y27:assets%2Fsounds%2Fdying.wavR60aR71hR6tgoR2i14108R3R64R5y30:assets%2Fsounds%2Ffireball.wavR60aR72hR6tgoR2i132444R3R64R5y26:assets%2Fsounds%2Fgoal.wavR60aR73hR6tgoR2i14236R3R64R5y26:assets%2Fsounds%2Fjump.wavR60aR74hR6tgoR2i63416R3R64R5y36:assets%2Fsounds%2Fpowerup-appear.wavR60aR75hR6tgoR2i119834R3R64R5y29:assets%2Fsounds%2Fpowerup.wavR60aR76hR6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R77R6tgoR2i10188R3R64R5y34:assets%2Fsounds%2Ftime-convert.wavR60aR78hR6tgoR2i2114R3R58R5y26:flixel%2Fsounds%2Fbeep.mp3R60aR79y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R58R5y28:flixel%2Fsounds%2Fflixel.mp3R60aR81y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3R64R5R80R60aR79R80hgoR2i33629R3R64R5R82R60aR81R82hgoR2i15744R3R10R11y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R10R11y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R15R5R87R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R15R5R88R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level1_tmx extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level2_tmx extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_level3_tmx extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_pixel_font_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_android_icon_144_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_android_icon_192_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_android_icon_48_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_android_icon_72_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_android_icon_96_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_apple_touch_icon_114x114_precomposed_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_apple_touch_icon_144x144_precomposed_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_apple_touch_icon_72x72_precomposed_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_apple_touch_icon_precomposed_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_default_568h_2x_iphone_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_default_landscape_2x_ipad_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_default_landscape_ipad_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_default_portrait_2x_ipad_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_default_portrait_ipad_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_default_2x_iphone_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_default_iphone_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_72_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_72_2x_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_small_20_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_small_20_2x_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_small_30_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_small_30_2x_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_small_50_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_small_50_2x_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_small_2x_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_2x_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_itunesartwork_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_icons_ios_itunesartwork_2x_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemya_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemyb_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemyc_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_fireball_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_hud_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_items_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_player_all_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_player_both_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_player_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_tiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_title_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_pixelland_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_pixelland_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_victory_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_victory_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_block_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_brick_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_coin_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_damage_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_death_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_defeat_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_dying_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_fireball_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_goal_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_jump_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_powerup_appear_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_powerup_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_time_convert_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/data/level1.tmx") @:noCompletion #if display private #end class __ASSET__assets_data_level1_tmx extends haxe.io.Bytes {}
@:keep @:file("assets/data/level2.tmx") @:noCompletion #if display private #end class __ASSET__assets_data_level2_tmx extends haxe.io.Bytes {}
@:keep @:file("assets/data/level3.tmx") @:noCompletion #if display private #end class __ASSET__assets_data_level3_tmx extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/pixel-font.ttf") @:noCompletion #if display private #end class __ASSET__assets_data_pixel_font_ttf extends lime.text.Font {}
@:keep @:image("assets/icons/android/icon_144.png") @:noCompletion #if display private #end class __ASSET__assets_icons_android_icon_144_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/android/icon_192.png") @:noCompletion #if display private #end class __ASSET__assets_icons_android_icon_192_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/android/icon_48.png") @:noCompletion #if display private #end class __ASSET__assets_icons_android_icon_48_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/android/icon_72.png") @:noCompletion #if display private #end class __ASSET__assets_icons_android_icon_72_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/android/icon_96.png") @:noCompletion #if display private #end class __ASSET__assets_icons_android_icon_96_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/apple-touch-icon-114x114-precomposed.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_apple_touch_icon_114x114_precomposed_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/apple-touch-icon-144x144-precomposed.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_apple_touch_icon_144x144_precomposed_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/apple-touch-icon-72x72-precomposed.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_apple_touch_icon_72x72_precomposed_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/apple-touch-icon-precomposed.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_apple_touch_icon_precomposed_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/Default-568h@2x~iphone.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_default_568h_2x_iphone_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/Default-Landscape@2x~ipad.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_default_landscape_2x_ipad_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/Default-Landscape~ipad.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_default_landscape_ipad_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/Default-Portrait@2x~ipad.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_default_portrait_2x_ipad_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/Default-Portrait~ipad.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_default_portrait_ipad_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/Default@2x~iphone.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_default_2x_iphone_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/Default~iphone.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_default_iphone_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/Icon-72.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_72_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/Icon-72@2x.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_72_2x_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/Icon-Small-20.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_small_20_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/Icon-Small-20@2x.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_small_20_2x_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/Icon-Small-30.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_small_30_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/Icon-Small-30@2x.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_small_30_2x_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/Icon-Small-50.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_small_50_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/Icon-Small-50@2x.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_small_50_2x_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/Icon-Small.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_small_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/Icon-Small@2x.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_small_2x_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/Icon.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/Icon@2x.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_icon_2x_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/iTunesArtwork.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_itunesartwork_png extends lime.graphics.Image {}
@:keep @:image("assets/icons/ios/iTunesArtwork@2x.png") @:noCompletion #if display private #end class __ASSET__assets_icons_ios_itunesartwork_2x_png extends lime.graphics.Image {}
@:keep @:image("assets/images/enemyA.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemya_png extends lime.graphics.Image {}
@:keep @:image("assets/images/enemyB.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemyb_png extends lime.graphics.Image {}
@:keep @:image("assets/images/enemyC.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemyc_png extends lime.graphics.Image {}
@:keep @:image("assets/images/fireball.png") @:noCompletion #if display private #end class __ASSET__assets_images_fireball_png extends lime.graphics.Image {}
@:keep @:image("assets/images/hud.png") @:noCompletion #if display private #end class __ASSET__assets_images_hud_png extends lime.graphics.Image {}
@:keep @:file("assets/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/items.png") @:noCompletion #if display private #end class __ASSET__assets_images_items_png extends lime.graphics.Image {}
@:keep @:image("assets/images/player-all.png") @:noCompletion #if display private #end class __ASSET__assets_images_player_all_png extends lime.graphics.Image {}
@:keep @:image("assets/images/player-both.png") @:noCompletion #if display private #end class __ASSET__assets_images_player_both_png extends lime.graphics.Image {}
@:keep @:image("assets/images/player.png") @:noCompletion #if display private #end class __ASSET__assets_images_player_png extends lime.graphics.Image {}
@:keep @:image("assets/images/tiles.png") @:noCompletion #if display private #end class __ASSET__assets_images_tiles_png extends lime.graphics.Image {}
@:keep @:image("assets/images/title.png") @:noCompletion #if display private #end class __ASSET__assets_images_title_png extends lime.graphics.Image {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/music/Pixelland.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_pixelland_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/music/pixelland.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_pixelland_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/music/victory.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_victory_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/music/victory.ogg") @:noCompletion #if display private #end class __ASSET__assets_music_victory_ogg extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/block.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_block_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/brick.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_brick_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/coin.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_coin_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/damage.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_damage_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/death.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_death_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/defeat.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_defeat_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/dying.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_dying_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/fireball.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_fireball_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/goal.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_goal_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/jump.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_jump_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/powerup-appear.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_powerup_appear_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/powerup.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_powerup_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/time-convert.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_time_convert_wav extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,9,0/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,9,0/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,9,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,9,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,9,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,9,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__assets_data_pixel_font_ttf') @:noCompletion #if display private #end class __ASSET__assets_data_pixel_font_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/data/pixel-font"; #else ascender = 1024; descender = -256; height = 1309; numGlyphs = 89; underlinePosition = 77; underlineThickness = 51; unitsPerEM = 1024; #end name = "Early GameBoy Regular"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__assets_data_pixel_font_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_data_pixel_font_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_data_pixel_font_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__assets_data_pixel_font_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_data_pixel_font_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_data_pixel_font_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
