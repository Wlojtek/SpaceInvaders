package com.si.model
{
	import flash.events.IEventDispatcher;

	public interface IGameModel extends IEventDispatcher
	{
		function getLevel():uint;
		function getScore():uint;
		function getLives():uint;
		
		function addScore(value:uint):void;
		function levelUp():void;
		function liveDown():void;
		function liveUp():void;
	}
}