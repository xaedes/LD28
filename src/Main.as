package {
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width='600',height='450',frameRate='60',backgroundColor='#000000')]
	
	public class Main extends Sprite {
		private var game:Game;
		
		public function Main():void {
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			game = new Game(this, stage.stageWidth, stage.stageHeight);
			game.start();
		}
	
	}

}