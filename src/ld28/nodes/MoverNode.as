package ld28.nodes {
	import ash.core.Node;
	import ld28.components.Audio;
	import ld28.components.Collision;
	import ld28.components.EnergyStorage;
	import ld28.components.Mover;
	import ld28.components.Position;
	
	public class MoverNode extends Node {
		public var mover:Mover;
		public var position:Position
		public var energyStorage:EnergyStorage;
		public var collision:Collision;

	}
}
