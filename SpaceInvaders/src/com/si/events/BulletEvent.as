package com.si.events
{
	import flash.events.Event;
	
	public class BulletEvent extends Event
	{
		
		
		public function BulletEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}