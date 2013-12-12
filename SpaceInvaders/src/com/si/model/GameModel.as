package com.si.model
{
	import com.si.model.Bullet;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class GameModel extends EventDispatcher implements IGameModel
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

		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function GameModel(lives:uint, boardHeight:uint, boardWidth:uint, shipsHorizontal:uint, shipsVertical:uint, target:IEventDispatcher=null)
		{
			super(target);
			
			_lives = lives;
			
			_boardHeight = boardHeight;
			_boardWidth = boardWidth;
			
			_shipsHorizontal = shipsHorizontal;
			_shipsVertical = shipsVertical;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public Methods
		//
		//--------------------------------------------------------------------------
		
		public function addScore(value:uint):void
		{
			_score += value;
			
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		public function levelUp():void
		{
			_level++;
			
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		public function liveUp():void
		{
			_lives++;
			
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		public function liveDown():void
		{
			_lives--;
			
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		public function getLives():uint
		{
			return _lives;
		}
		
		public function getScore():uint
		{
			return _score;
		}
		
		public function getLevel():uint
		{
			return _level;
		}
	}
}