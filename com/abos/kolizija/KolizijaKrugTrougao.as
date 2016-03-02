package com.abos.kolizija {
	import com.abos.elementi.Krug;
	import com.abos.elementi.Trougao;
	import flash.geom.Point;
	import com.abos.vektor.Vector2D;
	import fl.motion.MatrixTransformer;
	
	public class KolizijaKrugTrougao {
		
		private var t1:Trougao;
		private var k1:Krug;
		
		private var kolAB:KolizijaKrugDuz;		// provera kolizija za duzi pravougaonika
		private var kolAC:KolizijaKrugDuz;
		private var kolCB:KolizijaKrugDuz;
		
		private var A:Point;				// temena pravougaonika
		private var B:Point;
		private var C:Point;
		
		private var O:Point;				// centar kruga

		
		public function KolizijaKrugTrougao(ob1:Object, ob2:Object) {
			// constructor code
			if(ob1 is Krug) { 					// provera instanci klasa, posto se prosledjuju dva parametra tipa Object
				this.k1 = ob1 as Krug;			// 'as' <=> typecast
				this.t1 = ob2 as Trougao;		
			} else {
				this.k1 = ob2 as Krug;
				this.t1 = ob1 as Trougao;		
			}
				
			this.k1 = k1;
			this.t1 = t1;
			
			// rotacija temena pravougaonika
			
			this.A = t1.getA();
			this.B = t1.getB();
			this.C = t1.getC();

			this.O = new Point(k1.x, k1.y);		// centar kruznice
			
			// kolizija krug pravougaonik se sastoji od kolizije kruga i 4 duzi pravougaonika.
			
			this.kolAB = new KolizijaKrugDuz(A, B, k1);
			this.kolAC = new KolizijaKrugDuz(A, C, k1);
			this.kolCB = new KolizijaKrugDuz(C, B, k1);
			
		}
		
		public function proveriKoliziju():Boolean {
			
			if (kolAB.proveriKoliziju() || kolAC.proveriKoliziju() 		// ako je pogodio bilo koju od 4 duzi
				|| kolCB.proveriKoliziju()  || temenaSekuKrug())
				return true;
			
			return false;
						
			
		}
		
		private function temenaSekuKrug():Boolean {
			// provera da li je udaljenost izmedju temena pravougaonika i centra kruga, manja pod poluprecnika kr
			
			var vecAO:Vector2D = new Vector2D(O.x - A.x, O.y - A.y);
			var vecBO:Vector2D = new Vector2D(O.x - B.x, O.y - B.y);
			var vecCO:Vector2D = new Vector2D(O.x - C.x, O.y - C.y);
			
			if (vecAO.getMagnitude() <= k1.getR() || vecBO.getMagnitude() <= k1.getR()
				|| vecCO.getMagnitude() <= k1.getR())
				return true;
			
			return false;
		}
		
       /*public function rotatePoint1(rect:Pravougaonik, rotirajuca:Point):Point {
			var xNovo:Number = Math.cos(rect.getRotacija()) * (rotirajuca.x - rect.x) - 
					Math.sin(rect.getRotacija()) * (rotirajuca.y - rect.y) + rect.x;
		   //var xNovo:Number = Math.cos(theta) * (c.x – p.x) – Math.sin(theta) * (c.y – p.y) + p.x;
			//var yNovo:Number = Math.sin(theta) * (c.x – p.x) + Math.cos(theta) * (c.y – p.y) + p.y;
		   var yNovo:Number = Math.sin(rect.getRotacija()) * (rotirajuca.x - rect.x) + 
					Math.cos(rect.getRotacija()) * (rotirajuca.y - rect.y) + rect.y;	
			k1.x = xNovo;
		    k1.y = yNovo;
		   
		   return new Point(xNovo, yNovo);
		
		}*/
		
		//public function getA():

	}
	
}
