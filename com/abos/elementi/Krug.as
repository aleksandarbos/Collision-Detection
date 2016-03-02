package com.abos.elementi {
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class Krug extends Sprite {
		public static var brojKrugova:uint;
		private var r:Number;
		private var tf:TextField = new TextField();
		private var currentColor:uint;

		public function Krug(poluprecnik:Number) {
			brojKrugova++;								// povecavanje broja krugova na nivou klase
			this.r = poluprecnik;
			this.currentColor = 0xC6ECFB;
			trace("Ja sam krug " + brojKrugova + " , r: " + r);
			
			// ---- iscrtavanje
			this.graphics.lineStyle(1,189,0.9);
			this.graphics.beginFill(currentColor, 0.5);
			this.graphics.drawCircle(0, 0, poluprecnik);
			this.graphics.endFill();
			// ---- iscrtavanje
			
			// labela
			tf.selectable = false;
			tf.text = "K" + brojKrugova;
			tf.x -= 10;									// centriranje naziva
			tf.y -= 10;
			addChild(tf);								// dodavanje tf objekta u prikaz za klasu krug
		}
		public function setR(r:Number):void {
			this.r = r;
		}
		
		public function getR():Number {
			return r;
		}
		
		public function dodirnutElement():void {			// prefarbaj u crveno
			this.currentColor = 0xFF4444;
			this.graphics.clear();
			this.graphics.lineStyle(1,189,0.9);
			this.graphics.beginFill(currentColor, 0.5);		
			this.graphics.drawCircle(0, 0, r);
			this.graphics.endFill();			
			
		}
		
		/*public function nijeDodirnutKrug():void {			// prefarbaj u crveno
			this.currentColor = 0xC6ECFB;
			this.graphics.clear();
			this.graphics.lineStyle(1,189,0.9);
			this.graphics.beginFill(0xC6ECFB, 0.5);		
			this.graphics.drawCircle(0, 0, r);
			this.graphics.endFill();			
			
		}*/
	}
	
}
