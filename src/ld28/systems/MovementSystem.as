package ld28.systems {
	import ash.tools.ListIteratingSystem;
	import ld28.components.Motion;
	import ld28.components.Position;
	import ld28.GameConfig;
	import ld28.nodes.MovementNode;
	
	public class MovementSystem extends ListIteratingSystem {
		private var config:GameConfig;
		
		public function MovementSystem(config:GameConfig) {
			super(MovementNode, updateNode);
			this.config = config;
		}
		
		private function updateNode(node:MovementNode, time:Number):void {
			var position:Position = node.position;
			var motion:Motion = node.motion;
			
			position = node.position;
			motion = node.motion;
			position.position.x += motion.velocity.x * time;
			position.position.y += motion.velocity.y * time;
			
			var damp:Number = 0.9;
			
			if (position.position.x > this.config.width) {
				//position.position.x -= this.config.width;
				position.position.x = this.config.width;
				motion.velocity.x *= -damp;
			}
			if (position.position.x < 0) {
				//position.position.x += this.config.width;
				position.position.x = 0;
				motion.velocity.x *= -damp;
			}
			if (position.position.y > this.config.height) {
				//position.position.y -= this.config.height;
				position.position.y = this.config.height;
				motion.velocity.y *= -damp;
			}
			if (position.position.y < 0) {
				//position.position.y += this.config.height;
				position.position.y = 0;
				motion.velocity.y *= -damp;
			}
			
			motion.velocity.x *= motion.damping;
			motion.velocity.y *= motion.damping;
		}
	}
}
