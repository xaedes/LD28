package ld28.components {
	import flash.display.DisplayObject;
	
	public class EnergyStorage {
		public var maxEnergy:Number;
		public var energy:Number;
		
		public function EnergyStorage(maxEnergy:Number = 0, energy:Number = 0) {
			this.maxEnergy = maxEnergy;
			this.energy = energy;
		}
	}
}
