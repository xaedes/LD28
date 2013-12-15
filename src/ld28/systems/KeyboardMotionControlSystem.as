package ld28.systems {
	import ash.tools.ListIteratingSystem;
	import flash.geom.Point;
	import ld28.components.EnergyStorage;
	import ld28.components.Motion;
	import ld28.components.KeyboardMotionControls;
	import ld28.components.Mover;
	import ld28.components.Position;
	import ld28.KeyPoll;
	import ld28.nodes.KeyboardMotionControlNode;
	
	public class KeyboardMotionControlSystem extends ListIteratingSystem {
		private var keyPoll:KeyPoll;
		
		public function KeyboardMotionControlSystem(keyPoll:KeyPoll) {
			super(KeyboardMotionControlNode, updateNode);
			this.keyPoll = keyPoll;
		}
		
		private function updateNode(node:KeyboardMotionControlNode, time:Number):void {
			var control:KeyboardMotionControls = node.control;
			var position:Position = node.position;
			var motion:Motion = node.motion;
			var energyStorage:EnergyStorage = node.energyStorage;
			var mover:Mover = node.mover;
			
			var accel:Point = new Point(0, 0);
			
			if (keyPoll.isDown(control.left)) {
				accel.x -= control.accelerationRate * time;
			}
			if (keyPoll.isDown(control.right)) {
				accel.x += control.accelerationRate * time;
			}
			if (keyPoll.isDown(control.up)) {
				accel.y -= control.accelerationRate * time;
			}
			if (keyPoll.isDown(control.down)) {
				accel.y += control.accelerationRate * time;
			}
			var maxAccel:Number = energyStorage.energy / mover.energyConsumption;
			if (accel.length > maxAccel) {
				accel.normalize(maxAccel);
			}
			energyStorage.energy -= accel.length * mover.energyConsumption;
			motion.velocity = motion.velocity.add(accel);
		}
	}
}
