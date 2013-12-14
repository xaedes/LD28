package ld28.components {
	
	public class EnergyStorageEmitter {
		public var interval:Number;
		public var nParticles:Number;
		public var amount:Number;
		public var countdown:Number;
		public var spawnRadius:Number;
		public var spawnSpeedMin:Number;
		public var spawnSpeedMax:Number;
		public var emitterVelocityInfluence:Number; // 0-1
		
		public function EnergyStorageEmitter(interval:Number, spawnRadius:Number, spawnSpeedMin:Number = 1, spawnSpeedMax:Number = 10, emitterVelocityInfluence:Number = 0, amount:Number = 1, nParticles:Number = 1) {
			this.interval = interval;
			this.countdown = 0;
			this.amount = amount;
			this.nParticles = nParticles;
			this.spawnRadius = spawnRadius;
			this.spawnSpeedMin = spawnSpeedMin;
			this.spawnSpeedMax = spawnSpeedMax;
			this.emitterVelocityInfluence = emitterVelocityInfluence;
		}
	}
}
