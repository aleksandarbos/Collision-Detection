package com.abos.elementi {
	import flash.geom.Point;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class Trougao extends Sprite {

		private var trenutnaBoja:uint;
		
		private var A:Point;
		private var B:Point;
		private var C:Point;
		
		private var a:Number;		// duzina stranice a
		private var rotacija:Number;
		
		private var h:Number;
		private var tf:TextField = new TextField();
		
		private var temena:Vector.<Point> = new Vector.<Point>;
		private var s:Sprite = new Sprite();
		
		private static var brojKrugova:uint;
		
		public function Trougao(a:Number) {
			// constructor code
			this.trenutnaBoja = 0x76EE00;
//			this.trenutnaBoja = 0xfffa8f;
			this.a = a;
			h = a*Math.sqrt(3)/4;
			
			this.A = new Point(0, 0);
			this.B = new Point(-a/2, a);
			this.C = new Point(a/2, a);
						
			temena.push(A);
			temena.push(B);
			temena.push(C);
			
			// labela
			tf.selectable = false;
			tf.text = "T" + brojKrugova;
			tf.x -= 10;									// centriranje naziva
			tf.y += 20;
			addChild(tf);								// dodavanje tf objekta u prikaz za klasu trougao

			brojKrugova++;
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

		public function setRotacija(rot:Number) {
		
			for(var i:uint = 0; i < 3; i++) {
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
		
		
		private function iscrtavanjeElementa():void {
			s.graphics.lineStyle(1,489,0.5);
			s.graphics.beginFill(trenutnaBoja, 0.2);
			
			for (var i:int = 0; i < 3; i++) {
				s.graphics.beginFill(trenutnaBoja, 0.2);				
				s.graphics.moveTo(B.x, B.y);
				s.graphics.lineTo(C.x, C.y);
				s.graphics.lineTo(A.x, A.y);
				s.graphics.lineTo(B.x, B.y);
				//s.graphics.lineTo(A.x, A.y);
				s.graphics.endFill();
				
				s.graphics.beginFill(123,0.5);
				s.graphics.drawCircle(temena[i].x,temena[i].y,3);
				addChild(s);
			}
			s.graphics.endFill();
		}

		public function getRotacija():Number {
			return this.rotacija;
		}
		
		public function dodirnutElement():void {
			this.trenutnaBoja = 0xFF4444;			
			this.graphics.clear();
			iscrtavanjeElementa();

		}

		

	}
	
}
