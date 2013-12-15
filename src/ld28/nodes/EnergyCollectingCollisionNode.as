package ld28.nodes {
	import ash.core.Node;
	import ld28.components.Collision;
	import ld28.components.EnergyCollecting;
	import ld28.components.EnergyStorage;
	import ld28.components.Position;
	
	public class EnergyCollectingCollisionNode extends Node {
		public var position:Position;
		public var collision:Collision;
		public var energyStorage:EnergyStorage;
		public var energyCollecting:EnergyCollecting;
	}
}
