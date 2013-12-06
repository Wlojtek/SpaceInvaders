package com.si.model
{
	import com.si.model.Bullet;
	
	import flash.events.IEventDispatcher;

	public interface IBulletsModel extends IEventDispatcher
	{
		function addBullet(bullet:Bullet):void;
		function removeBullet(bullet:Bullet):void;
		function getBullets():Vector.<Bullet>;
		function updateBullets():void
	}
}