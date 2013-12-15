package ld28.nodes {
	import ash.core.Node;
	import ld28.components.Circle;
	import ld28.components.Collision;
	import ld28.components.EnergyParticle;
	import ld28.components.EnergyStorage;
	import ld28.components.Position;
	
	public class EnergyParticleCollisionNode extends Node {
		public var energyParticle:EnergyParticle;
		public var energyStorage:EnergyStorage;
		public var position:Position;
		public var collision:Collision;
		public var circle:Circle;
	}
}
