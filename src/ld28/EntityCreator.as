package ld28 {
	import ash.core.Engine;
	import ash.core.Entity;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import ld28.components.Audio;
	import ld28.components.Circle;
	import ld28.components.Collision;
	import ld28.components.Display;
	import ld28.components.EnergyCollecting;
	import ld28.components.EnergyParticle;
	import ld28.components.EnergyProducer;
	import ld28.components.EnergyStorage;
	import ld28.components.EnergyStorageEmitter;
	import ld28.components.HasEnergyStorageView;
	import ld28.components.Mass;
	import ld28.components.Motion;
	import ld28.components.MotionControls;
	import ld28.components.Mover;
	import ld28.components.Player;
	import ld28.components.Position;
	import ld28.components.Size;
	import ld28.components.SolidCollision;
	import ld28.graphics.CircleView;
	import ld28.graphics.EnergyProducerView;
	import ld28.graphics.MoverView;
	
	public class EntityCreator {
		private var engine:Engine;
		private var config:GameConfig;
		
		public function EntityCreator(engine:Engine, config:GameConfig) {
			this.engine = engine;
			this.config = config;
		}
		
		public function destroyEntity(entity:Entity):void {
			engine.removeEntity(entity);
		}
		
		public function createGame():Entity {
			var gameEntity:Entity = new Entity("game");
			engine.addEntity(gameEntity);
			
			return gameEntity;
		}
		
		public function createPlayer():Entity {
			var entity:Entity = new Entity();
			
			var radius:Number = 10;
			var density:Number = 1;
			
			var pos:Point = new Point(config.width / 2, config.height / 2);
			
			var moverView:MoverView = new MoverView(radius);
			with (entity) {
				add(new Position(pos.x, pos.y));
				add(new Size(new Point(radius * 2, radius * 2)));
				add(new Circle(radius));
				add(new Display(moverView));
				//add(new Mover(moverView, 0.001));
				add(new Mover(moverView, 0.0));
				add(new Motion(0, 0, 0.95));
				add(new EnergyStorage(10, 5));
				add(new HasEnergyStorageView(moverView.energyStorageView));
				add(new MotionControls(Keyboard.A, Keyboard.D, Keyboard.W, Keyboard.S, 1000));
				add(new Audio());
				add(new EnergyStorageEmitter(0.1, radius + 3, 1, 10, 0, 1, 1));
				add(new Mass(radius * radius * Math.PI * density));
				add(new Collision());
				add(new SolidCollision(0.5));
				add(new EnergyCollecting());
				add(new Player());
			}
			
			engine.addEntity(entity);
			return entity;
		}
		
		public function createEnergyParticle(energyAmount:Number = 1):Entity {
			var entity:Entity = new Entity();
			
			var radius:Number = 2;
			var pos:Point = new Point(Utils.randomRange(0, config.width), Utils.randomRange(0, config.height));
			
			var circleView:CircleView = new CircleView(radius, 0xFFF4BA);
			with (entity) {
				add(new Position(pos.x, pos.y));
				add(new Size(new Point(radius * 2, radius * 2)));
				add(new Circle(radius));
				add(new Display(circleView));
				add(new Motion(Utils.randomRange(-10, 10), Utils.randomRange(-10, 10), 0.999));
				add(new EnergyStorage(energyAmount, energyAmount));
				add(new Collision());
				add(new EnergyParticle());
			}
			
			engine.addEntity(entity);
			return entity;
		}
		
		public function createEnergyProducer():Entity {
			var entity:Entity = new Entity();
			
			var radius:Number = 5;
			var density:Number = 1;
			var _maxEnergy:Number = Utils.randomRange(5, 15);
			var pos:Point = new Point(Utils.randomRange(0, config.width), Utils.randomRange(0, config.height));
			
			var energyProducerView:EnergyProducerView = new EnergyProducerView(radius);
			with (entity) {
				add(new Position(pos.x, pos.y));
				add(new Size(new Point(radius * 2, radius * 2)));
				add(new Circle(radius));
				add(new Display(energyProducerView));
				add(new Motion(Utils.randomRange(-50, 50), Utils.randomRange(-50, 50), 0.995));
				add(new EnergyStorage(_maxEnergy, Utils.randomRange(0, _maxEnergy)));
				add(new Collision());
				add(new EnergyProducer(0.1, 0.01));
				//add(new EnergyProducer(0.1, 0.1));
				add(new EnergyStorageEmitter(0.1, radius + 3, 1, 10, 1, 5, 5));
				add(new HasEnergyStorageView(energyProducerView.energyStorageView));
				add(new Mass(radius * radius * Math.PI * density));
				add(new SolidCollision(0.1));
				add(new EnergyCollecting());
			}
			engine.addEntity(entity);
			return entity;
		}
	
	}
}
