package ld28.systems {
	import ash.core.ComponentMatchingFamily;
	import ash.core.Engine;
	import ash.core.Entity;
	import ash.core.NodeList;
	import ash.core.System;
	import flash.geom.Point;
	import ld28.Assets;
	import ld28.components.Audio;
	import ld28.components.Collision;
	import ld28.components.Player;
	import ld28.components.Radar;
	import ld28.EntityCreator;
	import ld28.GameConfig;
	import ld28.nodes.EnergyCollectingCollisionNode;
	import ld28.nodes.EnergyParticleCollisionNode;
	import ld28.nodes.MembranNode;
	
	public class MembranSystem extends System {
		private var creator:EntityCreator;
		
		private var nodes:NodeList;
		private var family:ComponentMatchingFamily;
		
		public function MembranSystem(creator:EntityCreator) {
			this.creator = creator;
		}
		
		override public function addToEngine(engine:Engine):void {
			nodes = engine.getNodeList(MembranNode);
			family = ComponentMatchingFamily(engine.getFamily(MembranNode));
		}
		
		override public function update(time:Number):void {
			var node1:MembranNode;
			var n:int = 0;
			for (node1 = nodes.head; node1; node1 = node1.next) {
				if (node1.membran.connections.length < 2) {
					var radarCollisions:Collision = node1.radar.entity.get(Collision);
					for each (var entity:Entity in radarCollisions.collidingEntities) {
						n++;
						if (entity == node1.entity) {
							continue;
						}
						var node2:MembranNode = MembranNode(family.entities[entity]);
						if (node2) {
							if (node1.membran.connected[entity]) {
								continue;
							}
							if (node2.membran.connections.length < 2) {
								trace("foo");
								
								var connection:Entity = creator.createConnection(node1.entity, node2.entity);
								node1.membran.connections.push(connection);
								node2.membran.connections.push(connection);
								node1.membran.connected[node2.entity] = connection;
								node2.membran.connected[node1.entity] = connection;
							}
						}
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
