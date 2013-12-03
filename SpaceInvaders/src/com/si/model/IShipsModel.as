package com.si.model
{
	import flash.events.IEventDispatcher;

	public interface IShipsModel extends IEventDispatcher
	{
		function addShip(ship:Ship):void;
		function removeShip(ship:Ship):void;
		
		function getShips():Vector.<Ship>;
		
		function moveShips():void;
		
		function getPlayerShip():Ship;
	}
}