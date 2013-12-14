package {
	import ash.core.Engine;
	import ash.tick.FrameTickProvider;
	import flash.display.DisplayObjectContainer;
	
	/**
	 * ...
	 * @author xaedes
	 */
	public class Game {
		private var container:DisplayObjectContainer;
		private var engine:Engine;
		private var tickProvider:FrameTickProvider;
		private var creator:EntityCreator;
		
		public function Game(container:DisplayObjectContainer, width:Number, height:Number) {
			this.container = container;
			prepare(width, height);
		}
		
		// todo 
		// - add simple circle to be drawn
		//   - add entity for it
		
		private function prepare(width:Number, height:Number):void {
			engine = new Engine();
			creator = new EntityCreator(engine);
			
			// add systems here
			// ...
			
			// create entities
			creator.createGame();
		}
		
		public function start():void {
			tickProvider = new FrameTickProvider(container);
			tickProvider.add(engine.update);
			tickProvider.start();
		}
	}

}