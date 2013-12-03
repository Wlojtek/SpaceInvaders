package com.si.model
{
	import com.si.model.Bullet;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class Model extends EventDispatcher
	{
		//--------------------------------------------------------------------------
		//
		//  Fields
		//
		//--------------------------------------------------------------------------
		
		private var _level:uint = 0;
		private var _score:uint = 0;
		private var _lives:uint = 0;
		
		private var _shipsHorizontal:uint;
		private var _shipsVertical:uint;
		
		private var _boardHeight:uint;
		private var _boardWidth:uint;
		
		public function get boardWidth():uint
		{
			return _boardWidth;
		}

		public function get boardHeight():uint
		{
			return _boardHeight;
		}

		public function get shipsVertical():uint
		{
			return _shipsVertical;
		}

		public function get shipsHorizontal():uint
		{
			return _shipsHorizontal;
		}

		public function get lives():uint
		{
			return _lives;
		}
		
		public function get score():uint
		{
			return _score;
		}
		
		public function get level():uint
		{
			return _level;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function Model(_lives:uint, boardHeight:uint, boardWidth:uint, /*shipsHorizontal:uint, shipsVertical:uint,*/ target:IEventDispatcher=null)
		{
			super(target);
			
			_lives = lives;
			
			_boardHeight = boardHeight;
			_boardWidth = boardWidth;
			
			/*_shipsHorizontal = shipsHorizontal;
			_shipsVertical = shipsVertical;*/
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		public function addScore(value:uint):void
		{
			_score += value;
		}
		
		public function levelUp():void
		{
			_level++;
		}
		
		public function liveUp():void
		{
			_lives++;
		}
		
		public function liveDown():void
		{
			_lives--;
		}
	}
}