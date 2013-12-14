package ld28.systems {
	import ash.core.Entity;
	import ash.core.NodeList;
	import ash.tools.ListIteratingSystem;
	import flash.geom.Point;
	import ld28.components.EnergyStorage;
	import ld28.components.EnergyStorageEmitter;
	import ld28.components.Motion;
	import ld28.components.Position;
	import ld28.EntityCreator;
	import ld28.nodes.EnergyStorageEmitterNode;
	import ld28.Utils;
	
	public class EnergyStorageEmitterSystem extends ListIteratingSystem {
		private var creator:EntityCreator;
		private var energyParticles:NodeList;
		private var movers:NodeList;
		
		public function EnergyStorageEmitterSystem(creator:EntityCreator) {
			this.creator = creator;
			super(EnergyStorageEmitterNode, updateNode);
		}
		
		private function updateNode(node:EnergyStorageEmitterNode, time:Number):void {
			var energyStorageEmitter:EnergyStorageEmitter = node.energyStorageEmitter;
			var energyStorage:EnergyStorage = node.energyStorage;
			var motion:Motion = node.motion;
			var position:Position = node.position;
			
			if (energyStorageEmitter.countdown >= 0) {
				energyStorageEmitter.countdown -= time;
			}
			if ((energyStorage.energy > energyStorage.maxEnergy) && (energyStorageEmitter.countdown <= 0)) {
				
				energyStorageEmitter.countdown = energyStorageEmitter.interval;
				energyStorage.energy -= energyStorageEmitter.amount;
				
				// emit particles
				for (var i:int = 0; i < energyStorageEmitter.nParticles; i++) {
					// create particle
					var energyParticleEntity:Entity = creator.createEnergyParticle(energyStorageEmitter.amount / energyStorageEmitter.nParticles);
					var particlePos:Position = energyParticleEntity.get(Position);
					var particleMotion:Motion = energyParticleEntity.get(Motion);
					
					// create random position
					var angle:Number = Math.random() * 2 * Math.PI;
					var offset:Point = new Point(Math.cos(angle), Math.sin(angle));
					offset.normalize(energyStorageEmitter.spawnRadius);
					particlePos.position = position.position.add(offset);
					
					offset.normalize(Utils.randomRange(energyStorageEmitter.spawnSpeedMin, energyStorageEmitter.spawnSpeedMax));
					particleMotion.velocity = motion.velocity.add(offset);
				}
				
			}
		
		}
	}
}
