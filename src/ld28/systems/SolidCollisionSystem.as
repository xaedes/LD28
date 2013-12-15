package ld28.systems {
	import ash.core.Engine;
	import ash.core.NodeList;
	import ash.core.System;
	import flash.geom.Point;
	import ld28.EntityCreator;
	import ld28.nodes.SolidCollisionNode;
	import ld28.Utils;
	
	public class SolidCollisionSystem extends System {
		private var creator:EntityCreator;
		private var solids:NodeList;
		
		public function SolidCollisionSystem(creator:EntityCreator) {
			this.creator = creator;
		}
		
		override public function addToEngine(engine:Engine):void {
			solids = engine.getNodeList(SolidCollisionNode);
		}
		
		override public function update(time:Number):void {
			var solid1:SolidCollisionNode;
			var solid2:SolidCollisionNode;
			for (solid1 = solids.head; solid1; solid1 = solid1.next) {
				for (solid2 = solid1.next; solid2; solid2 = solid2.next) {
					var radiusSum:Number = solid1.collision.radius + solid2.collision.radius;
					if (Point.distance(solid1.position.position, solid2.position.position) <= radiusSum) {
						trace();
						// resolve collision by moving the solids
						var m1:Number = solid1.mass.mass;
						var m2:Number = solid2.mass.mass;
						var massSum:Number = m1 + m2;
						var diff:Point = solid1.position.position.subtract(solid2.position.position);
						var diffNorm:Point = diff.clone();
						diffNorm.normalize(1);
						var diffLen:Number = diff.length;
						solid1.position.position = solid1.position.position.add(Utils.mult(diffNorm, (radiusSum - diffLen) * m2 / massSum));
						solid2.position.position = solid2.position.position.subtract(Utils.mult(diffNorm, (radiusSum - diffLen) * m1 / massSum));
						
						diff = solid2.position.position.subtract(solid1.position.position);
						diffNorm = diff.clone();
						diffNorm.normalize(1);
						
						// offset velocities to achieve elastic collision
						var v1:Number = Utils.dot(solid1.motion.velocity, diffNorm); // project solid1 velocity along diff vector
						var v2:Number = Utils.dot(solid2.motion.velocity, diffNorm); // project solid2 velocity along diff vector
						var u1:Number = ((m1 - m2) * v1 + 2 * m2 * v2) / (massSum); // solid1 velocity after elastic impact
						var u2:Number = ((m2 - m1) * v2 + 2 * m1 * v1) / (massSum); // solid2 velocity after elastic impact
						
						//coefficient of restitution which varies from 0 (totally plastic) to 1 (totally elastic)
						var e:Number = (solid1.solidCollision.elasticity * m1 + solid2.solidCollision.elasticity * m2) / massSum;
						
						// subtract projected part of velocity
						solid1.motion.velocity = solid1.motion.velocity.subtract(Utils.mult(diffNorm, v1));
						//add velocity impact change
						solid1.motion.velocity = solid1.motion.velocity.add(Utils.mult(diffNorm, u1 * e));
						
						//subtract projected part of velocity
						solid2.motion.velocity = solid2.motion.velocity.subtract(Utils.mult(diffNorm, v2));
						//add velocity impact change
						solid2.motion.velocity = solid2.motion.velocity.add(Utils.mult(diffNorm, u2 * e));
						
					}
				}
			}
		}
		
		override public function removeFromEngine(engine:Engine):void {
			solids = null;
		
		}
	}
}
