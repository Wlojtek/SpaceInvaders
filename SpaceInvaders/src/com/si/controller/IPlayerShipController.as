package com.si.controller
{
	import flash.events.KeyboardEvent;

	public interface IPlayerShipController
	{
		function moveShipLeft():void;
		function moveShipRight():void;
		function shoot():void;
		
		function keyPressHandler(event:KeyboardEvent):void;
	}
}