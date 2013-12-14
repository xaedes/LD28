package ld28 {
	import ash.core.Engine;
	import ash.core.Entity;
	import flash.ui.Keyboard;
	import ld28.components.Display;
	import ld28.components.Motion;
	import ld28.components.MotionControls;
	import ld28.components.Position;
	import ld28.graphics.CircleView;
	
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
			
			var circleView:CircleView = new CircleView(10);
			with (entity) {
				add(new Position(config.width / 2, config.height / 2, 0));
				add(new Display(circleView));
				add(new Motion(20, 20, 0.95));
				add(new MotionControls(Keyboard.A, Keyboard.D, Keyboard.W, Keyboard.S, 1000));
			}
			
			engine.addEntity(entity);
			return entity;
		}
	
	}
}
