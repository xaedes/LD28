package ld28.components {
	
	public class ElasticCollision {
		//coefficient of restitution which varies from 0 (totally plastic) to 1 (totally elastic)
		public var elasticity:Number = 0;
		
		public function ElasticCollision(elasticity:Number) {
			this.elasticity = elasticity;
		}
	}
}
