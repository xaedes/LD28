package ld28.systems {
	import ash.tools.ListIteratingSystem;
	import ld28.nodes.DistanceConstraintNode;
	
	public class DistanceConstraintSystem extends ListIteratingSystem {
		
		public function DistanceConstraintSystem() {
			super(DistanceConstraintNode, updateNode);
		}
		
		private function updateNode(node:DistanceConstraintNode, time:Number):void {
			//var position:Position = node.position;
			//var anchor:Anchor = node.anchor;
			//
			//var anchorPosition:Position = anchor.entity.get(Position);
			//
			//position.position.x = anchorPosition.position.x;
			//position.position.y = anchorPosition.position.y;
		}
	}
}
