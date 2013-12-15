package ld28.systems {
	import ash.tools.ListIteratingSystem;
	import ld28.components.Anchor;
	import ld28.components.Position;
	import ld28.nodes.AnchorNode;
	
	public class AnchorSystem extends ListIteratingSystem {
		
		public function AnchorSystem() {
			super(AnchorNode, updateNode);
		}
		
		private function updateNode(node:AnchorNode, time:Number):void {
			var position:Position = node.position;
			var anchor:Anchor = node.anchor;
			
			var anchorPosition:Position = anchor.entity.get(Position);
			
			position.position.x = anchorPosition.position.x;
			position.position.y = anchorPosition.position.y;
		}
	}
}
