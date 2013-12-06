package com.si.view
{
	import com.si.events.BulletEvent;
	import com.si.events.PlayerEvent;
	import com.si.model.Bullet;
	import com.si.model.IBulletsModel;
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
		private var _bulletsModel:IBulletsModel;
		
		public function BoardView(shipsModel:IShipsModel, bulletsModel:IBulletsModel, playerShip:PlayerShip)
		{
			super();
			
			_shipsModel = shipsModel;
			_playerShip = playerShip;
			_bulletsModel = bulletsModel;
			
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
			
			_bulletsModel.addEventListener(Event.CHANGE, _bulletsModel_changeHandler);
			_bulletsModel.addEventListener(BulletEvent.ADD_BULLET, _bulletsModel_addBulletHandler);
			_bulletsModel.addEventListener(BulletEvent.REMOVE_BULLET, _bulletsModel_removeBulletHandler);
		}
		
		private function initializeShipsView():void
		{
			var ships:Vector.<Vector.<Ship>> = _shipsModel.getShips();
			var lenW:uint = ships.length;
			
			for (var i:uint = 0; i < lenW; i++)
			{
				var lenH:uint = ships[i].length;
				
				for (var j:uint = 0; j < lenH; j++)
				{
					var shipView:InvaderShipView = new InvaderShipView(ships[i][j]);
					
					addChild(shipView);
					
					this._ships.push(shipView);
				}
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
		
		private function _bulletsModel_addBulletHandler(event:BulletEvent):void
		{
			var bulletView:BulletView = new BulletView(event.bullet);
			_bullets.push(bulletView);
			
			addChild(bulletView);
		}
		
		private function _bulletsModel_removeBulletHandler(event:BulletEvent):void
		{
			var bulletToRemove:Bullet = event.bullet;
			
			for (var i:uint = 0; i <  _bullets.length; i++)
			{
				if(_bullets[i].compareByBullet(bulletToRemove))
					removeBulletView(_bullets[i]);
			}
		}
		
		private function _bulletsModel_changeHandler(event:Event):void
		{
			updateBullets();
		}
		
		private function removeBulletView(bulletView:BulletView):void
		{
			removeChild(bulletView);
			
			var index:int = _bullets.indexOf(bulletView);
			
			if (index != -1)
				_bullets.splice(index, 1);
		}
		
		private function updateBullets():void
		{
			var len:uint = _bullets.length;
			
			for (var i:uint = 0; i < len; i++)
			{
				_bullets[i].update();
			}
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