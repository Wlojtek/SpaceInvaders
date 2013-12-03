package com.si.model
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;

	public class ShipsModel extends EventDispatcher implements IShipsModel
	{
		private var _ships:Vector.<Ship> = new Vector.<Ship>;
		private var _playerShip:Ship;
		private var _shipFactory:ShipFactory;
		
		private var _verticalShips:uint;
		private var _horizontalShips:uint;
		
		private var _shipsSize:uint;
		
		private var _shipsSpeed:uint = 10; 
		private var _moveDirection:uint = 1; 
		
		private static const SPACER:uint = 30;
		
		private var _boardHeight:uint = 200;
		private var _boardWidth:uint = 200;
		
		public function ShipsModel(shipFactory:ShipFactory, verticalShips:uint, horizontalShips:uint, target:IEventDispatcher=null)
		{
			super(target);
			
			_shipFactory = shipFactory;
			_verticalShips = verticalShips;
			_horizontalShips = horizontalShips;
			_shipsSize = _verticalShips*_horizontalShips;
			
			initialize();
		}
		
		private function initialize():void
		{
			_playerShip = _shipFactory.generateDefaultShip();

			_ships = new Vector.<Ship>(_shipsSize);
			
			initializeShips();
		}
		
		private function initializeShips():void
		{
			var currentX:uint = 0;
			var currentY:uint = 0;
			var j:uint = 1;
			
			for (var i:uint = 0; i < _shipsSize; i++)
			{
				var ship:Ship = _shipFactory.generateDefaultShip();
				ship.x =  currentX;
				ship.y =  currentY;
				
				_ships[i] = ship;
				
				if ((i + 1) >=  j*_horizontalShips)
				{
					currentX = 0;
					currentY = currentY + SPACER;
					j++;
				}
				else
					currentX += SPACER;
			}
		}
		
		public function addShip(ship:Ship):void
		{
			_ships.push(ship);
		}
		
		public function removeShip(ship:Ship):void
		{
			var index:int = _ships.indexOf(ship);
			
			if (index != -1)
				_ships.splice(index, 1);
			
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		public function getPlayerShip():Ship
		{
			return _playerShip;
		}
		
		public function getShips():Vector.<Ship>
		{
			return _ships;
		}
		
		public function moveShips():void
		{
			if (_moveDirection > 0 )
				moveShipsRight();
			else
				moveShipsLeft();
			
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		private function checkHitLeftBound(xPos:uint):Boolean
		{
			return (xPos <= 0);
		}
		
		private function checkHitRightBound(xPos:uint):Boolean
		{
			return (xPos >= _boardWidth);
		}
		
		private function moveShipsRight():void
		{
			var len:uint = _ships.length;
			var hitRight:Boolean = false;
			
			for (var i:uint = 0; i < len; i++)
			{
				_ships[i].x += _shipsSpeed;
				
				if (hitRightBound(_ships[i].x))
				{
					hitRight = true;
					break;
				}
			}
			
			if (hitRight)
			{
				moveShipsDown();
				_moveDirection = 0;
			}
		}
		
		private function moveShipsDown():void
		{
			var len:uint = _ships.length;
			
			for (var i:uint = 0; i < len; i++)
			{
				_ships[i].y += _shipsSpeed;
			}
		}
		
		private function moveShipsLeft():void
		{
			var len:uint = _ships.length;
			var hitLeft:Boolean = false;
			
			for (var i:uint = 0; i < len; i++)
			{
				_ships[i].x -= _shipsSpeed;
				
				if (hitLeftBound(_ships[i].x))
				{
					hitLeft = true;
					break;
				}
			}
			
			if (hitLeft)
			{
				moveShipsDown();
				_moveDirection = 1;
			}
		}
	}
}