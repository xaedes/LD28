package ld28.nodes {
	import ash.core.Node;
	import ld28.components.EnergyStorage;
	import ld28.components.Motion;
	import ld28.components.MouseMotionControls;
	import ld28.components.Mover;
	import ld28.components.Position;
	
	public class MouseMotionControlNode extends Node {
		public var control:MouseMotionControls;
		public var position:Position;
		public var motion:Motion;
		public var energyStorage:EnergyStorage;
		public var mover:Mover;
	}
}
