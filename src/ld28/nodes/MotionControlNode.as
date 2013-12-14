package ld28.nodes
{
	import ash.core.Node;
	import ld28.components.Motion;
	import ld28.components.MotionControls;
	import ld28.components.Position;


	public class MotionControlNode extends Node
	{
		public var control : MotionControls;
		public var position : Position;
		public var motion : Motion;
	}
}
