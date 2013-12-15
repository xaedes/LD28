package ld28.systems {
	import ash.core.ComponentMatchingFamily;
	import ash.core.Engine;
	import ash.core.Entity;
	import ash.core.NodeList;
	import ash.core.System;
	import flash.geom.Point;
	import ld28.Assets;
	import ld28.components.Audio;
	import ld28.components.Player;
	import ld28.EntityCreator;
	import ld28.GameConfig;
	import ld28.nodes.EnergyCollectingCollisionNode;
	import ld28.nodes.EnergyParticleCollisionNode;
	
	public class EnergyCollectingCollisionSystem extends System {
		private var creator:EntityCreator;
		private var config:GameConfig;
		
		private var energyParticlesFamily:ComponentMatchingFamily;
		private var energyCollectors:NodeList;
		
		public function EnergyCollectingCollisionSystem(creator:EntityCreator, config:GameConfig) {
			this.creator = creator;
			this.config = config;
		}
		
		override public function addToEngine(engine:Engine):void {
			energyParticlesFamily = ComponentMatchingFamily(engine.getFamily(EnergyParticleCollisionNode));
			energyCollectors = engine.getNodeList(EnergyCollectingCollisionNode);
		}
		
		override public function update(time:Number):void {
			var energyCollector:EnergyCollectingCollisionNode;
			var entity:Entity;
			
			for (energyCollector = energyCollectors.head; energyCollector; energyCollector = energyCollector.next) {
				for each (entity in energyCollector.collision.collidingEntities) {
					var energyParticle:EnergyParticleCollisionNode = EnergyParticleCollisionNode(energyParticlesFamily.entities[entity]);
					if (energyParticle) {
						if (Point.distance(energyCollector.position.position, energyParticle.position.position) <= (energyParticle.circle.radius + energyCollector.circle.radius)) {
							creator.destroyEntity(energyParticle.entity);
							
							energyCollector.energyStorage.energy += energyParticle.energyStorage.energy;
							if (energyCollector.entity.has(Player) && energyCollector.entity.has(Audio)) {
								var audio:Audio = energyCollector.entity.get(Audio);
								audio.play(Assets.CollectEnergy);
							}
						}
					}
				}
			}
		}
		
		override public function removeFromEngine(engine:Engine):void {
			energyParticlesFamily = null;
			energyCollectors = null;
		}
	}
}
