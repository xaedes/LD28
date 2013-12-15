package ld28.components {
	import ash.core.Entity;
	
	public class DistanceConstraint {
		public var entity1:Entity;
		public var entity2:Entity;
		public var distance:Number;
		public var damp:Number;
		public var strength:Number;
		
		public function DistanceConstraint(entity1:Entity, entity2:Entity, distance:Number, damp:Number = 0.99, strength:Number = 0.3) {
			this.entity1 = entity1;
			this.entity2 = entity2;
			this.distance = distance;
			this.strength = strength;
			this.damp = damp;
		}
	
	}

}