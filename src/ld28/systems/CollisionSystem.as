package ld28.systems {
	import ash.core.Engine;
	import ash.core.NodeList;
	import ash.core.System;
	import flash.geom.Point;
	import ld28.EntityCreator;
	import ld28.nodes.EnergyParticleCollisionNode;
	import ld28.nodes.MoverEnergyStorageNode;
	
	public class CollisionSystem extends System {
		private var creator:EntityCreator;
		private var energyParticles:NodeList;
		private var movers:NodeList;
		
		public function CollisionSystem(creator:EntityCreator) {
			this.creator = creator;
		}
		
		override public function addToEngine(engine:Engine):void {
			energyParticles = engine.getNodeList(EnergyParticleCollisionNode);
			movers = engine.getNodeList(MoverEnergyStorageNode);
		}
		
		override public function update(time:Number):void {
			var energyParticle:EnergyParticleCollisionNode;
			var mover:MoverEnergyStorageNode;
			
			for (energyParticle = energyParticles.head; energyParticle; energyParticle = energyParticle.next) {
				for (mover = movers.head; mover; mover = mover.next) {
					if (Point.distance(mover.position.position, energyParticle.position.position) <= (energyParticle.collision.radius + mover.collision.radius)) {
						creator.destroyEntity(energyParticle.entity);
						break;
					}
				}
			}
		
		}
		
		override public function removeFromEngine(engine:Engine):void {
			energyParticles = null;
			movers = null;
		
		}
	}
}
