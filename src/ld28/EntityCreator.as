package ld28 {
	import ash.core.Engine;
	import ash.core.Entity;
	import ld28.components.Display;
	import ld28.components.Motion;
	import ld28.components.Position;
	import ld28.graphics.CircleView;
	
	public class EntityCreator {
		private var engine:Engine;
		private var waitEntity:Entity;
		
		public function EntityCreator(engine:Engine) {
			this.engine = engine;
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
			
			var circleView:CircleView = new CircleView();
			with (entity) {
				add(new Position(0, 0, 0));
				add(new Display(circleView));
				add(new Motion(20, 20, 0.995));
			}
			
			engine.addEntity(entity);
			return entity;
		}
	
	}
}
