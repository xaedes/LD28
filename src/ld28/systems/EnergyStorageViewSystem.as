package ld28.systems {
	import ash.tools.ListIteratingSystem;
	import ld28.components.EnergyStorage;
	import ld28.components.HasEnergyStorageView;
	import ld28.nodes.EnergyStorageViewNode;
	
	public class EnergyStorageViewSystem extends ListIteratingSystem {
		public function EnergyStorageViewSystem() {
			super(EnergyStorageViewNode, updateNode);
		}
		
		private function updateNode(node:EnergyStorageViewNode, time:Number):void {
			var hasEnergyStorageView:HasEnergyStorageView = node.hasEnergyStorageView;
			var energyStorage:EnergyStorage = node.energyStorage;
			
			if ((energyStorage.energy != hasEnergyStorageView.energyStorageView.value) || (energyStorage.maxEnergy != hasEnergyStorageView.energyStorageView.max)) {
				hasEnergyStorageView.energyStorageView.setMax(energyStorage.maxEnergy);
				hasEnergyStorageView.energyStorageView.setValue(energyStorage.energy);
				hasEnergyStorageView.energyStorageView.draw();
			}
		}
	}
}
