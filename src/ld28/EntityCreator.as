package ld28 {
	import ash.core.Engine;
	import ash.core.Entity;
	
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
		
		public function createCircle():Entity {
			var circle:Entity = new Entity();
			
			engine.addEntity(circle);
			return circle;
		}
	
	}
}
