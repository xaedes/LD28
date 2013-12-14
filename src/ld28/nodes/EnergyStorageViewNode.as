package ld28.nodes {
	import ash.core.Node;
	import ld28.components.EnergyStorage;
	import ld28.components.HasEnergyStorageView;
	
	public class EnergyStorageViewNode extends Node {
		public var energyStorage:EnergyStorage;
		public var hasEnergyStorageView:HasEnergyStorageView;
	}
}
