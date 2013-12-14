package ld28.systems {
	import ash.tools.ListIteratingSystem;
	import ld28.components.EnergyProducer;
	import ld28.components.EnergyStorage;
	import ld28.nodes.EnergyProducerNode;
	
	public class EnergyProducerSystem extends ListIteratingSystem {
		
		public function EnergyProducerSystem() {
			super(EnergyProducerNode, updateNode);
		
		}
		
		private function updateNode(node:EnergyProducerNode, time:Number):void {
			var energyProducer:EnergyProducer = node.energyProducer;
			var energyStorage:EnergyStorage = node.energyStorage;
			
			if (energyProducer.countdown > 0) {
				energyProducer.countdown -= time;
			} else {
				energyProducer.countdown = energyProducer.interval;
				energyStorage.energy += energyProducer.amount;
			}
		
		}
	}
}
