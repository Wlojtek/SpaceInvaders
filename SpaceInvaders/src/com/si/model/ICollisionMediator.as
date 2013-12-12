package com.si.model
{
	import com.si.view.BulletView;
	import com.si.view.ShipViewBase;

	public interface ICollisionMediator
	{
		function registerBullets(bullets:IBulletsModel):void;
		function registerShips(ships:IShipsModel):void;
		
		function registerBulletsView(bullets:Vector.<BulletView>):void;
		function registerShipsView(ships:Vector.<ShipViewBase>):void;
		
		function checkCollisions():void;
	}
}