package com.si.model
{
	import flash.events.IEventDispatcher;

	public interface IPlayerShip extends IEventDispatcher
	{
		function moveLeft():void;
		function moveRight():void;
		
		function fire():Bullet;
		function getShip():Ship;
	}
}