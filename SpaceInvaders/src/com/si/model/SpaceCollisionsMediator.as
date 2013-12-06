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
		private var _shipsView:Vector.<Vector.<ShipViewBase>>;
		
		
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
		
		public function registerBulletsView(shipsView:Vector.<Vector.<ShipViewBase>>):void
		{
			_shipsView = shipsView;
		}
		
		public function checkCollisions():void
		{
			var bulletsToRemove:Vector.<Bullet> = new Vector.<Bullet>();
			var shipsToRemove:Vector.<Ship> = [];
			
			var bulletsLen:uint = _bulletsView.length;
			
			for (var i:uint = 0; i < bulletsLen; i++) 
			{
				var shipsLen:uint = _shipsView[i].length;
				
				for (var j:uint = 0; j < shipsLen; j++) 
				{
					if (_bulletsView[i].hitTestObject(_shipsView[j]))
					{
						shipsToRemove.push(_shipsView[j].ship);
						bulletsToRemove.push(_bulletsView[i].bullet);
						break;
					}
				}
			}

		}
	}
}