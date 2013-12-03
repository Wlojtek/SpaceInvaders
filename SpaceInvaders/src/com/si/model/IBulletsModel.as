package com.si.model
{
	import com.si.model.Bullet;

	public interface IBulletsModel
	{
		function addBullet(bullet:Bullet):void;
		function removeBullet(bullet:Bullet):void;
		
		function updateBullets():void
	}
}