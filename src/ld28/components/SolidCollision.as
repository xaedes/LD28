package ld28.components {
	
	public class SolidCollision {
		//coefficient of restitution which varies from 0 (totally plastic) to 1 (totally elastic)
		public var elasticity:Number = 0;
		
		public function SolidCollision(elasticity:Number) {
			this.elasticity = elasticity;
		}
	}
}
