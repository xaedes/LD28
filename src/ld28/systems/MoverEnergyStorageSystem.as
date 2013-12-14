package ld28.systems {
	import ash.tools.ListIteratingSystem;
	import ld28.components.EnergyStorage;
	import ld28.components.Mover;
	import ld28.nodes.MoverEnergyStorageNode;
	
	public class MoverEnergyStorageSystem extends ListIteratingSystem {
		public function MoverEnergyStorageSystem() {
			super(MoverEnergyStorageNode, updateNode);
		}
		
		private function updateNode(node:MoverEnergyStorageNode, time:Number):void {
			var mover:Mover = node.mover;
			var energyStorage:EnergyStorage = node.energyStorage;
			
			mover.moverView.energyStorageView.setMax(energyStorage.maxEnergy);
			mover.moverView.energyStorageView.setValue(energyStorage.energy);
		}
	}
}
