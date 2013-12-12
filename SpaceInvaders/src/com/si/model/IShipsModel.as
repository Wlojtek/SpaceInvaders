package com.si.model
{
	import flash.events.IEventDispatcher;

	public interface IShipsModel extends IEventDispatcher
	{
		function addShip(ship:Ship):void;
		function removeShip(ship:Ship):void;
		function removeShips(ships:Vector.<Ship>):void;
		
		function getShips():Vector.<Vector.<Ship>>;
		
		function haveAnyShips():Boolean;
		
		function moveShips():void;
		function getPlayerShip():Ship;
	}
}