package com.abos.kolizija {

	import com.abos.elementi.Pravougaonik;
	import com.abos.elementi.Trougao;
	import flash.geom.Point;

	public class KolizijaPravougaonikTrougao {

		private static var p1: Pravougaonik;
		private static var t1: Trougao;

		private static var bool1: Boolean = false;
		private static var bool2: Boolean = false;
		private static var bool3: Boolean = false;
		private static var bool4: Boolean = false;

		public function KolizijaPravougaonikTrougao() {
			// constructor code

		}


		public static function proveriKoliziju(ob1: Object, ob2: Object): Boolean {

			if (ob1 is Trougao) { // provera instanci klasa, posto se prosledjuju dva parametra tipa Object
				t1 = ob1 as Trougao; // 'as' <=> typecast
				p1 = ob2 as Pravougaonik;
			} else {
				t1 = ob2 as Trougao;
				p1 = ob1 as Pravougaonik;
			}


			bool1 = KolizijaDveDuzi.proveriKoliziju(p1.getA(), p1.getB(), t1.getA(), t1.getB()) // provera sa AB
			|| KolizijaDveDuzi.proveriKoliziju(p1.getD(), p1.getB(), t1.getA(), t1.getB()) 
			|| KolizijaDveDuzi.proveriKoliziju(p1.getC(), p1.getD(), t1.getA(), t1.getB()) 
			|| KolizijaDveDuzi.proveriKoliziju(p1.getA(), p1.getC(), t1.getA(), t1.getB());

			bool2 = KolizijaDveDuzi.proveriKoliziju(p1.getA(), p1.getB(), t1.getB(), t1.getC()) // provera sa BC
			|| KolizijaDveDuzi.proveriKoliziju(p1.getD(), p1.getB(), t1.getB(), t1.getC()) 
			|| KolizijaDveDuzi.proveriKoliziju(p1.getC(), p1.getD(), t1.getB(), t1.getC()) 
			|| KolizijaDveDuzi.proveriKoliziju(p1.getA(), p1.getC(), t1.getB(), t1.getC());

			bool3 = KolizijaDveDuzi.proveriKoliziju(p1.getA(), p1.getB(), t1.getA(), t1.getC()) // provera sa AC
			|| KolizijaDveDuzi.proveriKoliziju(p1.getD(), p1.getB(), t1.getA(), t1.getC()) 
			|| KolizijaDveDuzi.proveriKoliziju(p1.getC(), p1.getD(), t1.getA(), t1.getC()) 
			|| KolizijaDveDuzi.proveriKoliziju(p1.getA(), p1.getC(), t1.getA(), t1.getC());

			return bool1 || bool2 || bool3 || bool3; // ako ima bilo gde presek

			//return false;
		}

	}

}