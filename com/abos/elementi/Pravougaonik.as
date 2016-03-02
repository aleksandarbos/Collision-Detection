package com.abos.elementi {
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.net.drm.VoucherAccessInfo;
	import flash.geom.Point;
	import com.abos.vektor.Vector2D;
	import fl.motion.MatrixTransformer;
	import flash.display.Graphics;
	
	public class Pravougaonik extends Sprite {
		
		public static var brojPravougaonika:uint;

		private var tf:TextField = new TextField();
		private var trenutnaBoja:uint;
		
		private var a:Number;
		private var b:Number;
		
		private var rotacija:Number = 0;
		
		private var temena:Vector.<Point> = new Vector.<Point>;
		private var s:Sprite = new Sprite();
		
		private var A:Point;
		private var B:Point;
		private var C:Point;
		private var D:Point;
		
		private var duzAB:Vector.<Point> = new Vector.<Point>;
		private var duzBC:Vector.<Point> = new Vector.<Point>;
		private var duzCD:Vector.<Point> = new Vector.<Point>;
		private var duzAC:Vector.<Point> = new Vector.<Point>;
		
		private var duzi:Array = new Array();
		
		public function Pravougaonik(a:Number, b:Number) {
			
			/* --- polja  --- */
			brojPravougaonika++;								// povecavanje broja pravougaonika na nivou klase

			this.a = a;
			this.b = b;
			
			A = new Point(0, 0);
			B = new Point(a, 0);
			C = new Point(0, b);
			D = new Point(a, b);
			
			//temena
			temena.push(A);
			temena.push(B);
			temena.push(C);
			temena.push(D);
			

			this.trenutnaBoja = 0xfffa8f;
			/* --- polja  --- */
			
			/*trace("Ja sam pravougaonik " + brojPravougaonika + " , a: " + a + " , b: " + b);
			trace("Pozcija prav unutar klase: " + this.x + " " + this.y);*/
			// ---- iscrtavanje
			
			/*this.graphics.beginFill(trenutnaBoja, 0.5);
			this.graphics.drawRect(0, 0, a, b);
			this.graphics.endFill();*/
			// ---- iscrtavanje

			//trace("TEMEEE B: " + B.x + " " + B.y);
			
			// labela
			tf.selectable = false;
			//tf.border = true;
			tf.text = "P" + brojPravougaonika;
			tf.x += a/2;								// centriranje naziva
			tf.y += b/2;

			tf.x -= 10;									// centriranje naziva, za duzinu naziva
			tf.y -= 10;

			addChild(tf);								// dodavanje tf objekta u prikaz za klasu krug
		}
		
		public function dodirnutElement():void {
			this.trenutnaBoja = 0xFF4444;			
			this.graphics.clear();
			iscrtavanjeElementa();

		}
		
		
		public function getA():Point {
			return localToGlobal(A);			// iz lokalne klase, pretvara koordinate u globalne
		}
		
		public function getB():Point {
			return localToGlobal(B);
		}
		
		public function getC():Point {
			return localToGlobal(C);
		}

		public function getD():Point {
			return localToGlobal(D);
		}
		
		public function setRotacija(rot:Number) {
		
			for(var i:uint = 0; i < 4; i++) {
				var xlength:Number = temena[i].x - temena[0].x;
				var ylength:Number = temena[i].y - temena[0].y;
				temena[i].x = xlength * Math.cos(rot) - ylength * Math.sin(rot);
				temena[i].y = xlength * Math.sin(rot) + ylength * Math.cos(rot);
				temena[i].x += temena[0].x;
				temena[i].y += temena[0].y;
				
			}
			this.rotacija = rot;		// informacija o trenutnoj rotiranosti datog elementa
			iscrtavanjeElementa();		// iscraj duzi sa novonastalim temenima
			//this.rotation = rot;
			
		}
		public function getRotacija():Number {
			return this.rotacija;
		}
		
		public function iscrtavanjeElementa():void {
			
			//var s:Sprite = new Sprite();
			//var g:Graphics = new Graphics();
			s.graphics.lineStyle(1,189,0.7);
			s.graphics.beginFill(trenutnaBoja, 0.2);
			
			for (var i:int = 0; i < 4; i++) {
				s.graphics.beginFill(trenutnaBoja, 0.2);				
				s.graphics.moveTo(A.x, A.y);
				s.graphics.lineTo(B.x, B.y);
				s.graphics.lineTo(D.x, D.y);
				s.graphics.lineTo(C.x, C.y);
				s.graphics.lineTo(A.x, A.y);
				s.graphics.endFill();
				
				s.graphics.beginFill(123,0.5);
				s.graphics.drawCircle(temena[i].x,temena[i].y,3);
				addChild(s);
			}
			s.graphics.endFill();
		}
		
		public function getTemena():Vector.<Point> {
			return temena;
		}
		
		public function getDuzi():Array {
			//duzi
			//duzAB.cl
			duzAB.push(getA(), getB());
			duzBC.push(getB(), getC());
			duzCD.push(getC(), getD());
			duzAC.push(getA(), getC());
			
			duzi.push(duzAB, duzBC, duzCD, duzAC);

			return duzi;
		}
		
		public function getStranicaA():Number {
			return a;
		}
		public function getStranicaB():Number {
			return b;
		}
	}
	
}
