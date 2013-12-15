package ld28.nodes {
	import ash.core.Node;
	import ld28.components.Circle;
	import ld28.components.Collision;
	import ld28.components.Mass;
	import ld28.components.Motion;
	import ld28.components.Position;
	import ld28.components.SolidCollision;
	
	public class SolidCollisionNode extends Node {
		public var position:Position;
		public var motion:Motion;
		public var mass:Mass;
		public var collision:Collision;
		public var solidCollision:SolidCollision;
		public var circle:Circle;
	}
}
