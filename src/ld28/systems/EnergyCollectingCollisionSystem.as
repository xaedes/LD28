package ld28.systems {
	import ash.core.Engine;
	import ash.core.NodeList;
	import ash.core.System;
	import flash.geom.Point;
	import ld28.Assets;
	import ld28.components.Audio;
	import ld28.components.Player;
	import ld28.EntityCreator;
	import ld28.nodes.EnergyCollectingCollisionNode;
	import ld28.nodes.EnergyParticleCollisionNode;
	
	public class EnergyCollectingCollisionSystem extends System {
		private var creator:EntityCreator;
		private var energyParticles:NodeList;
		private var energyCollectors:NodeList;
		
		public function EnergyCollectingCollisionSystem(creator:EntityCreator) {
			this.creator = creator;
		}
		
		override public function addToEngine(engine:Engine):void {
			energyParticles = engine.getNodeList(EnergyParticleCollisionNode);
			energyCollectors = engine.getNodeList(EnergyCollectingCollisionNode);
		}
		
		override public function update(time:Number):void {
			var energyParticle:EnergyParticleCollisionNode;
			var energyCollector:EnergyCollectingCollisionNode;
			
			for (energyParticle = energyParticles.head; energyParticle; energyParticle = energyParticle.next) {
				for (energyCollector = energyCollectors.head; energyCollector; energyCollector = energyCollector.next) {
					if (Point.distance(energyCollector.position.position, energyParticle.position.position) <= (energyParticle.collision.radius + energyCollector.collision.radius)) {
						creator.destroyEntity(energyParticle.entity);
						
						energyCollector.energyStorage.energy += energyParticle.energyStorage.energy;
						if (energyCollector.entity.has(Player) && energyCollector.entity.has(Audio)) {
							var audio:Audio = energyCollector.entity.get(Audio);
							audio.play(Assets.CollectEnergy);
						}
						
						break;
					}
				}
			}
		}
		
		override public function removeFromEngine(engine:Engine):void {
			energyParticles = null;
			energyCollectors = null;
		}
	}
}
