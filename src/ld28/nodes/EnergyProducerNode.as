package ld28.nodes {
	import ash.core.Node;
	import ld28.components.EnergyProducer;
	import ld28.components.EnergyStorage;
	
	public class EnergyProducerNode extends Node {
		public var energyStorage:EnergyStorage;
		public var energyProducer:EnergyProducer;
	}
}
