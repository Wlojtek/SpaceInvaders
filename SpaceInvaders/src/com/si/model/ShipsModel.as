package com.si.model
{
	import com.si.events.ShipEvent;
	
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
		
		private var _moveDirection:uint = 1; 
		
		private var _boardHeight:uint = 200;
		private var _boardWidth:uint = 200;
		private var _shipsNum:uint = 0;
		
		private static const SPACER:uint = 30;
		public static const SHIPS_SPEED:uint = 10;
		
		public function ShipsModel(shipFactory:ShipFactory, verticalShips:uint, horizontalShips:uint, target:IEventDispatcher=null)
		{
			super(target);
			
			_shipFactory = shipFactory;
			_verticalShips = verticalShips;
			_horizontalShips = horizontalShips;
			
			initialize();
		}

		public function addShip(ship:Ship):void
		{
			var index:uint = 0;
			
			if (_ships.length == 0)
			{
				index = _ships.push(new Vector.<Ship>());
				index--;
			}
			
			_ships[index].push(ship);
			
			_shipsNum++;
		}
		
		public function haveAnyShips():Boolean
		{
			return _shipsNum > 0;
		}
		
		public function removeShip(ship:Ship):void
		{
			var lenW:uint = _ships.length;
			var shipsRemoved:Vector.<Ship>;
			
			for (var i:uint = 0; i < lenW; i++)
			{
				var index:int = _ships[i].indexOf(ship);
				
				if (index != -1)
				{
					shipsRemoved = _ships[i].splice(index, 1);
					break;
				}
			}
			
			if (shipsRemoved)
			{
				_shipsNum--;
				dispatchEvent(new ShipEvent(ShipEvent.REMOVE_SHIP, shipsRemoved[0]));
			}
		}
		
		public function removeShips(ships:Vector.<Ship>):void
		{
			var len:uint = ships.length;
			
			for (var i:uint = 0; i < len; i++)
				removeShip(ships[i]);
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
			checkShipsStatus();
			
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
		
		private function checkShipsStatus():void
		{
			var hitBottom:Boolean = hitBottom();
			
			if (hitBottom)
				dispatchEvent(new ShipEvent(ShipEvent.SHIP_HIT_BOTTOM, null)); 
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
					_ships[i][j].x += SHIPS_SPEED;					
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
					_ships[i][j].y += SHIPS_SPEED;					
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
					_ships[i][j].x -= SHIPS_SPEED;					
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
				if (_ships[rightIndex][0].x >= _boardWidth)
					hitRight = true;
			}
			
			return hitRight;
		}
		
		private function hitLeftBound():Boolean
		{
			var len:uint = _ships.length;
			var leftIndex:int = -1;
			var hitLeft:Boolean = false;
			
			for(var i:int = 0; i < len; i++)
			{
				if (_ships[i].length > 0)
				{
					leftIndex = i;
					break;
				}
			}
			
			if (hitLeft != -1)
			{
				if (_ships[leftIndex][0].x <= 0)
					hitLeft = true;
			}
			
			return hitLeft;
		}
		
		private function hitBottom():Boolean
		{
			var len:uint = _ships.length;
			var hitBottom:Boolean = false;
			
			for(var i:int = 0; i < len; i++)
			{
				var columnLen:uint = _ships[i].length;
				
				if (_ships[i][columnLen - 1].y >= _boardHeight)
				{
					hitBottom = true;
				}
			}
			
			return hitBottom;
		}
	}
}