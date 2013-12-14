package ld28.systems {
	import ash.tools.ListIteratingSystem;
	import flash.geom.Point;
	import ld28.components.EnergyStorage;
	import ld28.components.Motion;
	import ld28.components.MotionControls;
	import ld28.components.Mover;
	import ld28.components.Position;
	import ld28.KeyPoll;
	import ld28.nodes.MotionControlNode;
	
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
