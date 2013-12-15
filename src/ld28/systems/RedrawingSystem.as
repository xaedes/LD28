package ld28.systems {
	import ash.tools.ListIteratingSystem;
	import ld28.nodes.RedrawingNode;
	
	public class RedrawingSystem extends ListIteratingSystem {
		public function RedrawingSystem() {
			super(RedrawingNode, updateNode);
		}
		
		private function updateNode(node:RedrawingNode, time:Number):void {
			node.redrawing.redrawable.redraw(time);
		}
	}
}
