package ld28.systems {
	import ash.tools.ListIteratingSystem;
	import ld28.components.Motion;
	import ld28.components.MotionControls;
	import ld28.components.Position;
	import ld28.nodes.MotionControlNode;
	import ld28.KeyPoll;
	
	public class MotionControlSystem extends ListIteratingSystem {
		private var keyPoll:KeyPoll;
		
		public function MotionControlSystem(keyPoll:KeyPoll) {
			super(MotionControlNode, updateNode);
			this.keyPoll = keyPoll;
		}
		
		private function updateNode(node:MotionControlNode, time:Number):void {
			var control:MotionControls = node.control;
			var position:Position = node.position;
			var motion:Motion = node.motion;
			
			if (keyPoll.isDown(control.left)) {
				motion.velocity.x -= control.accelerationRate * time;
			}
			if (keyPoll.isDown(control.right)) {
				motion.velocity.x += control.accelerationRate * time;
			}
			if (keyPoll.isDown(control.up)) {
				motion.velocity.y -= control.accelerationRate * time;
			}
			if (keyPoll.isDown(control.down)) {
				motion.velocity.y += control.accelerationRate * time;
			}
		}
	}
}
