package com.si.view
{
	import com.si.events.BulletEvent;
	import com.si.events.PlayerEvent;
	import com.si.events.ShipEvent;
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
		//--------------------------------------------------------------------------
		//
		//	Fields
		//
		//--------------------------------------------------------------------------
		
		private var _ships:Vector.<ShipViewBase> = new Vector.<ShipViewBase>();
		private var _bullets:Vector.<BulletView> = new Vector.<BulletView>();
		
		private var _playerShipView:PlayerShipView;
		private var _playerShip:PlayerShip;
		
		private var _shipsModel:IShipsModel;
		private var _bulletsModel:IBulletsModel;
		
		//--------------------------------------------------------------------------
		//
		//	Constructor
		//
		//--------------------------------------------------------------------------
		
		public function BoardView(shipsModel:IShipsModel, bulletsModel:IBulletsModel)
		{
			super();
			
			_shipsModel = shipsModel;
			_bulletsModel = bulletsModel;
			
			initialize();
		}
		
		//--------------------------------------------------------------------------
		//
		//	Public methods
		//
		//--------------------------------------------------------------------------
		
		public function getStage():Stage
		{
			return stage;
		}
		
		public function getPlayerShipView():ShipViewBase
		{
			return _playerShipView;
		}
		
		public function getShipsView():Vector.<ShipViewBase>
		{
			return _ships;
		}
		
		public function getBulletsView():Vector.<BulletView>
		{
			return _bullets;
		}
		
		//--------------------------------------------------------------------------
		//
		//	Private methods
		//
		//--------------------------------------------------------------------------
		
		private function initialize():void
		{
			initializeShipsView();
			
			_shipsModel.addEventListener(Event.CHANGE, _shipsModel_changeHandler);
			
			_bulletsModel.addEventListener(Event.CHANGE, _bulletsModel_changeHandler);
			_bulletsModel.addEventListener(BulletEvent.ADD_BULLET, _bulletsModel_addBulletHandler);
			_bulletsModel.addEventListener(BulletEvent.REMOVE_BULLET, _bulletsModel_removeBulletHandler);
			
			_shipsModel.addEventListener(ShipEvent.REMOVE_SHIP, _shipsModel_removeShipHandler);
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
				{
					removeBulletView(_bullets[i]);
					return;
				}
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
		
		private function removeShipView(shipView:ShipViewBase):void
		{
			removeChild(shipView);
			
			var index:int = _ships.indexOf(shipView);
			
			if (index != -1)
				_ships.splice(index, 1);
		}
		
		private function _shipsModel_removeShipHandler(event:ShipEvent):void
		{
			var shipsToRemove:Ship = event.ship;
			var len:uint = _ships.length;
			
			for (var i:uint = 0; i <  len; i++)
			{
				if(_ships[i].compareByShip(shipsToRemove))
				{
					removeShipView(_ships[i]);
					break;
				}
			}
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