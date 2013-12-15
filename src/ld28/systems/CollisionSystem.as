package ld28.systems {
	import ash.core.Engine;
	import ash.core.NodeList;
	import ash.core.System;
	import flash.geom.Rectangle;
	import ld28.nodes.CollisionNode;
	import ld28.Utils;
	
	public class CollisionSystem extends System {
		private var nodes:NodeList;
		
		public function CollisionSystem() {
		}
		
		override public function addToEngine(engine:Engine):void {
			nodes = engine.getNodeList(CollisionNode);
		}
		
		protected function boundingRect(node:CollisionNode):Rectangle {
			return Utils.rectFromCenter(node.position.position, node.size.size.x, node.size.size.y);
		}
		
		override public function update(time:Number):void {
			var node1:CollisionNode;
			var node2:CollisionNode;
			
			// clear all collisions
			for (node1 = nodes.head; node1; node1 = node1.next) {
				node1.collision.collidingEntities.splice(0, node1.collision.collidingEntities.length);
			}
			
			// detect collisions
			for (node1 = nodes.head; node1; node1 = node1.next) {
				var boundingRect1:Rectangle = boundingRect(node1);
				for (node2 = node1.next; node2; node2 = node2.next) {
					var boundingRect2:Rectangle = boundingRect(node1);
					if (boundingRect1.intersects(boundingRect2)) {
						node1.collision.collidingEntities.push(node2.entity);
						node2.collision.collidingEntities.push(node1.entity);
					}
				}
			}
		}
		
		override public function removeFromEngine(engine:Engine):void {
			nodes = null;
		
		}
	}
}
