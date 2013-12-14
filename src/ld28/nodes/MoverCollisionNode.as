package ld28.nodes {
	import ash.core.Node;
	import ld28.components.Audio;
	import ld28.components.Collision;
	import ld28.components.EnergyStorage;
	import ld28.components.Mover;
	import ld28.components.Position;
	
	public class MoverCollisionNode extends Node {
		public var mover:Mover;
		public var position:Position;
		public var collision:Collision;
		public var audio:Audio;
		public var energyStorage:EnergyStorage;
	
	}
}
