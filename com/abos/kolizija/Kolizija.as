package com.abos.kolizija {

	import com.abos.elementi.*;
	import flash.display.Sprite;
	import com.abos.vektor.Vector2D;
	import com.abos.elementi.Trougao;
	import flash.utils.getQualifiedClassName;
	import flash.display.MovieClip;

	

	public class Kolizija {
		
		public var logTekst:String = "";
		
		private var dodirujuSe: Boolean;

		public function Kolizija() {
			// constructor code
		}

		public function proveriKoliziju(nizElemenata: Array): Boolean {
			var ob1, ob2: Object;

			for (var i: int = 0; i < nizElemenata.length; i++) { // prolaz kroz sve elemente na sceni
				ob1 = nizElemenata[i];

				for (var j: int = i + 1; j < nizElemenata.length + 1; j++) { // porednjenje kolizije za svaka 2
					ob2 = nizElemenata[j];
					// provera tipova elemenata za koje detektujemo koliziju
					if ((ob1 is Krug) && (ob2 is Krug)) { // ako su oba elementa tipa krug 'is' <=> 'instanceof'
						if (KolizijaKrugovi.proveriKoliziju(ob1, ob2)) { //obj 'as' Krug <=> (Krug)obj
							ob1.dodirnutElement(); // oboji ih ako su detektovani u koliziji
							ob2.dodirnutElement();
							logTekst += "\n Detektovana kolizija izmedju: " + ob1 + ", " + ob2;
						}
					} else if (ob1 is Pravougaonik && ob2 is Pravougaonik) {
						if (KolizijaPravougaonici.proveriKoliziju(ob1 as Pravougaonik, ob2 as Pravougaonik)) {
							ob1.dodirnutElement();
							ob2.dodirnutElement();
							logTekst += "\n Detektovana kolizija izmedju: " + ob1 + ", " + ob2;
						}
						//return false;
					} else if ((ob1 is Krug && ob2 is Pravougaonik) || (ob1 is Pravougaonik && ob2 is Krug)) { // krug - pravougaonik
						var kkp: KolizijaKrugPravougaonik = new KolizijaKrugPravougaonik(ob1, ob2);
						if (kkp.proveriKoliziju()) {
							ob1.dodirnutElement();
							ob2.dodirnutElement();
							logTekst += "\n Detektovana kolizija izmedju: " + ob1 + ", " + ob2;
						}
					} else if ((ob1 is Krug && ob2 is Trougao) || (ob1 is Trougao && ob2 is Krug)) { // trougao - krug
						var kkt: KolizijaKrugTrougao = new KolizijaKrugTrougao(ob1, ob2);
						if (kkt.proveriKoliziju()) {
							ob1.dodirnutElement(); // oboji ih u crveno, kao znak da su se ta dva dotakla
							ob2.dodirnutElement();
							logTekst += "\n Detektovana kolizija izmedju: " + ob1 + ", " + ob2;
						}
					} else if (ob1 is Trougao && ob2 is Trougao) {
						if (KolizijaTrouglovi.proveriKoliziju(ob1 as Trougao, ob2 as Trougao)) {
							ob1.dodirnutElement();
							ob2.dodirnutElement();
							logTekst += "\n Detektovana kolizija izmedju: " + ob1 + ", " + ob2;
						}
					} else if ((ob1 is Trougao && ob2 is Pravougaonik) || (ob1 is Pravougaonik && ob2 is Trougao)) { // krug - pravougaonik
						//var kkp: KolizijaKrugPravougaonik = new KolizijaKrugPravougaonik(ob1, ob2);
						if (KolizijaPravougaonikTrougao.proveriKoliziju(ob1, ob2)) {
							ob1.dodirnutElement();
							ob2.dodirnutElement();
							logTekst += "\n Detektovana kolizija izmedju: " + ob1 + ", " + ob2;
						}

					}
				}

			}
			return false;
		}
	}

}