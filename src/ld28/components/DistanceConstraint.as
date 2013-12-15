package ld28.components {
	import ash.core.Entity;
	
	public class DistanceConstraint {
		public var entity1:Entity;
		public var entity2:Entity;
		public var distance:Number;
		
		public function DistanceConstraint(entity1:Entity, entity2:Entity, distance:Number) {
			this.entity1 = entity1;
			this.entity2 = entity2;
			this.distance = distance;
		}
	
	}

}