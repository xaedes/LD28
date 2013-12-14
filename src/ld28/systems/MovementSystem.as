package ld28.systems {
	import ash.tools.ListIteratingSystem;
	import ld28.components.Motion;
	import ld28.components.Position;
	import ld28.nodes.MovementNode;
	public class MovementSystem extends ListIteratingSystem {
		public function MovementSystem() {
			super(MovementNode, updateNode);
		}
		
		private function updateNode(node:MovementNode, time:Number):void {
			var position:Position = node.position;
			var motion:Motion = node.motion;
			
			position = node.position;
			motion = node.motion;
			position.position.x += motion.velocity.x * time;
			position.position.y += motion.velocity.y * time;
			
			motion.velocity.x *= motion.damping;
			motion.velocity.y *= motion.damping;
		}
	}
}
