package ld28.nodes {
	import ash.core.Node;
	import ld28.components.EnergyStorage;
	import ld28.components.EnergyStorageEmitter;
	import ld28.components.Motion;
	import ld28.components.Position;
	
	public class EnergyStorageEmitterNode extends Node {
		public var position:Position;
		public var motion:Motion;
		public var energyStorage:EnergyStorage;
		public var energyStorageEmitter:EnergyStorageEmitter;
	}
}
