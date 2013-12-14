package ld28 {
	import ash.core.Engine;
	import ash.tick.FrameTickProvider;
	import flash.display.DisplayObjectContainer;
	import ld28.systems.CollisionSystem;
	import ld28.systems.MotionControlSystem;
	import ld28.systems.MovementSystem;
	import ld28.systems.MoverEnergyStorageSystem;
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
		private var config:GameConfig;
		
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
			keyPoll = new KeyPoll(container.stage);
			config = new GameConfig();
			config.width = width;
			config.height = height;
			creator = new EntityCreator(engine, config);
			
			// add systems
			engine.addSystem(new RenderSystem(container), 0);
			engine.addSystem(new MovementSystem(), 0);
			engine.addSystem(new MotionControlSystem(keyPoll), 0);
			engine.addSystem(new MoverEnergyStorageSystem(), 0);
			engine.addSystem(new CollisionSystem(creator), 0);
			
			// create entities
			creator.createGame();
			for (var i:int = 0; i < 10; i++) {
				creator.createEnergyParticle();
			}
			creator.createPlayer();
		}
		
		public function start():void {
			tickProvider = new FrameTickProvider(container);
			tickProvider.add(engine.update);
			tickProvider.start();
		}
	}

}