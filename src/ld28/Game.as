package ld28 {
	import ash.core.Engine;
	import ash.tick.FrameTickProvider;
	import flash.display.DisplayObjectContainer;
	import ld28.systems.MotionControlSystem;
	import ld28.systems.MovementSystem;
	import ld28.systems.RenderSystem;
	
	/**
	 * ...
	 * @author xaedes
	 */
	public class Game {
		private var container:DisplayObjectContainer;
		private var engine:Engine;
		private var tickProvider:FrameTickProvider;
		private var creator:EntityCreator;
		private var keyPoll:KeyPoll;
		
		public function Game(container:DisplayObjectContainer, width:Number, height:Number) {
			this.container = container;
			prepare(width, height);
		}
		
		// todo 
		// - add simple circle to be drawn
		//   - add entity for it
		//   - add movement
		
		private function prepare(width:Number, height:Number):void {
			engine = new Engine();
			creator = new EntityCreator(engine);
			keyPoll = new KeyPoll(container.stage);
			
			// add systems
			engine.addSystem(new RenderSystem(container), 0);
			engine.addSystem(new MovementSystem(), 0);
			engine.addSystem(new MotionControlSystem(keyPoll), 0);
			
			// create entities
			creator.createGame();
			creator.createPlayer();
		}
		
		public function start():void {
			tickProvider = new FrameTickProvider(container);
			tickProvider.add(engine.update);
			tickProvider.start();
		}
	}

}