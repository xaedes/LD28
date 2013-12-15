package ld28.systems {
	import ash.core.ComponentMatchingFamily;
	import ash.core.Engine;
	import ash.core.NodeList;
	import ash.core.System;
	import de.polygonal.ds.DLLNode;
	import flash.geom.Rectangle;
	import ld28.components.Radar;
	import ld28.etc.GridCell;
	import ld28.nodes.CollisionNode;
	import ld28.nodes.SpatialHashingNode;
	import ld28.Utils;
	
	public class CollisionWithSpatialHashingSystem extends System {
		private var nodes:NodeList;
		private var map:SpatialHashingSystem;
		private var family:ComponentMatchingFamily;
		
		public function CollisionWithSpatialHashingSystem(spatialHashingSystem:SpatialHashingSystem) {
			this.map = spatialHashingSystem;
		}
		
		override public function addToEngine(engine:Engine):void {
			nodes = engine.getNodeList(CollisionNode);
			family = ComponentMatchingFamily(engine.getFamily(CollisionNode));
		}
		
		protected function boundingRect(node:CollisionNode):Rectangle {
			return Utils.rectFromCenter(node.position.position, node.size.size.x, node.size.size.y);
		}
		
		override public function update(time:Number):void {
			var node1:CollisionNode;
			var node2:CollisionNode;
			
			// clear all collisions
			for (node1 = nodes.head; node1; node1 = node1.next) {
				//node1.collision.collidingEntities.clear(true); //todo test performance with purge
				node1.collision.clear();
					//node1.collision.collidingEntities.splice(0, node1.collision.collidingEntities.length);
			}
			
			var n:int = 0;
			
			var walker1:DLLNode;
			var walker2:DLLNode;
			
			//n = 0;
			// detect collisions
			for (var x:int = 0; x < map.gridWidth; x++) {
				for (var y:int = 0; y < map.gridHeight; y++) {
					var cell:GridCell = map.getCell(x, y);
					for (walker1 = cell.nodes.head; walker1; walker1 = walker1.next) {
						var spatialNode1:SpatialHashingNode = SpatialHashingNode(walker1.val);
						//node1 = CollisionNode(family.nodeByEntity(spatialNode.entity));
						node1 = CollisionNode(family.entities[spatialNode1.entity]);
						if (node1) {
							var boundingRect1:Rectangle = boundingRect(node1);
							for (walker2 = walker1.next; walker2; walker2 = walker2.next) {
								//for (node2 = node1.next; node2; node2 = node2.next) {
								var spatialNode2:SpatialHashingNode = SpatialHashingNode(walker2.val);
								if (node1.collision.collidingEntities[spatialNode2.entity]) {
									continue;
								}
								node2 = CollisionNode(family.entities[spatialNode2.entity]);
								if (node2) {
									var boundingRect2:Rectangle = boundingRect(node1);
									if (boundingRect1.intersects(boundingRect2)) {
										//if (node1.entity.has(Radar) || node2.entity.has(Radar)) {
										//trace("radar collision");
										//}
										n++;
										node1.collision.collidingEntities[node2.entity] = node2.entity;
										node2.collision.collidingEntities[node1.entity] = node1.entity;
											//node1.collision.collidingEntities.push(node2.entity);
											//node2.collision.collidingEntities.push(node1.entity);
											//node1.collision.collidingEntities.append(node2.entity);
											//node2.collision.collidingEntities.append(node1.entity);
									}
								}
							}
						}
							//trace(n);
					}
				}
			}
			
			trace(n);
		
		}
		
		override public function removeFromEngine(engine:Engine):void {
			nodes = null;
			family = null;
		
		}
	}
}
