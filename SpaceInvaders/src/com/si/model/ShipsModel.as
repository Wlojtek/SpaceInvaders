package com.si.model
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;

	public class ShipsModel extends EventDispatcher implements IShipsModel
	{
		private var _ships:Vector.<Vector.<Ship>> = new Vector.<Vector.<Ship>>;
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
		
		public function removeShips(ships:Vector.<Ship>):void
		{
			
		}
		
		public function getPlayerShip():Ship
		{
			return _playerShip;
		}
		
		public function getShips():Vector.<Vector.<Ship>>
		{
			return _ships;
		}
		
		public function moveShips():void
		{
			if (_moveDirection > 0 )
			{
				if (hitRightBound())
				{
					moveShipsDown();
					_moveDirection = 0;
				}
				else
					moveShipsRight();					
			}
			else
			{
				if (hitLeftBound())
				{
					moveShipsDown();
					_moveDirection = 1;
				}
				else
					moveShipsLeft();
			}
			
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		
		private function initialize():void
		{
			_playerShip = _shipFactory.generateDefaultShip();
			
			initializeShips();
		}
		
		private function initializeShips():void
		{
			for (var i:uint = 0; i < _horizontalShips; i++)
			{
				_ships[i] = new Vector.<Ship>(_verticalShips);
				
				for (var j:uint = 0; j < _horizontalShips; j++)
				{
					var ship:Ship = _shipFactory.generateDefaultShip();
					
					ship.x = i*(SPACER);
					ship.y = j*(SPACER);
					
					_ships[i][j] = ship;
				}
			}
		}
		
		
		private function moveShipsRight():void
		{
			var len:uint = _ships.length;
			
			for (var i:uint = 0; i < len; i++)
			{
				var lenH:uint = _ships[i].length;
				
				for (var j:uint = 0; j < lenH; j++)
				{
					_ships[i][j].x += _shipsSpeed;					
				}
			}
		}
		
		private function moveShipsDown():void
		{
			var len:uint = _ships.length;
			
			for (var i:uint = 0; i < len; i++)
			{
				var lenH:uint = _ships[i].length;
				
				for (var j:uint = 0; j < lenH; j++)
				{
					_ships[i][j].y += _shipsSpeed;					
				}
			}
		}
		
		private function moveShipsLeft():void
		{
			var len:uint = _ships.length;
			
			for (var i:uint = 0; i < len; i++)
			{
				var lenH:uint = _ships[i].length;
				
				for (var j:uint = 0; j < lenH; j++)
				{
					_ships[i][j].x -= _shipsSpeed;					
				}
			}
		}
		
		private function hitRightBound():Boolean
		{
			var len:uint = _ships.length;
			var rightIndex:int = -1;
			var hitRight:Boolean = false;
			
			for(var i:int = len - 1; i >= 0; i--)
			{
				 if (_ships[i].length > 0)
				 {
					 rightIndex = i;
					 break;
				 }
			}
			
			if (rightIndex != -1)
			{
				if (_ships[i][0].x >= _boardWidth)
					hitRight = true;
			}
			
			return hitRight;
		}
		
		private function hitLeftBound():Boolean
		{
			var len:uint = _ships.length;
			var leftIndex:int = -1;
			var hitLeft:Boolean = false;
			
			for(var i:int = 0; i < len; i--)
			{
				if (_ships[i].length > 0)
				{
					leftIndex = i;
					break;
				}
			}
			
			if (hitLeft != -1)
			{
				if (_ships[i][0].x <= 0)
					hitLeft = true;
			}
			
			return hitLeft;
		}
	}
}