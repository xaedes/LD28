package ld28 {
	import ash.core.Engine;
	import ash.core.Entity;
	import flash.ui.Keyboard;
	import ld28.components.Audio;
	import ld28.components.Collision;
	import ld28.components.Display;
	import ld28.components.EnergyParticle;
	import ld28.components.EnergyStorage;
	import ld28.components.Motion;
	import ld28.components.MotionControls;
	import ld28.components.Mover;
	import ld28.components.Position;
	import ld28.graphics.CircleView;
	import ld28.graphics.MoverView;
	
	public class EntityCreator {
		private var engine:Engine;
		private var config:GameConfig;
		
		public function EntityCreator(engine:Engine, config:GameConfig) {
			this.engine = engine;
			this.config = config;
		}
		
		public function destroyEntity(entity:Entity):void {
			engine.removeEntity(entity);
		}
		
		public function createGame():Entity {
			var gameEntity:Entity = new Entity("game");
			engine.addEntity(gameEntity);
			
			return gameEntity;
		}
		
		public function createPlayer():Entity {
			var entity:Entity = new Entity();
			
			var radius:Number = 10;
			
			var moverView:MoverView = new MoverView(radius);
			with (entity) {
				add(new Position(config.width / 2, config.height / 2));
				add(new Display(moverView));
				add(new Mover(moverView, 0.001));
				add(new Motion(0, 0, 0.95));
				add(new EnergyStorage(10, 5));
				add(new MotionControls(Keyboard.A, Keyboard.D, Keyboard.W, Keyboard.S, 1000));
				add(new Collision(radius));
				add(new Audio());
			}
			
			engine.addEntity(entity);
			return entity;
		}
		
		public function createEnergyParticle():Entity {
			var entity:Entity = new Entity();
			
			var radius:Number = 2;
			
			var circleView:CircleView = new CircleView(radius, 0xFFF4BA);
			with (entity) {
				add(new Position(Utils.randomRange(0, config.width), Utils.randomRange(0, config.height)));
				add(new Display(circleView));
				add(new Motion(Utils.randomRange(-10, 10), Utils.randomRange(-10, 10), 1));
				add(new EnergyStorage(1, 1));
				add(new Collision(radius));
				add(new EnergyParticle());
			}
			
			engine.addEntity(entity);
			return entity;
		}
	
	}
}
