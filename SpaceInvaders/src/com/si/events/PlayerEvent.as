package com.si.events
{
	import flash.events.Event;
	
	public class PlayerEvent extends Event
	{
		public static const SHIP_MOVE:String = "shipMove";
		
		public function PlayerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}