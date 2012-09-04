package com.maddashrobo;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.Lib;

/**
 * ...
 * @author Jonathan Dunlap
 */

class Main extends Sprite
{
	
	static function main() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		// entry point
		stage.addChild(new Main());
	}
	
	public function new() {
		super();
		trace("greetings");
	}
	
}