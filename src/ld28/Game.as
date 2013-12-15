package ld28 {
	import ash.core.Engine;
	import ash.tick.FrameTickProvider;
	import flash.display.DisplayObjectContainer;
	import ld28.graphics.Redrawable;
	import ld28.systems.AnchorSystem;
	import ld28.systems.AudioSystem;
	import ld28.systems.CollisionSystem;
	import ld28.systems.CollisionWithSpatialHashingSystem;
	import ld28.systems.EnergyCollectingCollisionSystem;
	import ld28.systems.EnergyProducerSystem;
	import ld28.systems.EnergyStorageEmitterSystem;
	import ld28.systems.EnergyStorageViewSystem;
	import ld28.systems.GravitySystem;
	import ld28.systems.MembranSystem;
	import ld28.systems.MotionControlSystem;
	import ld28.systems.MovementSystem;
	import ld28.systems.RedrawingSystem;
	import ld28.systems.RenderSystem;
	import ld28.systems.SolidCollisionSystem;
	import ld28.systems.SpatialHashingSystem;
	
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
			// todo: add priorites (CollisionSystem < SolidCollisionSystem, CollisionSystem < EnergyCollectingCollisionSystem)
			var spatialHashingSystem:SpatialHashingSystem = new SpatialHashingSystem(config, 20);
			var k:int = 0;
			engine.addSystem(new RedrawingSystem(), k++);
			engine.addSystem(new RenderSystem(container), k++);
			engine.addSystem(new MovementSystem(config), k++);
			engine.addSystem(new GravitySystem(), k++);
			engine.addSystem(new MotionControlSystem(keyPoll), k++);
			engine.addSystem(new EnergyStorageViewSystem(), k++);
			//engine.addSystem(new CollisionSystem(), 0);
			engine.addSystem(spatialHashingSystem, k++);
			engine.addSystem(new CollisionWithSpatialHashingSystem(spatialHashingSystem), k++);
			engine.addSystem(new EnergyCollectingCollisionSystem(creator, config), k++);
			engine.addSystem(new SolidCollisionSystem(), k++);
			engine.addSystem(new EnergyStorageEmitterSystem(creator), k++);
			engine.addSystem(new AnchorSystem(), k++);
			engine.addSystem(new AudioSystem(), k++);
			engine.addSystem(new EnergyProducerSystem(), k++);
			engine.addSystem(new MembranSystem(creator), k++);
			
			// create entities
			creator.createGame();
			
			var i:int;
			// spawn energy particles
			for (i = 0; i < 10; i++) {
				creator.createEnergyParticle();
			}
			// spawn energy producers
			for (i = 0; i < 10; i++) {
				creator.createEnergyProducer();
			}
			// spawn membran parts
			for (i = 0; i < 1; i++) {
				creator.createMembranPart();
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