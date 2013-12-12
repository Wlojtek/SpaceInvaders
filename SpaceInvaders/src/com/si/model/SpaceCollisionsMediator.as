package com.si.model
{
	import com.si.view.BulletView;
	import com.si.view.ShipViewBase;
	
	public class SpaceCollisionsMediator implements ICollisionMediator
	{
		//--------------------------------------------------------------------------
		//
		//	Fields
		//
		//--------------------------------------------------------------------------
		
		private var _bullets:IBulletsModel;
		private var _ships:IShipsModel;
		
		private var _bulletsView:Vector.<BulletView>;
		private var _shipsView:Vector.<ShipViewBase>;
		
		private var _game:IGameModel;
		
		//--------------------------------------------------------------------------
		//
		//	Constructor
		//
		//--------------------------------------------------------------------------
		
		public function SpaceCollisionsMediator()
		{
		}
		
		//--------------------------------------------------------------------------
		//
		//	Public Methods
		//
		//--------------------------------------------------------------------------
		
		public function registerBullets(bullets:IBulletsModel):void
		{
			_bullets = bullets;
		}
		
		public function registerShips(ships:IShipsModel):void
		{
			_ships = ships;
		}
		
		public function registerBulletsView(bullets:Vector.<BulletView>):void
		{
			_bulletsView = bullets;	
		}
		
		public function registerShipsView(shipsView:Vector.<ShipViewBase>):void
		{
			_shipsView = shipsView;
		}
		
		public function registerGameModel(gameModel:IGameModel):void
		{
			_game = gameModel;	
		}
		
		public function checkCollisions():void
		{
			var bulletsLen:uint = _bulletsView.length;
			var shipsLen:uint = _shipsView.length;
			
			if (!bulletsLen)
				return;
			
			var bulletsToRemove:Vector.<Bullet> = new Vector.<Bullet>();
			var shipsToRemove:Vector.<Ship> = new Vector.<Ship>();
			
			for (var i:uint = 0; i < bulletsLen; i++) 
			{
				for (var j:uint = 0; j < shipsLen; j++) 
				{
					if (_bulletsView[i].hitTestObject(_shipsView[j]))
					{
						var ship:Ship = _shipsView[j].ship;
						var bullet:Bullet = _bulletsView[i].bullet;
						
						shipsToRemove.push(ship);
						bulletsToRemove.push(bullet);
						
						_game.addScore(uint(ship.getProperty('value')));
						break;
					}
				}
			}
			
			_bullets.removeBullets(bulletsToRemove);
			_ships.removeShips(shipsToRemove);
			
		}
	}
}