package ld28.components {
	
	public class EnergyProducer {
		public var interval:Number;
		public var amount:Number;
		public var countdown:Number;
		
		public function EnergyProducer(interval:Number, amount:Number = 1) {
			this.interval = interval;
			this.countdown = interval;
			this.amount = amount;
		}
	}
}
