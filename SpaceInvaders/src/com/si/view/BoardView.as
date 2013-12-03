package com.si.view
{
	import com.si.events.PlayerEvent;
	import com.si.model.IShipsModel;
	import com.si.model.PlayerShip;
	import com.si.model.Ship;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class BoardView extends Sprite
	{	
		private var _ships:Vector.<ShipViewBase> = new Vector.<ShipViewBase>();
		private var _bullets:Vector.<BulletView> = new Vector.<BulletView>();
		
		private var _playerShipView:PlayerShipView;
		private var _playerShip:PlayerShip;
		
		private var _shipsModel:IShipsModel;
		
		public function BoardView(shipsModel:IShipsModel, playerShip:PlayerShip)
		{
			super();
			
			_shipsModel = shipsModel;
			_playerShip = playerShip;
			
			initialize();
		}
		
		public function getStage():Stage
		{
			return stage;
		}
		
		public function getPlayerShipView():ShipViewBase
		{
			return _playerShipView;
		}
		
		private function initialize():void
		{
			initializeShipsView();
			initializePlayerShip();
			
			_shipsModel.addEventListener(Event.CHANGE, _shipsModel_changeHandler);
			_playerShip.addEventListener(PlayerEvent.SHIP_MOVE, playerShip_moveHandler);
		}
		
		private function initializeShipsView():void
		{
			var ships:Vector.<Ship> = _shipsModel.getShips();
			
			for each (var ship:Ship in ships)
			{
				var shipView:InvaderShipView = new InvaderShipView(ship);
				
				addChild(shipView);
				
				this._ships.push(shipView);
			}
		}
		
		private function initializePlayerShip():void
		{
			var playerShip:Ship = _shipsModel.getPlayerShip();
			_playerShipView = new PlayerShipView(playerShip);
			
			_playerShipView.update();
			
			addChild(_playerShipView);
		}
		
		private function playerShip_moveHandler(event:PlayerEvent):void
		{
			_playerShipView.update();
		}
		
		private function _shipsModel_changeHandler(event:Event):void
		{
			updateShips();
		}
		
		private function updateShips():void
		{
			var len:uint = _ships.length;
			
			for (var i:uint = 0; i < len; i++)
			{
				_ships[i].update();
			}
		}
	}
}