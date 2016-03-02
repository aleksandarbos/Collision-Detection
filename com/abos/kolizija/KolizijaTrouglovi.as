package com.abos.kolizija {

	import com.abos.elementi.Trougao;
	import flash.geom.Point;

	public class KolizijaTrouglovi {

		private static var t1: Trougao;
		private static var t2: Trougao;

		private static var bool1: Boolean = false;
		private static var bool2: Boolean = false;
		private static var bool3: Boolean = false;
		private static var bool4: Boolean = false;

		public function KolizijaTrouglovi() {
			// constructor code
		}


		public static function proveriKoliziju(tr1: Trougao, tr2: Trougao): Boolean {
			
			t1 = tr1;
			t2 = tr2;

			bool1 = KolizijaDveDuzi.proveriKoliziju(t1.getA(), t1.getB(), t2.getA(), t2.getB()) // provera sa AB
			|| KolizijaDveDuzi.proveriKoliziju(t1.getB(), t1.getC(), t2.getA(), t2.getB()) 
			|| KolizijaDveDuzi.proveriKoliziju(t1.getA(), t1.getC(), t2.getA(), t2.getB());

			bool2 = KolizijaDveDuzi.proveriKoliziju(t1.getA(), t1.getB(), t2.getB(), t2.getC()) // provera sa BC
			|| KolizijaDveDuzi.proveriKoliziju(t1.getB(), t1.getC(), t2.getB(), t2.getC()) 
			|| KolizijaDveDuzi.proveriKoliziju(t1.getA(), t1.getC(), t2.getB(), t2.getC());

			bool3 = KolizijaDveDuzi.proveriKoliziju(t1.getA(), t1.getB(), t2.getA(), t2.getC()) // provera sa AC
			|| KolizijaDveDuzi.proveriKoliziju(t1.getB(), t1.getC(), t2.getA(), t2.getC()) 
			|| KolizijaDveDuzi.proveriKoliziju(t1.getA(), t1.getC(), t2.getA(), t2.getC());

			return bool1 || bool2 || bool3; // ako ima bilo gde presek

			//return false;
		}
	}

}