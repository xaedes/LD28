package ld28.nodes {
	import ash.core.Node;
	import ld28.components.Mover;
	import ld28.components.Position;
	
	public class MoverCollisionNode extends Node {
		public var mover:Mover;
		public var position:Position;
		public var collision:Collision;
	}
}
