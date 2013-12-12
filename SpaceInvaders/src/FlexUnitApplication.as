package
{
	import Array;
	
	import flash.display.Sprite;
	
	import flexUnitTests.BulletTestCase;
	import flexUnitTests.BulletsModelTestCase;
	import flexUnitTests.InvaderShipFactoryTest;
	import flexUnitTests.ShipTestCase;
	import flexUnitTests.ShipsModelTestCase;
	
	import flexunit.flexui.FlexUnitTestRunnerUIAS;
	
	public class FlexUnitApplication extends Sprite
	{
		public function FlexUnitApplication()
		{
			onCreationComplete();
		}
		
		private function onCreationComplete():void
		{
			var testRunner:FlexUnitTestRunnerUIAS=new FlexUnitTestRunnerUIAS();
			testRunner.portNumber=8765; 
			this.addChild(testRunner); 
			testRunner.runWithFlexUnit4Runner(currentRunTestSuite(), "SpaceInvaders");
		}
		
		public function currentRunTestSuite():Array
		{
			var testsToRun:Array = new Array();
			testsToRun.push(flexUnitTests.BulletsModelTestCase);
			testsToRun.push(flexUnitTests.BulletTestCase);
			testsToRun.push(flexUnitTests.InvaderShipFactoryTest);
			testsToRun.push(flexUnitTests.ShipsModelTestCase);
			testsToRun.push(flexUnitTests.ShipTestCase);
			return testsToRun;
		}
	}
}