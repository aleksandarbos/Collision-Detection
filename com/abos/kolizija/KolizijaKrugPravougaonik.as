package com.abos.kolizija {
	import com.abos.elementi.Krug;
	import com.abos.elementi.Pravougaonik;
	import flash.geom.Point;
	import com.abos.vektor.Vector2D;
	import fl.motion.MatrixTransformer;
	
	public class KolizijaKrugPravougaonik {
		
		private var p1:Pravougaonik;
		private var k1:Krug;
		
		private var kolAB:KolizijaKrugDuz;		// provera kolizija za duzi pravougaonika
		private var kolAC:KolizijaKrugDuz;
		private var kolBD:KolizijaKrugDuz;
		private var kolCD:KolizijaKrugDuz;
		
		private var A:Point;				// temena pravougaonika
		private var B:Point;
		private var C:Point;
		private var D:Point;
		
		private var O:Point;					// centar kruga

		
		public function KolizijaKrugPravougaonik(ob1:Object, ob2:Object) {
			// constructor code
			if(ob1 is Krug) { 					// provera instanci klasa, posto se prosledjuju dva parametra tipa Object
				this.k1 = ob1 as Krug;			// 'as' <=> typecast
				this.p1 = ob2 as Pravougaonik;		
			} else {
				this.k1 = ob2 as Krug;
				this.p1 = ob1 as Pravougaonik;		
			}
			// rotacija temena pravougaonika
			
			this.A = p1.getA();
			this.B = p1.getB();
			this.C = p1.getC();
			this.D = p1.getD();

			this.O = new Point(k1.x, k1.y);		// centar kruznice
			
			// kolizija krug pravougaonik se sastoji od kolizije kruga i 4 duzi pravougaonika.
			
			this.kolAB = new KolizijaKrugDuz(A, B, k1);
			this.kolAC = new KolizijaKrugDuz(A, C, k1);
			this.kolBD = new KolizijaKrugDuz(B, D, k1);
			this.kolCD = new KolizijaKrugDuz(C, D, k1);
			
		}
		
		public function proveriKoliziju():Boolean {
			
			if (kolAB.proveriKoliziju() || kolAC.proveriKoliziju() 		// ako je pogodio bilo koju od 4 duzi
				|| kolBD.proveriKoliziju() || kolCD.proveriKoliziju() || temenaSekuKrug())
				return true;
			
			return false;
						
			
		}
		
		private function temenaSekuKrug():Boolean {
			// provera da li je udaljenost izmedju temena pravougaonika i centra kruga, manja pod poluprecnika kr
			
			var vecAO:Vector2D = new Vector2D(O.x - A.x, O.y - A.y);
			var vecBO:Vector2D = new Vector2D(O.x - B.x, O.y - B.y);
			var vecCO:Vector2D = new Vector2D(O.x - C.x, O.y - C.y);
			var vecDO:Vector2D = new Vector2D(O.x - D.x, O.y - D.y);
			
			if (vecAO.getMagnitude() <= k1.getR() || vecBO.getMagnitude() <= k1.getR()
				|| vecCO.getMagnitude() <= k1.getR() || vecDO.getMagnitude() <= k1.getR())
				return true;
			
			return false;
		}
		
	}
	
}
