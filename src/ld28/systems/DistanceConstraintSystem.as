package ld28.systems {
	import ash.tools.ListIteratingSystem;
	import flash.geom.Point;
	import flash.geom.Utils3D;
	import ld28.components.Motion;
	import ld28.components.Position;
	import ld28.nodes.DistanceConstraintNode;
	import ld28.Utils;
	
	public class DistanceConstraintSystem extends ListIteratingSystem {
		
		public function DistanceConstraintSystem() {
			super(DistanceConstraintNode, updateNode);
		}
		
		private function updateNode(node:DistanceConstraintNode, time:Number):void {
			if (node.distanceConstraint.entity1.has(Position) && node.distanceConstraint.entity2.has(Position) && node.distanceConstraint.entity1.has(Motion) && node.distanceConstraint.entity2.has(Motion)) {
				var pos1:Position = node.distanceConstraint.entity1.get(Position);
				var pos2:Position = node.distanceConstraint.entity2.get(Position);
				var mot1:Motion = node.distanceConstraint.entity1.get(Motion);
				var mot2:Motion = node.distanceConstraint.entity2.get(Motion);
				
				// constraint axis
				var rel:Point = pos1.position.subtract(pos2.position);
				var relNorm = rel.clone();
				relNorm.normalize(1);
				
				// damp velocity along constraint axis
				dampAlongAxis(mot1.velocity, relNorm, node.distanceConstraint.damp);
				dampAlongAxis(mot2.velocity, relNorm, node.distanceConstraint.damp);
				
				// add velocity to get desired distance
				var velocCorr:Number = node.distanceConstraint.strength * (rel.length - node.distanceConstraint.distance);
				Utils.pointAdd(mot1.velocity, Utils.mult(relNorm, -velocCorr));
				Utils.pointAdd(mot2.velocity, Utils.mult(relNorm, velocCorr));
			}
		}
		
		private function dampAlongAxis(vec:Point, axisNormalised:Point, damp:Number):void {
			var projected:Number = Utils.dot(vec, axisNormalised);
			var damped:Number = damp * projected;
			var damping:Point = Utils.mult(axisNormalised, projected - damped);
			Utils.pointSub(vec, damping);
		}
	}
}
