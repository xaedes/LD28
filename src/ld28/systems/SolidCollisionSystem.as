package ld28.systems {
	import ash.core.ComponentMatchingFamily;
	import ash.core.Engine;
	import ash.core.Entity;
	import ash.core.NodeList;
	import ash.core.System;
	import flash.geom.Point;
	import ld28.nodes.SolidCollisionNode;
	import ld28.Utils;
	
	public class SolidCollisionSystem extends System {
		private var nodes:NodeList;
		private var family:ComponentMatchingFamily;
		
		public function SolidCollisionSystem() {
		}
		
		override public function addToEngine(engine:Engine):void {
			nodes = engine.getNodeList(SolidCollisionNode);
			family = ComponentMatchingFamily(engine.getFamily(SolidCollisionNode));
		}
		
		override public function update(time:Number):void {
			var node1:SolidCollisionNode;
			for (node1 = nodes.head; node1; node1 = node1.next) {
				for each (var entity:Entity in node1.collision.collidingEntities) {
					//var node2:SolidCollisionNode = SolidCollisionNode(family.nodeByEntity(entity));
					var node2:SolidCollisionNode = SolidCollisionNode(family.entities[entity]);
					if (node2) {
						handleCollision(node1, node2);
					}
				}
			}
		}
		
		protected function handleCollision(node1:SolidCollisionNode, node2:SolidCollisionNode):void {
			var radiusSum:Number = node1.circle.radius + node2.circle.radius;
			if (Point.distance(node1.position.position, node2.position.position) <= radiusSum) {
				// resolve collision by moving the solids
				var additionalDistance:Number = 0.01; // add addition distance to make sure they really won't intersect afterwards
				var m1:Number = node1.mass.mass;
				var m2:Number = node2.mass.mass;
				var massSum:Number = m1 + m2;
				var diff:Point = node1.position.position.subtract(node2.position.position);
				var diffNorm:Point = diff.clone();
				diffNorm.normalize(1);
				var moveAppart:Number = radiusSum - diff.length + additionalDistance;
				node1.position.position = node1.position.position.add(Utils.mult(diffNorm, moveAppart * m2 / massSum));
				node2.position.position = node2.position.position.subtract(Utils.mult(diffNorm, moveAppart * m1 / massSum));
				
				diff = node2.position.position.subtract(node1.position.position);
				diffNorm = diff.clone();
				diffNorm.normalize(1);
				
				// offset velocities to achieve elastic collision
				var v1:Number = Utils.dot(node1.motion.velocity, diffNorm); // project node1 velocity along diff vector
				var v2:Number = Utils.dot(node2.motion.velocity, diffNorm); // project node2 velocity along diff vector
				var u1:Number = ((m1 - m2) * v1 + 2 * m2 * v2) / (massSum); // node1 velocity after elastic impact
				var u2:Number = ((m2 - m1) * v2 + 2 * m1 * v1) / (massSum); // node2 velocity after elastic impact
				
				//coefficient of restitution which varies from 0 (totally plastic) to 1 (totally elastic)
				var e:Number = (node1.solidCollision.elasticity * m1 + node2.solidCollision.elasticity * m2) / massSum;
				
				// subtract projected part of velocity
				node1.motion.velocity = node1.motion.velocity.subtract(Utils.mult(diffNorm, v1));
				//add velocity impact change
				node1.motion.velocity = node1.motion.velocity.add(Utils.mult(diffNorm, u1 * e));
				
				//subtract projected part of velocity
				node2.motion.velocity = node2.motion.velocity.subtract(Utils.mult(diffNorm, v2));
				//add velocity impact change
				node2.motion.velocity = node2.motion.velocity.add(Utils.mult(diffNorm, u2 * e));
			}
		}
		
		override public function removeFromEngine(engine:Engine):void {
			nodes = null;
		
		}
	}
}
